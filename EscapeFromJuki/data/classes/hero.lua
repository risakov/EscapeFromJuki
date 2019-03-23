player = {}

function player:new(parent)
    local obj = {}
        obj.sheet_options = {width = 100, height = 139,numFrames = 20,sheetContentWidth = 2000,sheetContentHeight = 139}
        obj.sheet_run = graphics.newImageSheet("src/sprites/hr.png",obj.sheet_options)
        obj.data_animation = {name = "normal",start = 1,count = 20,time = 1000,loopCount = 0,loopDirection = "forward"}
        obj.sprite = display.newSprite(obj.sheet_run,obj.data_animation)
        obj.sprite:scale(2.5,2.5)
        obj.sprite.x, obj.sprite.y = CenterX*0.5,CenterY*1.5
        obj.sprite:play()
        

    setmetatable(obj,self)
    self.__index = self
    return obj
end
