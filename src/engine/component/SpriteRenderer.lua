local class = require('lib.middleclass')
local Component = require('src.engine.component.Component')

local SpriteRenderer = class('SpriteRenderer', Component)
function SpriteRenderer:initialize(image)
    Component.initialize(self)
    self.image = image
    -- maintain a transform object to calculate where to draw
    self.transform = love.math.newTransform()
end

function SpriteRenderer:draw()
    -- calculate the entity's combined transformation 
    self.transform:reset()
    self.entity:getTransform(self.transform)
    love.graphics.draw(self.image, self.transform)
end

return SpriteRenderer