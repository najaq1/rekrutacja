db = dbConnect( "mysql", "dbname=db_88506;host=137.74.6.118;charset=utf8", "db_88506", "xLzdxSAI4ljB", "share=1" )

marker=createMarker(-2533.00610, -15.86845, 15.42885,"cylinder",6,255,255,255,60, root)

addEventHandler("onMarkerHit", root, function(hit)
	if source==marker then
		if getElementType(hit)=="vehicle" then
			aut=getVehicleName(hit)
			dbExec(db,"UPDATE Przechowywalnia SET Pojazdy=? WHERE Nick=?",aut,"najaq")
			destroyElement(hit)
		end
	end
end)
