elm-memo
========

Most basic memoization functionality.

If you have a function `fun : Int -> Int -> Bool` that is expensive to compute, and you know you are going to repeatedly need values of that function with first argument `100` and second argument either between `1` and `10` or between `30 and `40`, you can do:

```elm
memoized : Memo.Function Int Bool
memoized =
  Memo.memo (fun 100) ([1..10] ++ [30..40])
```

and later use `Memo.apply memoized 5`, `Memo.apply memoized 35`, `Memo.apply memoized 35`, etc.
