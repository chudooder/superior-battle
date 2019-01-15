local Stage = require('src.engine.Stage')
local TestEntity = require('src.game.TestEntity')

local currentStage = Stage:new()


-- testing
local entity = TestEntity:new{x=300, y=100, angle=(3.14159 / 8)}
local entity2 = TestEntity:new{parent=entity, x=300, y=0, angle=(3.14159 / 4), sx=0.5, sy=0.5}
entity2.text = "at an angle!"
currentStage:addEntity(entity)
currentStage:addEntity(entity2)

function love.load()
    love.window.setTitle("Superior Battle")
    love.window.setMode(1280, 720)
end

function love.update()
    currentStage:update()
end

function love.draw()
    currentStage:draw()
end