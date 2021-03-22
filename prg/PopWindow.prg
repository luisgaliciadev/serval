Parameter sClass, uParam1, uParam2, uParam3, uParam4
    Local oWindow, uRetValue
    oWindow = CreateObject(sClass, uParam1, uParam2, uParam3, uParam4)
    oWindow.Show()
    uRetValue = oWindow.RetValue
    oWindow.Release()
Return (uRetValue)