module Main where

import Prelude
import Data.List (List(..), (:))

import Effect (Effect)
import Effect.Console (log)

foreign import onearg :: String -> String
foreign import noargs :: Unit -> String

list :: List String
list =
  ( onearg "List"
  : onearg "List"
  : onearg "List"
  : onearg "List"
  : onearg "List"
  : noargs unit
  : Nil )

main :: Effect Unit
main = do
  log $ onearg "Hello"
  log $ noargs unit
