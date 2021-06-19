type Complex = ref object
  r: cdouble # real
  i: cdouble # imaginary

proc newComplex(r, i: cdouble): Complex =
  return Complex(
    r: r,
    i: i
  )
