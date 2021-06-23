import dom
import color
import strformat

type
  ImageData* = ref object
    width*, height*: int
    data*: seq[uint8]

  Image* = ref object
    height*, width*: int
    src*: cstring
    onload*: proc ()
    complete*: bool

proc newImage*(): Image {.importjs: "(new Image())".}
proc newImageData*(width, height: int): ImageData {.importjs: "(new ImageData(@))".}
proc newImageData*(arr: seq[uint8], width, height: int): ImageData {.importjs: "(new ImageData(@))".}

proc get_pixel*(image: ImageData, x, y: int): Color =
  let position = image.width * (y * 4) + (x * 4)

  result = Color(
    r: image.data[position + 0],
    g: image.data[position + 1],
    b: image.data[position + 2],
    a: image.data[position + 3],
  )

proc put_pixel*(image: ImageData, x, y: int, color: Color) =
  let position = image.width * (y * 4) + (x * 4)

  # Alpha channel hack
  if x < image.width and y < image.width and x >= 0 and y >= 0:
    image.data[position + 0] = color.r
    image.data[position + 1] = color.g
    image.data[position + 2] = color.b
    image.data[position + 3] = color.a

proc put_pixel*(image: ImageData, x, y: int, color_string: string) =
  image.put_pixel(x, y, new_color(color_string))

proc put_rect*(image: ImageData, x, y, w, h: int, color_string: string) =
  let color = new_color(color_string)

  if x < 0 or x >= 256: return
  if y < 0 or y >= 256: return

  for r in y..y+h:
    for c in x..x+w:
      if c >= 256 or c < 0: break
      if r >= 256 or r < 0: break
      image.put_pixel(c, r, color)

proc get_clip*(image: ImageData, x, y, w, h: int): ImageData =
  let output = new_image_data(w, h)

  for r in y..y+h:
    for c in x..x+w:
      output.put_pixel(c - x, r - y, image.get_pixel(c, r))

  result = output

# Image Data
proc clear*(image: ImageData, color: string = "#000000") =
  for x in 0 ..< 256:
    for y in 0 ..< 256:
      image.put_pixel(x, y, color)
