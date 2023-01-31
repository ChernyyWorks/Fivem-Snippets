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

-- Event for Server-side
-- Just need to : TriggerClientEvent("core:notification",playerid,"your cool text")
RegisterNetEvent("core:notification")
AddEventHandler("core:notification",function(text)
    if not(text == nil) or string.len(text) > 0 then
        notification(tostring(text))
    end
end)

-- Native R* input box (the black rectangle)
-- title = title (obvious), pretext = default text, maxchar = max char lenght (it will increase/decrease the size of the text-box)
function TextBoxInput(title, pretext, maxchar)
	AddTextEntry('FMMC_KEY_TIP1', title)
	DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", pretext, "", "", "", maxchar) 
	while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do Wait(0) end
	if UpdateOnscreenKeyboard() ~= 2 then
		local result = GetOnscreenKeyboardResult()
		Wait(500) 
		return result
	else
		Wait(500) 
		return nil 
	end
end