-- Functions
--

function default.find_and_replace(pos, radius, tofind, replacement)
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
