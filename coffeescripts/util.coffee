define ['./Sprite'], (Sprite)->
  ctx = null
  canvas = null

  # canvas setup
  setup = ->
    canvas = document.createElement "canvas"
    ctx = canvas.getContext "2d"
    canvas.width = 512
    canvas.height = 480
    document.body.appendChild canvas

  renderEntity = (entity) ->
    ctx.save()
    ctx.translate entity.x, entity.y
    entity.getSprite().render(ctx)
    ctx.restore()

  getCanvas = -> canvas

  getCanvasCtx = -> ctx

  {setup, renderEntity, getCanvas, getCanvasCtx}







