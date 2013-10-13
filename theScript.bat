@echo off
color 0b
title Automated File Transfer
cls

REM PLEASE NOTE! All original information has been edited for secruity, please use this guideline to create your own script. WinSCP (A free software) is required to use this script.

REM Script info
REM Script purpose (1 of 4): To backup files from ex_database into the ex_company BK "backup" folder in ex_database.
REM Script purpose (2 of 4): To transfer files from ex_company's SFTP server to our network (more specifically ex_database)
REM Created: 9/16/2013
REM Last updated: 9/25/2013
REM Censored: 10/11/2013

REM Script start.
REM _________________________________________________________________________________________________________
REM 

REM Creates the variable lines used to shorten backing up files.
REM Example usage --> %backupStart%ImportantFile.txt %backupEnd%ImportantFile.bak

SET backupStart=move \\ex_database\ex_company\ex_company_Daily_Files\
SET backupEnd=\\ex_database\ex_company\ex_company_Daily_Files\Backup\

REM _________________________________________________________________________________________________________
REM 

REM Creates the variable lines to shorten the SFTP file transfer.
REM Example usage --> %transferStart%TheirFile.txt %transferEnd%OurFile.txt%e%

SET transferStart=winscp.exe /console /command "option confirm off" "open sftp://userpass@ftp.company.com" "cd /FromCompany/" "get 
SET transferEnd=\\ex_database\ex_company\ex_Files\
SET e=" "exit"
REM _________________________________________________________________________________________________________
REM 

REM Defines an exiting variable to be added onto each file giving it a time-stamp and exiting the current instance of WinSCP.
SET mm=%DATE:~4,2%
SET dd=%DATE:~7,2%
SET yyyy=%DATE:~10,4%
SET time=_%mm%-%dd%-%yyyy%
SET e=" "exit"
REM _________________________________________________________________________________________________________
REM 

REM Backing up files. 

%backupStart%GapExport*.txt %backupEnd%GapExport%time%.bak
%backupStart%GapRef*.txt %backupEnd%GapRef%time%.bak
%backupStart%PatientExport*.txt %backupEnd%PatientExport%time%.bak
%backupStart%ProvExport*.txt %backupEnd%ProvExport%time%.bak
%backupStart%ProvLocExport*.txt %backupEnd%ProvLocExport%time%.bak

REM _________________________________________________________________________________________________________
REM 

REM Transferring new files to our current files.

%transferStart%GapExport.txt %transferEnd%GapExport.txt%e%
%transferStart%GapRef.txt %transferEnd%GapRef.txt%e%
%transferStart%PatientExport.txt %transferEnd%PatientExport.txt%e%
%transferStart%ProvExport.txt %transferEnd%ProvExport.txt%e%
%transferStart%ProvLocExport.txt %transferEnd%ProvLocExport.txt%e%

REM _________________________________________________________________________________________________________
REM 

REM Script end.




REM -----------------------------------------!!--------PART TWO--------!!------------------------------------



REM Script purpose (3 of 4): To backup files from ex_database into the PatientExport "backup" folder in ex_database.
REM Script purpose (4 of 4): To upload files from ex_database to ex_company's SFTP server (more specifically inside the folder "To_ex_company").
REM Created: 9/20/2013
REM Creator: Michael Arnold - Orange Health Solutions
REM Contact: marnold@orangehealth.net
REM Censored on: 10/12/2013

REM Script start.
REM _________________________________________________________________________________________________________
REM 

REM Creates the variable lines used to shorten backing up files.
REM Example usage --> %backupStart%ImportantFile.txt %backupEnd%ImportantFile.bak

SET bakStart=copy \\ex_database\ex_company\ex_Daily_Files\
SET bakEnd=\\ex_database\ex_company\ex_Daily_Files\PatientExport\
REM _________________________________________________________________________________________________________
REM 

REM Creates the variable lines to shorten the SFTP file upload.
REM Example usage --> %transferStart%ourFile.txt %transferEnd%TheirFile.txt%e%

SET upload=winscp.exe /console /command "option confirm off" "open sftp://user:pass@ftp.ex_company.com" "cd /To_ex_company/" "put \\ex_database\ex_company\ex_Daily_Files\
REM _________________________________________________________________________________________________________
REM 

REM Backing up files. 
%bakStart%PatientExport*.txt %bakEnd%PatientExport%time%.bak
%bakStart%PatientGapsExport*.txt %bakEnd%PatientGapsExport%time%.bak
REM _________________________________________________________________________________________________________
REM 

REM Uploading files to ex_company.
%upload%PatientExport*.txt%e%
%upload%PatientGapsExport*.txt%e%



REM ---------------------------------------------------------------------------------------------------------
REM Script end.
REM ---------------------------------------------------------------------------------------------------------
REM PROGRAM END. 
