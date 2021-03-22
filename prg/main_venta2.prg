PARAMETERS usuario, contrasena,almacen
_SCREEN.VISIBLE = .F.
_SCREEN.BorderStyle= 3
application.Visible = .F.

SET STEP ON
MODIFY WINDOWS SCREEN TITLE ".:: SERVAL - SISTEMA DE GESTION ::."


PUBLIC lcAppDir,Vgc_almatrab,Vgc_usuario,nres,Vpc_server,Vgc_impresora,Vgc_impresora2,Vgc_version 
PUBLIC Vlc_numbl,Vlc_numcont,Vlc_nombrebuque,Vlc_numviaje,Vlc_fechaatr,Vgc_cliente2,Vgc_cambiom,Vpc_nuevafecha,Vpn_fecha_desde2,Vpn_fecha_hasta2,Vgc_clic,Vgn_opt,Vgc_cliente2,conex,Vgn_tipousu,lcConnect
PUBLIC Vgc_clic,Vgn_opt,Vgc_cliente2,conex,Vgn_tipousu,Vgc_serie,Vgc_nomb_usu,Vgn_actual,fg_conectado,Vgn_super_user,VPC_llave,Vgc_caja,caja,Vgc_barras
PUBLIC Vgc_fg_barra_menu 
Vgc_barras =0 
Vgn_super_user=0
fg_conectado=0
Vgn_actual=0
Vgc_cliente2=""
Vgc_serie=""
conex=0
Vgn_tipousu=0
lcAppDir = upper(ADDBS(SYS(5) + SYS(2003)))
Vgc_almatrab=0
Vgc_nomb_usu=""
*Vgc_usuario=""
Vgc_clic =0
Vgn_opt=1
conex=0
Vgc_fg_barra_menu = 0
*
*---------------------

*****VERSION
Vgc_version='1.0.0.22'
Vgc_vigencia='02/07/2019'
***VERSION
SET STEP ON
Local cnControladorArch,nTamaño,cCadena
cnControladorArch = FOPEN(lcAppDir+"config.txt")
*cnControladorArch = FOPEN("c:\config.txt")
nTamaño =  FSEEK(cnControladorArch, 0, 2)    && Lleva el puntero a EOF.
IF nTamaño <= 0
	MESSAGEBOX("Este archivo está vacío.")
ELSE
  = FSEEK(cnControladorArch, 0, 0)     && Mueve el puntero a BOF.
cCadena = FREAD(cnControladorArch, nTamaño)
ENDIF
= FCLOSE(cnControladorArch)   

aux=AT("$",cCadena,1)
Vgc_server=SUBSTR(cCadena,1,aux-1)
aux2=AT("$",cCadena,2)
Vgc_bd=SUBSTR(cCadena,aux+1,aux2-aux-1)
caja=ALLTRIM(SUBSTR(cCadena,aux2+1,LEN(cCadena)-aux2))
Vgc_caja=VAL(caja)
*---------------------

lcparServidor=Vgc_server
lcparDataBase =Vgc_bd
Vcl_conex = "driver={SQL Server};"+; 
"server=" + lcparServidor + ";"+; 
"database="+lcparDataBase+";"+;
" UID=serval; pwd=Cybers@c1;trusted_connection=no;" 
Conex=SQLSTRINGCONNECT(Vcl_conex)
*" UID=sa; pwd=sa123;trusted_connection=no;" 
**ERROR CONEXION SERVER
IF Conex > 0 THEN 
		
		SET DEFAULT TO FULLPATH(lcAppDir)
		*OPEN DATABASE FULLPATH(lcAppDir+"data\bppc.dbc")
		SET PATH TO "data,formularios,ing,ico,botones,clase,prg,reportes,archivos,menu"

****DATOS CONFIGURACION
lsql="Select * FROM  CONFIGURACION"
resp=SQLEXEC(conex, lsql, "CONFIGURACION")
IF resp<0
	MESSAGEBOX("Disculpe, error en la consulta, por favor comunicarse con el personal de soporte tecnico.",0+16,"Error de conexión")
	RETURN 
ELSE	
	Vpc_server = ALLTRIM(NB_SERVIDOR)	
	Vgc_impresora = ALLTRIM(NB_IMPRESORA)
	Vgc_impresora2 = ALLTRIM(NB_IMPRESORA2)
ENDIF 
**** FIN DATOS CONFIGURACION

	lsql="BEGIN TRANSACTION select * from usuarios COMMIT TRANSACTION"
	resp=SQLEXEC(conex, lsql, "usuarios")
	IF resp>0
		SELECT usuarios
		GO top
	ELSE
		MESSAGEBOX("Disculpe, error en la consulta por favor comunicarse con el Soporte Tecnico del Sistema .",0+16,"Error de conexión")
	ENDIF 
	********************
	
	
	lsql="BEGIN TRANSACTION select * from relacion_usu_sucursal COMMIT TRANSACTION"
	resp=SQLEXEC(conex, lsql, "relacion_usu_sucursal")
	IF resp>0
		SELECT relacion_usu_sucursal
		GO top
	ELSE
		MESSAGEBOX("Disculpe, error en la consulta por favor comunicarse con el Soporte Tecnico del Sistema .",0+16,"Error de conexión")
	ENDIF 
	
	
	***TIPO DOCUMENTO
	lsql="Select ID_SUCURSAL, NOMBRE FROM SUCURSAL WHERE FG_ACTIVO = 1"
	resp=SQLEXEC(conex, lsql, "SUCURSAL2")
	IF resp<0
		MESSAGEBOX("Disculpe, error en la consulta, por favor comunicarse con el personal de soporte tecnico.",0+16,"Error de conexión")
		RETURN 
	ENDIF 


	lsql="select dbo.fn_encripta(?contrasena) as clave_encriptada"
	resp=SQLEXEC(conex,lsql,"clave")
	SELECT clave
	vpc_clave=ALLTRIM(clave_encriptada)
	SELECT usuarios
	GO TOP
	LOCATE FOR ALLTRIM(UPPER(IDENTIFICACION))=usuario AND ALLTRIM(UPPER(clave))=contrasena AND (fg_activo=1 OR fg_activo=2)
	IF FOUND()
		Vgc_usuario=ALLTRIM(IDENTIFICACION)			
		Vgc_nomb_usu=ALLTRIM(nombre)
		Vgn_tipousu=id_rol
		Vgn_super_user=fg_superuser
		Vlc_usuario_pc=ALLTRIM(usuario_pc)
		Vlc_nombre_pc=ALLTRIM(nombre_pc)
		Vlc_ip=ALLTRIM(ip_actual)
		Vln_conectado=fg_conectado
		Vgc_fg_barra_menu = fg_barra_menu
		
		*this.Parent.txt1.SetFocus

		SELECT relacion_usu_sucursal
		LOCATE FOR IDENTIFICACION = Vgc_usuario AND id_sucursal = (almacen)
		IF FOUND()		
		Vgc_almatrab=(ID_SUCURSAL)
		ELSE		
			MESSAGEBOX("Disculpe, no tiene acceso a esta sucursal",0+16,"Mensaje")	
			RETURN 
		ENDIF 			
		Vlc_nom_pc=SUBSTR(SYS(0),1,AT('#',SYS(0))-2)
		Vlc_user=SUBSTR(SYS(0),AT('#',SYS(0))+2,LEN(SYS(0)))
		Vlc_ip_act=''
*!*			IF Vln_conectado=1 
*!*				lsql="UPDATE usuarios SET fg_conectado=2,usuario_ant=?Vlc_usuario_pc,ip_anterior=?Vlc_ip,nombre_pc_ant=?Vlc_nombre_pc,"+;
*!*				"usuario_pc=?Vlc_user,ip_actual=?Vlc_ip_act,nombre_pc=?Vlc_nom_pc,MAC_ADDRESS=?Vpc_mac WHERE IDENTIFICACION=?Vgc_usuario"
*!*				resp=SQLEXEC(conex, lsql)
*!*				Vgn_actual=0	
*!*				*MESSAGEBOX("Su cuenta esta siendo usada por otro usuario, IP:"+Vlc_ip,0+64,"BPPC - SBS")
*!*			ENDIF 
*!*			IF Vln_conectado=0
*!*				lsql="UPDATE usuarios SET fg_conectado=1,usuario_ant=?Vlc_usuario_pc,ip_anterior=?Vlc_ip,nombre_pc_ant=?Vlc_usuario_pc,"+;
*!*				"usuario_pc=?Vlc_user,ip_actual=?Vlc_ip_act,nombre_pc=?Vlc_nom_pc,MAC_ADDRESS=?Vpc_mac WHERE IDENTIFICACION=?Vgc_usuario"
*!*				resp=SQLEXEC(conex, lsql)
*!*				Vgn_actual=1
*!*			ENDIF 
		USE IN USUARIOS
		USE IN relacion_usu_sucursal
		USE IN SUCURSAL2
		
		DO FORM principal_venta
		*thisform.Release 
	ELSE
		MESSAGEBOX("Disculpe, clave o login incorrecto",0+16,"Mensaje")
	ENDIF 















*!*		****VERIFICAR EL SERIAL DEL DISCO
*!*		Vlc_disco = LEFT( lcAppDir, 2)
*!*		loFSO = CREATEOBJECT("Scripting.FileSystemObject")
*!*		lcSerialNumber = lofso.drives(Vlc_disco).serialnumber 
*!*		*messagebox((lcSerialNumber))
*!*		*****FIN VERIFICAR SERIAL DEL DISCO
*!*						
*!*		****NOMBRE PC	
*!*		Vlc_nom_pc=SUBSTR(SYS(0),1,AT('#',SYS(0))-2)
*!*		lsql="select dbo.fn_encripta(?Vlc_nom_pc) as pc_encriptada"
*!*		resp=SQLEXEC(conex,lsql,"llave")
*!*		SELECT llave
*!*		Vlc_pc_encriptada=ALLTRIM(pc_encriptada)
*!*		****FIN NOMBRE PC

*!*		****NOMBRE MAC
*!*		LOCAL lcComputerName, loWMIService, loItems, loItem, lcMACAddress,Vlc_mac
*!*		Vpc_mac_a=''
*!*		lcComputerName = "."
*!*		loWMIService = GETOBJECT("winmgmts:\\" + lcComputerName + "\root\cimv2")
*!*		loItems = loWMIService.ExecQuery("Select * from Win32_NetworkAdapter",,48)

*!*		FOR EACH loItem IN loItems
*!*		lcMACAddress = loItem.MACAddress
*!*			IF !ISNULL(lcMACAddress)		
*!*				IF EMPTY(Vpc_mac_a)
*!*					Vpc_mac_a = ALLTRIM(UPPER(loItem.MACAddress))
*!*					*MESSAGEBOX(Vpc_mac_a)
*!*				ENDIF   
*!*				
*!*			ENDIF
*!*		ENDFOR
*!*		lsql="select dbo.fn_encripta(?Vpc_mac_a) as mac_encriptada"
*!*		resp=SQLEXEC(conex,lsql,"llave")
*!*		SELECT llave
*!*		Vlc_mac_encriptada=ALLTRIM(mac_encriptada)
*!*		***FIN NOMBRE MAC

*!*		*****VERIFICO KEY EN ARCHIVO TXT
*!*		Local cnControladorArch2,nTamaño2,cCadena2
*!*		cnControladorArch2 = FOPEN(lcAppDir+"data\temp\temp130713\temp.txt")
*!*		nTamaño2 =  FSEEK(cnControladorArch2, 0, 2)    && Lleva el puntero a EOF.
*!*		IF nTamaño2 <= 0
*!*			*MESSAGEBOX("Este archivo está vacío.")
*!*			cCadena2 =''
*!*		ELSE
*!*		  = FSEEK(cnControladorArch2, 0, 0)     && Mueve el puntero a BOF.
*!*		cCadena2 = FREAD(cnControladorArch2, nTamaño2)
*!*		VPC_llave = cCadena2
*!*		ENDIF
*!*		= FCLOSE(cnControladorArch2)   
*!*		*********FIN VERIFICO KEY EN ARCHIVO TXT	


*!*		lsql="select dbo.fn_desencripta(?cCadena2) as llave_desencriptada"
*!*		resp=SQLEXEC(conex,lsql,"llave_des")
*!*		SELECT llave_des
*!*		Vlc_llave_desencriptada=ALLTRIM(llave_desencriptada)
*!*		
*!*		lsql="select * from NOTAS_REPORTES"
*!*		resp=SQLEXEC(conex, lsql, "NOTAS_REPORTES")
*!*		IF resp>0
*!*			SET EXACT ON 		
*!*			IF nTamaño2 > 0 	
*!*				SELECT NOTAS_REPORTES
*!*				
*!*				*LOCATE FOR NOTA_1 = ALLTRIM(Vlc_llave_desencriptada) AND  NOTA_2 = ALLTRIM(Vlc_mac_encriptada) AND active = .t.
*!*				LOCATE FOR NOTA_1 = ALLTRIM(Vlc_llave_desencriptada) AND  REPORTE_1 = (lcSerialNumber) AND active = .t.
*!*			
*!*				IF FOUND()								
*!*					USE IN NOTAS_REPORTES
*!*					USE IN LLAVE_DES					
*!*					DO FORM PRINCIPAL_VENTA
*!*					READ EVENTS	
*!*					*MESSAGEBOX('listo')			
*!*				ELSE	
*!*					MESSAGEBOX("Disculpe, Error en LICENCIA, por favor comunicarse con el Soporte Tecnico del Sistema .",0+16,"Error de Licencia")
*!*					RETURN
*!*				ENDIF
*!*			ELSE
*!*				SELECT NOTAS_REPORTES
*!*				*LOCATE FOR NOTA_2 = ALLTRIM(Vlc_mac_encriptada) AND active = .t.
*!*				LOCATE FOR REPORTE_1 = (lcSerialNumber) AND active = .t.
*!*				
*!*				IF FOUND()
*!*					Vlc_NOTA_1 = ALLTRIM(NOTA_1)
*!*					lsql="select dbo.fn_encripta(?Vlc_NOTA_1) as llave_encriptada"
*!*					resp=SQLEXEC(conex,lsql,"llave")
*!*					SELECT llave
*!*					Vlc_llave_encriptada=ALLTRIM(llave_encriptada)				
*!*					
*!*					lcFile=lcAppDir+"data\temp\temp130713\temp.txt"
*!*					*lcCadena=(STR(lcSerialNumber))+'&'+ALLTRIM(Vlc_NOTA_1)
*!*					lcCadena=ALLTRIM(Vlc_llave_encriptada)			
*!*					Strtofile( lcCadena, lcFile ,1)
*!*													
*!*					lsql = "UPDATE NOTAS_REPORTES SET REPORTE_1= ?lcSerialNumber, STATUS = 1, TOTAL_REPORTE = ?Vlc_pc_encriptada, NOTA_2=?Vlc_mac_encriptada WHERE NOTA_1 = ?Vlc_NOTA_1"
*!*					resp=SQLEXEC(conex, lsql)
*!*					IF resp<0
*!*						MESSAGEBOX("Disculpe, error en la consulta, por favor comunicarse con el Soporte Tecnico del Sistema .",0+16,"Error de conexión")
*!*						RETURN 
*!*					ENDIF
*!*					USE IN NOTAS_REPORTES
*!*					USE IN LLAVE_DES					
*!*					DO FORM PRINCIPAL_VENTA
*!*					READ EVENTS							
*!*				ELSE
*!*					SELECT NOTAS_REPORTES
*!*					LOCATE FOR STATUS = 0 AND active = .t.
*!*					IF FOUND()
*!*						Vlc_NOTA_1 = ALLTRIM(NOTA_1)
*!*						lsql="select dbo.fn_encripta(?Vlc_NOTA_1) as llave_encriptada"
*!*						resp=SQLEXEC(conex,lsql,"llave")
*!*						SELECT llave
*!*						Vlc_llave_encriptada=ALLTRIM(llave_encriptada)				
*!*						
*!*						lcFile=lcAppDir+"data\temp\temp130713\temp.txt"
*!*						*lcCadena=(STR(lcSerialNumber))+'&'+ALLTRIM(Vlc_NOTA_1)
*!*						lcCadena=ALLTRIM(Vlc_llave_encriptada)			
*!*						Strtofile( lcCadena, lcFile ,1)
*!*														
*!*						lsql = "UPDATE NOTAS_REPORTES SET REPORTE_1= ?lcSerialNumber, STATUS = 1, TOTAL_REPORTE = ?Vlc_pc_encriptada, NOTA_2=?Vlc_mac_encriptada,FH_ACTIVO=getdate() WHERE NOTA_1 = ?Vlc_NOTA_1"
*!*						resp=SQLEXEC(conex, lsql)
*!*						IF resp<0
*!*							MESSAGEBOX("Disculpe, error en la consulta, por favor comunicarse con el Soporte Tecnico del Sistema .",0+16,"Error de conexión")
*!*							RETURN 
*!*						ENDIF
*!*						USE IN NOTAS_REPORTES
*!*						USE IN LLAVE_DES					
*!*						DO FORM PRINCIPAL_VENTA
*!*						READ EVENTS	
*!*					ELSE
*!*						MESSAGEBOX("Disculpe, Error en LICENCIA, por favor comunicarse con el Soporte Tecnico del Sistema .",0+16,"Error de Licencia")
*!*						RETURN								
*!*					ENDIF				
*!*				ENDIF 		
*!*			ENDIF 
*!*		ELSE
*!*			MESSAGEBOX("Disculpe, error en la consulta por favor comunicarse con el Soporte Tecnico del Sistema .",0+16,"Error de conexión")
*!*			RETURN 
*!*		ENDIF 		
ELSE
	MESSAGEBOX("Disculpe, error de conexion con el servidor de base de datos Soporte Tecnico del Sistema .",0+16,"Error de conexión")
	RETURN 
ENDIF 
************FIN ERROR CONEXION SERVER

*DO FORM actualizacion
*READ EVENTS	









