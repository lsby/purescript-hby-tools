module Test.Main where

import Prelude
import Effect (Effect)
import Effect.Class.Console (log)
import Effect.Exception (throw)
import Hby.Tools (safeEffect, showEq)

eff1 :: Effect Unit
eff1 = do
  pure unit

main :: Effect Unit
main = do
  do
    log "showEq"
    showEq 1 1
  do
    log "safeEffect"
    a <- safeEffect eff1
    showEq a unit
