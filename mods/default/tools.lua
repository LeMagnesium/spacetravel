----------------
-- Space tools
--

-- The hand
minetest.register_item(":", {
	type = "none",
	wield_image = "wieldhand.png",
	wield_scale = {x=1, y=1, z=2.5},
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level = 0,
		groupcaps = {
			choppy = {times = {[3] = 3.0, [2] = 1.7, [1] = 0.8}, uses = 0},
			oddly_breakable_by_hand = {times = {[3] = 1.0, [2] = 0.6, [1] = 0.4}, uses = 0}
		},
		damage_groups = {fleshy = 2},
	},
})	

minetest.register_tool("default:pick_comet", {
	description = "Comet Pickaxe",
	inventory_image = "default_pick_comet.png",
	tool_capabilities = {
		full_punch_interval = 0.3,
		max_drop_level = 0,
		groupcaps = {
			planet = {times = {[3] = 3.4, [2] = 2.0, [1] = 0.9}, uses = 30}
		},
		damage_groups = {fleshy = 3},
	},
})

minetest.register_tool("default:laser_cutter", {
	description = "Laser Cutter",
	inventory_image = "default_laser_cutter.png",
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level = 0,
		groupcaps = {
			amber = {times = {[1] = 7.2}, uses = 1000}
		},
		damage_groups = {fleshy = 4},
	},
})
