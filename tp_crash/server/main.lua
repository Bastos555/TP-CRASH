ESX = exports["es_extended"]:getSharedObject()


RegisterServerEvent('tp_crash:checkGroup')
AddEventHandler('tp_crash:checkGroup', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local success
    if xPlayer.getGroup() == "admin" or xPlayer.getGroup() == "superadmin" then
        success = true
    else
        success = false
    end
    TriggerClientEvent("tp_crash:active", source, success)
end)






RegisterServerEvent('tp_crash:notify')
AddEventHandler('tp_crash:notify', function(state)
    if state then
        TriggerClientEvent('ox_lib:notify', source, {
            title = 'TP CRASH',
            description = '/tpcrash ativo!',
            type = 'success',
            duration = 5000
        })
    else
         TriggerClientEvent('ox_lib:notify', source, {
            title = 'TP CRASH',
            description = '/tpcrash desablitado!',
            type = 'error',
            duration = 5000
        })
    end
end)
