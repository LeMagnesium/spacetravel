-- Nodes
--

-- Index
--[[
1. Elements
    - default:duranium
    - default:tritanium

2. Terrains
    - default:dirt

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

-- 2. Terrains
minetest.register_node("default:dirt", {
	description = "Dirt",
	tiles = {"default_dirt.png"},
	groups = {crumbly = 1}
})


-- 3. Miscellaneous

local function pop_up_xz_platform(pos)
    default.find_and_replace(pos, 3, 0, 3, "air", "default:platform_border")
    minetest.after(7, default.find_and_replace, pos, 3, 0, 3,
    "default:platform_border", "air")
end

local function pop_up_xy_platform(pos)
    default.find_and_replace(pos, 3, 3, 0, "air", "default:platform_border")
    minetest.after(7, default.find_and_replace, pos, 3, 3, 0,
    "default:platform_border", "air")
end

local function pop_up_yz_platform(pos)
    default.find_and_replace(pos, 0, 3, 3, "air", "default:platform_border")
    minetest.after(7, default.find_and_replace, pos, 0, 3, 3,
    "default:platform_border", "air")
end

minetest.register_node("default:platform", {
    description = "Temporary Platform (y)",
    tiles = {"default_platform_top.png",    -- +Y
             "default_platform_top.png",    -- -Y
             "default_platform_side.png"},  -- +X/-X/+Z/-Z
    groups = {oddly_breakable_by_hand = 2, mesecon = 2},
    after_place_node = pop_up_xz_platform,
    on_punch = pop_up_xz_platform,
    mesecons = {
        effector = {
            action_on = pop_up_xz_platform
        }
    }
})

minetest.register_node("default:temporary_wall_z", {
    description = "Temporary Wall (z)",
    tiles = {"default_platform_top.png",    -- +Y
             "default_platform_top.png",    -- -Y
             "default_platform_side.png"},  -- +X/-X/+Z/-Z
    groups = {oddly_breakable_by_hand = 2, mesecon = 2},
    after_place_node = pop_up_yz_platform,
    on_punch = pop_up_yz_platform,
    mesecons = {
        effector = {
            action_on = pop_up_yz_platform
        }
    }
})

minetest.register_node("default:temporary_wall_x", {
    description = "temporary Wall (x)",
    tiles = {"default_platform_top.png",    -- +Y
             "default_platform_top.png",    -- -Y
             "default_platform_side.png"},  -- +X/-X/+Z/-Z
    groups = {oddly_breakable_by_hand = 2, mesecon = 2},
    after_place_node = pop_up_yz_platform,
    on_punch = pop_up_yz_platform,
    mesecons = {
        effector = {
            action_on = pop_up_yz_platform
        }
    }
})

minetest.register_node("default:platform_border", {
    description = "You shouldn't get this :p (default:platform_border)",
    tiles = {"default_platform_border_top.png",
             "default_platform_border_top.png",
             "default_platform_side.png"},
    groups = {oddly_breakable_by_hand = 2, not_in_creative_inventory = 1},
    drop = ""
})

local function on_diffuser_punch(pos)
	minetest.after(5, default.find_and_replace, pos, math.random(5, 10),
        	math.random(5, 10), math.random(5, 10), "air", "default:amber")
	minetest.remove_node(pos)
end

minetest.register_node("default:amber_diffuser", {
    description = "Amber sarcophagus bomb",
    drawtype = "mesh",
    mesh = "default_amber_bomb.obj",
    tiles = {"default_light.png"},
    paramtype = "light",
    paramtype2 = "facedir",
    visual_scale = 0.75,
    groups = {oddly_breakable_by_hand = 2, mesecon = 2},
    on_rightclick = on_diffuser_punch,
    mesecons = {
        effecter = {
            action_on = on_diffuser_punch
        }
    },
})

minetest.register_node("default:amber", {
	description = "Amber block",
	drawtype = "glasslike",
	tiles = {"default_amber.png"},
	use_texture_alpha = true,
	paramtype = "light",
	post_effect_color = {a = 150, r = 230, g = 137, b = 9},
	alpha = 120,
	groups = {amber = 1},
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

-- Asteroids and Planets

minetest.register_node("default:asteroid_core", {
	description = "Core of a asteroid",
	tiles = {"default_asteroid_core.png"},
	groups = {cracky = 2, planet = 1},
})

minetest.register_node("default:asteroid_surface", {
	description = "Surface of an asteroid",
	tiles = {"default_asteroid_surface.png"},
	groups = {choppy = 3},
})

minetest.register_node("default:asteroid", {
	description = "Asteroid",
	tiles = {"default_asteroid.png"},
})


minetest.register_node("default:planet", {
	decription = "Planet",
	tiles = {"default_planet.png"},
	groups = {planet = 2},
})

minetest.register_node("default:planet_core", {
	decription = "Planet Core",
	tiles = {"default_planet_core.png"},
	groups = {planet = 2},
})

minetest.register_node("default:planet_surface", {
	decription = "Planet_surface",
	tiles = {"default_planet_surface.png"},
	groups = {planet = 3},
})
