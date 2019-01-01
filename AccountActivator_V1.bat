@echo off

rem (c) Luca Franziskowski 2019. All rights reserved.
rem Download the .exe File from batchsoftware.de for free.
rem Thank you :)
rem Version 1.0_Github_Edition

color 71
:restart
cls
title Account_Activator
echo    Account_Activator V01
echo ---------------------------------
echo Current User: %username%
echo ---------------------------------
echo by (c) Luca Franziskowski. 2019
echo Visit batchsoftware.de for more.
echo  _______________________________
echo [1: Activate Administrator      ]
echo [2: Deactivate Administrator    ]
echo [3: Change Password from Admin  ]
echo  _______________________________
echo [4: Change User-Password        ]
echo [5: Add new user                ]
echo [6: Delete a user               ]
echo [7: Display all accounts        ]
echo.
choice/c 1234567 >nul
if errorlevel==7 goto display
if errorlevel==6 goto delete
if errorlevel==5 goto adduser
if errorlevel==4 goto changeuser
if errorlevel==3 goto changepass
if errorlevel==2 goto deaktivate
if errorlevel==1 goto activate
goto restart

:display
cls
echo * Accounts: *
echo.
net user
pause
goto restart


:delete
cls
echo Delete a Account
echo -----------------
set/p user=Account-Name: 
net user %user% /delete
set m=User %user% was deleted.
goto message

:adduser
cls
echo Add a Account 
echo -----------------
set/p user=New username: 
set/p pass=password: 
net user %user% %pass% /add
set m=User %user% was added.
goto message

:deaktivate
cls
echo Deaktivating...
net user Administrator /active:no
set m=Administrator account inactive.
goto message

:activate
cls
echo Activating...
net user Administrator /active:yes
set m=Administrator account active.
goto message

:changepass
cls
echo Change the Admin Password
echo -------------------------
set/p pass=New password: 
net user Administrator %pass%
set m=New password was set.
goto message

:changeuser
cls
echo Change the user password
echo -------------------------
set/p pass=New password: 
net user %username% %pass%
set m=New password was set.
goto message


:message
if exist %temp%\msg.vbs del %temp%\msg.vbs 
echo wscript.echo("%m%") >%temp%\msg.vbs
start %temp%\msg.vbs
goto restart

