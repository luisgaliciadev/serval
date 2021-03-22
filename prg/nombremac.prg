LOCAL lcComputerName, loWMIService, loItems, loItem, lcMACAddress
lcComputerName = "."
loWMIService = GETOBJECT("winmgmts:\\" + lcComputerName + "\root\cimv2")
loItems = loWMIService.ExecQuery("Select * from Win32_NetworkAdapter",,48)
FOR EACH loItem IN loItems
lcMACAddress = loItem.MACAddress
IF !ISNULL(lcMACAddress)
? "MAC Address: " + loItem.MACAddress
?
ENDIF
ENDFOR