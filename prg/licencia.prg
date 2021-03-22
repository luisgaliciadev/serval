PUBLIC nTamaño2,cCadena2,cnControladorArch2  
cnControladorArch2 = FOPEN(lcAppDir+"data\temp\temp130713\temp.txt")

	nTamaño2 =  FSEEK(cnControladorArch2, 0, 2)    && Lleva el puntero a EOF.
	IF nTamaño2 <= 0
		MESSAGEBOX("Este archivo está vacío.")
	ELSE
	  = FSEEK(cnControladorArch2, 0, 0)     && Mueve el puntero a BOF.
	cCadena2 = FREAD(cnControladorArch2, nTamaño2)
	ENDIF
	= FCLOSE(cnControladorArch2)   
