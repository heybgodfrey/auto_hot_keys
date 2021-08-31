#SingleInstance force
#NoTrayIcon
DetectHiddenWindows, On 
SetTitleMatchMode, 2
SetTitleMatchMode, Slow

; Begin variables

reportCounter=0

IfNotExist, %A_ScriptDir%\reports\archives\
   FileCreateDir, %A_ScriptDir%\reports\archives\

errorIni = %A_ScriptDir%\reports\errorLog.ini
mainIni=%A_scriptdir%\settings.ini
INI=%A_scriptdir%\reports\settings.ini
chINI = %A_ScriptDir%\reports\CHreport.ini
textFilesLoc = %A_ScriptDir%\text_files

T = %A_Now% 
T -= 1970,s

IniRead, clientName, %mainIni%, clientName, KEY1
if (clientName = "ERROR")
ReportError(Client Name INI,Empty INI,The results of the rep name from the settings file is empty Check the settings ini in the main script folder to see if it has been set)

IniRead, clientSkill, %mainIni%, clientSkill, KEY1
if (clientSkill = "ERROR")
ReportError(Client Skill INI,Empty INI,The results of the rep skill level from the settings file is empty Check the settings ini in the main script folder to see if it has been set)

IniRead, Team, %mainIni%, clientTeam, KEY1

IniRead, TotalHotkeys, %ini%, completeTotal, Total
if (TotakHotkeys = "ERROR")
ReportError(Total Hotkeys Result,Empty Ini,The results of TotalHotkeys from completeTotal/Total is empty Check to see if the Reports/Settings ini file is receiving values from the script)

processList = branding,content,dd,bands,sports,greek,offensive,celebs,disney,collegeyes,collegeno,videogames,watermark,designhelp,designlink,rotate,uploadhelp,uploadwhite,whitefix,filetypes,dpi,combinedesigns,combinecolors,combinestyles,inkchange,redraw,designteam,cs,pms,pmsdigital,sleevehelp,ssa,spvsdig,embroidery,subtleblank,subtleink,vss,up,pps,quoteonly,quotespec,quotebulk,quotesingles,bulkperks,singlesperks,pricehelp,sleeveprice,ap,callforyou,emailforyou,heydesign,heypricing,me,ooo,budget,byeorder,close,allshipping,standard,cr,rush,sr,worldwide,AltZ,gof,gofprice,gofdesign,gofcancel,gofsetup,orderdone,orderdonelink,vouchercode,pers,checkinfo,poinfo,vsslink,halftoneslink,printlink,contentno,peml,gofquote,tracking,followup,preship,ready,pending,followfix,followdesign,followquote,followorder,delivered,canadablanks,koozies,glasses,magnets,stickers,cups,mousepads,colormax,mugs,paper,pens,bottles,probphoto,probreturn,booster,minimum,canadasingles,designsaved,retrieve,rotateclipart,pq1,pq2,pq3,pq4,quoteperks,singlesperks,highprice,logistics,hold,precontact,preaddress,preshipping,preconfirm,presingles,cancelorder,help,chatforyou,cust,quote,probreview,probsizing,swappackage,probtones,probhelp,WinZ,WinS,WinW,AltL,WinN,WinH,WinB,AltShiftT,AltShiftC,AltShiftO,offsitecomm,AltShiftP,AltShiftS,WinQ,WinU,WinP,AltM,AltW,CtrlAltC,peml,voucher,probfull,sample,confirmfix,crookedphoto,crookedreport,ghosting,partial,hidesign,createdesign,hihelp,hiquote,AltC,AltD,AltA,hidelivery,AltB,AltG,AltV,AltX,designing,checking,email,transcript,dpibulk,dpisingles

timeTotals = morningTotal,afternoonTotal,eveningTotal

processUrl = clientName/1539012880,Location/2098811938,clientSkill/790489768,Team/1867021042,TotalHotkeys/1068444422,runmorningTotal/544298230,runafternoonTotal/122049253,runeveningTotal/1350770881,branding/723222126,content/1257910788,dd/708953065,bands/1140045285,sports/1423668679,greek/1047666672,offensive/698532430,celebs/857335304,disney/53203645,collegeyes/1501487490,collegeno/642096772,videogames/355041016,watermark/118033806,designhelp/889056035,designlink/851809281,rotate/604943355,uploadhelp/815063566,uploadwhite/1934508875,whitefix/682933627,filetypes/1647513703,dpi/1835464463,combinedesigns/2045185381,combinecolors/610027120,combinestyles/1602760496,inkchange/90601138,redraw/1159328356,designteam/18420121,cs/104629266,pms/1276060691,pmsdigital/1779448695,sleevehelp/1954131341,ssa/1169101341,spvsdig/1923364024,embroidery/236019304,subtleblank/1317980234,subtleink/849835408,vss/621339649,up/1977488524,pps/936611671,quoteonly/344346477,quotespec/1086846171,quotebulk/371862048,quotesingles/1722463144,bulkperks/310195759,singlesperks/691261123,pricehelp/926475631,sleeveprice/371292201,ap/168433243,callforyou/679444579,emailforyou/108248396,heydesign/233839568,heypricing/1252638807,me/2144667599,ooo/493450741,budget/1235091162,byeorder/1114179295,close/1663935697,allshipping/179510544,standard/2021617548,cr/2051685603,rush/375886411,sr/478684195,CH01Command/1309536169,CH01Total/1473574443,CH02Command/2734787,CH02Total/256347867,CH03Command/956627514,CH03Total/1551707449,CH04Command/272892141,CH04Total/627048279,CH05Command/817393949,CH05Total/713236437,CH06Command/1692085576,CH06Total/356609878,CH07Command/1404093888,CH07Total/1145150048,CH08Command/112626929,CH08Total/1488752894,CH09Command/746527654,CH09Total/1653320558,CH10Command/1510296805,CH10Total/1648610378


begURL = https://docs.google.com/forms/d/e/1FAIpQLSfl378Z7iGeeolHlVyJkJacZOor2-Tmx6NxuGY47Hyma-6BtA/viewform? ; This is the prefix for the form that we're adding these values to. If the form itself is copied to a different location, the area between /d/e/****/viewform? will need to be updated from the new form URL.

; End variables

; ================================================

; Begin actions

;TrayTip, Report Generating, Your AHK report is being generated... ; Generate traytip to notify user.

; Determine location from computer clock time

T1 := A_Now
T2 := A_NowUTC
EnvSub, T1, %T2%, M
TZD := Round( T1/60, 2 )

if (TZD = "-4.00")
{
location = Fairfax
}
else if (TZD = "-5.00")
{
location = Dallas
}
else if (TZD = "-8.00")
{
location = Reno
}

Try ; Saved Values for Process List
{
	Loop, parse, processList, `,
	{
	IniRead, %A_LoopField%, %ini%, %A_LoopField%, Total
	if (%A_LoopField% = "ERROR")
	%A_LoopField% = 0
	}
} catch e
{
ReportError(Saved Values for Process List,Loop Error,%e%)
}

runmorningTotal=0
runafternoonTotal=0
runeveningTotal=0
	
		Loop, parse, processList, `,
		{
			reviewing = %A_LoopField%
			Loop, parse, timeTotals, `,
			{
				IniRead, thisTotal, %ini%, %reviewing%, %A_LoopField%
				if (thisTotal = "ERROR")
				thisTotal = 0
				addto = run%A_LoopField%
				addTo := %addto% + thisTotal
				run%A_LoopField% := addTo
				finishto := run%A_LoopField%
			}
		}
	
		Loop, parse, processUrl, `,
		{
			Loop, parse, A_LoopField, /
			{
				if (A_Index = 1)
				{
				lastBuild := %A_LoopField%
				lastBuild = %lastBuild%&
				}
				else
				{
				firstBuild = entry.%A_LoopField%=
				combineBuild = %firstBuild%%lastBuild%
					if (url = "")
					url := combineBuild
					else
					url = %url%%combineBuild%
				}
			}
		}
		
url = %begUrl%%url%

StringReplace, url, url, ERROR`%2DERROR, ERROR, All
StringReplace, url, url, ERROR, NA, All

StringTrimRight, url, url, 1 ; removing additional & character from URL
clipboard = %url%
GoSub, StartCom
Return

StartCom:

IE := ComObjCreate("InternetExplorer.Application")
IE.Visible := false

IE.Navigate(url)
While IE.busy
Sleep 3000

IE.document.getElementsByClassName("quantumWizButtonPaperbuttonEl quantumWizButtonPaperbuttonFlat quantumWizButtonPaperbuttonDark quantumWizButtonPaperbutton2El2 freebirdFormviewerViewNavigationSubmitButton")[0].click()

sleep 2000	

;if(IE := GetActiveExplorer())
;finalURL := IE.LocationURL 

;ifInString, finalURL, formResponse
;{
reportCounter=0
IE.quit
FileDelete, %A_ScriptDir%\reports\settings.ini
if (ErrorLevel != 0)
ReportError(Delete Settings ini From Report Folder,File Delete Error,This file was unable to be deleted from the Reports folder)
;}
;else
;{
;reportCounter++
	;if (reportCounter > 2) ; Report has tried to submit more than 3 times without success.
	;{
	; Archive the stats and inform the rep to contact AutoHotkeys@customink.com for support.
	;Msgbox, 4112, Reporting Error, First There has been an error with the automatic reporting for your AHK script. Please contact autohotkeys@customink.com for further assistance with this matter.
	;FileCopy, %A_ScriptDir%\reports\settings.ini, %A_ScriptDir%\reports\archives\%A_YYYY%%A_MM%%A_DD%_%A_Hour%%A_Min%_settings.ini
;if (ErrorLevel != 0)
;ReportError(Copy Report To Archives,File Copy Error,This file was unable to be copied to the Archives)
;FileDelete, %A_ScriptDir%\reports\settings.ini
;if (ErrorLevel != 0)
;ReportError(Delete Settings ini From Report Folder,File Delete Error,This file was unable to be deleted ;from the Reports folder)
	;ExitApp
	;Return	
	;}
	;else
	;{


IniWrite, %T%, %ini%, lastReport, Time
if (ErrorLevel = 1)
ReportError(Write Current Time to Settings,INI Write Error,The lastReport variable was unable to be set)

; Begin Custom Hotkey Reporting

url=

begCHurl = https://docs.google.com/forms/d/e/1FAIpQLSeIY9xFlnV2iogXVBmDCpAcs2VbqqPorIXZgCtMnpiBqMoxCg/viewform?

IniRead, CH01Command, %mainIni%, custHotkey01, KEY2
IniRead, CH02Command, %mainIni%, custHotkey02, KEY2
IniRead, CH03Command, %mainIni%, custHotkey03, KEY2
IniRead, CH04Command, %mainIni%, custHotkey04, KEY2
IniRead, CH05Command, %mainIni%, custHotkey05, KEY2
IniRead, CH06Command, %mainIni%, custHotkey06, KEY2
IniRead, CH07Command, %mainIni%, custHotkey07, KEY2
IniRead, CH08Command, %mainIni%, custHotkey08, KEY2
IniRead, CH09Command, %mainIni%, custHotkey09, KEY2
IniRead, CH10Command, %mainIni%, custHotkey10, KEY2

StringReplace, CH01Command, CH01Command, #,,All
StringReplace, CH02Command, CH02Command, #,,All
StringReplace, CH03Command, CH03Command, #,,All
StringReplace, CH04Command, CH04Command, #,,All
StringReplace, CH05Command, CH05Command, #,,All
StringReplace, CH06Command, CH06Command, #,,All
StringReplace, CH07Command, CH07Command, #,,All
StringReplace, CH08Command, CH08Command, #,,All
StringReplace, CH09Command, CH09Command, #,,All
StringReplace, CH10Command, CH10Command, #,,All

IniRead, CH01Total, %chINI%, custHotkey01, Total
if (CH01Total = "ERROR")
CH01Total = 0
IniRead, CH02Total, %chINI%, custHotkey02, Total
if (CH02Total = "ERROR")
CH02Total = 0
IniRead, CH03Total, %chINI%, custHotkey03, Total
if (CH03Total = "ERROR")
CH03Total = 0
IniRead, CH04Total, %chINI%, custHotkey04, Total
if (CH04Total = "ERROR")
CH04Total = 0
IniRead, CH05Total, %chINI%, custHotkey05, Total
if (CH05Total = "ERROR")
CH05Total = 0
IniRead, CH06Total, %chINI%, custHotkey06, Total
if (CH06Total = "ERROR")
CH06Total = 0
IniRead, CH07Total, %chINI%, custHotkey07, Total
if (CH07Total = "ERROR")
CH07Total = 0
IniRead, CH08Total, %chINI%, custHotkey08, Total
if (CH08Total = "ERROR")
CH08Total = 0
IniRead, CH09Total, %chINI%, custHotkey09, Total
if (CH09Total = "ERROR")
CH09Total = 0
IniRead, CH10Total, %chINI%, custHotkey10, Total
if (CH10Total = "ERROR")
CH10Total = 0

FileRead, CH01Combine, %textFilesLoc%\custHotkey01.txt
FileRead, CH02Combine, %textFilesLoc%\custHotkey02.txt
FileRead, CH03Combine, %textFilesLoc%\custHotkey03.txt
FileRead, CH04Combine, %textFilesLoc%\custHotkey04.txt
FileRead, CH05Combine, %textFilesLoc%\custHotkey05.txt
FileRead, CH06Combine, %textFilesLoc%\custHotkey06.txt
FileRead, CH07Combine, %textFilesLoc%\custHotkey07.txt
FileRead, CH08Combine, %textFilesLoc%\custHotkey08.txt
FileRead, CH09Combine, %textFilesLoc%\custHotkey09.txt
FileRead, CH10Combine, %textFilesLoc%\custHotkey10.txt

CH01Command = %CH01Command%-%CH01Combine%
CH02Command = %CH02Command%-%CH02Combine%
CH03Command = %CH03Command%-%CH03Combine%
CH04Command = %CH04Command%-%CH04Combine%
CH05Command = %CH05Command%-%CH05Combine%
CH06Command = %CH06Command%-%CH06Combine%
CH07Command = %CH07Command%-%CH07Combine%
CH08Command = %CH08Command%-%CH08Combine%
CH09Command = %CH09Command%-%CH09Combine%
CH10Command = %CH10Command%-%CH10Combine%

CH01Command := uriEncode(CH01Command)
CH02Command := uriEncode(CH02Command)
CH03Command := uriEncode(CH03Command)
CH04Command := uriEncode(CH04Command)
CH05Command := uriEncode(CH05Command)
CH06Command := uriEncode(CH06Command)
CH07Command := uriEncode(CH07Command)
CH08Command := uriEncode(CH08Command)
CH09Command := uriEncode(CH09Command)
CH10Command := uriEncode(CH10Command)


; Because the variables are being passed through the URL, we need to ensure that the maximum URL character amount of 2083 is not met. Therefore, we will limit collection of hotkey command/text to 150 characters total. The script below will trim these strings to 150 or less characters. If they are already less than 150 characters, they will not be touched.

StringLen, CH01Count, CH01Command
if (CH01Count > 80)
{
	TrimResult := CH01Count - 80
	StringTrimRight, CH01Command, CH01Command, %TrimResult%
}

StringLen, CH02Count, CH02Command
if (CH02Count > 80)
{
	TrimResult := CH02Count - 80
	StringTrimRight, CH02Command, CH02Command, %TrimResult%
	StringLen, CH02Again, CH02Command
}


StringLen, CH03Count, CH03Command
if (CH03Count > 80)
{
	TrimResult := CH03Count - 80
	StringTrimRight, CH03Command, CH03Command, %TrimResult%
}


StringLen, CH04Count, CH04Command
if (CH04Count > 80)
{
	TrimResult := CH04Count - 80
	StringTrimRight, CH04Command, CH04Command, %TrimResult%
}

StringLen, CH05Count, CH05Command
if (CH05Count > 80)
{
	TrimResult := CH05Count - 80
	StringTrimRight, CH05Command, CH05Command, %TrimResult%
}

StringLen, CH06Count, CH06Command
if (CH06Count > 80)
{
	TrimResult := CH06Count - 80
	StringTrimRight, CH06Command, CH06Command, %TrimResult%
}


StringLen, CH07Count, CH07CCommand
if (CH07Count > 80)
{
	TrimResult := CH07Count - 80
	StringTrimRight, CH07Command, CH07Command, %TrimResult%
}


StringLen, CH08Count, CH08Command
if (CH08Count > 80)
{
	TrimResult := CH08Count - 80
	StringTrimRight, CH08Command, CH08Command, %TrimResult%
}

StringLen, CH09Count, CH09Command
if (CH09Count > 80)
{
	TrimResult := CH09Count - 80
	StringTrimRight, CH09Command, CH09Command, %TrimResult%
}

StringLen, CH10Count, CH10Command
if (CH10Count > 80)
{
	TrimResult := CH10Count - 80
	StringTrimRight, CH10Command, CH10Command, %TrimResult%
}

chURL = clientName/1534566672,Location/1584596807,CH01Command/1015559563,CH01Total/596163780,CH02Command/1853271648,CH02Total/1137771021,CH03Command/541284839,CH03Total/944700375,CH04Command/1291783188,CH04Total/778343916,CH05Command/395649096,CH05Total/1206619073,CH06Command/1136106907,CH06Total/555850849,CH07Command/1822009226,CH07Total/2018598190,CH08Command/822099442,CH08Total/1524046869,CH09Command/42161573,CH09Total/430308738,CH10Command/981872448,CH10Total/1289063135

Loop, parse, chURL, `,
		{
			Loop, parse, A_LoopField, /
			{
				if (A_Index = 1)
				{
				lastBuild := %A_LoopField%
				lastBuild = %lastBuild%&
				}
				else
				{
				firstBuild = entry.%A_LoopField%=
				combineBuild = %firstBuild%%lastBuild%
					if (url = "")
					url := combineBuild
					else
					url = %url%%combineBuild%
				}
			}
		}
		
url = %begCHUrl%%url%

StringReplace, url, url, ERROR`%2DERROR, ERROR, All
StringReplace, url, url, ERROR, NA, All
StringReplace, url, url, `%D`%, `%20, All ; Removing formatting as it negatively affects URL
StringReplace, url, url, `%23, `%23, All ; Removing # as it negatively affects URL
StringReplace, url, url, `%&entry,&entry, All ; removing trailing ampersand
StringReplace, url, url, `%2&entry,2&entry, All ; removing trailing ampersand and 2

clipboard := url

StringTrimRight, url, url, 1 ; removing additional & character from URL
clipboard = %url%
GoSub, StartCHCom
Return


StartCHCom:

IE := ComObjCreate("InternetExplorer.Application")
IE.Visible := false

sleep 5000

IE.Navigate(url)
While IE.busy
Sleep 3000

BlockInput, On
IE.document.getElementsByClassName("quantumWizButtonPaperbuttonEl quantumWizButtonPaperbuttonFlat quantumWizButtonPaperbuttonDark quantumWizButtonPaperbutton2El2 freebirdFormviewerViewNavigationSubmitButton")[0].click()
BlockInput, Off
sleep 2000	


reportCounter=0
IE.quit
FileDelete, %A_ScriptDir%\reports\CHreport.ini
if (ErrorLevel != 0)
ReportError(Delete Settings ini From Report Folder,File Delete Error,This file was unable to be deleted from the Reports folder)

sleep 3000

ExitApp
Return

ReportError(theArea,ErrorType,theMessage)
{
FileAppend,
(

Error Location: repTimer.ahk
Error Type: %ErrorType%
Error Message: %theMessage%
Error Date: %A_Hour%:%A_Min% %A_MM%/%A_DD%/%A_YYYY%

), %errorIni%

}

GetActiveExplorer() { ; Gets the active IE or Explorer window
    WinHWND := WinActive("A")
    for win in ComObjCreate("Shell.Application").Windows
        if (win.HWND = WinHWND)
            return win
    return 0
}

uriEncode(str) {

   f = %A_FormatInteger%

   SetFormat, Integer, Hex

   If RegExMatch(str, "^\w+:/{0,2}", pr)

      StringTrimLeft, str, str, StrLen(pr)

   StringReplace, str, str, `%, `%25, All

   Loop

      If RegExMatch(str, "i)[^\w\.~%/:]", char)

         StringReplace, str, str, %char%, % "%" . SubStr(Asc(char),3), All

      Else Break

   SetFormat, Integer, %f%

   Return, pr . str

}

