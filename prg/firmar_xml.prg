PARAMETER xruta, namefile, pfxop12, passpfx
SET STEP ON
xruta_AUX = xruta
namefile_AUX = namefile
pfxop12_AUX =  pfxop12
passpfx_AUX = passpfx

LOCAL FIRMA
FIRMA = CREATEOBJECT("firmadoCE.firmado2")
FIRMA.firmar(xruta, namefile, pfxop12, passpfx)
*RETURN FIRMA
