local class = require('lib.middleclass')

local SpriteRenderer = class('SpriteRenderer')
function SpriteRenderer:initialize(entity, image)
    self.entity = entity
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