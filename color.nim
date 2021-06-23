import strutils, strformat
type
  Color* = ref object
    r*: uint8
    g*: uint8
    b*: uint8
    a*: uint8

proc new_color*(r, g, b, a: uint8): Color =
  result = Color(
    r: r,
    g: g,
    b: b,
    a: a,
  )

proc new_color*(color: string): Color =
  # TODO: clamp result between 0 and 250
  result = Color(
    r: fromHex[uint8]("0x" & color[1..2]),
    g: fromHex[uint8]("0x" & color[3..4]),
    b: fromHex[uint8]("0x" & color[4..6]),
    a: 255,
  )

# TODO: add color mixing techniques
