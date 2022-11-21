#   Scientific ALgorithms in hOON

Transcendental and algebraic functions in native Hoon (and later jets).

It's time to supersede [`lazytrig`](https://github.com/sigilante/lazytrig).

Arms in `++rs` and other `@r`-servicing cores will be provided with necessary transcendental and trigonometric functions.

As a first pass, we implement operators for `@rs`, `@rd`, `@rq`, and `@rh`.  After Lagoon is merged, we implement `@lvs`, `@lms`, `@lvd`, and `@lmd`.

This requires us to finally resolves the treatment of complex numbers in Hoon.

##  Constants

- [x] `pi`
- [x] `e`
- [ ] `i`
- [x] `phi`
- [x] `sqrt2`

##  Algebraic

- [x] `sgn` (also `++sig` for compatibility)
- [x] `abs`
- [ ] `sqrt`
- [ ] `cbrt`
- [ ] `arg`
- [ ] `conj` (complex conjugate)
- [x] `pow`
- [x] `pown` (faster integer `pow`)
- [x] `log`
- [ ] `log10`
- [x] `log2`
- [x] `exp`
- [ ] `expn` (faster integer `exp`)
- [ ] `bernoulli` (Bernoulli number)
- [ ] `binomial` (Binomial coefficient)
- [ ] `euler` (Euler number)

##  Trigonometric

- [x] `sin`
- [x] `cos`
- [x] `tan`
- [ ] `csc`
- [ ] `sec`
- [ ] `cot`
- [ ] `arcsin`
- [ ] `arccos`
- [ ] `arctan`
- [ ] `arccsc`
- [ ] `arcsec`
- [ ] `arccot`
- [ ] `crd` (chord)
- [ ] `versin`
- [ ] `coversin`
- [ ] `haversin`
- [ ] `exsin`
- [ ] `excsc`

##  Hyperbolic

- [ ] `sinh`
- [ ] `cosh`
- [ ] `tanh`
- [ ] `csch`
- [ ] `sech`
- [ ] `coth`
- [ ] `arcsinh`
- [ ] `arccosh`
- [ ] `arctanh`
- [ ] `arccsch`
- [ ] `arcsech`
- [ ] `arccoth`

##  Analytical

- [ ] `besselj`
- [ ] `bessely`
- [ ] `besseli`
- [ ] `besselk`
- [ ] `ai`
- [ ] `bi`
- [ ] `gamma`
- [ ] `elliptic`
- [ ] `zeta`

##  Operations

- [ ] `int`
- [ ] `diff`
- [ ] `sum`
- [ ] `prod`

- [ ] `isclose`
- [ ] `allclose` (over a `(list @r)`)

The library will pass through `++rs` behaviors for `++add` and so forth for ease of use.

##  References

- [David Goldberg, “What Every Computer Scientist Should Know About Floating-Point Arithmetic”](https://docs.oracle.com/cd/E19957-01/806-3568/ncg_goldberg.html)
