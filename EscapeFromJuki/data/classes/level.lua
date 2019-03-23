local sectLevel = require("classes.sectLevel")
lvl = {}

function lvl:new(number)

    local obj = {}
        obj.number = number
        math.randomseed(os.time() + number)
        obj.countSceneRun = math.random(4 + 2 * number, 10 + 2 * number)
        obj.countSceneBreakBrain = math.random(1 + number, 2 + number)
        obj.layers = display.newGroup()
        obj.layers.back = display.newGroup()
        obj.layers.mid = display.newGroup()
        obj.layers.front = display.newGroup()
        obj.locations = {}
        for i = 1, obj.countSceneRun do
            obj.locations[i] = sect:new(i-1,obj.layers)
        end


    function obj:update(event)
        if (obj.locations[obj.countSceneRun].ground.x >= 0) then
            for i = 1, obj.countSceneRun do
                obj.locations[i]:update()
            end
        end
    end

    function obj:start()
        Runtime:addEventListener("enterFrame",update)
    end


    setmetatable(obj,self)
    self.__index = self
    return obj
end
