RegisterNetEvent("GSR:TestPlayer")
AddEventHandler("GSR:TestPlayer", function(tested)
    TriggerClientEvent("GSR:TestHandler", tested, source)
    if Config.NotifySubject then
        TriggerClientEvent("GSR:TestNotify", tested, Config.Text.GettingTestedMsg .. GetPlayerName(source))
    end
end)

RegisterNetEvent("GSR:TestCallback")
AddEventHandler("GSR:TestCallback", function(tester, result)
    if result then
        TriggerClientEvent("GSR:TestNotify", tester, Config.Text.TestedPositive)
    else
        TriggerClientEvent("GSR:TestNotify", tester, Config.Text.TestedNegative)
    end
end)