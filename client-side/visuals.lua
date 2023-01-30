-- These are the visual tools you could use, made standalone (but took from esx)

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