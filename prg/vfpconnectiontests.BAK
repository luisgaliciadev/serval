*!* The code below is not designed to run all at once
*!* Run the individual examples seperately

********************************************************************
*!* Upload Examples
********************************************************************
SET LIBRARY TO (LOCFILE("vfpconnection.fll","FLL"))
*!* FILE
?FILEGet("File:///C:\Source.txt", "C:\Destination.txt", "MyProgress()", "MyTrace()")
*!* FTP
?FTPGet("FTP://UserName:Password@somedomain.com/directory/Source.zip", "C:\Destination.zip", "MyProgress()", "MyTrace()")
*!* FTPS
?FTPSGet("FTPS://UserName:Password@somedomain.com:21/directory/Source.zip", "C:\Destination.zip", "MyProgress()", "MyTrace()")
*!* HTTP
?HTTPGet("http://www.somedomain.com/Source.htm", "C:\Destination.htm", "MyProgress()", "MyTrace()")
*!* HTTPS
?HTTPSGet("https://www.somedomain.com/Source.htm", "C:\Destination.htm", "MyProgress()", "MyTrace()")
SET LIBRARY TO

********************************************************************
*!* Download Examples
********************************************************************
SET LIBRARY TO (LOCFILE("vfpconnection.fll","FLL"))
*!* FILE
?FILEPut("C:\Source.txt", "File:///C:\Destination.txt", "MyProgress()", "MyTrace()")
*!* FTP
?FTPPut("C:\Source.zip", "FTP://UserName:Password@somedomain.com/directory/Destination.zip", "MyProgress()", "MyTrace()")
*!* FTPS
?FTPSPut("C:\Source.zip", "FTPS://UserName:Password@somedomain.com:21/directory/Destination.zip", "MyProgress()", "MyTrace()")
*!* HTTP
?HTTPPut("C:\Source.htm", "http://www.somedomain.com/Destination.htm", "MyProgress()", "MyTrace()")
*!* HTTPS
?HTTPSPut("C:\Source.htm", "https://www.somedomain.com/Destination.htm", "MyProgress()", "MyTrace()")
SET LIBRARY TO

********************************************************************
*!* To String Examples
********************************************************************
SET LIBRARY TO (LOCFILE("vfpconnection.fll","FLL"))
*!* FILE
?FILEToStr("C:\Source.txt")
*!* FTP
?FTPTOSTR("FTP://UserName:Password@somedomain.com:21/directory/Source.txt")
*!* FTPS
?FTPSTOSTR("FTPS://UserName:Password@somedomain.com:21/directory/Source.txt")
*!* HTTP
?HTTPToStr("http://www.somedomain.com/Source.txt")
*!* HTTPS
?HTTPSToStr("https://www.somedomain.com/Source.txt")
SET LIBRARY TO

********************************************************************
*!* HTTP Post Examples
********************************************************************
*!* Simple HTTP Post
SET LIBRARY TO (LOCFILE("vfpconnection.fll","FLL"))
LOCAL lcPost
m.lcPost = "fname=John&lname=Smith"
?HttpSimplePost("http://www.snee.com/xml/crud/posttest.cgi", m.lcPost, "", "MyTrace()")
SET LIBRARY TO

*!* MultiPart/Form-Data HTTP Post
SET LIBRARY TO (LOCFILE("vfpconnection.fll","FLL"))
LOCAL ARRAY aryPost(2,2)
aryPost(1,1) = "fname" && name
aryPost(1,2) = "test first" && value
aryPost(2,1) = "lname" && name
aryPost(2,2) = "test last" && value
?HttpPost("http://www.cs.tut.fi/cgi-bin/run/~jkorpela/echo.cgi", @aryPost, "", "MyTrace()")
SET LIBRARY TO

********************************************************************
*!* FTP Commands Example
********************************************************************
*!* Rename FTP Directory
SET LIBRARY TO (LOCFILE("vfpconnection.fll","FLL"))
LOCAL ARRAY aryFTPCommands(4)
aryFTPCommands(1) = "CWD /"
aryFTPCommands(2) = "PWD"
aryFTPCommands(3) = "RNFR MyDir"
aryFTPCommands(4) = "RNTO RenamedMyDir"
?FTPCommands("FTP://username:password@somedomain.com/", @aryFTPCommands, "MyTrace()")
*!* ?FTPSCommands("FTPS://username:password@somedomain.com/", @aryFTPCommands, "MyTrace()")
SET LIBRARY TO

********************************************************************
*!* URL Encode/Decode Example
********************************************************************
SET LIBRARY TO (LOCFILE("vfpconnection.fll","FLL"))
LOCAL lcString, lcEncoded, lcDecoded
m.lcString = "A!B@C#D$E%F^G&H*I(J)K_L-M=N+O[P]Q{R}S|T\U:V;W'X,Y.Z<0>1/2?3񞎽񞶗񟝱"
m.lcEncoded = UrlEncode(m.lcString)
m.lcDecoded = UrlDecode(m.lcEncoded)
?"Escaped: " + m.lcEncoded
?"Unescaped: " + m.lcDecoded
?"Original : " + m.lcString
SET LIBRARY TO

********************************************************************
*!* Setting Timeouts Example
********************************************************************
SET LIBRARY TO (LOCFILE("vfpconnection.fll","FLL"))
SetConnectTimeout(30) && Default is 10 seconds
SetResponseTimeout(30) && Default is 10 seconds
SET LIBRARY TO

********************************************************************
*!* Datetime String to the number of seconds from Epoch (12 Midnight on January 1, 1970)
********************************************************************
SET LIBRARY TO (LOCFILE("vfpconnection.fll","FLL"))
?DateStrToEpochSec("Sun, 06 Nov 1994 08:49:37 GMT")
?DateStrToEpochSec("Sunday, 06-Nov-94 08:49:37 GMT")
?DateStrToEpochSec("Sun Nov 6 08:49:37 1994")
?DateStrToEpochSec("06 Nov 1994 08:49:37 GMT")
?DateStrToEpochSec("06-Nov-94 08:49:37 GMT")
?DateStrToEpochSec("Nov 6 08:49:37 1994")
?DateStrToEpochSec("06 Nov 1994 08:49:37")
?DateStrToEpochSec("06-Nov-94 08:49:37")
?DateStrToEpochSec("1994 Nov 6 08:49:37")
?DateStrToEpochSec("GMT 08:49:37 06-Nov-94 Sunday")
?DateStrToEpochSec("94 6 Nov 08:49:37")
?DateStrToEpochSec("1994 Nov 6")
?DateStrToEpochSec("06-Nov-94")
?DateStrToEpochSec("Sun Nov 6 94")
?DateStrToEpochSec("1994.Nov.6")
?DateStrToEpochSec("Sun/Nov/6/94/GMT")
?DateStrToEpochSec("Sun, 06 Nov 1994 08:49:37 CET")
?DateStrToEpochSec("06 Nov 1994 08:49:37 EST")
?DateStrToEpochSec("Sun, 12 Sep 2004 15:05:58 -0700")
?DateStrToEpochSec("Sat, 11 Sep 2004 21:32:11 +0200")
?DateStrToEpochSec("20040912 15:05:58 -0700")
?DateStrToEpochSec("20040911 +0200")
SET LIBRARY TO

********************************************************************
*!* Determine the version of libcurl and OpenSSL that were used for VFPConnection.fll
********************************************************************
SET LIBRARY TO (LOCFILE("vfpconnection.fll","FLL"))
?CURLVERSION()
SET LIBRARY TO 

***********************
FUNCTION MyProgress() && Callback from the FLL - can be used to track operation progress
***********************
    *!* You can create your own function, procedure or method to handle this and name it whatever you want.
    *!* The nConnectTotalBytes and nConnectBytesSoFar are private variables created on-the-fly by the FLL
    ?m.nConnectTotalBytes
    ?m.nConnectBytesSoFar
ENDFUNC

***********************
FUNCTION MyTrace() && Callback from the FLL - used to provide a detailed trace of the operation
***********************
    *!* You can create your own function, procedure or method to handle this and name it whatever you want.
    *!* The nTraceDataType and cTraceData are private variables created on-the-fly by the FLL
#DEFINE TYPE_TEXT 0
#DEFINE TYPE_HEADER_IN 1
#DEFINE TYPE_HEADER_OUT 2
#DEFINE TYPE_DATA_IN 3
#DEFINE TYPE_DATA_OUT 4
#DEFINE TYPE_SSL_DATA_IN 5
#DEFINE TYPE_SSL_DATA_OUT 6
#DEFINE TYPE_END 7
    ?ICASE(m.nTraceDataType = TYPE_TEXT, "STATUS:", ;
     m.nTraceDataType = TYPE_HEADER_IN, "<RECV HEADER: ", ;
     m.nTraceDataType = TYPE_HEADER_OUT, ">SEND HEADER: ", ;
     m.nTraceDataType = TYPE_DATA_IN, "<RECV DATA: ", ;
     m.nTraceDataType = TYPE_DATA_OUT, ">SEND DATA: ", ;
     m.nTraceDataType = TYPE_SSL_DATA_IN, "<RECV SSL DATA: ", ;
     m.nTraceDataType = TYPE_SSL_DATA_OUT, ">SEND SSL DATA: ", ;
     m.nTraceDataType = TYPE_END, "END: ", "UNKNOWN: ")
    ??m.cTraceData
ENDFUNC

