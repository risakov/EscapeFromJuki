local composer = require("composer")
local level = require("classes.level")
local hero = require("classes.hero")
local physics = require("physics")
local scene = composer.newScene()

function updateGame(event)
    scene.lvl:update()
end

function scene:create(event)
    local sceneGroup = self.view
    self.lvl = lvl:new(1)
    self.hr = player:new(sceneGroup)

    physics.start()
    physics.setGravity(0,10)
end

function scene:show(event)
      local sceneGroup = self.view

      if(event.phase == "will")then
          Runtime:addEventListener("enterFrame",updateGame)
      end
      if(event.phase == "did")then
      end
end

function scene:hide(event)
    local sceneGroup = self.view

    if(event.phase == "will")then
    end
    if(event.phase == "did")then
    end
end

function scene:destroy(event)
    local sceneGroup = self.view
end

scene:addEventListener("create",scene)
scene:addEventListener("show",scene)
scene:addEventListener("hide",scene)
scene:addEventListener("destroy",scene)
return scene
