--[[
Title: Account Manager
Author(s): big
CreateDate: 2021.09.08
Desc: 
use the lib:
------------------------------------------------------------
local AccountManager = NPL.load('(gl)Mod/Offline/AccountManager.lua')
------------------------------------------------------------
]]

local AccountManager = NPL.export()

function AccountManager:ShowActivationPage()
    local params = Mod.WorldShare.Utils.ShowWindow(
        0,
        0,
        'Mod/OfflineMod/ActivationPage.html',
        'Mod.OfflineMod.ActivationPage',
        0,
        0,
        '_fi'
    )

    -- TODO: // get bind status
end