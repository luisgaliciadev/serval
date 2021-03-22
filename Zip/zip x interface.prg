SET PATH TO FULLPATH(CURDIR())
SET CLASSLIB TO 'zip.vcx' ADDITIVE 


*!* Creamos el objeto
oZip=CREATEOBJECT('Zip.Interface')
oZip.Show