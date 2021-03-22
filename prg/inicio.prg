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
SET SYSMENU off
SET BELL ON
**----------
SET RESOURCE off 
SET REFRESH TO 1,1 
SET EXCLUSIVE OFF 
SET UNIQUE OFF 
SET AUTOSAVE ON 
SET OPTIMIZE ON 
SET REPRO TO AUTOMATIC 
SET MULTILOCKS ON 

MODIFY WINDOWS SCREEN TITLE ".:: SAGA SMART ::."



SET DATE DMY 
PUBLIC Vpc_directorio
txtvalopen=FOPEN("C:\Windows\System32\config.txt")
DO WHILE .t. &&hasta que este vacia la linea
txtCadena = FGETS(txtvalopen)
IF EMPTY(txtcadena)
EXIT
ENDIF
Vpc_directorio=ALLTRIM(UPPER(txtCadena))
ENDDO 
FCLOSE(txtValopen)

SET DEFAULT TO FULLPATH(Vpc_directorio)
SET PATH TO formularios,data,imagenes,botones,clase,iconos,program,swf,reportes
*ON ERROR 
PUBLIC Vpc_usuario,Vpn_empresa,Vpc_nombreu,Vpn_empresanom,Vpn_iva,Vpc_empresarif,Vpc_empresadir,Vpc_empresatele
Vpc_empresarif="J-29696392-4"
Vpc_empresadir="BARQUISIMETO"
Vpc_empresatele="0412.508.56.22"
Vpc_usuario="V-18689696"
Vpn_empresa=56
Vpc_nombreu=""
Vpn_empresanom=""
Vpn_iva=0.12

DO FORM inicio

READ EVENTS