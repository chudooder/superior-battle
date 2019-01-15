local class = require('lib.middleclass')
local Entity = require('src.engine.Entity')
local SpriteRenderer = require('src.engine.component.SpriteRenderer')

local TestEntity = class('TestEntity', Entity)

function TestEntity:initialize(arg)
    Entity.initialize(self, arg)
    self.text = "Hello world!"
    self.spriteRenderer = SpriteRenderer:new(self, love.graphics.newImage("res/chudooder-256.png"))
end

function TestEntity:update()
    local deltaTime = love.timer.getDelta()
    self.localTransform:rotate(deltaTime * 3.14159)
end

function TestEntity:draw()
    -- set self.transform to this entity's transform in world coordinates
    worldX, worldY = self:localToWorld(0, -20)
    love.graphics.print(self.text, worldX, worldY)
    self.spriteRenderer:draw()
end

-- exports
return TestEntity