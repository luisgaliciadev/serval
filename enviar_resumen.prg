PARAMETER _rutaxml, _nombrearchivose, femodo, rucsol, usuariosol, clavesol, _urlws
SET STEP ON
 PUBLIC rptawsticket
 rptawsticket = "ERROR"
 ls_ruc_emisor = rucsol
 ls_user = ls_ruc_emisor+usuariosol
 ls_pwd_sol = clavesol
 ps_file = _rutaxml+_nombrearchivose
 ps_filezip = ps_file+".zip"
 IF  .NOT. FILE(ps_filezip)
    *RETURN "Archivo zip a enviar no encontrado"
    RETURN "<message>Error: Comprobante NO SE HA ENVIADO - Archivo zip a enviar no encontrado</message>"
 ENDIF 
 ls_filename = JUSTFNAME(ps_filezip)
 ls_contentfile = FILETOSTR(ps_filezip)
 ls_base64 = STRCONV(ls_contentfile, 13)
 TEXT TO ls_envioxml TEXTMERGE NOSHOW PRETEXT 0015 FLAGS 1
	<soapenv:Envelope xmlns:ser="http://service.sunat.gob.pe" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"
			xmlns:wsse="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd">
		<soapenv:Header>
			<wsse:Security>
				<wsse:UsernameToken>
					<wsse:Username><<ls_user>></wsse:Username>
					<wsse:Password><<ls_pwd_sol>></wsse:Password>
				</wsse:UsernameToken>
			</wsse:Security>
		</soapenv:Header>
		<soapenv:Body>
			<ser:sendSummary>
				<fileName><<ls_fileName>></fileName>
				<contentFile><<ls_base64>></contentFile>
			</ser:sendSummary>
		</soapenv:Body>				
	</soapenv:Envelope>
 ENDTEXT
 oxmlhttp = CREATEOBJECT("MSXML2.ServerXMLHTTP.6.0")
 oxmlbody = CREATEOBJECT('MSXML2.DOMDocument.6.0')
 IF  .NOT. (oxmlbody.loadxml(ls_envioxml))
    oresp.mensaje = "No se cargo XML: "+oxmlbody.parseerror.reason
    rptawsticket = "<message>Error: Comprobante NO SE HA ENVIADO - NO SE CARGO XML</message>"
    RETURN rptawsticket
 ENDIF
 lsurl = _urlws
 *MESSAGEBOX(lsurl)
 oxmlhttp.open('POST', lsurl, .F.)
 oxmlhttp.setrequestheader("Content-Type", "text/xml")
 oxmlhttp.setrequestheader("Content-Type", "text/xml;charset=ISO-8859-1")
 oxmlhttp.setrequestheader("Content-Length", LEN(ls_envioxml))
 oxmlhttp.setrequestheader("SOAPAction", "sendSummary")
 oxmlhttp.setoption(2, 13056)
 oxmlhttp.send(oxmlbody.documentelement.xml)
 IF (oxmlhttp.status<>200)
 
 	Vlc_faultcode = STREXTRACT(oxmlhttp.responsetext, "<statusCode>", "</statusCode>")
    Vlc_faultstring= STREXTRACT(oxmlhttp.responsetext, "<content>", "</content>")
    Vlc_message= STREXTRACT(oxmlhttp.responsetext, "<message>", "</message>")
    
    rptawsticket = '<message>Error: Comprobante NO SE HA ENVIADO - ' + Vlc_faultstring + ' </message> '+'<httpstatus>'+ALLTRIM(STR(oxmlhttp.status))+'</httpstatus>'+'-'+NVL(oxmlhttp.responsetext, '')
    RETURN rptawsticket
 ENDIF
 loxmlresp = CREATEOBJECT("MSXML2.DOMDocument.6.0")
 loxmlresp.loadxml(oxmlhttp.responsetext)
 
 	Vlc_faultcode = STREXTRACT(oxmlhttp.responsetext, "<statusCode>", "</statusCode>")
    Vlc_faultstring= STREXTRACT(oxmlhttp.responsetext, "<content>", "<content>")
    Vlc_message= STREXTRACT(oxmlhttp.responsetext, "<message>", "</message>")
    
    IF EMPTY(Vlc_faultcode) AND EMPTY(Vlc_faultstring) AND EMPTY(Vlc_message) THEN
    	rptawsticket = '<message>ENVIADO</message> '+'<httpstatus>'+ALLTRIM(STR(oxmlhttp.status))+'</httpstatus>'+'-'+NVL(oxmlhttp.responsetext, '')
 		RETURN rptawsticket
    ELSE
    	rptawsticket = '<message>Error: Comprobante NO SE HA ENVIADO - ' + Vlc_faultstring + '</message> '+'<httpstatus>400</httpstatus>'+'-'+NVL(oxmlhttp.responsetext, '')
 		RETURN rptawsticket
    ENDIF 
 *rptawsticket = STREXTRACT(oxmlhttp.responsetext, "<ticket>", "</ticket>")
 
