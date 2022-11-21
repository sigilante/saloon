  ::
::::  Saloon:  Scientific ALgorithms in hOON
::
::  Transcendental functions library for Hoon, with pass-through for ++rs:hoon arms.
::
::  Pure Hoon implementations are generally naive formally correct algorithsm, awaiting
::  efficient jetting.
::
::  @rs-compatible arm
|%
++  rs
    ^|
    |_  $:  r=$?(%n %u %d %z)   :: round nearest, round up, round down, round to zero
            rtol=_.1e-6         :: relative tolerance for precision of operations
        ==
    =/  tau   .6.28318530717
    =/  pi    .3.14159265358
    =/  e     .2.718281828
    =/  phi   .
    =/  rtol  .1e-6
    |%
    ++ma   ma:rs
    ++sea  sea:rs
    ++bit  bit:rs
    ++add  add:rs
    ++sub  sub:rs
    ++mul  mul:rs
    ++div  div:rs
    ++fma  fma:rs
    ++sqt  sqt:rs
    ++lth  lth:rs
    ++lte  lte:rs
    ++equ  equ:rs
    ++gte  gte:rs
    ++gth  gth:rs
    ++sun  sun:rs
    ++san  san:rs
    ++sig  sig:rs
    ++exp  exp:rs
    ++toi  toi:rs
    ++drg  drg:rs
    ++grd  grd:rs
    ++  isclose
      |=  [s=@rs t=@rs]
      (lth:rs (abs (sub:rs s t)) rtol)
    ++  factorial
      |=  x=@rs  ^-  @rs
      =/  t=@rs  .1
      |-  ^-  @rs
      ?:  (isclose x .1)
        t
      $(x (sub:rs x .1), t (mul:rs t x))
  --  :: rs
--
