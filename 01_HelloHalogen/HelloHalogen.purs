module Main where

import Prelude

import Effect (Effect)
import Halogen as H
import Halogen.Aff as HA
import Halogen.HTML as HH
import Halogen.HTML.Events as HE
import Halogen.VDom.Driver (runUI)

import Data.Char (toCharCode, fromCharCode)
import Data.Foldable (foldl)
import Data.Maybe (fromMaybe, Maybe(..))
import Data.String.CodeUnits (singleton)

main :: Effect Unit
main = HA.runHalogenAff do
  body <- HA.awaitBody
  runUI component unit body

data Action = Increment | Decrement

component =
  H.mkComponent
    { initialState
    , render
    , eval: H.mkEval $ H.defaultEval { handleAction = handleAction }
    }
  where
  initialState _ = chr 'I'

  render state =
    HH.div_
      [ HH.button [ HE.onClick \_ -> Decrement ] [ HH.text "prev" ]
      , HH.div_ [ HH.text $ show state ]
      , HH.button [ HE.onClick \_ -> Increment ] [ HH.text "next" ]
      , HH.pre [] [ HH.text "hello world\nsecond line"]
      ]

  handleAction = case _ of
    Increment -> H.modify_ \state -> state + one
    Decrement -> H.modify_ \state -> state - one

chr :: Char -> Mychar
chr c = Mychar (toCharCode c)

newtype Mychar = Mychar Int
derive newtype instance Semiring Mychar
derive newtype instance Ring Mychar
instance Show Mychar where
  show (Mychar c) = case fromCharCode c of
    Nothing -> "Invalid"
    Just n -> singleton n
