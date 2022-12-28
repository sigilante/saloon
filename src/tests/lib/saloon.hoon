/+  *test
/+  saloon
::
::::
  ::
^|
|_  rtol=_.1e-5
::  Auxiliary tools
++  expect-near
  |=  [expected=@rs actual=@rs]  ^-  tang
  ?:  (~(isclose rs:saloon [%z rtol]) `@rs`expected `@rs`actual)
    ~
  :~  [%palm [": " ~ ~ ~] [leaf+"expected" "{<expected>}"]]
      [%palm [": " ~ ~ ~] [leaf+"actual" "{<actual>}"]]
  ==
::  Comparison
++  test-isclose  !!
++  test-allclose  !!
:: https://en.wikipedia.org/wiki/Particular_values_of_the_gamma_function
++  test-gamma  ^-  tang
  ;:  weld
    %+  expect-near
      .1.772453850
      (gamma:rs:saloon .0.5)
    %+  expect-near
      .0.886226925
      (gamma:rs:saloon .1.5)
    %+  expect-near
      .1.329340388
      (gamma:rs:saloon .2.5)
    %+  expect-near
      .3.32335097
      (gamma:rs:saloon .3.5)
    %+  expect-near
      .-3.544907701
      (gamma:rs:saloon .-0.5)
    ==
--
