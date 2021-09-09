--[[
Title: Offline Mod
Author(s):  Big
Date: 2021.09.08
Desc: 
use the lib:
------------------------------------------------------------
NPL.load('(gl)Mod/OfflineMod/main.lua')
local Offline = commonlib.gettable('Mod.Offline')
------------------------------------------------------------

CODE GUIDELINE

1. all classes and functions use upper camel case.
2. all variables use lower camel case.
3. all files use use upper camel case.
4. all templates variables and functions use underscore case.
5. single quotation marks are used for strings.

]]

local Offline = commonlib.inherit(commonlib.gettable('Mod.ModBase'), commonlib.gettable('Mod.Offline'))

Offline:Property({'Name', 'Offline', 'GetName', 'SetName', { auto = true }})
Offline:Property({'Desc', '', 'GetDesc', 'SetDesc', { auto = true }})
Offline.version = '0.0.1'

function Offline:init(refresh)
    if not self.instance or refresh then
        self.instance = self:new()
    end

    return self.instance
end

function Offline:GetInstance()
    return self.instance
end




