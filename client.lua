
okno = guiCreateWindow(0.34, 0.29, 0.30, 0.43, "Przechowywalnia pojazdów", true)
guiWindowSetSizable(okno, false)
guiSetVisible(okno, false)

lista = guiCreateComboBox(0.07, 0.12, 0.86, 0.69, "Wybierz pojazd..", true, okno)
wyjmij = guiCreateButton(0.03, 0.83, 0.33, 0.12, "Wyjmij", true, okno)
zamknij = guiCreateButton(0.64, 0.83, 0.33, 0.12, "Zamknij", true, okno)

pojazdy={
{411,"najaq"},
{429,"najaq1"}
}

markerwyjmij=createMarker(-2534.17944, -28.28324, 15.45938,"cylinder",1.5,255,255,255,255, root)

addEventHandler("onClientGUIClick", wyjmij, function()
	if source==wyjmij then
		if getPedOccupiedVehicle(localPlayer) then
			return
		end
		select=guiComboBoxGetSelected(lista)
		if select then
			txt=guiComboBoxGetItemText(lista,select)
			id=getVehicleModelFromName(txt)
			auto=createVehicle(id,-2534.10132, -23.17995, 16.42885)
		end
	end
end)

addEventHandler("onClientMarkerHit", markerwyjmij, function(el)
	if localPlayer==el then
		guiSetVisible(okno, true)
		showCursor(true)
		if guiGetVisible then
			for _,v in ipairs(pojazdy) do
				if getPlayerName(localPlayer)==v[2] then
					guiComboBoxAddItem(lista,getVehicleNameFromModel(v[1]))
				end
			end
		end
	end
end)

addEventHandler("onClientGUIClick", zamknij, function()
	if source==zamknij then
		guiSetVisible(okno, false)
		showCursor(false)
		guiComboBoxClear(lista)
	end
end)