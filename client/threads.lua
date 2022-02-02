local function insidePolygon(point)
    local oddNodes = false
    for i = 1, #Config.Zones do
        local Zone = Config.Zones[i]
        local j = #Zone
        for i = 1, #Zone do
            if (Zone[i][2] < point.y and Zone[j][2] >= point.y or Zone[j][2] < point.y and Zone[i][2] >= point.y) then
                if (Zone[i][1] + (point[2] - Zone[i][2] ) / (Zone[j][2] - Zone[i][2]) * (Zone[j][1] - Zone[i][1]) < point.x) then
                    oddNodes = not oddNodes;
                end
            end
            j = i;
        end
    end
    return oddNodes 
end

local function has_value(tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end
    return false
end

Citizen.CreateThread(function()
    while true do
        local iPed = GetPlayerPed(-1)
        Citizen.Wait(0)
        point = GetEntityCoords(iPed,true)
        local inZone = insidePolygon(point)
        if Config.ShowBorder then
            drawPoly(inZone)
        end
        if inZone then
            if Config.TopLeftInfoBox then
                DisplayHelpText(Lang:t('info.savezone'))
            end
            if PlayerJob.name ~= "police" then
                if not has_value(Config.WeaponBypass, GetSelectedPedWeapon(iPed)) then
                    SetCurrentPedWeapon(iPed, GetHashKey("WEAPON_UNARMED"), true)
                    DisablePlayerFiring(iPed, true)
                    SetWeaponDamageModifierThisFrame(GetSelectedPedWeapon(iPed), -1000)
                end
                if IsPedInAnyVehicle(iPed, false) then
                    veh = GetVehiclePedIsUsing(iPed)
                    SetEntityCanBeDamaged(veh, false)
                    if Config.MaxVehicleSpeed then
                        if not has_value(Config.MaxSpeedBypass, GetVehicleClass(veh)) then
                            SetVehicleMaxSpeed(veh, Config.MaxVehicleSpeed)
                        end
                    end
                end
                SetEntityInvincible(iPed, true)
                SetPedCanRagdoll(iPed, false)
                ClearPedBloodDamage(iPed)
                ResetPedVisibleDamage(iPed)
                ClearPedLastWeaponDamage(iPed)
                for _, players in ipairs(GetActivePlayers()) do
                    if IsPedInAnyVehicle(GetPlayerPed(players), true) then
                        veh = GetVehiclePedIsUsing(GetPlayerPed(players))
                        SetEntityNoCollisionEntity(iPed, veh, true)
                    end
                end
                hasRun = false
            end
        else
            if not hasRun then
                hasRun = true
                SetEntityInvincible(iPed, false)
                SetPedCanRagdoll(iPed, true)
                NetworkSetFriendlyFireOption(true)
                if IsPedInAnyVehicle(iPed, false) then
                    veh = GetVehiclePedIsUsing(iPed)
                    SetEntityCanBeDamaged(veh, true)
                    if Config.MaxVehicleSpeed then
                        SetVehicleMaxSpeed(veh, 1000.00)
                    end
                end
                if IsPedInAnyVehicle(GetPlayerPed(players), true) then
                    veh = GetVehiclePedIsUsing(GetPlayerPed(players))
                    SetEntityNoCollisionEntity(iPed, veh, false)
                end
            end
        end
    end 
end)