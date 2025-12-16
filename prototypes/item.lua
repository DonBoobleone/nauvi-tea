--item.lua
local item_sounds = require("__base__.prototypes.item_sounds")
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")
local item_effects = require("__space-age__.prototypes.item-effects")

local leaf_weight = 0.05 * kg
local leaf_fuel_value = "100kJ"

data:extend({
    {
        type = "item",
        name = "tea-leaves",
        icon = "__nauvi-tea__/graphics/icons/tea-leaves.png",
        pictures =
        {
            { size = 64, filename = "__nauvi-tea__/graphics/icons/tea-leaves.png",   scale = 0.5, mipmap_count = 4 },
            { size = 64, filename = "__nauvi-tea__/graphics/icons/tea-leaves-2.png", scale = 0.5, mipmap_count = 4 },
            { size = 64, filename = "__nauvi-tea__/graphics/icons/tea-leaves-3.png", scale = 0.5, mipmap_count = 4 },
            { size = 64, filename = "__nauvi-tea__/graphics/icons/tea-leaves-4.png", scale = 0.5, mipmap_count = 4 }
        },
        localised_name = { "item-name.tea-leaves" },
        subgroup = "tea",
        order = "t[tea]-a[leaves]",
        stack_size = 200,
        weight = leaf_weight,
        fuel_value = "100kJ",
        fuel_category = "chemical",
        default_import_location = "nauvis",
        inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
        pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
        spoil_ticks = 8 * minute,
        spoil_result = "withered-tea-leaves"
    },
    {
        type = "item",
        name = "withered-tea-leaves",
        icon = "__nauvi-tea__/graphics/icons/withered-tea-leaves.png",
        pictures =
        {
            { size = 64, filename = "__nauvi-tea__/graphics/icons/withered-tea-leaves.png",   scale = 0.5, mipmap_count = 4 },
            { size = 64, filename = "__nauvi-tea__/graphics/icons/withered-tea-leaves-2.png", scale = 0.5, mipmap_count = 4 },
            { size = 64, filename = "__nauvi-tea__/graphics/icons/withered-tea-leaves-3.png", scale = 0.5, mipmap_count = 4 },
            { size = 64, filename = "__nauvi-tea__/graphics/icons/withered-tea-leaves-4.png", scale = 0.5, mipmap_count = 4 },
        },
        localised_name = { "item-name.withered-tea-leaves" },
        subgroup = "tea",
        order = "t[tea]-b[withered]",
        stack_size = 200,
        weight = leaf_weight,
        fuel_value = "100kJ",
        fuel_category = "chemical",
        inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
        pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
        spoil_ticks = 6 * minute,
        spoil_result = "spoilage"
    },
    {
        type = "item",
        name = "crushed-tea-leaves",
        icon = "__nauvi-tea__/graphics/icons/crushed-tea-leaves.png",
        pictures =
        {
            { size = 64, filename = "__nauvi-tea__/graphics/icons/crushed-tea-leaves.png",   scale = 0.5, mipmap_count = 4 },
            { size = 64, filename = "__nauvi-tea__/graphics/icons/crushed-tea-leaves-2.png", scale = 0.5, mipmap_count = 4 },
            { size = 64, filename = "__nauvi-tea__/graphics/icons/crushed-tea-leaves-3.png", scale = 0.5, mipmap_count = 4 },
        },
        localised_name = { "item-name.crushed-tea-leaves" },
        subgroup = "tea",
        order = "t[tea]-c[crushed]",
        stack_size = 200,
        weight = leaf_weight,
        fuel_value = "100kJ",
        fuel_category = "chemical",
        inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
        pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
        spoil_ticks = 6 * minute,
        spoil_result = "oxidized-tea-leaves"
    },
    {
        type = "item",
        name = "oxidized-tea-leaves",
        icon = "__nauvi-tea__/graphics/icons/oxidized-tea-leaves.png",
        pictures =
        {
            { size = 64, filename = "__nauvi-tea__/graphics/icons/oxidized-tea-leaves.png",   scale = 0.5, mipmap_count = 4 },
            { size = 64, filename = "__nauvi-tea__/graphics/icons/oxidized-tea-leaves-2.png", scale = 0.5, mipmap_count = 4 },
            { size = 64, filename = "__nauvi-tea__/graphics/icons/oxidized-tea-leaves-3.png", scale = 0.5, mipmap_count = 4 },
            { size = 64, filename = "__nauvi-tea__/graphics/icons/oxidized-tea-leaves-4.png", scale = 0.5, mipmap_count = 4 },
        },
        localised_name = { "item-name.oxidized-tea-leaves" },
        subgroup = "tea",
        order = "t[tea]-d[oxidized]",
        stack_size = 200,
        weight = leaf_weight,
        fuel_value = "100kJ",
        fuel_category = "chemical",
        inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
        pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
        spoil_ticks = 1 * minute,
        spoil_result = "spoilage"
    },
    {
        type = "item",
        name = "steamed-tea-leaves",
        icon = "__nauvi-tea__/graphics/icons/steamed-tea-leaves.png",
        pictures =
        {
            { size = 64, filename = "__nauvi-tea__/graphics/icons/steamed-tea-leaves.png",   scale = 0.5, mipmap_count = 4 },
            { size = 64, filename = "__nauvi-tea__/graphics/icons/steamed-tea-leaves-2.png", scale = 0.5, mipmap_count = 4 },
        },
        localised_name = { "item-name.steamed-tea-leaves" },
        subgroup = "tea",
        order = "t[tea]-e[steamed]",
        stack_size = 200,
        weight = leaf_weight,
        fuel_value = "100kJ",
        fuel_category = "chemical",
        inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
        pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
        spoil_ticks = 12 * minute,
        spoil_result = "dried-flavourful-tea-leaves"
    },
    {
        type = "item",
        name = "dried-flavourful-tea-leaves",
        icon = "__nauvi-tea__/graphics/icons/dried-flavourful-tea-leaves.png",
        pictures =
        {
            { size = 64, filename = "__nauvi-tea__/graphics/icons/dried-flavourful-tea-leaves.png",   scale = 0.5, mipmap_count = 4 },
            { size = 64, filename = "__nauvi-tea__/graphics/icons/dried-flavourful-tea-leaves-2.png", scale = 0.5, mipmap_count = 4 },
            { size = 64, filename = "__nauvi-tea__/graphics/icons/dried-flavourful-tea-leaves-3.png", scale = 0.5, mipmap_count = 4 },
        },
        localised_name = { "item-name.dried-flavourful-tea-leaves" },
        subgroup = "tea",
        order = "t[tea]-f[dried]",
        stack_size = 200,
        weight = leaf_weight,
        fuel_value = "100kJ",
        fuel_category = "chemical",
        inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
        pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
        spoil_ticks = 12 * hour,
        spoil_result = "spoilage"
    },
    {
        type = "item",
        name = "tea-sack",
        icon = "__nauvi-tea__/graphics/icons/tea-sack.png",
        localised_name = { "item-name.tea-sack" },
        subgroup = "tea",
        order = "t[tea]-g[sack]",
        stack_size = 50,
        weight = 5 * kg,
        fuel_value = "10MJ",
        fuel_category = "chemical",
        default_import_location = "nauvis",
        inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
        pick_sound = space_age_item_sounds.agriculture_inventory_pickup
    },
    {
        type = "capsule",
        name = "nauvi-tea",
        icon = "__nauvi-tea__/graphics/icons/nauvi-tea.png",
        subgroup = "tea",
        order = "t[tea]-n[nauvi-tea]",
        fuel_category = "food",
        fuel_value = "12MJ", -- 2 x Bioflux
        -- burnt_result = "barrel", -- not supported by biter spawner
        spoil_ticks = 1 * hour, -- 0.5 x Bioflux
        spoil_result = "barrel",
        stack_size = 10,
        weight = 10 * kg,
        default_import_location = "nauvis",
        inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
        pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
        drop_sound = space_age_item_sounds.agriculture_inventory_move,
        capsule_action = item_effects.bioflux_speed_and_regen,
    },
    {
        type = "item",
        name = "tea-plant-seed",
        icon = "__nauvi-tea__/graphics/icons/tea-plant-seed.png",
        localised_name = { "item-name.tea-plant-seed" },
        localised_description = {"item-description.tea-plant-seed"},
        plant_result = "tea-plant",
        place_result = "tea-plant",
        subgroup = "tea",
        order = "t[seed]-t[tea]",
        stack_size = 20,
        weight = 2 * kg,
        fuel_value = "1MJ",
        fuel_category = "chemical",
    },
})
