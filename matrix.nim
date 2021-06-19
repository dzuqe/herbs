import vector2D

type Matrix = ref object
  x: Vector
  y: Vector

proc newScaleMat(cdouble c): Vector =
  Matrix(
    x: Vector(c, 0),
    y: Vector(0, c),
  )

proc newRotMat(cdouble angle): Vector =
  Matrix(
    x: Vector(cos(theta), -sin(theta)),
    y: Vector(sin(theta), cos(theta))
  )
