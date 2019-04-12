marioData = require('../assets/Mario.json')
Mario = require('../assets/Mario.png')
app = require('../App.coffee')

class Mario

    animationSpeed : .05
    y: 456

    constructor: (app) ->
        @app = app
        PIXI.loader.add(marioData).load(@build)

    build: () =>
        frames = []
        for i in [1] by 1
            node = PIXI.Texture.fromFrame('Mario - Idle.gif')
            frames.push(node)
        @idle = new PIXI.extras.AnimatedSprite(frames)
        @idle.x = 100
        @idle.y = @y
        @idle.width = 45
        @idle.height = 50
        @idle.animationSpeed = @animationSpeed
        @app.stage.addChild(@idle)


        for i in [1..3] by 1
            node1 = PIXI.Texture.fromFrame('Mario - Walk'+i+'.gif')
            frames.push(node1)

        @walk = new PIXI.extras.AnimatedSprite(frames)
        @walk.x = 100
        @walk.y = @y
        @walk.width = 45
        @walk.height = 50
        @walk.alpha = 0
        @walk.animationSpeed = @animationSpeed
        @app.stage.addChild(@walk)


        for i in [1] by 1
            node2 = PIXI.Texture.fromFrame('Mario - Jump.gif')
            frames.push(node2)
        @jump = new PIXI.extras.AnimatedSprite(frames)
        @jump.x = 100
        @jump.y = @y
        @jump.width = 45
        @jump.height = 50
        @jump.alpha = 0
        @jump.animationSpeed = @animationSpeed
        @app.stage.addChild(@jump)


module.exports = Mario