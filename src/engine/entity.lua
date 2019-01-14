local class = require('lib.middleclass')

-------------------------------------------
-- Entity: base class for all game objects.
-------------------------------------------

local Entity = class('Entity')

Entity.static.ID_COUNTER = 0
function Entity:initialize()
    self.id = Entity.ID_COUNTER
    self.stage = nil
    Entity.ID_COUNTER = Entity.ID_COUNTER + 1
end


-- gotta define these here
function Entity:update()
end

function Entity:draw()
end

-- exports
return Entity