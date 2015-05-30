-- Crafting
--

-- Conversions
minetest.register_craft({
    output = "default:temporary_wall_x",
    recipe = {{"default:platform"}}
})

minetest.register_craft({
    output = "default:platform",
    recipe = {{"default:temporary_wall_z"}}
})

minetest.register_craft({
    output = "default:temporary_wall_z",
    recipe = {{"default:temporary_wall_x"}}
})
