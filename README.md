#   Scientific ALgorithms in hOON

Transcendental and algebraic functions in native Hoon (and later jets).

It's time to supersede [`lazytrig`](https://github.com/sigilante/lazytrig).

Arms in `++rs` and other `@r`-servicing cores will be provided with necessary transcendental and trigonometric functions.

As a first pass, we implement operators for `@rs`, `@rd`, `@rq`, and `@rh`.  After Lagoon is merged, we implement `@lvs`, `@lms`, `@lvd`, and `@lmd`.

- [ ] `@rs`
- [ ] `@rd`
- [ ] `@rq`
- [ ] `@rh`
- [ ] `@rsc`
- [ ] `@rdc`
- [ ] `@rqc`
- [ ] `@rhc`
- [ ] `@lvs`
- [ ] `@lvd`
- [ ] `@lvq`
- [ ] `@lvh`
- [ ] `@lms`
- [ ] `@lmd`
- [ ] `@lmq`
- [ ] `@lmh`

This requires us to finally resolves the treatment of complex numbers in Hoon (which I've here noted as `@rsc` etc.).

- Possible four-letter alternative names:  sake, salt, saxe, soon, star
- Possible two-letter core names:  sa, sl

Checkmarks are a first pass in `@rs` single-precision floating-point implementation:

##  Constants

- [x] `pi`
- [x] `e`
- [ ] `i` (complex only)
- [x] `phi`
- [x] `sqrt2`

##  Comparison

- [x] `isclose`
- [x] `allclose` (over a `(list @r)`)
- [x] `isint`
- [ ] `isreal` (complex only)
- [ ] `isimag` (complex only)

##  Algebraic

- [x] `sgn` (also `++sig` for compatibility)
- [x] `abs`
- [x] `sqrt`
- [x] `cbrt`
- [x] `arg`
- [ ] `conj` (complex conjugate) (complex only)
- [x] `pow`
- [x] `pown` (faster integer `pow`)
- [x] `log`
- [x] `log10`
- [x] `log2`
- [x] `exp`
- [x] `binomial` (Binomial coefficient)

##  Trigonometric

- [x] `sin`
- [x] `cos`
- [x] `tan`
- [x] `csc`
- [x] `sec`
- [x] `cot`
- [x] `arcsin`
- [x] `arccos`
- [x] `arctan`
- [x] `arccsc`
- [x] `arcsec`
- [x] `arccot`
- [x] `crd` (chord)
- [x] `siv` (versine)

##  Hyperbolic

- [x] `sinh`
- [x] `cosh`
- [x] `tanh`
- [x] `csch`
- [x] `sech`
- [x] `coth`
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

- [x] `round` (regular banker's roundaing)
  - [x] `round-decimal` (rounding to specific accuracy, e.g. `.100.01`)
- [x] `linspace` (`++gulf` which evenly spans a range in floating-point)
- [x] `iota` (APL-style `++gulf` in floating-point)
- [x] `diff` (placeholder for adaptive algorithm in future)
  - [x] `difffinite` (finite difference)
  - [ ] `diffpade` (Padé approximation)
- [x] `integrate` (placeholder for adaptive algorithm as door in future)
  - [x] `inttrapez` (trapezoid rule)
  - [x] `intsimpson` (Simpson's rule)
- [x] `newton` (locate a function zero using Newton's method)

The library will pass through `++rs` behaviors for `++add` and so forth for ease of use.  Thus Saloon's `++rs` can act as a drop-in core for almost all Hoon `++rs` arms (except `++exp` and `++ma`).

##  References

- Milton Abramowitz & Irene Stegun, _Handbook of Mathematical Functions with Formulas, Graphs, and Mathematical Tables_.  1964–2010.
- Forman Acton, _Numerical Methods that (Usually) Work_, 1ed.  1997.
- [Bartosz Ciechanowski, “Float Exposed” (webapp)](https://float.exposed/0x00000001)
- [David Goldberg, “What Every Computer Scientist Should Know About Floating-Point Arithmetic”](https://docs.oracle.com/cd/E19957-01/806-3568/ncg_goldberg.html)
- Parviz Moin, _Fundamentals of Engineering Numerical Analysis_. 2ed.  2001.
