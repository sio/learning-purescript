module Main where

import Prelude
import Effect (Effect(..))
import Effect.Console (log)

impure :: String -> Effect Unit
impure message = log $ "Hello, " <> message

unsafe :: forall a. Effect a -> a
unsafe (Effect x) = x

main :: Effect Unit
main = do
  log "Can we discard an effect to make an impure function appear as pure?"
  log $ unsafe $ impure "world"
