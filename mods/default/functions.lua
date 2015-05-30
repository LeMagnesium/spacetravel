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
