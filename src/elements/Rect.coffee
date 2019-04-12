class Rect extends PIXI.Graphics
    velX: 0
    velY: 0
    onGround: true
    constructor: (app) ->
        super()
        @build()
        
    
    build: () =>
        @beginFill(0xff0000)
        @drawRect(0, 0, 20, 20)
        @x = 50
        @y = 486
        @endFill()
    animate:=>
        @y += @velY
        @x += @velX
        if !@onGround then @velY += .98
        if @y > 486
            @y = 486
            @onGround = true
            @velY = 0
        

module.exports = Rect
