-- achievements.lua
data:extend({
    {
        type = "use-item-achievement",
        name = "one-tea-to-rule-them-all",
        order = "q[quality]-c[one-tea-to-rule-them-all]",
        to_use = "nauvi-tea",
        limit_quality = "legendary",
        icon = "__nauvi-tea__/graphics/achievement/one-tea-to-rule-them-all.png",
        icon_size = 128,
        hidden = true,
        localised_name = {"achievement-name.one-tea-to-rule-them-all"},
        localised_description = {"achievement-description.one-tea-to-rule-them-all"}
    },
    {
        type = "produce-achievement",
        name = "industrial-quali-tea",
        order = "q[quality]-c[industrial-quali-tea]",
        item_product = "tea-sack",
        amount = 5000,
        limited_to_one_game = true,
        icon = "__nauvi-tea__/graphics/achievement/industrial-quali-tea.png",
        icon_size = 128,
        localised_name = {"achievement-name.industrial-quali-tea"},
        localised_description = {"achievement-description.industrial-quali-tea"}
    },
})