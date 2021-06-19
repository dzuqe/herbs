import math, strformat

## Vector
## 
## geometrical object for doing vector algebra, calculus and analysis 
type Vector* = ref object
  x: cdouble 
  y: cdouble 

proc newVector*(x, y, z: cdouble): Vector =
  ## make a new vector
  return Vector(
    x: x,
    y: y
  )

proc `+`*(u, v: Vector): Vector =
  ## add tw vectors
  return Vector(
    x: u.x + v.x,
    y: u.y + v.y
  )

proc `*`*(u: Vector, c: cdouble): Vector =
  ## multiply a vector with a scalar
  return Vector(
    x: u.x * c,
    y: u.y * c
  )

proc `-`*(u, v: Vector): Vector =
  ## substract two vector
  return Vector(
    x: u.x - v.x,
    y: u.y - v.y
  )

proc `*`*(u, v: Vector): cdouble =
  ## dot product of two vectors
  return u.x * v.x +
          u.y * v.y

  # divide means multiply by 1/c
  return u * (1 / c)

#proc cross*(u,v: Vector): Vector =
#  ## cross product of two vectors
#  ## i  j  
#  ## ux uy 
#  ## vx vy
#  return Vector(
#    x: u.x * v.y - u.z * v.y,
#    y: u.x * v.z - u.z * v.x,
#  )

proc norm*(u: Vector): cdouble =
  ## length or magnitude or norm
  ## computes the magnitude of a vector
  return sqrt(pow(u.x, 2) + pow(u.y, 2))

proc angle*(u, v: Vector): cdouble =
  ## angle between two vectors
  arccos((u * v) / u.norm() * v.norm())

proc unit*(u: Vector): Vector =
  # returns the unit vector
  return u * (1 / u.norm())

proc `$`*(u: Vector): string =
  return fmt"x: {u.x}, y: {u.y}"


