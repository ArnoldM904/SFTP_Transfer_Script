@echo off
color 0b
title Automated ABC File Transfer
cls

REM !! Attention !! All sensitive information here has been modified to be purely educational and you will need to change information to your own for this script to work. For questions or comments please see the contact information below.

REM Script info
REM Script purpose (1 of 2): To backup files from fileSystemA into a different backup folder in fileSystemA
REM Script purpose (2 of 2): To transfer files from ABC's SFTP server to our network (more specifically fileSystemA)
REM Created: 9/16/2013
REM Last updated: 9/16/2013
REM Creator: Michael Arnold
REM Contact: marnold904@gmail.net

REM Script start.
REM ---------------------------------------------------------------------------------------------------------

REM Creates the variable lines used to shorten backing up files.
REM Example usage --> %backupStart%ImportantFile.txt %backupEnd%ImportantFile.bak

SET backupStart=move \\fl-jax-fileSystemA\ABC_BK\FromABC\
SET backupEnd=\\fl-jax-fileSystemA\ABC_BK\FromABC\Backups\

REM ---------------------------------------------------------------------------------------------------------

REM Creates the variable lines to shorten the SFTP file transfer.
REM Example usage --> %transferStart%TheirFile.txt %transferEnd%OurFile.txt%e%

SET transferStart=winscp.exe /console /command "option confirm off" "open sftp://username:password@ftp.abc.com" "cd /FromABC/" "get
SET transferEnd=\\fl-jax-fileSystemA\ABC_BK\FromABC\
SET e=" "exit"
REM ---------------------------------------------------------------------------------------------------------
REM Backing up files.

%backupStart%GapExport.txt %backupEnd%GapExport.bak
%backupStart%GapRef.txt %backupEnd%GapRef.bak
%backupStart%PatientExport.txt %backupEnd%PatientExport.bak
%backupStart%ProvExport.txt %backupEnd%ProvExport.bak
%backupStart%ProvLocExport.txt %backupEnd%ProvLocExport.bak

REM ---------------------------------------------------------------------------------------------------------

REM Transferring new files to our current files.

%transferStart%GapExport.txt %transferEnd%GapExport.txt%e%
%transferStart%GapRef.txt %transferEnd%eGapRef.txt%e%
%transferStart%PatientExport.txt %transferEnd%PatientExport.txt%e%
%transferStart%ProvExport.txt %transferEnd%ProvExport.txt%e%
%transferStart%ProvLocExport.txt %transferEnd%ProvLocExport.txt%e%

REM ---------------------------------------------------------------------------------------------------------

REM Script end.
