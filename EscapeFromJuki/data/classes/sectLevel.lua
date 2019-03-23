sect = {}

function sect:new(number,lvlg)

    local obj = {}
        math.randomseed(os.time() + number)
        obj.number = number
        obj.background = display.newRect(lvlg.back,Width  * number,0,Width, Height)
        obj.background.anchorX = 0
        obj.background.anchorY = 0
        obj.background:setFillColor((130 - number)/255,(130- number)/255,(130- number)/255)
        obj.cx = obj.background.x
        obj.tree = {}
        obj.gtree = display.newGroup()
        table.insert(lvlg.back,obj.gtree)

        local countBackTree = math.random(1,3)
        local countMidTree = math.random(2,4)
        local prev = nil
        local rand = nil
        for i = 1, countBackTree do
            repeat
                rand = math.random(1,6)
                if (rand ~= prev) then
                    prev = rand
                end
            until (rand == prev)

            obj.tree[i] = display.newImageRect(obj.gtree,"src/sprites/backTree"..rand..".png",math.random(Width/4,Width/3),math.random(Height*1.1,Height*1.2))
            obj.tree[i].x = math.random(Width/16 + obj.background.x + (i-1)/countBackTree*Width,obj.background.x + i*Width/countBackTree - Width/10)
            obj.tree[i].y = obj.tree[i].height/2

        end

        prev = nil
        rand = nil
        for i = 1, countMidTree do
            repeat
                rand = math.random(1,7)
                if (rand ~= prev) then
                    prev = rand
                end
            until (rand == prev)

            obj.tree[i] = display.newImageRect(obj.gtree,"src/sprites/midTree"..rand..".png",math.random(Width/4,Width/3),math.random(Height*1.1,Height*1.2))
            obj.tree[i].x = math.random(Width/16 + obj.background.x + (i-1)/countMidTree*Width,obj.background.x + i*Width/countMidTree - Width/10)
            obj.tree[i].y = obj.tree[i].height/2

        end

        curGr = math.random(1,4)
        obj.ground = display.newImageRect(lvlg.mid,"src/sprites/Down"..curGr..".png",Width+2,Height/4)
        obj.ground.x = obj.background.x
        obj.ground.anchorX = 0
        obj.ground.y = Height - Height/8
        local physicsData = (require "shapes.floar").physicsData(1)
        physics.addBody(obj.ground,"static",physicsData:get("Down"..curGr))

        if (curGr < 3) then
            obj.grass = display.newImageRect(lvlg.front,"src/sprites/grass"..curGr..".png",Width+2,Height/4)
            obj.grass.x = obj.background.x
            obj.grass.anchorX = 0
            obj.grass.y = obj.ground.y - Height/12
        end
    function obj:update(event)
        obj.cx = obj.cx - 4
        obj.background.x = obj.background.x - 4
        obj.gtree.x = obj.gtree.x - 4
        obj.ground.x = obj.ground.x - 6
        if (obj.grass ~= nil) then
            obj.grass.x = obj.grass.x - 6
        end
    end


    function obj:destroy()
        display.remove(obj.background)
        display.remove(obj.gtree)
        display.remove(obj.ground)
        display.remove(obj.grass)
    end

    setmetatable(obj,self)
    self.__index = self
    return obj
end
