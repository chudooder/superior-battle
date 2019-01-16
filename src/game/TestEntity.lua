local class = require('lib.middleclass')
local Entity = require('src.engine.Entity')
local Component = require('src.engine.component.Component')
local SpriteRenderer = require('src.engine.component.SpriteRenderer')

-- Subclasses of entities are intended to be used as convenient ways
-- to create certain arrangements of components, and not as a way
-- to define new behavior directly.

local TestEntity = class('TestEntity', Entity)

local Spinner = class('Spinner', Component)
function Spinner:update(dt)
    self.entity.localTransform:rotate(dt * 3.14159)
end

function TestEntity:initialize(arg)
    Entity.initialize(self, arg)
    self.text = "Hello world!"

    -- add components
    local sr = SpriteRenderer:new(love.graphics.newImage("res/chudooder-256.png"))
    
    -- the spinner component is not defined as a class explicitly, but we can
    -- anonymously define it here using the functions below
    local spinner = Spinner:new()
    spinner.update = update

    self:addComponent(sr)
    self:addComponent(spinner)
end

-- As we are using components to define entity behavior, we do NOT 
-- override Entity.update or Entity.draw. Instead, we can
-- define a component here and add it in this class's initializer.



-- exports
return TestEntity