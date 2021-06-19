# complex number
type Complex = ref object
  a: cdouble # real
  b: cdouble # imaginary

proc newComplex(r, i: cdouble): Complex =
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
    a: u.a*v.a - u.b*v.b,
    b: u.a*v.b + u.b*v.a
  )

proc squared*(u: Vector): Complex =
  return Complex(
    a: u.a**2 - u.b**2,
    b: 2*x*y
  )

# associate, commute, distribute 
# multiplicative inverse
# division
