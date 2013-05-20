# shim
requestAnimFrame = (->
  return window.requestAnimationFrame       ||
      window.webkitRequestAnimationFrame ||
      window.mozRequestAnimationFrame    ||
      window.oRequestAnimationFrame      ||
      window.msRequestAnimationFrame     ||
      (callback) ->
          window.setTimeout callback, 1000 / 60
)()

gameTime = 0
now = null
lastTime = null
backgroundPattern = null


requirejs.config
  baseUrl: 'lib/javascripts'
  paths:
    javascripts: '../../javascripts'

  requirejs ['jquery', 'underscore', 'javascripts/Sprite', 'javascripts/resources', 'javascripts/util', 'javascripts/Entity'], ($, _, Sprite, resources, util, Entity) ->
    util.setup()
    ctx = util.getCanvasCtx()
    canvas = util.getCanvas()

    # TODO: check how to change constructor in coffee to take in object
    player = new Entity(0, 0, 0, 'down', null, null, null, null, new Sprite('assets/img/sprites.png', [0, 0], [39, 39], 16, [0, 1]))
      # pos: [0, 0],
      # sprite:
    init = () ->
      backgroundPattern = ctx.createPattern resources.get('assets/img/terrain.png'), 'repeat'
      reset()
      lastTime = Date.now()
      mainLoop()

    mainLoop = ->
      now = Date.now()
      dt = (now - lastTime) / 1000.0
      lastTime = now

      update dt
      render()
      requestAnimFrame mainLoop

    reset = ->

    update = (dt) ->
      gameTime += dt
      updateEntities(dt)

    render = ->
      ctx.fillStyle = backgroundPattern
      ctx.fillRect 0, 0, canvas.width, canvas.height
      util.renderEntity(player)

    updateEntities = (dt) ->
      player.getSprite().update(dt)



    util.loadGame ['assets/img/sprites.png', 'assets/img/terrain.png'], init




