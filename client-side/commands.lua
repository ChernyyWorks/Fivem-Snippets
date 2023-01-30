-- This Command removes all props stucked with the ped
RegisterCommand('deleteprop', function()
    for k, v in pairs(GetGamePool('CObject')) do
        if IsEntityAttachedToEntity(PlayerPedId(), v) then
            SetEntityAsMissionEntity(v, true, true)
            DeleteObject(v)
            DeleteEntity(v)
        end
    end
end)

-- Easy Full performance vehicle upgrade, don't forget to add your own permissions to access the command
RegisterCommand("upgrademe",function()
    local vehicle = GetVehiclePedIsIn(PlayerPedId())
    SetVehicleMod(vehicle, 11, 3, false) -- Engine
    SetVehicleMod(vehicle, 12, 2, false) -- Brakes
    SetVehicleMod(vehicle, 13, 2, false) -- GearBox
    ToggleVehicleMod(vehicle, 18, true) -- Adds a Turbo
end)