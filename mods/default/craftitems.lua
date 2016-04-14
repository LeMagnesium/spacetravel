minetest.register_craftitem("default:planet_seed", {
	description = "Planet Seed",
	on_place = function(itemstack, placer, pointed_thing)
--		default.planet_build(pointed_thing.under, "default:dirt", 30, 0)
	end,
	inventory_image = "default_planet_seed.png",
})
