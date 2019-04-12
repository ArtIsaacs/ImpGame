class GameOver extends PIXI.Sprite.fromImage
    constructor: (img) ->
        super(img)
        @x = 10300
        @y = 0
        @original = 10300
        @height = 300
        @width = 600


module.exports = GameOver