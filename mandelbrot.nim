import complex, strformat, canvasjs, dom, image

let
  max_iter = 1000
  screen_width: cdouble = 640.0
  screen_height: cdouble = 480.0
  scale_min_x: cdouble = -2.5
  scale_max_x: cdouble = 1.0
  scale_min_y: cdouble = -1.0
  scale_max_y: cdouble = 1.0
  scale_width: cdouble = 3.5
  scale_height: cdouble = 2.0
  pixel_width: cdouble = scale_width / screen_width
  pixel_height: cdouble = scale_height / screen_height

proc mandel(): ImageData =
  let img = newImageData(screen_width.int, screen_height.int)
  for y in 0..<screen_height.int:
    for x in 0..<screen_width.int:
      # get scaled pixel as complex value c
      let
        cx = (x.cdouble * pixel_width) - (scale_width.cdouble / 2.0)
        cy = (y.cdouble * pixel_height) - (scale_height.cdouble / 2.0)
        c = newComplex(cx.cdouble, cy.cdouble)

      var iter: int = 0

      # iterate through the fx 
      var z = newComplex(0.cdouble, 0.cdouble)
      while z.absl() <= 2 and iter < max_iter:
        z = z.pow2() + c
        inc iter

      # analyze iteration count
      #echo iter
      
      # generate color from iter count analysis
      if iter >= max_iter:
        # failed to converge
        img.put_pixel(x, y, "#000000");
      else:
        # converged success
        img.put_pixel(x, y, "#ffffff");
  return img


proc runner(event: Event) {.exportc.} =
  echo "display thr image"
  # setup canvas
  var canvas = document.getElementById("framebuffer").EmbedElement
  canvas.width = screen_width.int
  canvas.height = screen_height.int

  var ctx = canvas.getContext("2d")
  ctx.width = screen_width.int
  ctx.height = screen_height.int

  ctx.putImageData(mandel(), 0, 0)


window.onLoad = runner
