sect = {}

function sect:new(number,lvlg)

    local obj = {}
        math.randomseed(os.time() + number)

        obj.background = display.newRect(lvlg.back,Width  * number,0,Width, Height)
        obj.background.anchorX = 0
        obj.background.anchorY = 0
        obj.background:setFillColor((140 + number*5)/255,(148+ number*5)/255,(148+ number*5)/255)

        obj.tree = {}
        obj.gtree = display.newGroup()
        table.insert(lvlg.back,obj.gtree)

        local countBackTree = math.random(1,3)
        local countMidTree = math.random(2,4)
        print("Количество деревьев заднего фона: " .. countBackTree .. "\nКоличество деревьев переднего фона: "..countMidTree)
        for i = 1, countBackTree do
            local rand = math.random(1,2)
            obj.tree[i] = display.newImageRect(obj.gtree,"src/sprites/backTree"..rand..".png",math.random(Width/4,Width/3),math.random(Height*1.1,Height*1.2))
            print("Диапазон задних: ".. Width/16 + obj.background.x + (i-1)/countBackTree*Width,obj.background.x + i*Width/countBackTree -Width/10)
            obj.tree[i].x = math.random(Width/16 + obj.background.x + (i-1)/countBackTree*Width,obj.background.x + i*Width/countBackTree -Width/10)
            obj.tree[i].y = obj.tree[i].height/2

        end
        for i = 1, countMidTree do
            local rand = math.random(1,3)
            obj.tree[i] = display.newImageRect(obj.gtree,"src/sprites/midTree"..rand..".png",math.random(Width/4,Width/3),math.random(Height*1.1,Height*1.2))
            print("Диапазон передних: ".. Width/16 + obj.background.x + (i-1)/countMidTree*Width,obj.background.x + i*Width/countMidTree - Width/10)
            obj.tree[i].x = math.random(Width/16 + obj.background.x + (i-1)/countMidTree*Width,obj.background.x + i*Width/countMidTree - Width/10)
            obj.tree[i].y = obj.tree[i].height/2

        end

        local rand = math.random(1,2)
        obj.ground = display.newImageRect(lvlg.mid,"src/sprites/ground"..rand..".png",Width,Height/4)
        obj.ground.x = obj.background.x
        obj.ground.anchorX = 0
        obj.ground.y = Height - Height/8
        obj.grass = display.newImageRect(lvlg.front,"src/sprites/grass"..rand..".png",Width,Height/3)
        obj.grass.x = obj.background.x
        obj.grass.anchorX = 0
        obj.grass.y = obj.ground.y - Height/10

    function obj:update(event)
        obj.gtree.x = obj.gtree.x - 2
        obj.ground.x = obj.gtree.x - 4
        obj.grass.x = obj.grass.x - 4
    end

    setmetatable(obj,self)
    self.__index = self
    return obj
end
