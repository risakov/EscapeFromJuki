--Прячем статус бар
display.setStatusBar(display.HiddenStatusBar)

--Константы
_G.Width = display.contentWidth
_G.Height = display.contentHeight
_G.CenterX = display.contentCenterX
_G.CenterY = display.contentCenterY

local composer = require("composer")
composer.gotoScene("Scenes.NewGame")
