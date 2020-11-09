local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTION
-----------------------------------------------------------------------------------------------------------------------------------------
local menuactive = false
function ToggleActionMenu()
	menuactive = not menuactive
	if menuactive then
		SetNuiFocus(true,true)
		SendNUIMessage({ showmenu = true })
	else
		SetNuiFocus(false)
		SendNUIMessage({ hidemenu = true })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- BUTTON
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("ButtonClick",function(data,cb)
	if data == "gasolina-01" then
		spawnVehicle("tanker",1142.50,-3264.00,5.90)
		TriggerEvent("Notify","sucesso","Carga de <b>gasolina</b> liberada.")
	elseif data == "gasolina-02" then
		spawnVehicle("tanker",1142.50,-3273.00,5.90)
		TriggerEvent("Notify","sucesso","Carga de <b>gasolina</b> liberada.")
	elseif data == "gasolina-03" then
		spawnVehicle("tanker",1142.50,-3282.00,5.90)
		TriggerEvent("Notify","sucesso","Carga de <b>gasolina</b> liberada.")

	elseif data == "diesel-01" then
		spawnVehicle("tanker2",1142.50,-3264.00,5.90)
		TriggerEvent("Notify","sucesso","Carga de <b>diesel</b> liberada.")
	elseif data == "diesel-02" then
		spawnVehicle("tanker2",1142.50,-3273.00,5.90)
		TriggerEvent("Notify","sucesso","Carga de <b>diesel</b> liberada.")
	elseif data == "diesel-03" then
		spawnVehicle("tanker2",1142.50,-3282.00,5.90)
		TriggerEvent("Notify","sucesso","Carga de <b>diesel</b> liberada.")

	elseif data == "show-01" then
		spawnVehicle("tvtrailer",1142.50,-3264.00,5.90)
		TriggerEvent("Notify","sucesso","Carga de <b>shows</b> liberada.")
	elseif data == "show-02" then
		spawnVehicle("tvtrailer",1142.50,-3273.00,5.90)
		TriggerEvent("Notify","sucesso","Carga de <b>shows</b> liberada.")
	elseif data == "show-03" then
		spawnVehicle("tvtrailer",1142.50,-3282.00,5.90)
		TriggerEvent("Notify","sucesso","Carga de <b>shows</b> liberada.")

	elseif data == "madeiras-01" then
		spawnVehicle("trailerlogs",1142.50,-3264.00,5.90)
		TriggerEvent("Notify","sucesso","Carga de <b>madeiras</b> liberada.")
	elseif data == "madeiras-02" then
		spawnVehicle("trailerlogs",1142.50,-3273.00,5.90)
		TriggerEvent("Notify","sucesso","Carga de <b>madeiras</b> liberada.")
	elseif data == "madeiras-03" then
		spawnVehicle("trailerlogs",1142.50,-3282.00,5.90)
		TriggerEvent("Notify","sucesso","Carga de <b>madeiras</b> liberada.")

	elseif data == "carros-01" then
		spawnVehicle("tr4",1142.50,-3264.00,5.90)
		TriggerEvent("Notify","sucesso","Carga de <b>veículos</b> liberada.")
	elseif data == "carros-02" then
		spawnVehicle("tr4",1142.50,-3273.00,5.90)
		TriggerEvent("Notify","sucesso","Carga de <b>veículos</b> liberada.")
	elseif data == "carros-03" then
		spawnVehicle("tr4",1142.50,-3282.00,5.90)
		TriggerEvent("Notify","sucesso","Carga de <b>veículos</b> liberada.")

	elseif data == "container-01" then
		spawnVehicle("docktrailer",1142.50,-3264.00,5.90)
		TriggerEvent("Notify","sucesso","Carga de <b>contâiner</b> liberada.")
	elseif data == "container-02" then
		spawnVehicle("docktrailer",1142.50,-3273.00,5.90)
		TriggerEvent("Notify","sucesso","Carga de <b>contâiner</b> liberada.")
	elseif data == "container-03" then
		spawnVehicle("docktrailer",1142.50,-3282.00,5.90)
		TriggerEvent("Notify","sucesso","Carga de <b>contâiner</b> liberada.")

	elseif data == "alimentos-01" then
		spawnVehicle("trflat",1142.50,-3264.00,5.90)
		TriggerEvent("Notify","sucesso","Carga de <b>alimentos</b> liberada.")
	elseif data == "alimentos-02" then
		spawnVehicle("trflat",1142.50,-3273.00,5.90)
		TriggerEvent("Notify","sucesso","Carga de <b>alimentos</b> liberada.")
	elseif data == "alimentos-03" then
		spawnVehicle("trflat",1142.50,-3282.00,5.90)
		TriggerEvent("Notify","sucesso","Carga de <b>alimentos</b> liberada.")

	elseif data == "menuoption-fechar" then
		ToggleActionMenu()
	end
end)

function spawnVehicle(name,x,y,z)
	local mhash = GetHashKey(name)
	while not HasModelLoaded(mhash) do
		RequestModel(mhash)
		Citizen.Wait(10)
	end

	if HasModelLoaded(mhash) then
		local nveh = CreateVehicle(mhash,x,y,z+0.5,270.90,true,false)

		SetVehicleOnGroundProperly(nveh)
		SetVehicleNumberPlateText(nveh,vRP.getRegistrationNumber())
		SetEntityAsMissionEntity(nveh,true,true)

		SetModelAsNoLongerNeeded(mhash)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCAIS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	SetNuiFocus(false,false)
	while true do
		Citizen.Wait(1)
		local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),1151.90,-3249.53,5.90,true)
		if distance <= 30 then
			DrawMarker(21,1151.80,-3249.91,5.90-0.6,0,0,0,0.0,0,0,0.7,0.7,0.7,65,105,225,50,0,0,0,1)
			if distance <= 1.5 then
				drawTxt("PRESSIONE  ~b~E~w~  PARA ~b~VISUALIZAR~w~ AS ~b~CARGAS~w~ DISPONÍVEIS",4,0.5,0.93,0.50,255,255,255,180)
			if IsControlJustPressed(0,38) then
				ToggleActionMenu()
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------
function drawTxt(text,font,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end