-- data.lua

-- Enable auto-barreling for thruster oxidizer
-- Has to be in data.lua stage, data-updates.lua is too late.
if data.raw["fluid"]["thruster-oxidizer"] then
    data.raw["fluid"]["thruster-oxidizer"].auto_barrel = true
end

require("prototypes.plant")
require("prototypes.item-groups")
require("prototypes.item")
require("prototypes.recipe")
require("prototypes.technology")
require("prototypes.achievement")