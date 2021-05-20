local gsrTimer = 0
local gsrPositive = false
local plyPed = PlayerPedId()
local gsrTestDistance = 5
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        GSRThread()
    end
end)

if Config.EnableCleanGSR then
    RegisterCommand(Config.CleanGSR, function()
        if gsrPositive then
            gsrPositive = false
            gsrTimer = 0
            Notify(Config.Text.TCleaningGSR)
        elseif not gsrPositive then
            Notify(Config.Text.AlreadyClean)
        end
        print('Cleaned GSR')
    end)
end


RegisterCommand(Config.TestGSR, function()
    local playerCoords = GetEntityCoords(plyPed)
    for _, player in ipairs(GetActivePlayers()) do
        local targetPed = GetPlayerPed(player)
        local targetId = GetPlayerServerId(player)
        local distance = #(playerCoords-GetEntityCoords(targetPed))
        if targetPed ~= plyPed then
            if distance <= gsrTestDistance then
                print('GSR Tested: ' .. targetId)
                TriggerServerEvent('GSR:TestPlayer', targetId)
            else
                Notify(tostring(Config.Text.NoSubjectError))
            end
        end
    end
end)

-- RegisterCommand('gsrs', function()
--     if gsrPositive then
--         Notify('You Tested ^1Positive')
--     elseif not gsrPositive then
--         Notify('You Tested ^2Negative')
--     end
-- end)

RegisterNetEvent("GSR:TestNotify")
AddEventHandler("GSR:TestNotify", function(notHandler)
    Notify(notHandler)
end)

RegisterNetEvent("GSR:TestHandler")
AddEventHandler("GSR:TestHandler", function(tester)
    if gsrPositive then
        TriggerServerEvent("GSR:TestCallback", tester, true)
    elseif not gsrPositive then
        TriggerServerEvent("GSR:TestCallback", tester, false)
    end
end)

function GSRThread()
    plyPed = PlayerPedId()
    if IsPedShooting(plyPed) then
        if gsrPositive then
            gsrTimer = Config.GSRAutoClean
        else
            gsrPositive = true
            gsrTimer = Config.GSRAutoClean
            Citizen.CreateThread(GSRThreadTimer)
        end
    end
end

function GSRThreadTimer()
    while gsrPositive do
        Citizen.Wait(1000)
        if gsrTimer == 0 then
            gsrPositive = false
        else
            gsrTimer = gsrTimer - 1
        end
    end
end

function Notify(text)
    TriggerEvent('chat:addMessage', {
        color = { 255, 0, 0},
        multiline = true,
        args = {'GSR', text}
    })      
end
