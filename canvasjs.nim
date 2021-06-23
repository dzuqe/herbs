import dom
import image

type
  CanvasRenderingContext* = ref object
    fillStyle* {.importc.}: cstring
    strokeStyle* {.importc.}: cstring
    width* {.importc.}: int
    height* {.importc.}: int

    shadowColor* {.importc.}: cstring
    shadowBlur* {.importc.}: int

    lineWidth* {.importc.}: int

    font* {.importc.}: cstring
    textAlign* {.importc.}: cstring

  ContextAttributes* = ref object
    alpha* {.importc.}: bool

{.push importcpp.}

proc getContext*(canvasElement: Element, contextType: cstring,
    contextAttributes = ContextAttributes(alpha: true)): CanvasRenderingContext

proc fillRect*(context: CanvasRenderingContext, x, y, width, height: int)
proc fillText*(context: CanvasRenderingContext, text: cstring, x, y: int)
proc createImageData*(context: CanvasRenderingContext, width, height: SomeNumber): ImageData
proc putImageData*(context: CanvasRenderingContext, image: ImageData, dx, dy: SomeNumber)


#proc beginPath*(context: CanvasRenderingContext)
#proc moveTo*(context: CanvasRenderingContext, x, y: int)
#proc lineTo*(context: CanvasRenderingContext, x, y: int)
#proc stroke*(context: CanvasRenderingContext)
#proc translate*(context: CanvasRenderingContext, x, y: int)
#proc setTransform*(context: CanvasRenderingContext, a, b, c, d, e, f: int)
#proc drawImage*(context: CanvasRenderingContext, image, x, y, width, height: int)
#proc rotate*(context: CanvasRenderingContext, angle: float)
#proc scale*(context: CanvasRenderingContext, x, y: float)
#proc save*(context: CanvasRenderingContext)
#proc restore*(context: CanvasRenderingContext)
#proc drawImage*(context: CanvasRenderingContext, img: Image | EmbedElement, dx, dy: SomeNumber)
#proc drawImage*[T: SomeNumber, Y: SomeNumber](context: CanvasRenderingContext, img: Image | EmbedElement, dx, dy: T, dWidth, dHeight: Y)
#proc arc*[T: SomeNumber, Y: SomeNumber](context: CanvasRenderingContext, x, y, radius: T, startAngle, endAngle: Y, anticlockwise=false)
