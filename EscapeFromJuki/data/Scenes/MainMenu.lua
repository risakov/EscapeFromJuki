local composer = require("composer")
local scene = composer.newScene()
local widget = require ("widget")
require ("Classes.MyButton")


function PressToPlay(event)
  composer.gotoScene("Scenes.NewGame")
end

function PressToSettings(event)
  composer.gotoScene("Scenes.Settings")
end

function PressToExit(event)
  composer.gotoScene("Scenes.Exit")
end

function scene:create(event)
  local sceneGroup = self.view
  scene.background = display.newImageRect(sceneGroup,"Sprites/fon.png",Height,Width)
  scene.background.x = CenterX
  scene.background.y = CenterY
  scene.buttonPlay = MyButton:new(sceneGroup,CenterX-Width/6,CenterY*1/3+Height/200,Height/20,Height/30,"Игратт",native.systemFontSize,PressToPlay)
  scene.buttonSettings = MyButton:new(sceneGroup,CenterX-Width/6,CenterY,Height/20,Height/30,"Настройки",native.systemFontSize,PressToSettings)
  scene.buttonExit = MyButton:new(sceneGroup,CenterX-Width/6,CenterY*3/2+Height/200,Height/20,Height/30,"Выход",native.systemFontSize,PressToExit)
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
