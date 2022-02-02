-- On Player Load
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
    PlayerJob  = PlayerData.job
end)

-- On job update
RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
end)

-- On jody set
RegisterNetEvent('QBCore:Client:SetDuty', function(duty)
    onDuty = duty
end)

-- QBCore Player SetPlayerData
RegisterNetEvent('QBCore:Player:SetPlayerData', function(val)
    PlayerData = val
end)