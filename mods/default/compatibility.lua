-- Compatiblity between mods and this subgame
--[[
    Many mods use functions or fields from `default` thinking it will only be
used with Minetest Game. Well, no. I need an interface file to redirect
functions not redefined in this subgame to variants.
]]

-- Sounds
function default.node_sound_stone_defaults()

end

function default.node_sound_wood_defaults()

end

function default.node_sound_leaves_defaults()

end

function default.node_sound_glass_defaults()

end

-- Nodes
minetest.register_node("default:mese",{
    description = "Mese Block",
    tiles = {"default_steel.png"},
    groups = {cracky = 3}
})
