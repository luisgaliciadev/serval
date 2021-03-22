PARAMETER _nombrearchivose,nro_ticket, femodo, rucsol, usuariosol, clavesol, _urlws,ruta_cdr_local,ruta_cdr_server,ruta_rpta_server
SET STEP ON
 PUBLIC rptawsticket
 rptawsticket = "ERROR"
 ls_ruc_emisor = rucsol
 ls_user = ls_ruc_emisor+usuariosol
 ls_pwd_sol = clavesol
 
*!*		<soapenv:Header>
*!*			<wsse:Security>
*!*		 		<wsse:UsernameToken>
*!*		 			<wsse:Username><<ls_user>></wsse:Username>
*!*		 			<wsse:Password><<ls_pwd_sol>></wsse:Password>
*!*				</wsse:UsernameToken>
*!*		 	</wsse:Security>
*!*		 </soapenv:Header>
	 
*!*		 <SOAP-ENV:Header xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope">
*!*			<wsse:Security>
*!*		 		<wsse:UsernameToken>
*!*		 			<wsse:Username><<ls_user>></wsse:Username>
*!*		 			<wsse:Password><<ls_pwd_sol>></wsse:Password>
*!*				</wsse:UsernameToken>
*!*		 	</wsse:Security>
*!*		</SOAP-ENV:Header>	 

 TEXT TO ls_envioxml TEXTMERGE NOSHOW PRETEXT 0015 FLAGS 1
	<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/"
	xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:xsd="http://www.w3.org/2001/XMLSchema"
	xmlns:wsse="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wsswssecurity-secext-1.0.xsd">
		<SOAP-ENV:Header>
			<wsse:Security>
				<wsse:UsernameToken>
					<wsse:Username>20524119553MODDATOS</wsse:Username>
					<wsse:Password>moddatos</wsse:Password>
				</wsse:UsernameToken>
			</wsse:Security>
		</SOAP-ENV:Header>
		<SOAP-ENV:Body>
			<m:getStatusCdr xmlns:m="http://service.sunat.gob.pe">
				<rucComprobante>20538236021</rucComprobante>
				<tipoComprobante>01</tipoComprobante>
				<serieComprobante>F001</serieComprobante>
				<numeroComprobante>493</numeroComprobante>
			</m:getStatusCdr>
		</SOAP-ENV:Body>
	</SOAP-ENV:Envelope>
 ENDTEXT
 oxmlhttp = CREATEOBJECT("MSXML2.ServerXMLHTTP.6.0")
 oxmlbody = CREATEOBJECT('MSXML2.DOMDocument.6.0')
 IF  .NOT. (oxmlbody.loadxml(ls_envioxml))
    oresp.mensaje = "No se cargo XML: "+oxmlbody.parseerror.reason
    *RETURN .F.
    RETURN "<message>ERROR NO SE CARGO XML</message>"
 ENDIF
 lsurl = purlws
 oxmlhttp.open('POST', lsurl, .F.)
 oxmlhttp.setrequestheader("Content-Type", "text/xml")
 oxmlhttp.setrequestheader("Content-Type", "text/xml;charset=ISO-8859-1")
 oxmlhttp.setrequestheader("Content-Length", LEN(ls_envioxml))
 oxmlhttp.setrequestheader("SOAPAction", "getStatus")
 oxmlhttp.setoption(2, 13056) 
 
 lcErr = "" 
TRY 
 oxmlhttp.send(oxmlbody.documentelement.xml)

CATCH TO loError 
	lcErr = [Error: ] + STR(loError.ERRORNO) + CHR(13) + [Linea: ] + STR(loError.LINENO) + CHR(13) + [Mensaje: ] + loError.MESSAGE 
FINALLY 
	IF EMPTY(lcErr) 
		*MESSAGEBOX("El mensaje se envió con éxito", 64, "Aviso") 
	ELSE 
		MESSAGEBOX(lcErr, 16 , "Error")
	ENDIF 
ENDTRY 

IF lcerr=""
ELSE
	*RETURN "ERROR- ASEGURE QUE HAY CONEXION A INTENET O ESTE DISPONIBLE EL SERVIDOR EL COMPROBANTE NO SE ENVIO" 
	*RETURN 0
	RETURN "<message>ERROR - NO QUE HAY CONEXION A INTENET O  EL SERVIDOR NO ESTA DISPONIBLE, EL COMPROBANTE NO SE ENVIO</message> <httpstatus>"+ALLTRIM(STR(oxmlhttp.status))+"</httpstatus>"+ +NVL(oxmlhttp.responsetext, '')
ENDIF

 
 SET STEP ON
 IF (oxmlhttp.status<>200)
 	*MESSAGEBOX("ERROR:"+ oxmlhttp.responsetext )
    RETURN "<message>Error: Comprobante NO SE HA ENVIADO</message>, ERROR: <httpstatus>"+ALLTRIM(STR(oxmlhttp.status))+"</httpstatus>"+ +NVL(oxmlhttp.responsetext, '')
    *RETURN 0
 ELSE
    loxmlresp = CREATEOBJECT("MSXML2.DOMDocument.6.0")
    loxmlresp.loadxml(oxmlhttp.responsetext)
    ccontenidorptazip = STREXTRACT(oxmlhttp.responsetext, "<content>", "</content>")
    DELETE FILE ALLTRIM(ruta_cdr_local+"R-"+_nombrearchivose+".zip")
    STRTOFILE(STRCONV(ccontenidorptazip, 14), ruta_cdr_local+"R-"+_nombrearchivose+".zip")
    
    DELETE FILE ALLTRIM(ruta_cdr_server+"R-"+_nombrearchivose+".zip")
    STRTOFILE(STRCONV(ccontenidorptazip, 14), ruta_cdr_server+"R-"+_nombrearchivose+".zip") 
    
    DELETE FILE ALLTRIM(ruta_rpta_server+"R-"+_nombrearchivose+".zip")
    STRTOFILE(STRCONV(ccontenidorptazip, 14), ruta_rpta_server+"R-"+_nombrearchivose+".zip")
    *STRTOFILE(STRCONV(ccontenidorptazip, 14), _rutaxml_cdr+"R-"+_nombrearchivose_CLIENTE+".zip")
    *STRTOFILE(STRCONV(ccontenidorptazip, 14), _rutaxml_cdr_server+"R-"+_nombrearchivose_CLIENTE+".zip")  
    *MESSAGEBOX(oxmlhttp.responsetext)
    *RETURN "COMPROBANTE ENVIADO Y ACEPTADO"
    RETURN '<message>ENVIADO Y ACEPTADO</message> '+'<httpstatus>'+ALLTRIM(STR(oxmlhttp.status))+'</httpstatus>'+'-'+NVL(oxmlhttp.responsetext, '')
    * rptawsticket = 
 ENDIF



	