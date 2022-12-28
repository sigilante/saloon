  ::
::::  Saloon:  Scientific ALgorithms in hOON
::
::  Transcendental functions library for Urbit.
::
::  Pure Hoon implementations are generally naive formally correct algorithms,
::  awaiting efficient jetting.
::
::  @rs-compatible arm, single-precision floating-point
|%
++  rs
  ::  mathematics constants to single precision
  =/  tau    .6.2831853
  =/  pi     .3.14159265
  =/  e      .2.7182818
  =/  phi    .0.57721566
  =/  sqrt2  .1.4142135
  =/  ln2    .0.69314718
  =/  ln10   .2.30258509
  ::  numerics constants to single precision
  =/  epsc  .1e-5             :: C standard minimum epsilon for binary32
  =/  epsd  `@rs`0b1          :: IEEE-754 dwarf (closest number to zero)
  ^|
  |_  $:  r=$?(%n %u %d %z)   :: round nearest, up, down, to zero
          rtol=_epsc          :: relative tolerance for precision of operations
      ==
  ++  sea  sea:^rs
  ++  bit  bit:^rs
  ++  sun  sun:^rs
  ++  san  san:^rs
  ::++  exp  exp:^rs  :: no pass-through because of exp function
  ++  toi  toi:^rs
  ++  drg  drg:^rs
  ++  grd  grd:^rs
  ::
  ::  Comparison
  ::
  ++  lth  lth:^rs
  ++  lte  lte:^rs
  ++  equ  equ:^rs
  ++  gte  gte:^rs
  ++  gth  gth:^rs
  ++  isclose
    |=  [p=@rs r=@rs]
    (lth (abs (sub p r)) rtol)
  ++  allclose
    |=  [p=@rs q=(list @rs)]
    =/  i  0
    =/  n  (lent q)
    |-  ^-  ?
    ?:  =(n i)
      %.y
    ?.  (isclose p (snag i q))
      %.n
    $(i +(i))
  ::  use equality rather than isclose here
  ++  isint
    |=  x=@rs  ^-  ?
    (equ x (san (need (toi x))))
  ::
  ::  Algebraic
  ::
  ++  add  add:^rs
  ++  sub  sub:^rs
  ++  mul  mul:^rs
  ++  div  div:^rs
  ++  fma  fma:^rs
  ++  sig  |=(x=@rs =(0 (rsh [0 31] x)))
  ++  sgn  sig
  ++  neg  |=(x=@rs (sub .0 x))
  ++  factorial
    |=  x=@rs  ^-  @rs
    =/  t=@rs  .1
    ?:  (isclose x .0)
      t
    |-  ^-  @rs
    ?:  (isclose x .1)
      t
    $(x (sub x .1), t (mul t x))
  ++  abs
    |=  x=@rs  ^-  @rs
    ?:((sgn x) x (neg x))
  ++  exp
    |=  x=@rs  ^-  @rs
    =/  p   .1
    =/  po  .-1
    =/  i   .1
    |-  ^-  @rs
    ?:  (lth (abs (sub po p)) rtol)
      p
    $(i (add i .1), p (add p (div (pow-n x i) (factorial i))), po p)
  ::  restricted pow, based on integers only
  ++  pow-n
    |=  [x=@rs n=@rs]  ^-  @rs
    ?:  =(n .0)  .1
    =/  p  x
    |-  ^-  @rs
    ?:  (lth n .2)
      p
    $(n (sub n .1), p (mul p x))
  ::  natural logarithm, only converges for z < 2
  ++  log-e-2
    |=  z=@rs  ^-  @rs
    =/  p   .0
    =/  po  .-1
    =/  i   .1
    |-  ^-  @rs
    ?:  (lth (abs (sub po p)) rtol)
      p
    =/  ii  (add .1 i)
    =/  term  (mul (pow-n .-1 (add .1 i)) (div (pow-n (sub z .1) i) i))
    $(i (add i .1), p (add p term), po p)
  ::  natural logarithm, z > 0
  ++  log
    |=  z=@rs  ^-  @rs
    =/  p   .0
    =/  po  .-1
    =/  i   .0
    |-  ^-  @rs
    ?:  (lth (abs (sub po p)) rtol)
      (mul (div (mul .2 (sub z .1)) (add z .1)) p)
    =/  term1  (div .1 (add .1 (mul .2 i)))
    =/  term2  (mul (sub z .1) (sub z .1))
    =/  term3  (mul (add z .1) (add z .1))
    =/  term  (mul term1 (pow-n (div term2 term3) i))
    $(i (add i .1), p (add p term), po p)
  ::  logarithm base 2
  ++  log2
    |=  z=@rs
    (div (log z) ln2)
  ::  logarithm base 10
  ++  log10
    |=  z=@rs
    (div (log z) ln10)
  ::  general power, based on logarithms
  ::  x^n = exp(n ln x)
  ++  pow
    |=  [x=@rs n=@rs]  ^-  @rs
    (exp (mul n (log x)))
  ::  square root
  ++  sqt  sqrt
  ++  sqrt
    |=  x=@rs  ^-  @rs
    ?>  (sgn x)
    (pow x .0.5)
  ::  cubic root
  ++  cbrt
    |=  x=@rs  ^-  @rs
    ?>  (sgn x)
    (pow x .0.33333333)
  ::  argument (real argument = absolute value)
  ++  arg  abs
  ::  binomial coefficient
  ++  binomial
    |=  [p=@ud q=@ud]  ^-  @ud
    !!
    ::(div (factorial p) (mul (factorial q) (factorial (sub p q))))
  ::
  ::  Trigonometric functions
  ::
  ::  sin x = x - x^3/3! + x^5/5! - x^7/7! + x^9/9! - ...
  ++  sin
    |=  x=@rs  ^-  @rs
    =/  p   .0
    =/  po  .-1
    =/  i   .0
    |-  ^-  @rs
    ?:  (lth (abs (sub po p)) rtol)
      p
    =/  ii  (add (mul .2 i) .1)
    =/  term  (mul (pow-n .-1 i) (div (pow-n x ii) (factorial ii)))
    $(i (add i .1), p (add p term), po p)
  ::  cos x = 1 - x^2/2! + x^4/4! - x^6/6! + x^8/8! - ...
  ++  cos
    |=  x=@rs  ^-  @rs
    =/  p   .1
    =/  po  .-1
    =/  i   .1
    |-  ^-  @rs
    ?:  (lth (abs (sub po p)) rtol)
      p
    =/  ii  (mul .2 i)
    =/  term  (mul (pow-n .-1 i) (div (pow-n x ii) (factorial ii)))
    $(i (add i .1), p (add p term), po p)
  ::  tan x = sin x / cos x
  ++  tan
    |=  x=@rs  ^-  @rs
    (div (sin x) (cos x))
    ::  TODO domain errors
  ::  reciprocal functions
  ++  csc  |=(x=@rs (div .1 (sin x)))
  ++  sec  |=(x=@rs (div .1 (cos x)))
  ++  cot  |=(x=@rs (div .1 (tan x)))
  ::  https://dsp.stackexchange.com/questions/25770/looking-for-an-arcsin-algorithm
  ::  arcsin x = x + (1/2)*(x^3/3) + (3/8)(x^5/5) + (15/48)(x^7/7) + ...
  ++  arcsin
    |=  x=@rs  ^-  @rs
    =/  p   .0
    =/  po  .-1
    =/  i   .0
    ?:  (gte (abs x) .1)
      !!
    |-  ^-  @rs
    ?:  (lth (abs (sub po p)) rtol)
      p
    =/  ii  (mul .2 i)
    =/  ti  (mul (pow-n .2 i) (factorial i))
    =/  oi  (add (mul .2 i) .1)
    =/  term  (mul (div (factorial ii) (mul ti ti)) (div (pow-n x oi) oi))
    $(i (add i .1), p (add p term), po p)
  ++  arccos
    |=  x=@rs  ^-  @rs
    (sub (div pi .2) (arcsin x))
  ++  arctan  
    |=  x=@rs  ^-  @rs
    =/  p   .0
    =/  po  .-1
    =/  i   .0
    ?:  (gte (abs x) .1)
      !!
    |-  ^-  @rs
    ?:  (lth (abs (sub po p)) rtol)
      p
    =/  ii  (add (mul .2 i) .1)
    =/  term  (div (mul (pow-n .-1 i) (pow-n x ii)) ii)
    $(i (add i .1), p (add p term), po p)
  ++  arccsc 
    |=  x=@rs  ^-  @rs
    (arcsin (div .1 x))
  ++  arcsec 
    |=  x=@rs  ^-  @rs
    (arccos (div .1 x))
  ++  arccot 
    |=  x=@rs  ^-  @rs
    (arccos (div .1 x))
  ::  chord
  ++  crd
    |=  z=@rs  ^-  @rs
    (mul .2 (sin (mul z .0.5)))
  ::  versine
  ++  siv
    |=  z=@rs  ^-  @rs
    (mul (sin z) (tan (mul z .0.5)))
  ::
  ::  Hyperbolic functions
  ::
  ::  hyperbolic sine
  ++  sinh
    |=  x=@rs  ^-  @rs
    (mul .0.5 (sub (exp x) (exp (neg x))))
  ::  hyperbolic cosine
  ++  cosh
    |=  x=@rs  ^-  @rs
    (mul .0.5 (add (exp x) (exp (neg x))))
  ::  hyperbolic tangent
  ++  tanh
    |=  x=@rs  ^-  @rs
    (div (sinh x) (cosh x))
  ::  reciprocal functions
  ++  csch  |=(x=@rs (div .1 (sinh x)))
  ++  sech  |=(x=@rs (div .1 (cosh x)))
  ++  coth  |=(x=@rs (div .1 (tanh x)))
  ::
  ::  Analytical
  ::
  ::  Lanczos approximation for the Gamma function
  ::  https://en.wikipedia.org/wiki/Lanczos_approximation
  ++  gamma
    !!
  ::
  ::  Operations
  ::
  ::  https://www.eetimes.com/an-introduction-to-different-rounding-algorithms/
  ++  floor
    |=  x=@rs  ^-  @rs
    ~&  >>  rs
    ~&  >>>  ^rs
    !!
    ::(need (~(toi rs %d) x))
  ++  ceil
    |=  x=@rs  ^-  @rs
    ~&  >>  rs
    ~&  >>>  ^rs
    !!
    ::(need (~(toi rs [%u rtol]) x))
  ::  regular round-half-up
  ++  round
    |=  [x=@rs]  ^-  @rs
    (ceil (mul (floor (mul .2 x)) .0.5))
  ++  round-decimal
    |=  [x=@rs y=@sd]
    (div (round (mul x (pow .10 (san y)))) (pow .10 (san y)))
  ++  linspace
    |=  [lims=[@rs @rs] n=@ud]  ^-  (list @rs)
    =/  i  0
    =|  s=(list @rs)
    =/  f  -:lims
    =/  dx  (div (sub +:lims -:lims) (sun n))
    %-  flop
    |-  ^+  s
    ?:  =(i n)  s
    %=  $
      i  +(i)
      f  (add f dx)
      s  [f s]
    ==
  ++  iota
    |=  [l=@rs r=@rs]
    ?.  &((isint l) (isint r))  !!
    (linspace [l r] `@ud`(round (sub r l)))
  ::  Placeholder, probably as a door so can default to gate
  ++  diff  !!
  ::  Finite difference, central difference formula
  ++  difffinite
    |*  [f=gate x=@rs dx=@rs]
    =/  fm1  (f (sub x dx))
    =/  f2   (sub .0 (mul .2 (f x)))
    =/  fp1  (f (add x dx))
    (div :(add fm1 f2 fp1) (mul dx dx))
  ++  diffpade  !!
  ::  Placeholder, probably as a door so can default to gate
  ++  integrate  !!
  ::  Trapezoid rule integration
  ++  inttrapez
    |*  [f=gate lims=[@rs @rs] dx=@rs n=@ud]
    =/  i   1
    =/  xs  (linspace lims n)
    =/  s   (mul .0.5 (add (f (snag 0 xs)) (f (snag (dec n) xs))))
    %-  (cury mul dx)
    |-  ^-  @rs
    ?:  =(n +(i))  s
    $(i +(i), s (add (f (snag i xs)) s))
  ::  Trapezoid rule integration
  ::++  intsimpson
    ::|*  [f=gate lims=[@rs @rs] dx=@rs n=@ud]
    ::=/  i   1
    ::=/  xs  (linspace lims n)
    ::=/  s   (mul .0.33333333 (add (f (snag 0 xs)) (f (snag (dec n) xs))))
    ::%-  (cury mul dx)
    ::|-  ^-  @rs
    ::?:  =(n +(i))  s
    ::?:  =(1 (mod n .2))
      ::$(i +(i), s (add (mul .4 (f (snag i xs)) s)))
    ::$(i +(i), s (add (mul .2 (f (snag i xs)) s)))
  ::  Newton's method for finding zero
  ++  newton
    |*  [f=gate x0=@rs]
    =/  i  1
    =|  x=@rs
    =/  dx  .1
    |-  ^-  @rs
    ?:  (isclose .0 (f x))  x
    %=  $
      dx  (abs (sub x x0))
      x   (sub x0 (div x (difffinite f x dx)))
      x0  x
    ==
  --  :: rs
--
