-- These are some tools you can use in your code

-- Return a boolean if player is godmode or not
function IsGodMode(player)
	if player == nil then
		player = PlayerId()
	end
    return(GetPlayerInvincible_2(player))
end

-- Returns the sex (m/f) of the ped
function GetMySex(ped)
    if GetEntityModel(ped) == GetHashKey("mp_m_freemode_01") then
        return("m")
    elseif GetEntityModel(ped) == GetHashKey("mp_f_freemode_01") then
        return("f")
    end
end