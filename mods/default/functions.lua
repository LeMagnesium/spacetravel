-- Functions
--

function default.find_and_replace(pos, xradius, yradius, zradius, tofind,
        replacement)
    local dx, dz
    for dx = -xradius, xradius do
        for dy = -yradius, yradius do
            for dz = -zradius, zradius do
                pos.x = pos.x + dx
                pos.y = pos.y + dy
                pos.z = pos.z + dz
                if minetest.get_node(pos).name == tofind then
                    minetest.add_node(pos, {name = replacement})
                end
                pos.z = pos.z - dz
                pos.y = pos.y - dy
                pos.x = pos.x - dx
            end
        end
    end
end

-- Kill players in amber

function lethal_amber()
	for name, ref in pairs(minetest.get_connected_players()) do
		local pos = ref:getpos()
		local node = minetest.get_node({x=pos.x, y=pos.y+0.5, z=pos.z})
		if node and node.name == "default:amber" and ref:get_hp() > 0 then
			ref:set_hp(ref:get_hp() - 1)
		end
	end
	minetest.after(2, lethal_amber)
end

minetest.after(0, lethal_amber)
