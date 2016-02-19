elm-memo
========

Most basic memoization functionality.

If you have a function `fun : Int -> Int -> Bool` that is expensive to
compute, and you know you are going to repeatedly need values of that
function with first argument `100` and second argument either between
`1` and `10` or between `30` and `40`, you can do:

```elm
memoized : Int -> Maybe Bool
memoized =
  memo (fun 100) ([1..10] ++ [30..40])
```

and later use `memoized 5`, `memoized 35`, `memoized 35`, `memoized 5`,
`memoized 35`, etc.

No recomputation will take place, i.e., each of `fun 100 5` and `fun
100 35` will be computed only once. Also, only results that are
actually needed will be computed, so in the example only `fun 100 5`
and `fun 100 35` will be computed at all, no `fun 100 1` or any others
in the range.
