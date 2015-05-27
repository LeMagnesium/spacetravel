-- Nodes
--

-- Index
--[[
1. Elements
    - default:duranium
    - default:tritanium

x. Unsorted
    - default:steel
    - default:light
    - default:stairs
    - default:glass
]]


-- 1. Elements

minetest.register_node("default:duranium", {
    description = "Duranium",
    drawtype = "nodebox",
    paramtype = "light",
    node_box = {
        type = "fixed",
        fixed = {
            {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
        },
    },
    tiles = {"default_duranium.png"},
    groups = {cracky=3,level=1},
})

minetest.register_node("default:tritanium", {
    description = "Tritanium",
    drawtype = "nodebox",
    paramtype = "light",
    node_box = {
        type = "fixed",
        fixed = {
            {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
        },
    },
    tiles = {"default_tritanium.png"},
    groups = {cracky=3,level=1},
})

minetest.register_node("default:steel", {
    description = "Steel",
    drawtype = "nodebox",
    paramtype = "light",
    node_box = {
        type = "fixed",
        fixed = {
            {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
        },
    },
    tiles = {"default_steel.png"},
    groups = {cracky=3,level=1},
})

minetest.register_node("default:stairs", {
    description = "Stairs",
    drawtype = "nodebox",
    paramtype = "light",
    node_box = {
        type = "fixed",
        fixed = {
            {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
            {-0.5, 0, 0, 0.5, 0.5, 0.5},
        },
    },
    tiles = {"default_steel.png"},
    groups = {cracky=3,level=1},
})

minetest.register_node("default:glass", {
    description = "Glass",
    drawtype = "glasslike",
    tiles = {"default_glass.png", "default_glass_detail.png"},
    paramtype = "light",
    sunlight_propagates = true,
    groups = {cracky=3},
})

minetest.register_node("default:light", {
    description = "Light",
    drawtype = "allfaces_optional",
    tiles = {"default_light.png"},
    paramtype = "light",
    sunlight_propagates = true,
    groups = {cracky = 3, oddly_breakable_by_hand = 3},
    light_source = 14,
})
