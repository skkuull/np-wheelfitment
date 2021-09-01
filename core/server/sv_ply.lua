local wheelInUse = false

RPC.register("np-wheelfitment_sv:setIsWheelFitmentInUse", function(pSource, pBool)
    wheelInUse = pBool
end)

RPC.register("np-wheelfitment_sv:getIsWheelFitmentInUse", function(pSource)
    return wheelInUse
end)

RPC.register("np-wheelfitment_sv:checkIfWhitelisted", function(pSource)
    return exports["np-business"]:checkIfWhitelisted("wheel")
end)

RPC.register("np-wheelfitment_sv:saveWheelfitment", function(pSource, pVin, pData)
    if pVin == nil or pVin == 0 or pVin == "" then return end
    SQL.execute("UPDATE _vehicles SET wheels = ? WHERE vin = ?", pData, pVin)
    return true
end)