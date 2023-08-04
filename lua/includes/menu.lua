--=============================================================================--
--  ___  ___   _   _   _    __   _   ___ ___ __ __
-- |_ _|| __| / \ | \_/ |  / _| / \ | o \ o \\ V /
--  | | | _| | o || \_/ | ( |_n| o ||   /   / \ / 
--  |_| |___||_n_||_| |_|  \__/|_n_||_|\\_|\\ |_|  2007
--										 
--=============================================================================--



include( "menu/menu.lua" )

_G.ReloadMenuState = function()
    include( "menu/plugin_init.lua" )
end
_G.ReloadMenuState()

concommand.Add("menustate_reload", _G.ReloadMenuState)