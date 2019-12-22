ESX = nil

--[[    ESX Base    ]]
Citizen.CreateThread(function()
    while ESX == nil do
      	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
      	Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
	local clock = GetClockHours()
    local day = GetClockDayOfWeek()
	local min = GetClockMinutes()
    while day == 1 do 
        	if clock == 8 then
				if min == 30 then
					TriggerServerEvent('esx_taxes:player')
				end
			end
			Citizen.Wait(60*1000)
		end
	end
end)

RegisterNetEvent('esx_taxes:tocket')
AddEventHandler('esx_taxes:tocket', function(total)
    total = total * Config.rate
    if total > Config.high then
        total = total * 1.15
        TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(PlayerId()), 'society_irs', '資產稅', total)
        txt = "<b style='color:green'>國稅局</b> <br /><br /> <hl style='color:white'>提醒您,由於您擁有資產超出政府標準,因此增加15%的稅收,應繳金額 $: ".. total .. " ,請務必於期限內繳交</hl><br /><br /><hl style='color:red'>開啟 '繳費選單' 繳交稅金</hl>"
        Notify(txt)
    elseif total >= Config.mid and total < Config.high then
        total = total * 1.05
        TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(PlayerId()), 'society_irs', '資產稅', total)
        txt = "<b style='color:green'>國稅局</b> <br /><br /> <hl style='color:white'>提醒您,由於您擁有資產超出政府標準,因此增加5%的稅收,應繳金額 $: ".. total .. " ,請務必於期限內繳交</hl><br /><br /><hl style='color:red'>開啟 '繳費選單' 繳交稅金</hl>"
        Notify(txt)
    elseif total >= Config.low and total < Config.mid then
        total = total * 0.95
        TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(PlayerId()), 'society_irs', '資產稅', total)
        txt = "<b style='color:green'>國稅局</b> <br /><br /> <hl style='color:white'>提醒您,由於您擁有資產低於政府標準,因此降低5%的稅收,應繳金額 $: ".. total .. " ,請務必於期限內繳交</hl><br /><br /><hl style='color:red'>開啟 '繳費選單' 繳交稅金</hl>"
        Notify(txt)
    elseif total >= Config.null and total < Config.mid then
        total = total * 0.85
        TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(PlayerId()), 'society_irs', '資產稅', total)
        txt = "<b style='color:green'>國稅局</b> <br /><br /> <hl style='color:white'>提醒您,由於您擁有資產低於政府標準,因此降低15%的稅收,應繳金額 $: ".. total .. " ,請務必於期限內繳交</hl><br /><br /><hl style='color:red'>開啟 '繳費選單' 繳交稅金</hl>"
        Notify(txt)
    elseif total < Config.mid then
        total = 0
        txt = "<b style='color:green'>國稅局</b> <br /><br /> <hl style='color:white'>由於您的資產未達到稅收標準,因此不對您進行收稅的動作</hl><br /><br /><hl style='color:blue'>國稅局關心您</hl>"
        Notify(txt)
    end
end)

RegisterNetEvent('esx_taxes:account')
AddEventHandler('esx_taxes:account', function(total, bank, num)
    bank = bank - total
    if num == 4 then
        txt = "<b style='color:green'>國稅局</b> <br /><br /> <hl style='color:white'>提醒您,由於您擁有資產超出政府標準,因此增加15%的稅收,應繳金額 $: ".. total .. " ,已自動從銀行扣除稅金</hl><br /><br /><hl style='color:red'>銀行餘額 $: ".. bank .. "</hl>"
        Notify(txt)
    elseif num == 3 then
        txt = "<b style='color:green'>國稅局</b> <br /><br /> <hl style='color:white'>提醒您,由於您擁有資產超出政府標準,因此增加5%的稅收,應繳金額 $: ".. total .. " ,已自動從銀行扣除稅金</hl><br /><br /><hl style='color:red'>銀行餘額 $: ".. bank .. "</hl>"
        Notify(txt)
    elseif num == 2 then
        txt = "<b style='color:green'>國稅局</b> <br /><br /> <hl style='color:white'>提醒您,由於您擁有資產低於政府標準,因此降低5%的稅收,應繳金額 $: ".. total .. " ,已自動從銀行扣除稅金</hl><br /><br /><hl style='color:red'>銀行餘額 $: ".. bank .. "</hl>"
        Notify(txt)
    elseif num == 1 then
        txt = "<b style='color:green'>國稅局</b> <br /><br /> <hl style='color:white'>提醒您,由於您擁有資產低於政府標準,因此降低15%的稅收,應繳金額 $: ".. total .. " ,已自動從銀行扣除稅金</hl><br /><br /><hl style='color:red'>銀行餘額 $: ".. bank .. "</hl>"
        Notify(txt)
    elseif num == 0 then
        txt = "<b style='color:green'>國稅局</b> <br /><br /> <hl style='color:white'>由於您的資產未達到稅收標準,因此不對您進行收稅的動作</hl><br /><br /><hl style='color:blue'>國稅局關心您</hl>"
        Notify(txt)
    end
end)

--[[    Function    ]]
function Notify(txt)
    TriggerEvent("pNotify:SendNotification", 
    {
        text = txt,
        type = "success", 
        timeout = 5000,
        layout = "centerRight"
    })
end
