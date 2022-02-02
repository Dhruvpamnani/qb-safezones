QBCore     = exports['qb-core']:GetCoreObject()
PlayerData = {}
PlayerJob  = {}
onDuty     = false
notify     = false
hasRun     = false
notify     = true

if Config.CheckForUpdates then
	TriggerServerEvent("qb-parking:CheckVersion")
end