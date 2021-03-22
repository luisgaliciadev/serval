PUBLIC lcAppDir,Vgc_almatrab,Vgc_usuario,nres
PUBLIC Vlc_numbl,Vlc_numcont,Vlc_nombrebuque,Vlc_numviaje,Vlc_fechaatr ,Vgc_clic,Vgn_opt,Vgc_cliente2,conex,Vgn_tipousu,lcConnect,Vgc_nomb_usu
PUBLIC nres,res,vgc_serie,Vgn_actual,fg_conectado,Vgn_super_user

Vgn_super_user=1
fg_conectado=0
Vgn_actual=0
conex=0
vgc_serie="APCK"

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
Vgc_ip_lector=SUBSTR(cCadena,aux2+1,LEN(cCadena)-aux2)
*---------------------

lcparServidor=Vgc_server
lcparDataBase =Vgc_bd
Vcl_conex = "driver={SQL Server};"+; 
"server=" + lcparServidor + ";"+; 
"database="+lcparDataBase+";"+;
" UID=sa; pwd=sa123;trusted_connection=no;" 
Conex=SQLSTRINGCONNECT(Vcl_conex )


		
SET DEFAULT TO FULLPATH(lcAppDir)
*!*	OPEN DATABASE FULLPATH(lcAppDir+"data\bppc.dbc")
SET PATH TO "data,formularios,ing,ico,botones,clase,prg,reportes,archivos"




Vgc_nomb_usu="PRUEBA"
Vgc_cliente2=""
lcAppDir = upper(ADDBS(SYS(5) + SYS(2003)))
SET DEFAULT TO FULLPATH(lcAppDir)
OPEN DATABASE FULLPATH(lcAppDir+"data\SAPME.dbc")
Vgc_almatrab='1'
Vgc_usuario="87654321"
Vgc_clic =0
Vgn_opt=1
Vgn_tipousu=4
SET DELETED ON 
