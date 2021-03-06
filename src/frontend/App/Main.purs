module App.Main where

import Prelude

import App.Button.Component as B
import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Class (liftEffect)
import Effect.Console as C
import Halogen.Aff as HA
import Halogen.VDom.Driver (runUI)
import Partial.Unsafe (unsafeCrashWith)
import Web.DOM.ParentNode (QuerySelector(..))
import Graph.ForceGraph (plot)

main :: Effect Unit
main = C.log "hell" *> HA.runHalogenAff do
    mappElem <- HA.selectElement $ QuerySelector "#app"
    case mappElem of
      Nothing -> unsafeCrashWith "div#app has to be defined"
      Just appElem -> do
        liftEffect plot
        runUI B.myButton unit appElem

