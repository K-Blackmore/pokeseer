@echo off
:set_auth
Set /P _auth=Please enter auth account type ( 'google' or 'ptc' ): || Set _auth=nothingchosen
if "%_auth%"=="nothingchosen" (
	Echo Auth account type required.
        goto set_auth
	)
if "%_auth%"=="google" (
	goto set_user
	)
if "%_auth%"=="ptc" (
	goto set_user
	) else (
        	echo "incorrect value"
		goto set_auth
		)

:set_user
Set /P _user=Please enter account username: || Set _user=nothingchosen
if "%_user%"=="nothingchosen" (
	Echo Account username required
	goto set_user
	) else (
		goto set_pass
		)

:set_pass
Set /P _pass=Please enter account password: || Set _pass=nothingchosen
if "%_pass%"=="nothingchosen" (
	Echo Password required
	goto set_pass
	) else (
		goto set_step
		)

:set_step
Set /P _step="Please enter amount of steps to be scanned. Steps are the amount of radial scanned around selected position. recommend values between 3 and 5: " || set _step=nothingchosen
if "%_step%"=="nothingchosen" (
	Echo No value was entered.
	goto set_step
	) else (
		goto set_api
		)

:set_api
Set /P _api="please enter your Google API key: " || set _api=nothingchosen
if "%_api%"=="nothingchosen" (
	Echo Nothing was entered.
	goto set_api
	) else (
		goto set_loc
		)

:set_loc
Set /P _loc="please enter your location: " || set _loc=nothingchosen
if "%_loc%"=="nothingchosen" (
	Echo Nothing was entered.
	goto set_loc
	) else (
		goto print
		)

:print
cls
Echo Great! Configuration complete. you can run the server by running run.bat or using the following command:
Echo python runserver.py -a %_auth% -u %_user% -p %_pass% -st %_step% -k %_api% -l "%_loc%"
(
	Echo @echo off
	Echo start "" http://localhost:5000
	Echo python runserver.py -a %_auth% -u %_user% -p %_pass% -st %_step% -k %_api% -l "%_loc%"
) >run.bat
Set /P _run="Would you like to run the server now? [y/n]"
if "%_run%"=="y" (
	call run.bat
	) else (
		pause
		)