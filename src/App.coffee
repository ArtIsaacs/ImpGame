Rect = require("./elements/Rect")
Stage = require("./data/stage")
Background = require("./elements/Background")
GameOver = require("./elements/GameOver")
BgImage = require('./assets/SuperMarioBros-World1Austero-1.png')
GOver = require './assets/Game Over.png'
#marioData = require('./assets/Mario.json')
#MarioAnim = require('./elements/Mario')
#Mario = require('./assets/Mario.png')
FloorContainer = require('./elements/Floor/FloorCollectionView')

class App extends PIXI.Application
  animation:true
  animationNodes:[]
  myStage: Stage
  bg:null
  frames: []
  floorObstacles: []

  constructor:(w,h,o)->
    super(w,h,o)
    document.body.appendChild @view
    window.addEventListener 'keydown', @onKeyPress
    window.addEventListener 'keyup', @onKeyUp
    @build()
    @animate()
  
  build:=>
    #@mario = new MarioAnim(@)
    @bg = new Background(BgImage)
    @gOver = new GameOver(GOver)
    @rect = new Rect()
    @stage.addChild @bg
    @stage.addChild @gOver
    @stage.addChild @rect
    @addAnimationNodes(@rect) 
    @floorContainer = new FloorContainer(@)
    

  
  onKeyPress: (evt) =>
    if evt.key == 'd'

      @keyD = true
    
    if evt.key == 'w'
      null
    
  onKeyUp: (evt) =>
    if evt.key == 'd'
    
      @keyD = false
    
    if evt.key == 'w'
      return if !@rect.onGround 
      @rect.onGround = false
      @rect.velY = -15


  collision: (obj1, arr, image) ->
    for n in arr
      if (obj1.x < n.x + n.width && obj1.x + obj1.width > n.x)
        if (obj1.y < n.y + n.height && obj1.y + obj1.height > n.y)
          @bg.x = 0
          n.alpha = 1
          for item in @floorContainer.children
            item.x = item.model.original
            image.x = image.original


  addAnimationNodes:(child)=>
    @animationNodes.push child
    null

  animate:=>
    @ticker.add ()=>
      if @keyD is true
        @bg.x -= 10
        @gOver.x -= 10
        for item in @floorContainer.children
          item.x -= 10
      
      # if @keyW is true
      #   if @rect.y >= 400
      #     @rect.y = 400
      #   else
      #     @rect.y -= 30
      
      @collision(@rect, @floorContainer.children, @gOver)
      for n in @animationNodes
        n.animate?()

    null

module.exports = App