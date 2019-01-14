local class = require('lib.middleclass')
local struct = require('src.common.struct')

---------------------------------
-- Stage: container for entities.
---------------------------------

local Stage = class('Stage')

function Stage:initialize()
    self.entities = {}
    self.addEntityQueue = struct.Queue:new()
    self.removeEntityQueue = struct.Queue:new()
end

function Stage:update()
    -- process all current entities
    for eid, entity in pairs(self.entities) do
        entity:update()
    end

    -- add entities that have been queued up
    while not self.addEntityQueue:empty() do
        e = self.addEntityQueue:dequeue()
        self.entities[e.id] = e
    end

    -- remove entities that have been queued up
    while not self.removeEntityQueue:empty() do
        e = self.removeEntityQueue:dequeue()
        self.entities[e.id] = nil
    end
end

function Stage:draw()
    for eid, entity in pairs(self.entities) do
        entity:draw()
    end
end

function Stage:addEntity(entity)
    entity.stage = self;
    self.addEntityQueue:enqueue(entity)
end

function Stage:removeEntity(entity)
    self.removeEntityQueue:enqueue(entity)
end

-- exports
return Stage