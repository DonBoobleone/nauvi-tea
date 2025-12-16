--plant.lua
local function gather_tile_restrictions()
    local allowed_grass_placement_tiles = {}
    -- filter for subgroup: nauvis-tiles
    for name, tile in pairs(data.raw.tile) do
        if tile.subgroup == "nauvis-tiles" then
            -- filter for any with "grass" in name
            if string.find(name, "grass") then
                table.insert(allowed_grass_placement_tiles, name)
            end
        end
    end
    return allowed_grass_placement_tiles
end

-- Plant definition
local tea_plant_entity = {
    type = "plant",
    name = "tea-plant",
    flags = { "placeable-neutral", "placeable-off-grid", "breaths-air" },
    subgroup = "tea-processing",
    order = "t[seed]-b[plant]",
    icon = "__nauvi-tea__/graphics/icons/tea-plant.png",
    icon_size = 64,
    hidden_in_factoriopedia = false,
    collision_box = { { -0.8, -0.8 }, { 0.8, 0.8 } },
    selection_box = { { -1.0, -1.0 }, { 1.0, 1.0 } },
    drawing_box_vertical_extension = 1.2,
    map_color = { 0.23, 0.7, 0.14, 1 },
    agricultural_tower_tint = {
        primary = { r = 0.5, g = 1.0, b = 0.2, a = 1 }, -- TODO
        secondary = { r = 0.561, g = 0.613, b = 0.308, a = 1.000 },
    },
    minable = {
        mining_particle = "leaf-particle",
        mining_time = 0.8,
        results = {
            { type = "item", name = "tea-leaves",     amount = 100 }, -- do min-max for variance? 80-120?
            { type = "item", name = "tea-plant-seed", amount = 1 },   -- 100% recycling seeds have to be pre made with recipe.
        },
    },
    harvest_emissions = { pollution = 1 },    -- Biters can smell this too
    -- variation_weights = { 1, 1, 1, 1, 1, 1 }, -- Must match variation count, only needed if not uniform
    colors = {
        { r = 0.17, g = 0.53, b = 0.11, a = 1 }, -- lightly autumn
        { r = 0.16, g = 0.60, b = 0.12, a = 1 }, -- medium dark green
        { r = 0.18, g = 0.65, b = 0.12, a = 1 }, -- medium green 
        { r = 0.33, g = 0.80, b = 0.24, a = 1 }, -- light green
        { r = 0.45, g = 0.55, b = 0.25, a = 1 }, -- light brown tint 
        { r = 0.23, g = 0.70, b = 0.14, a = 1 }, -- map color tint
    },
    growth_ticks = 10 * minute,
    surface_conditions = { { property = "pressure", min = 1000, max = 1000 } },
    autoplace = {
        probability_expression = 0,
        tile_restriction = gather_tile_restrictions()
    },
    max_health = 10,
    emissions_per_second = { pollution = -0.001 },
    variations = require("__nauvi-tea__/prototypes/tea-plant-variations"),
    impact_category = "tree",
}

data:extend({ tea_plant_entity })
