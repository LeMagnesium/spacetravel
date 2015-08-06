-- Mapgeneration
--

minetest.register_alias("mapgen_stone", "air")
minetest.register_alias("mapgen_water_source", "air")
minetest.register_alias("mapgen_river_water_source", "air")

minetest.register_on_generated(function(minp, maxp, blockseed)

	-- Asteroids
	local ps = math.random(1,100)
	if ps < 3 then
		local pos = {x = math.random(minp.x, maxp.x), y = math.random(minp.y, maxp.y), z = math.random(minp.z, maxp.z)}
		local radius = math.random(1,5)
		minetest.set_node(pos, {name = "default:asteroid"})
		minetest.after(1, worldedit.sphere, pos, radius, "default:asteroid_core", false)
		minetest.after(1.5, worldedit.sphere, pos, radius+1, "default:asteroid_surface", true)
		minetest.log("action", "Generated asteroid at " .. minetest.pos_to_string(pos))
	end

	-- Generates first node at (0,0,0)
	if (minp.x <= 0 and maxp.x >= 0) and
		(minp.y <= 0 and maxp.y >= 0) and
		(minp.z <= 0 and maxp.z >= 0) then
		minetest.set_node({x=0,y=0,z=0},{name="default:light"})
	end



end)
