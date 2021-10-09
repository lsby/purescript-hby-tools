module Hby.Tools where

import Prelude
import Effect (Effect)
import Effect.Console (log)
import Data.Either (Either(..))

diceyEffectDispose :: Effect (Either String Unit) -> Effect Unit
diceyEffectDispose e = do
  c <- e
  case c of
    Left err -> log err
    Right _ -> pure unit

eitherUniversal :: forall a b. Show a => Either a b -> Either String b
eitherUniversal a = case a of
  Left err -> Left $ show err
  Right d -> Right d

changeLeft :: forall a b c. (a -> b) -> Either a c -> Either b c
changeLeft fn a = case a of
  Left err -> Left $ fn err
  Right d -> Right d
