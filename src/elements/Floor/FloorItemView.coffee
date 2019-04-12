
class FloorItemView extends PIXI.Graphics
    constructor: (model, container) ->
        super()
        @model = model
        @container = container
        @container.addChild(@)
        @build()

    build: () =>
        @beginFill(@model.color)
        @lineStyle 2,'0xff0000'
        @drawRect(0, 0, @model.width, @model.height)
        @x = @model.x
        @y = @model.y
        @alpha = @model.alpha
        @endFill()
        

module.exports = FloorItemView