module Server.Main where

import Prelude

import Data.Maybe (Maybe(..))
import Effect (Effect)
import QuickServe (GET, quickServe)

server :: GET String
server = pure "Hello, World!"

main :: Effect Unit
main = do
  let opts = { hostname: "localhost", port: 3000, backlog: Nothing }
  quickServe opts server
