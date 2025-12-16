--technology.lua

data:extend({
    {
        type = "technology",
        name = "nauvi-tea",
        icon = "__nauvi-tea__/graphics/technology/nauvi-tea.png",
        icon_size = 256,
        prerequisites = { "tree-seeding", "carbon-fiber" },
        effects = {
            { type = "unlock-recipe", recipe = "synthetize-tea-plant-seed" },
            { type = "unlock-recipe", recipe = "tea-withering" },
            { type = "unlock-recipe", recipe = "tea-crushing" },
            { type = "unlock-recipe", recipe = "tea-oxidization" },
            { type = "unlock-recipe", recipe = "tea-steaming" },
            { type = "unlock-recipe", recipe = "tea-drying" },
            { type = "unlock-recipe", recipe = "tea-bagging" },
            { type = "unlock-recipe", recipe = "tea-brewing-raw" },
            { type = "unlock-recipe", recipe = "tea-brewing-bag" },
        },
        unit = {
            count = 1000,
            ingredients = {
                { "automation-science-pack",   1 },
                { "logistic-science-pack",     1 },
                { "chemical-science-pack",     1 },
                { "production-science-pack",   1 },
                { "utility-science-pack",      1 },
                { "space-science-pack",        1 },
                { "agricultural-science-pack", 1 }
            },
            time = 60
        },
        localised_name = {"technology-name.nauvi-tea"},
        localised_description = { "technology-description.nauvi-tea" },
    }
})