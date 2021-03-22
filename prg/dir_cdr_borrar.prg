 PROCEDURE get_FilesFromDirectory
        LPARAMETERS tcDir, taFiles, lnFileCount
        SET STEP ON
        EXTERNAL ARRAY taFiles

        LOCAL laFiles(1), I, lnFiles

        IF TYPE("ALEN(laFiles)") # "N" OR EMPTY(lnFileCount)
            lnFileCount = 0
            DIMENSION taFiles(1)
        ENDIF

        tcDir    = ADDBS(tcDir)

        IF DIRECTORY(tcDir)
            lnFiles = ADIR( laFiles, tcDir + '*.*', 'D', 1)

            *-- Busco los archivos
            FOR I = 1 TO lnFiles
                IF SUBSTR( laFiles(I,5), 5, 1 ) == 'D'
                    LOOP
                ENDIF
                lnFileCount    = lnFileCount + 1
                DIMENSION taFiles(lnFileCount)
                taFiles(lnFileCount)    = tcDir +laFiles(I,1)              
                
*!*	                oFSO = CREATEOBJECT("Scripting.FileSystemObject") 
*!*					oFSO.DeleteFolder("D:\SFS_v1.2\sunat_archivos\sfs\RPTA\dummy",.t.) 
                   
               IF FILE(  taFiles(lnFileCount))
					DELETE FILE (taFiles(lnFileCount))
				ENDIF	
                
*!*	                oFSO = CREATEOBJECT("Scripting.FileSystemObject") 
*!*					oFSO.DeleteFolder(taFiles(lnFileCount)) 		
*!*								
                
            ENDFOR

*!*	            *-- Busco los subdirectorios
*!*	            FOR I = 1 TO lnFiles
*!*	                IF NOT SUBSTR( laFiles(I,5), 5, 1 ) == 'D' ;
*!*	                       OR LEFT(laFiles(I,1), 1) == '.'
*!*	                    LOOP
*!*	                ENDIF
*!*	                get_FilesFromDirectory( tcDir + laFiles(I,1), ;
*!*	                   @taFiles, @lnFileCount )
*!*	                  
*!*	               

*!*					   
*!*	                   
*!*	            ENDFOR
        ENDIF
    ENDPROC