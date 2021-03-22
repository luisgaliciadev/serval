*SET STEP ON
**********************************************************************
*      FUNCION: monto_letra()
*     QUE REALIZA  : Transforma un monto determinado de numeros a letras
*	  LLAMADOR POR : 
*     Retorna	   : EL MONTO ESCRITO EN LETRAS
***********************************************************************
*- Function monto_letra
PARAMETERS CANT
*CANT=36.57
N=" "
N1="UNO"
N2="DOS"
N3="TRES"
N4="CUATRO"
N5="CINCO"
N6="SEIS"
N7="SIETE"
N8="OCHO"
N9="NUEVE"
N10="DIEZ"
N11="ONCE"
N12="DOCE"
N13="TRECE"
N14="CATORCE"
N15="QUINCE"
N16="DIECISEIS"
N17="DIECISIETE"
N18="DIECIOCHO"
N19="DIECINUEVE"
N20="VEINTE"
N30="TREINTA"
N40="CUARENTA"
N50="CINCUENTA"
N60="SESENTA"
N70="SETENTA"
N80="OCHENTA"
N90="NOVENTA"
CONT=1
Inicio=1
Cadena=STR(CANT,12,2)
Frase=' '
DO WHILE CONT<4
	 Subcadena=Substr(Cadena,Inicio,3)
	 Cen=Substr(Subcadena,1,1)
	 Dec=Substr(Subcadena,2,2)
	 Uni=Substr(Subcadena,3,1)
	 IF (CONT=1 .OR. CONT=2) .AND. Uni="1"
			N1="UN"
	 Endif
	 IF VAL(Subcadena)>99
			IF VAL(Subcadena)=100
				 Frase=Frase+" CIEN "
				ELSE
				 IF VAL(Subcadena)<200
						Frase=Frase+" CIENTO "
					 ELSE
						IF (VAL(Subcadena)>=500.AND.VAL(Subcadena)<600)
							 Frase=Frase+"QUINIENTOS "
							ELSE
							 IF (VAL(Subcadena)>=700.AND.VAL(Subcadena)<800)
									Frase=Frase+"SETECIENTOS "
								 ELSE
									IF VAL(Subcadena)>=900
										 Frase=Frase+"NOVECIENTOS "
										ELSE
										 Frase=Frase+N&Cen+" CIENTOS "
									Endif
							 Endif
						Endif
				 Endif
			Endif
	 Endif
	 DE=VAL(Dec)
	 IF DE>0
			Do Case
				 Case (INT(DE/10.0)=DE/10.0).OR.(DE>9.AND.DE<20)
							Frase=Frase+N&Dec
				 Case DE>9 .AND.(INT(DE/10.0)#DE/10.0)
							IF DE>20 .AND. DE<30
								 Frase=Frase+" VEINTI "+N&Uni
								ELSE
								 Dec=Substr(Dec,1,1)+"0"
								 Frase=Frase+N&Dec+" Y "+N&Uni
							Endif
				 Case DE<10
							Frase=Frase+N&Uni
			ENDCase
	 Endif
	 IF CONT=1
			IF VAL(Subcadena)=1
				 Frase=Frase + ' MILLON '
				ELSE
				 IF VAL(Subcadena)>1
						Frase=Frase + ' MILLONES '
				 Endif
			Endif
		 ELSE
			IF CONT=2 .AND. CANT>999.99 .AND. VAL(Subcadena)#0
				 Frase=Frase + " MIL "
			Endif
	 Endif
	 Inicio=Inicio+3
	 CONT=CONT+1
	 N1="UNO"
	 N9="NUEVE"
ENDDO
Frase=Frase+" CON "
Frase=Frase+Substr(Cadena,11,2)+"/100"

Return ALLTRIM(Frase)
