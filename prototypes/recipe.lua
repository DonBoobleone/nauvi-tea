--prototypes/recipe.lua

-- ===================================================================
-- Every step of processing is faster then letting it spoil
-- Some steps result will spoil into spoilage not the next step of the chain
-- Making quality tea and not rushing it with speed modules or beacons is desired, most steps can be quality moduled.
-- ===================================================================

-- TODO: Balance spoil times and plant growth time as well as stage spoil time ratios.

data:extend({
    -- ===================================================================
    -- 1. Withering (very slow, moisture reduction to 50-60%)
    -- Version-1: leaves spoil into withered-leaves (24-48h real time)
    -- Version-2: Through withering, machine with hot air blasts and distribution (18 hours)
    -- ===================================================================
    {
        type = "recipe",
        name = "tea-withering",
        icons = {
            { icon = "__nauvi-tea__/graphics/icons/tea-leaves.png",         icon_size = 64, scale = 0.5,  shift = { -8, 8 } },
            { icon = "__base__/graphics/icons/signal/signal-hourglass.png", icon_size = 64, scale = 0.25, shift = { 4, -4 }, tint = { r = 1, g = 0.5, b = 0, a = 1 } },
        },
        localised_name = { "recipe-name.tea-withering" },
        category = "crafting",
        enabled = false,
        energy_required = 180,
        ingredients = {
            { type = "item", name = "tea-leaves", amount = 200 },
        },
        results = {
            { type = "item", name = "withered-tea-leaves", amount = 200 },
        },
        allowed_module_categories = { "efficiency", "quality" },
        allow_inserter_overload = false,
        overload_multiplier = 1,
        allow_decomposition = false,
        auto_recycle = false,
        always_show_made_in = false,                                -- default false, set this to true for smelting recipes
        result_is_always_fresh = true,                              -- set this to false for intermediates that spoil into spoilage instead of next stage
        crafting_machine_tint = { r = 0.5, g = 1, b = 0.5, a = 1 }, -- tint for working_visualisations -- light green
        subgroup = "tea-processing",
        order = "t[tea]-a[withering]"
    },
    -- ===================================================================
    -- 2 Crushing/rolling
    -- ===================================================================
    {
        type = "recipe",
        name = "tea-crushing",
        icons = {
            { icon = "__nauvi-tea__/graphics/icons/withered-tea-leaves.png",        icon_size = 64, scale = 0.5, shift = { -8, 8 } },
            { icon = "__core__/graphics/icons/tooltips/tooltip-category-debug.png", icon_size = 40, scale = 0.4, shift = { 4, -4 }, tint = { r = 0.6, g = 0.8, b = 0.6, a = 0.7 } },
        },
        localised_name = { "recipe-name.tea-crushing" },
        category = "crafting",
        additional_categories = { "crushing" },
        enabled = false,
        energy_required = 2,
        ingredients = {
            { type = "item", name = "withered-tea-leaves", amount = 12 },
        },
        results = {
            { type = "item", name = "crushed-tea-leaves", amount = 12 },
        },
        allowed_module_categories = { "efficiency", "quality" },
        allow_decomposition = false,
        auto_recycle = false,
        always_show_made_in = false,
        result_is_always_fresh = true,
        crafting_machine_tint = {},
        subgroup = "tea-processing",
        order = "t[tea]-b[crushing]"
    },
    -- ===================================================================
    -- 3. Fermentation / Oxidation
    -- If you leave it on air it oxidizes, so it can spoil into this with long spoil time
    -- Oxidizer can fasten the process or add quality
    -- ===================================================================
    {
        type = "recipe",
        name = "tea-oxidization",
        icons = {
            { icon = "__nauvi-tea__/graphics/icons/crushed-tea-leaves.png",      icon_size = 64, scale = 0.5,  shift = { -4, 4 } },
            { icon = "__space-age__/graphics/icons/fluid/thruster-oxidizer.png", icon_size = 64, scale = 0.25, shift = { 8, -8 } }
        },
        localised_name = { "recipe-name.tea-oxidization" },
        category = "chemistry",
        enabled = false,
        energy_required = 12,
        ingredients = {
            { type = "item",  name = "crushed-tea-leaves", amount = 36 },
            { type = "fluid", name = "thruster-oxidizer",  amount = 50 }
        },
        results = {
            { type = "item",  name = "oxidized-tea-leaves", amount = 36 },
            { type = "fluid", name = "thruster-oxidizer",   amount = 30 }
        },
        main_product = "oxidized-tea-leaves",
        allowed_module_categories = { "efficiency", "quality" },
        allow_decomposition = false,
        auto_recycle = false,
        always_show_made_in = false,
        result_is_always_fresh = true,
        crafting_machine_tint = { r = 0.5, g = 0.8, b = 1, a = 1 }, -- light blue
        subgroup = "tea-processing",
        order = "t[tea]-c[oxidization]"
    },

    -- ===================================================================
    -- 4. Lock the enzymes (chemistry)
    -- quick steaming it
    -- ===================================================================
    {
        type = "recipe",
        name = "tea-steaming",
        icons = {
            { icon = "__nauvi-tea__/graphics/icons/oxidized-tea-leaves.png", icon_size = 64, scale = 0.5,  shift = { -4, 4 } },
            { icon = "__base__/graphics/icons/fluid/steam.png",              icon_size = 64, scale = 0.25, shift = { 8, -8 } }
        },
        localised_name = { "recipe-name.tea-steaming" },
        category = "chemistry",
        enabled = false,
        energy_required = 1,
        ingredients = {
            { type = "item",  name = "oxidized-tea-leaves", amount = 12 },
            { type = "fluid", name = "steam",               amount = 100 }
        },
        results = {
            { type = "item",  name = "steamed-tea-leaves", amount = 12 },
            { type = "fluid", name = "steam",              amount = 80 }
        },
        main_product = "steamed-tea-leaves",
        allowed_module_categories = { "efficiency", "quality" },
        allow_decomposition = false,
        auto_recycle = false,
        always_show_made_in = false,
        result_is_always_fresh = true,
        crafting_machine_tint = { r = 0.5, g = 1, b = 0.5, a = 1 }, -- light green
        subgroup = "tea-processing",
        order = "t[tea]-d[steaming]"
    },
    -- ===================================================================
    -- 5. Drying (smelting) -
    -- ===================================================================
    {
        type = "recipe",
        name = "tea-drying",
        icons = {
            { icon = "__nauvi-tea__/graphics/icons/steamed-tea-leaves.png",        icon_size = 64, scale = 0.5, shift = { -4, 4 } },
            { icon = "__core__/graphics/icons/tooltips/tooltip-category-heat.png", icon_size = 40, scale = 0.4, shift = { 8, -8 } }
        },
        localised_name = { "recipe-name.tea-drying" },
        category = "smelting",
        enabled = false,
        energy_required = 1,
        ingredients = { { type = "item", name = "steamed-tea-leaves", amount = 8 } },
        results = { { type = "item", name = "dried-flavourful-tea-leaves", amount = 8 } },
        allowed_module_categories = { "efficiency", "quality" },
        allow_decomposition = false,
        auto_recycle = false,
        always_show_made_in = true,
        result_is_always_fresh = true,
        crafting_machine_tint = { r = 1, g = 0.8, b = 0.3, a = 1 }, -- darker warm yellow
        subgroup = "tea-processing",
        order = "t[tea]-e[drying]"
    },
    -- ===================================================================
    -- 5.5 Long Storage and mobility
    -- This item won't spoil
    -- ===================================================================
    {
        type = "recipe",
        name = "tea-bagging",
        icons = {
            { icon = "__nauvi-tea__/graphics/icons/tea-sack.png",                    icon_size = 64, scale = 0.5,  shift = { -4, 4 } },
            { icon = "__nauvi-tea__/graphics/icons/dried-flavourful-tea-leaves.png", icon_size = 64, scale = 0.25, shift = { 8, -8 } }
        },
        localised_name = { "recipe-name.tea-bagging" },
        category = "crafting",
        enabled = false,
        energy_required = 4,
        ingredients = {
            { type = "item", name = "dried-flavourful-tea-leaves", amount = 100 },
            { type = "item", name = "carbon-fiber",                amount = 1 }
        },
        results = {
            { type = "item", name = "tea-sack", amount = 1 },
        },
        allowed_module_categories = { "efficiency", "quality" },
        allow_decomposition = false,
        auto_recycle = false,
        always_show_made_in = false,
        result_is_always_fresh = true,
        crafting_machine_tint = { r = 0.5, g = 0.5, b = 0.5, a = 1 }, -- grey
        subgroup = "tea-processing",
        order = "t[tea]-f[bagging]"
    },
    -- ===================================================================
    -- 6. Brewing
    -- ===================================================================
    {
        type = "recipe",
        name = "tea-brewing-raw",
        icons = {
            { icon = "__nauvi-tea__/graphics/icons/nauvi-tea.png",                   icon_size = 64, scale = 0.5,  shift = { -4, 4 } },
            { icon = "__nauvi-tea__/graphics/icons/dried-flavourful-tea-leaves.png", icon_size = 64, scale = 0.25, shift = { 8, -8 } }
        },
        localised_name = { "recipe-name.tea-brewing-raw" },
        category = "chemistry",
        enabled = false,
        energy_required = 5,
        ingredients = {
            { type = "item",  name = "dried-flavourful-tea-leaves", amount = 100 },
            { type = "item",  name = "barrel",                      amount = 1 },
            { type = "fluid", name = "steam",                       amount = 500 }
        },
        results = {
            { type = "item", name = "nauvi-tea", amount = 1 },
        },
        allowed_module_categories = { "efficiency", "quality" },
        allow_decomposition = false,
        auto_recycle = false,
        always_show_made_in = false,
        result_is_always_fresh = false,
        crafting_machine_tint = { r = 0.8, g = 1, b = 0.6, a = 1 }, -- greenish golden glow tint
        subgroup = "tea-processing",
        order = "t[tea]-g[brewing]"
    },
    {
        type = "recipe",
        name = "tea-brewing-bag",
        icons = {
            { icon = "__nauvi-tea__/graphics/icons/nauvi-tea.png", icon_size = 64, scale = 0.5,  shift = { -4, 4 } },
            { icon = "__nauvi-tea__/graphics/icons/tea-sack.png",  icon_size = 64, scale = 0.25, shift = { 8, -8 } }
        },
        localised_name = { "recipe-name.tea-brewing-bag" },
        category = "chemistry",
        enabled = false,
        energy_required = 5,
        ingredients = {
            { type = "item",  name = "tea-sack", amount = 1 },
            { type = "item",  name = "barrel",   amount = 1 },
            { type = "fluid", name = "steam",    amount = 500 }
        },
        results = {
            { type = "item", name = "nauvi-tea",    amount = 1 },
            { type = "item", name = "carbon-fiber", amount = 1, probability = 0.95 }
        },
        main_product = "nauvi-tea",
        allowed_module_categories = { "efficiency", "quality" },
        allow_decomposition = false,
        auto_recycle = false,
        always_show_made_in = false,
        result_is_always_fresh = true,
        crafting_machine_tint = { r = 0.8, g = 1, b = 0.6, a = 1 }, -- greenish golden glow tint
        subgroup = "tea-processing",
        order = "t[tea]-h[brewing]"
    },
    -- ===================================================================
    -- Seed
    -- ===================================================================
    {
        type = "recipe",
        name = "synthetize-tea-plant-seed",
        icons = {
            { icon = "__nauvi-tea__/graphics/icons/tea-plant-seed.png",   icon_size = 64, scale = 0.5,  shift = { 0, 0 } },
            { icon = "__core__/graphics/icons/mip/item-request-slot.png", icon_size = 64, scale = 0.25, shift = { 8, -8 } }
        },
        localised_name = { "recipe-name.synthetize-tea-plant-seed" },
        category = "advanced-crafting",
        additional_categories = { "organic" },
        enabled = false,
        energy_required = 20,
        ingredients = {
            { type = "item", name = "space-science-pack", amount = 1 },
            { type = "item", name = "tree-seed",          amount = 10 }
        },
        results = { { type = "item", name = "tea-plant-seed", amount = 10 } },
        allowed_module_categories = { "efficiency", "speed", "productivity" },
        allow_decomposition = false,
        auto_recycle = false,
        always_show_made_in = false,
        crafting_machine_tint = { r = 1, g = 0.6, b = 0.3, a = 1 }, -- orange-brown tint
        subgroup = "tea-processing",
        order = "t[seed]-a[tea-seed]"
    }
})
