-- Nodes
--

-- Index
--[[
1. Elements
    - default:duranium
    - default:tritanium

3. Miscellaneous
    - default:platform
    - default:platform_border

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


-- 3. Miscellaneous

local function pop_up_platform(pos)
    default.find_and_replace(pos, 3, "air", "default:platform_border")
    minetest.after(7, default.find_and_replace, pos, 3,
    "default:platform_border", "air")
end

minetest.register_node("default:platform", {
    description = "Platform",
    tiles = {"default_platform_top.png",    -- +Y
             "default_platform_top.png",    -- -Y
             "default_platform_side.png"},  -- +X/-X/+Z/-Z
    groups = {oddly_breakable_by_hand = 2, mesecon = 2},
    after_place_node = pop_up_platform,
    on_punch = pop_up_platform,
    mesecons = {
        effector = {
            action_on = pop_up_platform
        }
    }
})

minetest.register_node("default:platform_border", {
    description = "You shouldn't get this :p (default:platform_border)",
    tiles = {"default_platform_border_top.png",
             "default_platform_border_top.png",
             "default_platform_side.png"},
    groups = {oddly_breakable_by_hand = 2},
    drop = ""
})

-- x. Unsorted
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
