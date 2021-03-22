Declare Integer WSAStartup In wsock32;
 Integer wVerRq, String @lpWSAData

Declare Integer WSACleanup In wsock32

Declare Integer gethostname In wsock32;
 String @Name, Integer namelen

Declare Integer gethostbyname In wsock32;
 String HostName

Declare RtlMoveMemory In kernel32 As Heap2Str;
 String @, Integer, Integer
 
 **************************
Function IPPortion(nPointer)
**************************
    Local lnAddress, lcResult
    lnAddress = buf2dword(MemoryBuffer(nPointer, 4))
    Return Iif(lnAddress <> 0, JustIP(MemoryBuffer(lnAddress, 4)), "")
Endfunc


**************************
Function JustIP(cBuffer)
**************************
    Local lcResult, lnCounter
    lcResult = ""
    For lnCounter=1 To 4
        lcResult = lcResult + Ltrim(Str(Asc(Substr(cBuffer, lnCounter)))) + Iif(lnCounter=4,     "",".")
    Endfor
    Return lcResult
Endfunc


**************************
Function buf2word (cBuffer)
**************************
    Return Asc(Substr(cBuffer, 1,1)) + Asc(Substr(cBuffer, 2,1)) * 256
Endfunc


**************************
Function buf2dword(cBuffer)
**************************
    Return Asc(Substr(cBuffer, 1,1)) + ;
        BitLShift(Asc(Substr(cBuffer, 2,1)), 8) +;
        BitLShift(Asc(Substr(cBuffer, 3,1)), 16) +;
        BitLShift(Asc(Substr(cBuffer, 4,1)), 24)
Endfunc


**************************
Function MemoryBuffer(nAddress, nBuffersize)
**************************
    Local lcBuffer
    lcBuffer = SPACE(nBuffersize)
    = Heap2Str (@lcBuffer, nAddress, nBuffersize)
    Return lcBuffer
Endfunc