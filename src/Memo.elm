module Memo (apply, Function, memo) where

{-| Most basic memoization functionality.

@docs Function, memo, apply
-}

import Dict exposing (Dict)
import Lazy exposing (Lazy)


{-|
-}
type Function comparable b
  = Function (Dict comparable (Lazy b))


{-|
-}
apply : Function comparable b -> comparable -> Maybe b
apply (Function dict) arg =
  Maybe.map Lazy.force (Dict.get arg dict)


{-|
-}
memo : (comparable -> b) -> List comparable -> Function comparable b
memo fun =
  Function << Dict.fromList << List.map (\arg -> ( arg, Lazy.lazy (\() -> fun arg) ))
