local month, DayOfMonth, DayOfWeek, hour, minute, second

--[[    Show Text   ]]
function DrawTxt(text, x, y)
	SetTextFont(0)
	SetTextProportional(1)
	SetTextScale(0.3, 0.3)
	SetTextDropshadow(1, 0, 0, 0, 255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x, y)
end

--[[    Display Time    ]]
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
		DisplayTime()
		hour = 24 - hour
		minute = 60 - minute
					if hour <= 9 then
			hour = "0" .. hour
		end
		if minute <= 9 then
			minute = "0" .. minute
		end
        DrawTxt("繳稅倒數時間: ".. DayOfWeek .. " : " .. hour .." : ".. minute, 0.465, 0.045)
    end
end)

--[[    Hour Minute Second    ]]
function DisplayTime()
	hour = GetClockHours()
    minute = GetClockMinutes()
    second = GetClockSeconds()
    DayOfWeek = GetClockDayOfWeek()
    month = GetClockMonth()
	DayOfMonth = GetClockDayOfMonth()

    -- if hour == 0 or hour == 24 then
    --     hour = 12 
    -- elseif hour >= 13 then
    --     hour = hour - 12 
    -- end

	-- if hour <= 9 then
	-- 	hour = "0" .. hour
	-- end
	-- if minute <= 9 then
	-- 	minute = "0" .. minute
    -- end
--[[    Date    ]]
	if DayOfWeek == 1 then
		DayOfWeek = "5"
	elseif DayOfWeek == 2 then
		DayOfWeek = "4"
	elseif DayOfWeek == 3 then
		DayOfWeek = "3"
	elseif DayOfWeek == 4 then
		DayOfWeek = "2"
	elseif DayOfWeek == 5 then
		DayOfWeek = "1"
	elseif DayOfWeek == 6 then
		DayOfWeek = "0"
	else 
		DayOfWeek = "6"
    end
--[[    Year Month Date    ]]
	if month == 0 then
		month = "January"
	elseif month == 1 then
		month = "February"
	elseif month == 2 then
		month = "March"
	elseif month == 3 then
		month = "April"
	elseif month == 4 then
		month = "May"
	elseif month == 5 then
		month = "June"
	elseif month == 6 then
		month = "July"
	elseif month == 7 then
		month = "August"
	elseif month == 8 then
		month = "September"
	elseif month == 9 then
		month = "October"
	elseif month == 10 then
		month = "November"
	elseif month == 11 then
		month = "December"
    end
end
