#Persistent
#NoTrayIcon
DetectHiddenWindows, On
SetTitleMatchmode, 2
SetTitleMatchMode, Slow
INI=%A_scriptdir%\reports\settings.ini

; This will generate the automatic reporting once a week. Checking current time against a timestamp stores in the reports folder.

T = %A_Now% 
T -= 1970,s

IniRead, lastReport, %ini%, lastReport, Time
if (lastReport = "ERROR") ; There's no date set in the settings.ini file, need to set a date.
IniWrite, %T%, %ini%, lastReport, Time

SetTimer, CheckReport, 3600000
Return


CheckReport:
T = %A_Now% 
T -= 1970,s

INI=%A_scriptdir%\reports\settings.ini

result := t - lastReport

if (result > 603800)
{
Run, %A_ScriptDir%\repTimer.ahk
Sleep 20000
Reload
}

Return
