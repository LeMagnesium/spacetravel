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
		},
		damage_groups = {fleshy = 2},
	},
})	
