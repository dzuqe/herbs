import math, strformat

# complex number
type Complex* = ref object
  a: cdouble # real
  b: cdouble # imaginary

proc newComplex*(a, b: cdouble): Complex =
  ## make a new complex number
  return Complex(
    a: a,
    b: b,
  )

# add, sub, mult
proc `+`*(u, v: Complex): Complex =
  ## add two complex numbers
  return Complex(
    a: u.a + v.a,
    b: u.b + v.b
  )

proc `-`*(u, v: Complex): Complex =
  ## subtract two complex numbers
  return Complex(
    a: u.a - v.a,
    b: u.b - v.b
  )

proc `*`*(u, v: Complex): Complex =
  ## multipy two complex numbers
  return Complex(
    a: (u.a*v.a) - (u.b*v.b),
    b: (u.a*v.b) + (u.b*v.a)
  )

proc pow2*(u: Complex): Complex =
  # return the square of a complex number
  return Complex(
    a: pow(u.a, 2) - pow(u.b, 2),
    b: 2 * u.a * u.b
  )

proc `$`*(u: Complex): string =
  return fmt"{u.a} + {u.b}i"


proc absl*(u: Complex): cdouble =
  return sqrt(pow(u.a, 2) + pow(u.b, 2))

# associate, commute, distribute 
# multiplicative inverse
# division
