module Hby.Tools where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Effect.Console (log, error)
import Effect.Exception (message, throw, try)

showEq :: forall a b. Show a => Show b => a -> b -> Effect Unit
showEq a b = if eq (show a) (show b) == true then log ((show a) <> " == " <> (show b) <> " ... pass!") else throw ((show a) <> " == " <> (show b) <> "... 不通过!")

safeEffect :: Effect Unit -> Effect Unit
safeEffect e = do
  c <- try e
  case c of
    Left err -> error $ message err
    Right _ -> e
