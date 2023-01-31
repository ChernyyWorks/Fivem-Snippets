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
