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

minetest.register_node("default:platform", {
    description = "Platform",
    tiles = {"default_light.png"},
    groups = {oddly_breakable_by_hand = 2},
    after_place_node = function(pos)
        local function find_and_replace(pos, radius, tofind, replacement)
            local dx, dz
            for dx = -radius, radius do
                for dz = -radius, radius do
                    pos.x = pos.x + dx
                    pos.z = pos.z + dz
                    if minetest.get_node(pos).name == tofind then
                        minetest.add_node(pos, {name = replacement})
                    end
                    pos.z = pos.z - dz
                    pos.x = pos.x - dx
                end
            end
        end
        find_and_replace(pos, 3, "air", "default:platform_border")
        minetest.after(7, find_and_replace, pos, 3, "default:platform_border",
            "air")
    end,
    on_punch = function(pos)
        minetest.registered_nodes["default:platform"].after_place_node(pos)
    end,
})

minetest.register_node("default:platform_border", {
    description = "You shouldn't get this :p",
    tiles = {"default_steel.png"},
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
