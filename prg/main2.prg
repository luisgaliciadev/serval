_SCREEN.VISIBLE = .F.
application.Visible = .F.
CLEAR ALL
CLOSE ALL
SET TALK OFF
set date to DMY
SET DEBUG OFF
SET ESCAPE OFF
SET HELP OFF
SET CENTURY ON
SET SAFETY OFF
SET DELETE ON
SET EXCLUSIVE OFF
SET SYSMENU OFF
SET BELL ON
**----------
SET RESOURCE off 
SET REFRESH TO 1,1 
SET EXCLUSIVE OFF 
SET UNIQUE OFF 
SET AUTOSAVE ON 
SET OPTIMIZE ON 
SET REPROCESS TO AUTOMATIC 
SET MULTILOCKS ON 


MODIFY WINDOWS SCREEN TITLE ".:: SAPME - PRINCIPAL ::."


PUBLIC lcAppDir,Vgc_almatrab,Vgc_usuario,nres
PUBLIC Vlc_numbl,Vlc_numcont,Vlc_nombrebuque,Vlc_numviaje,Vlc_fechaatr,Vgc_cliente2,Vgc_cambiom,Vpc_nuevafecha,Vpn_fecha_desde2,Vpn_fecha_hasta2,Vgc_clic,Vgn_opt,Vgc_cliente2,conex,Vgn_tipousu,lcConnect
PUBLIC Vgc_clic,Vgn_opt,Vgc_cliente2,conex,Vgn_tipousu,Vgc_serie,Vgc_nomb_usu,Vgn_actual,fg_conectado,Vgn_super_user
Vgn_super_user=0
fg_conectado=0
Vgn_actual=0
Vgc_cliente2=""
Vgc_serie=""
conex=0
Vgn_tipousu=0
lcAppDir = upper(ADDBS(SYS(5) + SYS(2003)))
Vgc_almatrab=""
Vgc_nomb_usu=""
Vgc_usuario=""
Vgc_clic =0
Vgn_opt=1
conex=0
*!*	lcparServidor="sql-pruebas,2433"
*!*	lcparDataBase ="SOFIAP"
*!*	lcConnect = "driver={SQL Server};"+; 
*!*	"server=" + lcparServidor + ";"+; 
*!*	"database="+lcparDataBase+";"+;
*!*	" UID=aries; pwd=aries;trusted_connection=yes;" 
SET DEFAULT TO FULLPATH(lcAppDir)
OPEN DATABASE FULLPATH(lcAppDir+"data\SAPME.dbc")
SET PATH TO "data,formularios,ing,ico,botones,clase,prg,reportes,archivos"

DO FORM inicio

READ EVENTS



