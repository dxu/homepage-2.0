'up, down, left, right'
define ->
  class Entity
    constructor: (@x, @y, @vel, @dir, @wSprite, @lSprite, @rSprite, @uSprite, @dSprite) ->
      return
    getSprite: ->
      # returns the sprite based on direction
      switch (@dir)
        when 'left' then @lSprite
        when 'right' then @rSprite
        when 'up' then @uSprite
        when 'waiting' then @wSprite
        else @dSprite
  return Entity
