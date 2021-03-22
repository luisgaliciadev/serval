
h="hola mundo, es pedro"
j=""
g=""
i=1
DIMENSION a[255],b[9999]
DO WHILE i<256
b=INT(100*RAND())
DO while(b<0 AND b>256)
	b=INT(100*RAND())
ENDDO 
a[i]=b
i=i+1
ENDDO 
FOR i=1 TO LEN(h)
		x=asc(SUBSTR(h,i,1))
		b[i]=x
		j=j+chr(asc(SUBSTR(h,i,1))+a[x])
ENDFOR 
MESSAGEBOX(j)
z=""
c=i

FOR i =1 TO c
	z=z+ALLTRIM(STR(b[i]))+","
ENDFOR 
*!*	SELECT prueba
*!*	GO BOTTOM 
*!*	APPEND BLANK
*!*	replace palabras WITH ALLTRIM(j)
*!*	replace llave WITH ALLTRIM(z)

FOR i=1 TO LEN(j)
	g=g+chr(asc(SUBSTR(j,i,1))-a[b[i]])
ENDFOR 
MESSAGEBOX(g)