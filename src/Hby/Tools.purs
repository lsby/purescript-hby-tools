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

map_l2 :: forall m1 m2 a b. Functor m1 => Functor m2 => (a -> b) -> m1 (m2 a) -> m1 (m2 b)
map_l2 = map <<< map

infixl 4 map_l2 as <$$>

apply_l2 :: forall m1 m2 a b. Bind m1 => Apply m2 => m1 (m2 (a -> b)) -> m1 (m2 a) -> m1 (m2 b)
apply_l2 f v = join $ map (\vn -> map (\fn -> apply fn vn) f) v

infixl 4 apply_l2 as <**>

lift2_l2 :: forall m1 m2 a b c. Bind m1 => Apply m2 => (a -> b -> c) -> m1 (m2 a) -> m1 (m2 b) -> m1 (m2 c)
lift2_l2 f v1 v2 = f <$$> v1 <**> v2
