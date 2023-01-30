-- These are some visual functions, it may seem obvious but it can be useful.

-- Classic Help Notification, you can 
function ShowHelpNotification(msg, thisFrame, beep, duration)
    AddTextEntry("cn-snippets", msg)

    if thisFrame then
        DisplayHelpTextThisFrame("cn-snippets", false)
    else
        if beep == nil then
            beep = true
        end
        BeginTextCommandDisplayHelp("cn-snippets")
        EndTextCommandDisplayHelp(0, false, beep, duration or -1)
    end
end

-- Native notification
function notification(text)
    BeginTextCommandThefeedPost('STRING')
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandThefeedPostTicker(0,1)
end

RegisterNetEvent("core:notification")
AddEventHandler("core:notification",function(text)
    if not(text == nil) or string.len(text) > 0 then
        notification(tostring(text))
    else
        print("Error notification message : "..text)
    end
end)