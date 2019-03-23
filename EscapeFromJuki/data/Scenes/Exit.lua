local composer = require("composer")
local scene = composer.newScene()
local widget = require ("widget")
require ("Classes.MyButton")

--composer.removeScene('MainMenu')


function PressExit(event)
  os.exit(0)
end

function PressReturn(event)
  composer.gotoScene("Scenes.MainMenu")
end

function scene:create(event)
  local sceneGroup = self.view
  scene.background = display.newImageRect(sceneGroup,"Sprites/backMenuExit.jpg",Width,Height)

scene.text = display.newText({
parent=sceneGroup,
x=CenterX,
y=CenterY,
text = "Вы уверены?",
width=Width/10,
height=Height/10,
font = native.systemFont,
fontSize=fontSize,
align="center"
})
scene.buttonExitFromGame = MyButton:new(sceneGroup,CenterX+Width/10,CenterY,Height/20,Height/30,"Да",native.systemFontSize,PressExit)
scene.buttonReturnToMenu = MyButton:new(sceneGroup,CenterX-Width/10,CenterY,Height/20,Height/30,"Нет",native.systemFontSize,PressReturn)
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
