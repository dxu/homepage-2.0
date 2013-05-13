requestAnimFrame = (->
  return window.requestAnimationFrame       ||
      window.webkitRequestAnimationFrame ||
      window.mozRequestAnimationFrame    ||
      window.oRequestAnimationFrame      ||
      window.msRequestAnimationFrame     ||
      (callback) ->
          window.setTimeout callback, 1000 / 60
)()

canvas = document.createElement "canvas"
ctx = canvas.getContext "2d"
canvas.width = 512
canvas.height = 480
document.body.appendChild canvas


main = ->
  now = Date.now()
  dt = (now - lastTime) / 1000.0

  update dt
  # render()

  lastTime = now
  requestAnimFrame main

reset = ->

update = (dt) ->
  gameTime += dt

init = () ->
    terrainPattern = ctx.createPattern resources.get('img/terrain.png'), 'repeat'

    # document.getElementById('play-again')
    #         .addEventListener 'click', () ->
    #           reset()
    reset()
    lastTime = Date.now()
    main()

resources.load ['img/sprites.png', 'img/terrain.png']
resources.onReady(init)



