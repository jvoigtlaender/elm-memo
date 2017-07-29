module RandomHelper exposing (randomInt)

import Native.RandomHelper


randomInt : Int -> Int
randomInt =
    Native.RandomHelper.randomInt
