concommand.Remove("plugins_reload")
concommand.Add("plugins_reload", function()
    MsgC(Color(252, 186, 3), "Reloading plugins.\n")
    _G.LoadPlugins()
end)


if ConVarExists"plugins_enable" then return end

CreateClientConVar("plugins_enable", "0", true, false)