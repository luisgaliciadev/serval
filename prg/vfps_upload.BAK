*!* EJEMPLO PARA SUBIR ARCHIVO
*!* Autor VFPSTEAM BI SOLUTIONS
*!* 15/06/2018

PARAMETERS RUTA 
*SET STEP ON
LOCAL loVFPsUpload,lcDirFile,lcRutaFile

*!* LLAMADO A LA LIBRERIA DE FUNCIONES
SET CLASSLIB TO lcAppDir+'Clase\vfps_upload' ADDITIVE 

*!* CREACIÓN DEL OBJETO
loVFPsUpload = CREATEOBJECT("vfps_upload")
IF VARTYPE(loVFPsUpload) = "O"
   *!* INGRESAR LA URL DONDE SE ALOJA NUESTRO ARCHIVO DE WS
   *loVFPsUpload.lcURL = "https://dief.pe/fe/vfpsupload.php"
   loVFPsUpload.lcURL = "https://www.cyberpowerperu.com/factura/vfpsupload.php"
   *loVFPsUpload.lcURL = "https://www.briane.pe/fe/vfpsupload.php"
   
   *!* LLAMADO A LA VFPSUPLOAD
   *!* PARAMETROS 
   *!* lcDirFile  = NOMBRE DEL DIRECTORIO EN LA NUBE DONDE SE DESEA SUBIR EL ARCHIVO (sin espacios, tal como esta creado en su servidor)
   *!* lcRutaFile = RUTA Y NOMBRE DEL ARCHIVO A SUBIR 
   lcDirFile  = "ARCHIVOS"
   lcRutaFile = ALLTRIM(RUTA)
   
   IF !loVFPsUpload.VFPs_Upload_File (lcDirFile,lcRutaFile)
      *!* HUBO UN ERROR
      RETURN .F.
   ENDIF
   *!* TODO OK SE SUBIO EL ARCHIVO
   *MESSAGEBOX("El archivo se subio correctamente.",64,"SERVAL")
   *SET STEP ON
   lsql = "UPDATE FACT_VENTA SET FG_SUBIDO=1 where ID_FACTURA_VENTA=?Vpn_ID_FACTURA_VENTA"			
		resp=SQLEXEC(conex, lsql)
		IF resp<0
			MESSAGEBOX("Disculpe, error en la consulta, por favor comunicarse con el Soporte Tecnico del Sistema .",0+16,"Error de conexión")
			RETURN 
		ENDIF
		
	lsql = "UPDATE FACT_VENTA SET FG_SUBIDO=1 where ID_FACTURA_VENTA=?Vpn_id_factura"			
		resp=SQLEXEC(conex, lsql)
		IF resp<0
			MESSAGEBOX("Disculpe, error en la consulta, por favor comunicarse con el Soporte Tecnico del Sistema .",0+16,"Error de conexión")
			RETURN 
		ENDIF
ENDIF

*!*	 NOTA IMPORTANTE
*!*	 INSTALACIÓN DEL WEBSERVICE EN LA NUBE O LOCAL (wamp,xamp)
*!*	 PASO 1
*!*	  COPIAR TODO LA CARPETA WS EN LA RUTA DONDE DESEA SUBIR LOS ARCHIVOS (NUBE O LOCAL) 
*!*	 PASO 2
*!*      CREAR LA CARPETA DONDE SE DESEA SUBIR LOS ARCHIVOS (si ya la tiene creada pasar por alto este paso)
*!* PASO 3
*!*      LINKEAR SU RUTA (Chrome, IE, FireFox, Etc) PARA SABER QUE EL WEBSERVICE ESTA BIEN INSTALADO
*!*      Ejemplo link: http://www.facturacionelectronicasunat.solutions/vfpsupload/ws/vfpsupload.php
*!* 
*!* RECUERDE QUE LA ESTRUCTURA DEL WS Y DE SU CARPETA DONDE DESEA SUBIR SUS ARCHIVOS TIENEN QUE ESTAR EN EL MISMO NIVEL
*!* PARA ESTE EJEMPLO LAS CARPETAS QUEDARIAN DE ESTA FORMA: (upload_file es mi carpeta que tengo creada en la nube)
*!* /ws/           ----> CARPETA DONDE ESTA EL WEBSERVICE
*!* /upload_file/  ----> MI CARPETA CREADA DONDE DESEO SUBIR MIS ARCHIVOS
*!* 


