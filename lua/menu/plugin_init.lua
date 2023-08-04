local ROOTDIR = "menu/plugins/"
_G.LoadPlugins = function()

    if not file.IsDir( ROOTDIR, "LuaMenu" ) then return end

    local _, folders = file.Find(ROOTDIR .. "*", "LuaMenu")
    for _, folder in SortedPairs(folders, true) do

        for _, File in SortedPairs(file.Find(ROOTDIR .. folder .. "/*.lua", "LuaMenu"), true) do

            include(ROOTDIR .. folder .. "/" .. File)
            MsgC(Color(3, 140, 252), "UserScript    ", Color(115, 252, 3), folder, "/", File .. " <== " .. "loaded!\n")
            -- include(ROOTDIR .. folder .. "/" .. File)

        end

    end

    for _, File in SortedPairs(file.Find(ROOTDIR .. "/*.lua", "LuaMenu"), true) do

        MsgC(Color(252, 94, 3), "BaseScipt     ", Color(115, 252, 3),  File .. " <== " .. "loaded!\n")
        include(ROOTDIR .. "/" .. File)

    end
end

_G.LoadPlugins()
