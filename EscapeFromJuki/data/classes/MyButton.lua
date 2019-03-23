MyButton = {}
local widget = require( "widget" )

function MyButton:new(parent,x1,y1,width,height,text,fontSize,event)
    local private = {}

    local public = {}
    local image1 = display.newRoundedRect(parent,x1,y1-(height/y1)*2,width,height,4)
    image1.parent = parent
    image1.strokeWidth = 2
    image1:setFillColor(gray, alpha )
    image1:setStrokeColor( gray, alpha )

    local text = display.newText({
      parent=parent,
      x=x1,
      y=y1+height/3,
      text = text,
      width=width,
      height=height,
      font = native.systemFont,
      fontSize=fontSize,
      align="center"
    })

--      image1:addEventListener("touch",event)
      text:addEventListener("touch",event)

setmetatable(public,self)
self.__index = self
return public
end
