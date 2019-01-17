local class = require('lib.middleclass')
local Component = require('src.engine.component.Component')

local SpriteRenderer = class('SpriteRenderer', Component)
function SpriteRenderer:initialize(spriteOptions)
    Component.initialize(self)
    self.image = spriteOptions.image
    -- maintain a transform object to calculate where to draw
    self.transform = love.math.newTransform()
    
    --table of frames quads for animation
    self.frames = {}
    self.numOfFrames = spriteOptions.numOfFrames

    --length of animation duration in seconds
    self.animationDuration = spriteOptions.animationDuration
    --time counter used to update animation 
    self.currentTime = 0

    --grab dimensions of spritesheet
    local height = self.image:getHeight()
    local width = self.image:getWidth() / self.numOfFrames

    local i=0
    while i < self.numOfFrames do
      table.insert(self.frames,love.graphics.newQuad(i*width, 0, height, width, self.image:getDimensions()))
      i = i + 1
    end
    print(#self.frames)
end

function SpriteRenderer:draw()
    -- calculate the entity's combined transformation 
    self.transform:reset()
    self.entity:getTransform(self.transform)
    local frameNum = math.floor(self.currentTime / self.animationDuration * #self.frames) + 1
    love.graphics.draw(self.image, self.frames[frameNum], self.transform)
end

function SpriteRenderer:update(dt)
  --update animationtimer reset once reaches duration
    self.currentTime = self.currentTime + dt
    if self.currentTime >= self.animationDuration then
      self.currentTime = self.currentTime - self.animationDuration
    end
end

return SpriteRenderer
