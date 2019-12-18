ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_taxes:player')
AddEventHandler('esx_taxes:player', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local cash = xPlayer.getMoney()
    local bank = xPlayer.getAccount('bank').money
    if Config.usebill == true then
        if Config.cash == true and Config.bank == false then
            local total = cash + bank
            TriggerClientEvent('esx_taxes:tocket', -1, total)
        elseif Config.bank == true and Config.cash == false then
            local total = bank
            TriggerClientEvent('esx_taxes:tocket', -1, total)
        elseif Config.cash == true and Config.bank == true then
            print('Just choise bank or cash, not both of true')
        end
    else
        if Config.cash == true and Config.bank == false then
            local total = cash + bank
            TriggerEvent('esx_taxes:tax', xPlayer, total)
        elseif Config.bank == true and Config.cash == false then
            local total = bank
            TriggerEvent('esx_taxes:tax', xPlayer, total)
        elseif Config.cash == true and Config.bank == true then
            print('Just choise bank or cash, not both of true')
        end
    end
end)

AddEventHandler('esx_taxes:tax', function(xPlayer, total)
    local bank = xPlayer.getAccount('bank').money
    total = total * Config.rate
    if total > Config.high then
        total = total * 1.15
        xPlayer.removeAccountMoney('bank', total)
        TriggerClientEvent('esx_taxes:account', -1, total, bank, 4)
    elseif total >= Config.mid and total < Config.high then
        total = total * 1.05        
        xPlayer.removeAccountMoney('bank', total)
        TriggerClientEvent('esx_taxes:account', -1, total, bank, 3)
    elseif total >= Config.low and total < Config.mid then
        total = total * 0.95        
        xPlayer.removeAccountMoney('bank', total)
        TriggerClientEvent('esx_taxes:account', -1, total, bank, 2)
    elseif total >= Config.null and total < Config.mid then
        total = total * 0.85        
        xPlayer.removeAccountMoney('bank', total)
        TriggerClientEvent('esx_taxes:account', -1, total, bank, 1)
    elseif total < Config.mid then
        total = 0
        TriggerClientEvent('esx_taxes:account', -1, total, bank, 0)
    end
end)

--Cmd info
print("####################\n")
print("Have any problem can send message to Discord:Azusakawa *#8628")
print("Have fun !\n")
print("####################")