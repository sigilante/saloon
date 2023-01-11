/+  *test
/+  saloon
::
::::
  ::
^|
|_  $:  atol=_.1e-3          :: absolute tolerance for precision of operations
        rtol=_.1e-5          :: relative tolerance for precision of operations
    ==
::  Auxiliary tools
++  expect-near
  |=  [expected=@rs actual=@rs]  ^-  tang
  ?:  (~(isclose rs:saloon [%z rtol]) `@rs`expected `@rs`actual)
    ~
  :~  [%palm [": " ~ ~ ~] [leaf+"expected" "{<expected>}"]]
      [%palm [": " ~ ~ ~] [leaf+"actual" "{<actual>}"]]
  ==
++  expect-near-per
  |=  [expected=@rs actual=@rs]  ^-  tang
  =/  pdif  (div:rs:saloon (abs:rs:saloon (sub:rs:saloon actual expected)) expected)
  ?:  (lth:rs:saloon pdif atol)
    ~
  :~  [%palm [": " ~ ~ ~] [leaf+"expected" "{<expected>}"]]
      [%palm [": " ~ ~ ~] [leaf+"actual" "{<actual>}"]]
  ==
  
::  Comparison
::++  test-isclose  !!
::++  test-allclose  !!
++  test-factorial  ^-  tang
  ;:  weld
    %+  expect-near
      .1
      (factorial:rs:saloon .0)
    %+  expect-near
      .1
      (factorial:rs:saloon .1)
    %+  expect-near
      .120
      (factorial:rs:saloon .5)
    ==
++  test-abs  ^-  tang
  ;:  weld
    %+  expect-near
      .1
      (abs:rs:saloon .-1)
    %+  expect-near
      .1
      (abs:rs:saloon .1)
    %+  expect-near
      .120
      (abs:rs:saloon .-120)
    ==
++  test-exp  ^-  tang
  ;:  weld
    %+  expect-near-per
      .148.413
      (exp:rs:saloon .5)
    %+  expect-near-per
      .26903.186
      (exp:rs:saloon .10.2)
    ==
++  test-pow-n  ^-  tang
  ;:  weld
    %+  expect-near-per
      .132.651
      (pow-n:rs:saloon .5.1 .3)
    %+  expect-near-per
      .-27
      (pow-n:rs:saloon .-3 .3)
    ==
++  test-log-e-2  ^-  tang
  ;:  weld
    %+  expect-near-per
      .0.33647
      (log-e-2:rs:saloon .1.4)
    %+  expect-near-per
      .-0.5978
      (log-e-2:rs:saloon .0.55)
    ==
++  test-log  ^-  tang
  ;:  weld
    %+  expect-near-per
      .-2.30259
      (log:rs:saloon .0.1)
    %+  expect-near-per
      .4.094345
      (log:rs:saloon .60)
    ==
++  test-log2  ^-  tang
  ;:  weld
    %+  expect-near-per
      .4.9069
      (log2:rs:saloon .30)
    %+  expect-near-per
      .-0.8625
      (log2:rs:saloon .0.55)
    ==
++  test-log10  ^-  tang
  ;:  weld
    %+  expect-near-per
      .1.477121
      (log10:rs:saloon .30)
    %+  expect-near-per
      .-0.180456
      (log10:rs:saloon .0.66)
    ==
++  test-pow  ^-  tang
  ;:  weld
    %+  expect-near-per
      .202.582
      (pow:rs:saloon .5 .3.3)
    %+  expect-near-per
      .-391.35393
      (pow:rs:saloon .-3.3 .5)
    %+  expect-near-per
      .0.00493627
      (pow:rs:saloon .5 .-3.3)
    %+  expect-near-per
      .391.35393
      (pow:rs:saloon .3.3 .5)
    ==
++  test-sqrt  ^-  tang
  ;:  weld
    %+  expect-near-per
      .2
      (sqrt:rs:saloon .4)
    %+  expect-near-per
      .1.41421
      (sqrt:rs:saloon .2)
    ==
++  test-cbrt  ^-  tang
  ;:  weld
    %+  expect-near-per
      .3
      (cbrt:rs:saloon .27)
    %+  expect-near-per
      .1.63864
      (cbrt:rs:saloon .4.4)
    ==
::++  test-binomial  !!
++  test-sin  ^-  tang
  ;:  weld
    %+  expect-near-per
      .-0.756802
      (sin:rs:saloon .4)
    %+  expect-near-per
      .0.522687
      (sin:rs:saloon .0.55)
    ==
++  test-cos  ^-  tang
  ;:  weld
    %+  expect-near-per
      .-0.65364
      (cos:rs:saloon .4)
    %+  expect-near-per
      .0.852525
      (cos:rs:saloon .0.55)
    ==
++  test-tan  ^-  tang
  ;:  weld
    %+  expect-near-per
      .1.15782
      (tan:rs:saloon .4)
    %+  expect-near-per
      .0.613105
      (tan:rs:saloon .0.55)
    ==
++  test-csc  ^-  tang
  ;:  weld
    %+  expect-near-per
      .-1.32135
      (csc:rs:saloon .4)
    %+  expect-near-per
      .1.91319
      (csc:rs:saloon .0.55)
    ==
++  test-sec  ^-  tang
  ;:  weld
    %+  expect-near-per
      .-1.52989
      (sec:rs:saloon .4)
    %+  expect-near-per
      .1.17299
      (sec:rs:saloon .0.55)
    ==
++  test-cot  ^-  tang
  ;:  weld
    %+  expect-near-per
      .0.86369
      (cot:rs:saloon .4)
    %+  expect-near-per
      .1.63104
      (cot:rs:saloon .0.55)
    ==
++  test-arcsin  ^-  tang
  ;:  weld
    %+  expect-near-per
      .1.11977
      (arcsin:rs:saloon .0.9)
    %+  expect-near-per
      .0.55
      (arcsin:rs:saloon .0.522687)
    ==
++  test-arccos  ^-  tang
  ;:  weld
    %+  expect-near-per
      .2.28318
      (arccos:rs:saloon .-0.65364)
    %+  expect-near-per
      .0.55
      (arccos:rs:saloon .0.852525)
    ==
++  test-arctan  ^-  tang
  ;:  weld
    %+  expect-near-per
      .0.732815
      (arctan:rs:saloon .0.9)
    %+  expect-near-per
      .0.55
      (arctan:rs:saloon .0.613105)
    ==
++  test-arccsc  ^-  tang
  ;:  weld
    %+  expect-near-per
      .-0.858406
      (arccsc:rs:saloon .-1.32135)
    %+  expect-near-per
      .0.55
      (arccsc:rs:saloon .1.91319)
    ==
++  test-arcsec  ^-  tang
  ;:  weld
    %+  expect-near-per
      .2.28318
      (arcsec:rs:saloon .-1.52989)
    %+  expect-near-per
      .0.55
      (arcsec:rs:saloon .1.17299)
    ==
++  test-arccot  ^-  tang
  ;:  weld
    %+  expect-near-per
      .0.24498
      (arccot:rs:saloon .4)
    %+  expect-near-per
      .0.55
      (arccot:rs:saloon .1.63104)
    ==
::: https://en.wikipedia.org/wiki/Particular_values_of_the_gamma_function
::++  test-gamma  ^-  tang
  ::;:  weld
    ::%+  expect-near
      ::.1.772453850
      ::(gamma:rs:saloon .0.5)
    ::%+  expect-near
      ::.0.886226925
      ::(gamma:rs:saloon .1.5)
    ::%+  expect-near
      ::.1.329340388
      ::(gamma:rs:saloon .2.5)
    ::%+  expect-near
      ::.3.32335097
      ::(gamma:rs:saloon .3.5)
    ::%+  expect-near
      ::.-3.544907701
      ::(gamma:rs:saloon .-0.5)
    ::==
--
