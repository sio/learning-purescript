module Main where

import Prelude

import Effect (Effect)
import Effect.Console (log)

foreign import ffiHello :: String -> String

main :: Effect Unit
main = do
  log $ ffiHello "hello"
