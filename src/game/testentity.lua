local class = require('lib.middleclass')
local Entity = require('src.engine.entity')

local TestEntity = class('TestEntity', Entity)

function TestEntity:initialize()
    Entity.initialize(self)
    self.text = "Hello world!"
end

function TestEntity:draw()
    love.graphics.print(self.text, 200, 200)
end

-- exports
return TestEntity