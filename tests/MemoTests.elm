module MemoTests exposing (..)

import Expect exposing (Expectation)
import Memo exposing (memo)
import RandomHelper exposing (randomInt)
import Test exposing (..)


suite : Test
suite =
    describe "Memo"
        [ describe "squareMemo"
            [ test "returns a value if argument at upper bound of range" <|
                \_ ->
                    Expect.equal
                        (Just 100)
                        (squareMemo 10)
            , test "returns a value if argument at lower bound of range" <|
                \_ ->
                    Expect.equal
                        (Just 1)
                        (squareMemo 1)
            , test "returns Nothing if argument is above range" <|
                \_ ->
                    Expect.equal
                        Nothing
                        (squareMemo 11)
            , test "returns Nothing if argument is below range" <|
                \_ ->
                    Expect.equal
                        Nothing
                        (squareMemo 0)
            ]
        , describe "randomInt"
            [ test "returns different values each time" <|
                \_ ->
                    Expect.notEqual
                        (randomInt upper)
                        (randomInt upper)
            ]
        , describe "randomIntMemo"
            [ test "returns a value if argument in range" <|
                \_ ->
                    Expect.notEqual
                        (randomIntMemo upper |> Maybe.withDefault -1)
                        -1
            , test "returns the same value each time" <|
                \_ ->
                    Expect.equal
                        (randomIntMemo upper)
                        (randomIntMemo upper)
            , test "returns different values for different arguments" <|
                \_ ->
                    Expect.notEqual
                        (randomIntMemo upper)
                        (randomIntMemo <| upper + 1)
            ]
        ]


upper : Int
upper =
    1000000000000


square : Int -> Int
square x =
    x * x


squareMemo : Int -> Maybe Int
squareMemo =
    memo square <| List.range 1 10


randomIntMemo : Int -> Maybe Int
randomIntMemo =
    memo randomInt <| List.range upper (upper + 1)
