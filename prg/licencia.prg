PUBLIC nTama�o2,cCadena2,cnControladorArch2  
cnControladorArch2 = FOPEN(lcAppDir+"data\temp\temp130713\temp.txt")

	nTama�o2 =  FSEEK(cnControladorArch2, 0, 2)    && Lleva el puntero a EOF.
	IF nTama�o2 <= 0
		MESSAGEBOX("Este archivo est� vac�o.")
	ELSE
	  = FSEEK(cnControladorArch2, 0, 0)     && Mueve el puntero a BOF.
	cCadena2 = FREAD(cnControladorArch2, nTama�o2)
	ENDIF
	= FCLOSE(cnControladorArch2)   
