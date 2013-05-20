define ['./resources'], (resources) ->
  class Sprite
    constructor: (@url, @pos, @size, speed, @frames, dir, @once) ->
      @speed = typeof speed == 'number' ? speed : 0
      @dir = dir || 'horizontal'
      @_index = 0

    update: (dt) ->
      @._index += @.speed*dt

    render: (ctx) ->
      if @.speed > 0
        max = @.frames.length
        idx = Math.floor(@._index)
        frame = @.frames[idx % max]
        if @.once and idx >= max
          @.done = true
          return
      else frame = 0

      x = @.pos[0]
      y = @.pos[1]

      if @.dir == 'vertical'
        y += frame * @.size[1]
      else x += frame * @.size[0]


      ctx.drawImage(resources.get(@.url), x, y, @.size[0], @.size[1],
                    0, 0, @.size[0], @.size[1])
  return Sprite

