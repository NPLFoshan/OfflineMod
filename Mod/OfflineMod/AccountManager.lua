--[[
Title: Account Manager
Author(s):  Big
Date: 2021.09.08
Desc: 
use the lib:
------------------------------------------------------------
local AccountManager = NPL.load('(gl)Mod/Offline/AccountManager.lua')
------------------------------------------------------------
]]

local AccountManager = NPL.export()

function AccountManager:ShowActivationPage()
    Mod.WorldShare.Utils.ShowWindow(
        0,
        0,
        'Mod/OfflineMod/ActivationPage.html',
        'Mod.OfflineMod.ActivationPage',
        0,
        0,
        '_fi'
    )
end