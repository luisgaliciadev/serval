LParameters tnFilaNro
Local lnColor
 
  if MOD(tnFilaNro, 2) <> 0     && Si es un n�mero de fila impar
    lnColor = RGB(255, 255, 160)
  else                          && Si es un n�mero de fila par
    lnColor = RGB(  0, 255,   0)
  endif
 
Return(lnColor)