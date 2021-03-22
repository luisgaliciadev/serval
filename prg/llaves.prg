LPARAMETERS Vlc_cadena
Vlc_cadena=ALLTRIM(UPPER(Vlc_cadena))
conex=SQLCONNECT("bppc")
IF conex > 0 
	lsql="SELECT * FROM llaves"
	resp=SQLEXEC(conex, lsql, "llaves")
	IF resp>0
		SELECT llaves
		GO top
	ENDIF 
ENDIF 
Vlc_result=""
SELECT llaves
FOR i=1 TO LEN(Vlc_cadena)
	aux=SUBSTR(Vlc_cadena,i,1)
	SCAN FOR simbolo=aux 
		Vlc_result=Vlc_result+valor
	ENDSCAN 
ENDFOR 
RETURN ALLTRIM(Vlc_result)