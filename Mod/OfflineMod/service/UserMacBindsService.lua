--[[
Title: User Mac Binds Service
Author(s): big
CreateDate: 2021.09.08
Desc: 
use the lib:
------------------------------------------------------------
local UserMacBindsService = NPL.load('(gl)Mod/service/UserMacBindsService.lua')
------------------------------------------------------------
]]

-- api
local UserMacBindsApi = NPL.load('(gl)Mod/OfflineMod/api/Keepwork/UserMacBindsApi.lua')



local UserMacBindsService = NPL.export()

function UserMacBindsService:GetMachineID()
    return ParaEngine.GetAttributeObject():GetField('MachineID', '')
end

function UserMacBindsService:GetUUID()
    return System.Encoding.guid.uuid()
end

function UserMacBindsService:BindDevice(callback)
    if not callback and type(callback) ~= 'function' then
        return
    end

    local function RecordToLocal()
        -- TODO: // set machine ID and UUID
    end

    self:IsBindDevice(function(bExist)
        if bExist then
            RecordToLocal()
            callback(true)
        else
            UserMacBindsApi:BindMacAddress(
                self:GetMachineID(),
                self:GetUUID(),
                function(data, err)
                    if err == 200 then
                        RecordToLocal()
                        callback(true)
                    else
                        callback(false)
                    end
                    echo(data, true)
                end
            )
        end
    end)
end

function UserMacBindsService:UnBindDevice(callback)
    self:IsBindDevice(function(bExist, deviceInfo)
        if bExist then
            -- UserMacBindsApi:RemoveMacAddress(id)
        end
    end)
end

function UserMacBindsService:IsBindDevice(callback)
    if not callback or type(callback) ~= 'function' then
        return
    end

    UserMacBindsApi:GetBindList(function(data, err)
        if err ~= 200 or data ~= 'table' then
            return
        end

        local macAddress = self:GetMachineID()
        local UUID = self:GetUUID()

        for _, item in ipairs(data) do
            if item.macAddress == macAddress and
               item.uuid == UUID then
                callback(true, item)
                return
            end
        end

        callback(false)
    end)
end
