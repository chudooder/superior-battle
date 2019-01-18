local Stage = require('src.engine.Stage')
local SpriteSheet = require('src.engine.render.SpriteSheet')
local TestEntity = require('src.game.TestEntity')

local currentStage = Stage:new()

function love.load()
    love.window.setTitle("Superior Battle")
    love.window.setMode(1280, 720)

    -- sets the scaling filter to nearest-neighbor
    love.graphics.setDefaultFilter("nearest", "nearest", 1)
    
    local entity = TestEntity:new{x=300, y=100, angle=0, sx=4, sy=4}
    local entity2 = TestEntity:new{parent=entity, x=50, y=0}
    entity2.text = "at an angle!"
    currentStage:addEntity(entity)
    currentStage:addEntity(entity2)
end

function love.update()
    currentStage:update()
end

function love.draw()
    currentStage:draw()
end