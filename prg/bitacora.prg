LPARAMETERS VlN_accion,Vlc_entidad,Vlc_descri,Vlc_motivo,vln_idmod

Vln_accion=Vln_accion
Vlc_entidad=Vlc_entidad
Vlc_descri=ALLTRIM(UPPER(Vlc_descri))
Vlc_motivo=ALLTRIM(UPPER(Vlc_motivo))
SET STEP ON
*MESSAGEBOX('bitacora1')
IF conex > 0 	
		lsql="INSERT INTO bitacora (identificacion,id_accion,entidad,descripcion,motivo,id_mod)"+;
		" values(?Vgc_usuario,?Vln_accion,?Vlc_entidad,?Vlc_descri,?Vlc_motivo,?vln_idmod)"
		resp=SQLEXEC(conex, lsql, "BITACORA")		
		IF resp<=0
			MESSAGEBOX("Disculpe, error en la consulta por favor comunicarse con el Dpto. de Informática .",0+16,"Error de conexión")
		ELSE
		*MESSAGEBOX('bitacora2')
		ENDIF
	
ELSE
	MESSAGEBOX("Disculpe, no existe conexión con el servidor.",0+16,"Error de conexión")
ENDIF 