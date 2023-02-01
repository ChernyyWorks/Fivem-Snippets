-----------------------------------------
-- These are some cool features to play with (to troll your players for exemple ^^).
-----------------------------------------


-- Super Jump loop
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        SetSuperJumpThisFrame(PlayerId()) -- PlayerId not PlayerPedId !
        if IsControlJustReleased(0,38) then -- Press E to stop
            return
        end
    end
end)

-- Command format :
RegisterCommand("superjump",function()
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            SetSuperJumpThisFrame(PlayerId())
            ShowSubtext("Appuie sur ~b~E~w~ pour arrêter le ~y~super saut~w~.")
            if IsControlJustReleased(0,38) then
                return
            end
        end
    end)
end)

-----------------------------------------

-- Adding drift tyres on a car
-- (Auto Enable/Disable)
function GetThatTyreDrift()
    SetDriftTyresEnabled(GetVehiclePedIsIn(PlayerPedId()),not(GetDriftTyresEnabled(GetVehiclePedIsIn(PlayerPedId()))))
end

-- Command :
RegisterCommand("drifttyre",GetThatTyreDrift())

-----------------------------------------

-- Transform into a ped (check : https://wiki.rage.mp/index.php?title=Peds)
-- Please note that some peds can't be loaded in game so you will be invisible.

-- the function :
function ChangePlayerToPed(pedname)
    -- Just to be sure
    if pedname == nil then
        local chosenped = GetHashKey(pedname)
        RequestModel(chosenped)
        while not HasModelLoaded(chosenped) do
            Citizen.Wait(100)
        end
        SetPlayerModel(PlayerId(), chosenped)
        SetModelAsNoLongerNeeded(chosenped)
    end
end

-- Command :
-- Don't forget to add permissions before using it !
RegisterCommand("setped",function(source,args)
    -- Check if argument 1 (the ped name) exists
    if args[1] == nil then
        return
    end
    local chosenped = GetHashKey(args[1])
    RequestModel(chosenped)
    while not HasModelLoaded(chosenped) do
        Citizen.Wait(100)
    end
    SetPlayerModel(PlayerId(), chosenped)
    SetModelAsNoLongerNeeded(chosenped)
end)

-- Exemple :
-- /setped ig_beverly

-----------------------------------------