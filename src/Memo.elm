module Memo (memo) where

{-| Most basic memoization functionality.

@docs memo
-}

import Dict exposing (Dict)
import Lazy exposing (Lazy)


{-|
-}
type alias Function comparable b =
  Dict comparable (Lazy b)


{-|
-}
apply : Function comparable b -> comparable -> Maybe b
apply dict =
  \arg -> Maybe.map Lazy.force (Dict.get arg dict)


{-|
-}
memo : (comparable -> b) -> List comparable -> comparable -> Maybe b
memo fun args =
  apply (Dict.fromList (List.map (\arg -> ( arg, Lazy.lazy (\() -> fun arg) )) args))
