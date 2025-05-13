local activate = false

RegisterCommand(Config.Command, function()
    TriggerServerEvent("tp_crash:checkGroup")
end)

RegisterNetEvent("tp_crash:active")
AddEventHandler("tp_crash:active", function(success)
    if success then
        if activate then
            activate = false
            TriggerServerEvent("tp_crash:notify", activate)
        else
            activate = true
            TriggerServerEvent("tp_crash:notify", activate)
        end
    else
        lib.notify({
            title = 'TP CRASH',
            description = 'Não tens permisão',
            type = 'error'
        })
    end
end)




RegisterCommand("tpcrash", function()
    if activate then
        local ped = PlayerPedId()
        SetEntityCoords(ped, Config.coords.x, Config.coords.y, Config.coords.z, false, false, false, false)
    else
        lib.notify({
            title = 'TP CRASH',
            description = '/tpcrash inativo',
            type = 'error'
        })
    end
end)
