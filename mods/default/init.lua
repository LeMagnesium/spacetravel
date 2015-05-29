minetest.register_on_joinplayer(function(player)
      player:set_physics_override({gravity = 0.1})
end)

-- Default mod
--

-- Global namespace
default = {}

default.LIGHT_MAX = 14

dofile(minetest.get_modpath("default").."/compatibility.lua")
dofile(minetest.get_modpath("default").."/functions.lua")
dofile(minetest.get_modpath("default").."/nodes.lua")
dofile(minetest.get_modpath("default").."/mapgen.lua")
dofile(minetest.get_modpath("default").."/player.lua")
