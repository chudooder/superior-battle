local Stage = require('src.engine.stage')
local TestEntity = require('src.game.testentity')

local currentStage = Stage:new()

-- testing
local entity = TestEntity:new()
currentStage:addEntity(entity)

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