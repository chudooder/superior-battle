local class = require('lib.middleclass')

local Animation = class('Animation')

-- represents a list of quads in a spritesheet
function Animation:initialize(spriteSheet, quadList, length)
    self.spriteSheet = spriteSheet
    self.quadList = quadList
    self.numFrames = #quadList
    self.length = length
end

return Animation