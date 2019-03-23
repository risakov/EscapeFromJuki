local composer = require("composer")
local scene = composer.newScene()

function scene:create(event)
  local sceneGroup = self.view
  scene.background = display.newImageRect(sceneGroup,"Sprites/but.png",Height,Width)
end

function scene:show(event)
  local sceneGroup = self.view
  local phase = event.phase
  if(event.phase=="will")then
  end
  if(event.phase=="did")then
  end
end

function scene:hide(event)
  local sceneGroup = self.view
  local phase = event.phase
  if(event.phase=="will")then
  end
  if(event.phase=="did")then
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
