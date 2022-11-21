#   Scientific ALgorithms in hOON

Transcendental and algebraic functions in native Hoon (and later jets).

It's time to supersede [`lazytrig`](https://github.com/sigilante/lazytrig).

Arms in `++rs` and other `@r`-servicing cores will be provided with necessary transcendental and trigonometric functions.

As a first pass, we implement operators for `@rs`, `@rd`, `@rq`, and `@rh`.  After Lagoon is merged, we implement `@lvs`, `@lms`, `@lvd`, and `@lmd`.

This requires us to finally resolves the treatment of complex numbers in Hoon.

##  Constants

- `pi`
- `e`
- `i`
- `phi`
- `sqrt2`

##  Algebraic

- `sgn`
- `sqrt`
- `cbrt`
- `arg`
- `conj` (complex conjugate)
- `pow`
- `pown` (faster integer `pow`)
- `log`
- `log10`
- `log2`
- `exp`
- `expn` (faster integer `exp`)
- `bernoulli` (Bernoulli number)
- `binomial` (Binomial coefficient)
- `euler` (Euler number)

##  Trigonometric

- `sin`
- `cos`
- `tan`
- `csc`
- `sec`
- `cot`
- `arcsin`
- `arccos`
- `arctan`
- `arccsc`
- `arcsec`
- `arccot`
- `crd` (chord)
- `versin`
- `coversin`
- `haversin`
- `exsin`
- `excsc`

##  Hyperbolic

- `sinh`
- `cosh`
- `tanh`
- `csch`
- `sech`
- `coth`
- `arcsinh`
- `arccosh`
- `arctanh`
- `arccsch`
- `arcsech`
- `arccoth`

##  Analytical

- `besselj`
- `bessely`
- `besseli`
- `besselk`
- `ai`
- `bi`
- `gamma`
- `elliptic`
- `zeta`

##  Operations

- `int`
- `diff`
- `sum`
- `prod`

- `isclose`

The library will pass through `++rs` behaviors for `++add` and so forth for ease of use.
