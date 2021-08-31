#SingleInstance force

; AHK Setup

#Include  %A_ScriptDir%
INI=%A_scriptdir%\settings.ini

IniRead, showFull, %ini%, clientName, KEY1
IniRead, showNick, %ini%, clientNick, KEY1
IniRead, showEmail, %ini%, clientEmail, KEY1
IniRead, showSkill, %ini%, clientSkill, KEY1

checkError := "ERROR"


  IfNotExist, %INI%
{
gosub, SetupMenu
Return
}

IfExist, %INI%
{
if (showFull = checkError)
{
gosub, SetupMenu
Return
}
else if (showNick = checkError)
{
gosub, SetupMenu
Return
}
else if (showEmail = checkError)
{
gosub, SetupMenu
Return
}
else if (showSkill = checkError)
{
gosub, SetupMenu
Return
}
else
{
gosub, CustomHotkeys
Return
}
}



SetupMenu:
height = 500
GuiWidth = 600

Gui, theMenu:Add, Picture, w180 h-1 vLogo, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theMenu:Color, FFFFFF
Gui, theMenu:Font, S26, w700
Gui, theMenu:Add, Text, center x20 y149 w550, Welcome! Let's get your AutoHotkey script setup.
Gui, theMenu:Font, S14, w700
Gui, theMenu:Add, Text, center x12 y259 w570, Let's start with your name. This should match your name associated with your CustomInk profile.
Gui, theMenu:Font, S10, w700
Gui, theMenu:Add, Button, center ym-10 x230 y430 w140 h30 Default gOutputVar, Continue
GuiControl, theMenu:Move, Logo, x210
Gui, theMenu:Font, S13, w700
Gui, theMenu:Add, Edit, x80 y360 w440 h40 -VScroll -E0x200 -WantReturn hwndHEdit2 Center vFullName, %FullName% 
Gui, theMenu:Font, S12, w700
Gui, theMenu:Add, Text, center x80 y330 w440, *Enter Your Full Name*
Gui, theMenu:Show, xCenter yCenter h%height% w%GuiWidth%, AutoHotkey Setup - Full Name
Edit_VCENTER(HEdit2)
Gui, theNick:destroy
GuiControl, theMenu:Focus, FullName

return


Edit_VCENTER(HEDIT) { ; The Edit control must have the ES_MULTILINE style (0x0004 \ +Multi)!
   ; EM_GETRECT := 0x00B2 <- msdn.microsoft.com/en-us/library/bb761596(v=vs.85).aspx
   ; EM_SETRECT := 0x00B3 <- msdn.microsoft.com/en-us/library/bb761657(v=vs.85).aspx
   VarSetCapacity(RC, 16, 0)
   DllCall("User32.dll\GetClientRect", "Ptr", HEDIT, "Ptr", &RC)
   CLHeight := NumGet(RC, 12, "Int")
   SendMessage, 0x0031, 0, 0, , ahk_id %HEDIT% ; WM_GETFONT
   HFONT := ErrorLevel
   HDC := DllCall("GetDC", "Ptr", HEDIT, "UPtr")
   DllCall("SelectObject", "Ptr", HDC, "Ptr", HFONT)
   VarSetCapacity(RC, 16, 0)
   DTH := DllCall("DrawText", "Ptr", HDC, "Str", "W", "Int", 1, "Ptr", &RC, "UInt", 0x2400)
   DllCall("ReleaseDC", "Ptr", HEDIT, "Ptr", HDC)
   SendMessage, 0x00BA, 0, 0, , ahk_id %HEDIT% ; EM_GETLINECOUNT
   TXHeight := DTH * ErrorLevel
   If (TXHeight > CLHeight)
      Return False
   VarSetCapacity(RC, 16, 0)
   SendMessage, 0x00B2, 0, &RC, , ahk_id %HEDIT%
   DY := (CLHeight - TXHeight) // 2
   NumPut(DY, RC, 4, "Int")
   NumPut(TXHeight + DY, RC, 12, "Int")
   SendMessage, 0x00B3, 0, &RC, , ahk_id %HEDIT%
}

OutputVar:
GuiControl, disable, OutputVar
Gui, Submit, NoHide

; create a list of your edit control vars
emptyfields = FullName
loop, parse, emptyfields, `,, %A_Space% 				; loop through the list
{
	GuiControlGet, OutputVar, Enabled, %A_LoopField%
		If !(%A_LoopField%) && OutputVar ; if the value of the variable whose name is saved in A_LoopField is empty and is enabled
		{
			if A_LoopField = FullName
			{
			required = Your Full Name
			}
			
			MsgBox A required field is empty: %required%	; show error message
			GuiControl, enable, OutputVar
			return						; stop
		}
}
;~ ; if you're here then all vars are not empty

gosub, SetupNick
Return

SetupNick:
WinGetPos, Xpos, Ypos
height = 500
GuiWidth = 600

Gui, theNick:Add, Picture, w180 h-1 vLogo, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theNick:Color, FFFFFF
Gui, theNick:Font, S26, w700
Gui, theNick:Add, Text, center x20 y149 w550, Thanks, %FullName%!
Gui, theNick:Font, S14, w700
Gui, theNick:Add, Text, center x20 y219 w550, Now, let's enter the first name you'd like to use that will be displayed to customers. (Ex: If you prefer Dave instead of David, enter it here.) 
Gui, theNick:Font, S10, w700
Gui, theNick:Add, Button, center ym-10 x150 y430 w140 h30 Default gSetupMenu, Go Back
Gui, theNick:Add, Button, center ym-10 x300 y430 w140 h30 Default gOutputNick, Continue
GuiControl, theNick:Move, Logo, x210
Gui, theNick:Font, S13, w700
Gui, theNick:Add, Edit, x80 y360 w440 h40 -VScroll -E0x200 -WantReturn hwndHEdit2 Center vNickName, %NickName% 
Gui, theNick:Font, S12, w700
Gui, theNick:Add, Text, center x80 y330 w440, *Enter Your First Name*
Gui, theNick:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, AutoHotkey Setup - First Name
Edit_VCENTER(HEdit2)

Gui, theSkill:destroy
Gui, theMenu:destroy
Gui, theEmail:destroy

GuiControl, theNick:Focus, NickName

Return

OutputNick:
GuiControl, disable, OutputNick
Gui, Submit, NoHide

; create a list of your edit control vars
emptyfields = NickName
loop, parse, emptyfields, `,, %A_Space% 				; loop through the list
{
	GuiControlGet, OutputNick, Enabled, %A_LoopField%
		If !(%A_LoopField%) && OutputNick ; if the value of the variable whose name is saved in A_LoopField is empty and is enabled
		{
			if A_LoopField = NickName
			{
			required = Your First Name
			}
			
			MsgBox A required field is empty: %required%	; show error message
			GuiControl, enable, OutputNick
			return						; stop
		}
}
;~ ; if you're here then all vars are not empty

gosub, SetupSkill
Return

SetupSkill:
WinGetPos, Xpos, Ypos
height = 500
GuiWidth = 600

Gui, theSkill:Add, Picture, w180 h-1 vLogo, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theSkill:Color, FFFFFF
Gui, theSkill:Font, S26, w700
Gui, theSkill:Add, Text, center x20 y149 w550, Great, thanks %NickName%!
Gui, theSkill:Font, S14, w700
Gui, theSkill:Add, Text, center x20 y219 w550, Now, let's select your skill level for the hotkeys. 
Gui, theSkill:Font, S10, w700
Gui, theSkill:Add, Button, center ym-10 x150 y430 w140 h30 Default gSetupNick vSetupNick, Go Back
Gui, theSkill:Add, Button, center ym-10 x300 y430 w140 h30 Default gOutputSkill vOutputSkill, Continue
Gui, theSkill:Font, S20, w700
GuiControl, theSkill:Move, Logo, x210
Gui, theSkill:Add, DropDownList, x222 y270 w155 h250 vSkill, Select One||Advanced|Core|Flex|Service|Lead
Gui, theSkill:Font, S12, w700
Gui, theSkill:Add, Text, center x80 y330 w440, *Select Your Skill Level*
Gui, theSkill:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, AutoHotkey Setup - Skill

Gui, theNick:destroy
Gui, theEmail:destroy

Return

OutputSkill:
GuiControl, disable, OutputSkill
GuiControl, disable, SetupNick
Gui, Submit, NoHide

; create a list of your edit control vars

;need to check to make sure that the e-mail address is correct and also includes CustomInk.com

emptyfields = Skill
loop, parse, emptyfields, `,, %A_Space% 				; loop through the list
{
	GuiControlGet, OutputEmail, Enabled, %A_LoopField%
		If !(%A_LoopField%) && OutputVar ; if the value of the variable whose name is saved in A_LoopField is empty and is enabled
		{
			if A_LoopField = Skill
			{
			required = Select a Skill
			}
			
			MsgBox A required field is empty: %required%	; show error message
			GuiControl, enable, OutputSkill
			GuiControl, enable, SetupNick
			return						; stop
		}
}

if (skill = "Select One")
{
MsgBox A required field is empty: Select a Skill	; show error message
			GuiControl, enable, OutputSkill
			GuiControl, enable, SetupNick
			return
}
;~ ; if you're here then all vars are not empty

gosub, SetupEmail
Return

SetupEmail:
WinGetPos, Xpos, Ypos
height = 500
GuiWidth = 600

Gui, theEmail:Add, Picture, w180 h-1 vLogo, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmail:Color, FFFFFF
Gui, theEmail:Font, S26, w700
Gui, theEmail:Add, Text, center x20 y149 w550, Ok, thanks again %NickName%!
Gui, theEmail:Font, S14, w700
Gui, theEmail:Add, Text, center x20 y219 w550, Finally, let's add your CustomInk e-mail address. This won't be for customers, just for internal use only. 
Gui, theEmail:Font, S10, w700
Gui, theEmail:Add, Button, center ym-10 x150 y430 w140 h30 Default gSetupSkill, Go Back
Gui, theEmail:Add, Button, center ym-10 x300 y430 w140 h30 Default gOutputEmail, Continue
GuiControl, theEmail:Move, Logo, x210
Gui, theEmail:Font, S13, w700
Gui, theEmail:Add, Edit, x80 y360 w440 h40 -VScroll -E0x200 -WantReturn hwndHEdit2 Center vEmail, %Email% 
Gui, theEmail:Font, S12, w700
Gui, theEmail:Add, Text, center x80 y330 w440, *Enter Your E-mail Address*
Gui, theEmail:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, AutoHotkey Setup - Email
Edit_VCENTER(HEdit2)
Gui, theSkill:destroy

GuiControl, theEmail:Focus, Email

Return

OutputEmail:
GuiControl, disable, OutputEmail
Gui, Submit, NoHide

; create a list of your edit control vars

;need to check to make sure that the e-mail address is correct and also includes CustomInk.com

emptyfields = Email
loop, parse, emptyfields, `,, %A_Space% 				; loop through the list
{
	GuiControlGet, OutputEmail, Enabled, %A_LoopField%
		If !(%A_LoopField%) && OutputVar ; if the value of the variable whose name is saved in A_LoopField is empty and is enabled
		{
			if A_LoopField = Email
			{
			required = Your CustomInk Email
			}
			
			MsgBox A required field is empty: %required%	; show error message
			GuiControl, enable, OutputEmail
			return						; stop
		}
}
;~ ; if you're here then all vars are not empty

FoundPos := RegExMatch(Email, "i)@customink")

if (FoundPos = 0)
{
MsgBox, E-mail Address must be from CustomInk
Return
}

FoundPos := RegExMatch(Email, "\.@")

if (FoundPos > 0)
{
MsgBox, Incorrect E-mail Syntax. There's no period allowed in front of the @ sign.
Return
}

gosub, ClientSetupFinish
Return

ClientSetupFinish:
; Creating the INI file.


	if (Skill = "Advanced")
	{
	NumSkill = 2
	}
	else if (Skill = "Core")
	{
	NumSkill = 4
	}
	else if (Skill = "Flex")
	{
	NumSkill = 1
	}
	else if (Skill = "Service")
	{
	NumSkill = 3
	}
	else if (Skill = "Lead")
	{
	NumSkill = 5
	}
		
    IniWrite, %FullName%, %ini%, clientName, KEY1
    IniWrite, %NickName%, %ini%, clientNick, KEY1
    IniWrite, %Email%, %ini%, clientEmail, KEY1
	IniWrite, %NumSkill%, %ini%, clientSkill, KEY1
	IniWrite, same, %ini%, targetSettings, KEY1
	
try
{
UrlDownloadToFile, https://drive.google.com/uc?export=download&id=0B13bYaJLlH0MaHZfOHNJT09jeGc, versions.ini
}
T = %A_Now% 

T -= 1970,s

DownloadINI=%A_scriptdir%\versions.ini

; IniRead, OutputVar, Filename, Section, Key [, Default]
IniRead, current_description, %DownloadINI%, description, KEY1 ; reading settings
IniRead, current_manual, %DownloadINI%, manual, KEY1 ; reading settings
IniRead, current_master, %DownloadINI%, master, KEY1 ; reading settings
IniRead, current_setup, %DownloadINI%, setup, KEY1 ; reading settings
IniRead, current_ups, %DownloadINI%, ups, KEY1 ; reading settings
IniRead, current_gen_comp_list, %DownloadINI%, gen_comp_list, KEY1 ; reading settings
IniRead, current_zip_checker, %DownloadINI%, zip_checker, KEY1 ; reading settings
IniRead, current_browser_check, %DownloadINI%, browser_check, KEY1 ; reading settings


	IniRead, showFull, %ini%, clientName, KEY1
	IniRead, showNick, %ini%, clientNick, KEY1
	IniRead, showEmail, %ini%, clientEmail, KEY1
	IniRead, showSkill, %ini%, clientSkill, KEY1
	
	closingFile = master.ahk ; Terminate this script if it's currently running.

	DetectHiddenWindows On
	SetTitleMatchMode RegEx
	IfWinExist, i)%closingFile%.* ahk_class AutoHotkey
		{
		WinClose
		WinWaitClose, i)%closingFile%.* ahk_class AutoHotkey, , 2
		}
		
	run, %A_ScriptDir%\master.ahk
	FileDelete, %DownloadINI%
	
	gosub, KeepGoing
Return

KeepGoing:
WinGetPos, Xpos, Ypos
if Xpos is space
{
Xpos = Center
Ypos = Center
}
height = 500
GuiWidth = 600

Gui, theChoice:Add, Picture, w180 h-1 vLogo, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChoice:Color, FFFFFF
Gui, theChoice:Font, S26, w700
Gui, theChoice:Add, Text, center x20 y149 w550, Basic Setup Complete!
Gui, theChoice:Font, S14, w700
Gui, theChoice:Add, Text, center x20 y219 w550, Thanks %showNick%, the basic setup has been completed. If you'd like to continue, we can setup custom hotkeys for you to use. You can also check out the tutorial if you're interested.
Gui, theChoice:Font, S10, w700
GuiControl, theChoice:Move, Logo, x210
Gui, theChoice:Add, Button, center ym-10 x85 y430 w140 h30 Default gGuiCloseLaunch, Exit
Gui, theChoice:Add, Button, center ym-10 x235 y430 w140 h30 Default gLaunchTutorial, Tutorial
Gui, theChoice:Add, Button, center ym-10 x410 y430 w140 h30 Default gCustomHotkeys, Continue
Gui, theChoice:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, AutoHotkey Setup - Basic Setup Complete

Gui, theEmail:destroy

Return

LaunchTutorial:
Gui, theChoice:destroy
run %A_ScriptDir%\manual.ahk
gosub, theChoiceGuiClose
Return

Feedback:
direction = http://goo.gl/forms/KJL6994N0q
Run, %BrowExe% %direction%
Gui, theChoice:destroy
Gui, theSettings:destroy
Gui, theSettings1:destroy
Gui, theHotkeyChoice:destroy
Gui, theFUDesign:destroy
Gui, theFUGeneral:destroy
Gui, theFUOrder:destroy
Gui, theFUQuote:destroy
Gui, openingHK:destroy
Gui, closingHK:destroy
Gui, theHeyDesign:destroy
Gui, theHeyPricing:destroy
Gui, theByeOrder:destroy
Gui, theGeneralClosing:destroy
Return


CustomHotkeys:
IniRead, showSettings, %ini%, targetSettings, KEY1
IniWrite, new, %ini%, targetSettings, KEY1

WinGetPos, Xpos, Ypos
if Xpos is space
{
Xpos = Center
Ypos = Center
}

IniRead, showFull, %ini%, customSetup, KEY1

height = 500
GuiWidth = 600

Gui, theCustom:Add, Picture, w180 h-1 vLogo, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theCustom:Add, Picture, w150 h-1 vSettings gSettings, %A_ScriptDir%\images\settings.jpg
Gui, theCustom:Add, Picture, w150 h-1 vCustom gCustom, %A_ScriptDir%\images\custom_hotkeys.jpg
Gui, theCustom:Add, Picture, w150 h-1 vSpelling gSpelling, %A_ScriptDir%\images\spelling.jpg
Gui, theCustom:Add, Picture, w140 h-1 vExit gGuiClose, %A_ScriptDir%\images\exit.jpg
Gui, theCustom:Color, FFFFFF
Gui, theCustom:Font, S26, w700
if (customSetup = complete)
{
Gui, theCustom:Add, Text, center CGray w550 vWb, Welcome Back, %showNick%!
Gui, theCustom:Font, S14, w700
Gui, theCustom:Add, Text, center CGray w550 vSelection, Make your selection below:
}
else
{
Gui, theCustom:Add, Text, center CGray x20 y129 w550, Setup Your Custom Hotkeys
}
GuiControl, theCustom:Move, Logo, x210
GuiControl, theCustom:Move, Custom, x230 y230
GuiControl, theCustom:Move, Settings, x50 y230
GuiControl, theCustom:Move, Spelling, x410 y230
GuiControl, theCustom:Move, Exit, x230 y430

GuiControl, theCustom:Move, Wb, x20 y139
GuiControl, theCustom:Move, Selection, x20 y179
Gui, theCustom:Font, S10, w700
Gui, theCustom:Add, Text, center y475 w570 x20 vFeedback gFeedback, Feedback

Gui, theCustom:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, AutoHotkey Setup Menu - Selection



Gui, theChoice:destroy
Gui, theSettings:destroy
Gui, theSettings1:destroy
Gui, theHotkeyChoice:destroy
Gui, theFUDesign:destroy
Gui, theFUGeneral:destroy
Gui, theFUOrder:destroy
Gui, theFUQuote:destroy
Gui, openingHK:destroy
Gui, closingHK:destroy
Gui, theHeyDesign:destroy
Gui, theHeyPricing:destroy
Gui, theByeOrder:destroy
Gui, theGeneralClosing:destroy
Gui, theCustomList:destroy
Gui, theCustomList2:destroy
Gui, userHotkeys01:destroy
Gui, userHotkeys02:destroy
Gui, userHotkeys03:destroy
Gui, userHotkeys04:destroy
Gui, userHotkeys05:destroy
Gui, userHotkeys06:destroy
Gui, userHotkeys07:destroy
Gui, userHotkeys08:destroy
Gui, userHotkeys09:destroy
Gui, userHotkeys10:destroy
Gui, theCustomChat:destroy
Gui, theCustomChat2:destroy
Gui, theAltN:destroy
Gui, theAltI:destroy
Gui, theAltH:destroy
Gui, theAltS:destroy
Gui, theAltX:destroy
Gui, theAltD:destroy
Gui, theAltG:destroy
Gui, theAltZ:destroy
Gui, theAltC:destroy
Gui, theAltB:destroy
Gui, theSuggestSpelling:destroy
Gui, theSpellingMenu:destroy
Gui, theSpellingList:destroy
Gui, theSpellingList2:destroy
Return

Logo:
gosub, CustomHotkeys
Return


Settings:
WinGetPos, Xpos, Ypos
if (Xpos = "")
{
Xpos := xValue
Ypos := yValue
}

IniRead, showTarget, %ini%, targetSettings, KEY1
IniRead, showSuggest, %ini%, suggestSettings, KEY1

height = 500
GuiWidth = 600
Gui, theSettings:Color, FFFFFF

Gui, theSettings:Add, Picture, w180 h-1 vLogo gLogo, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theSettings:Add, Picture, w140 h-1 vGoBack gCustomHotkeys, %A_ScriptDir%\images\go_back.jpg
Gui, theSettings:Add, Picture, w140 h-1 vExit gGuiClose, %A_ScriptDir%\images\exit.jpg

if ((showTarget = "same") || (showTarget = "ERROR"))
{
Gui, theSettings:Add, Picture, w117 h-1 vOff gtargetOff, %A_ScriptDir%\images\off.jpg
}
else if (showTarget = "new")
{
Gui, theSettings:Add, Picture, w117 h-1 vOn gtargetOn, %A_ScriptDir%\images\on.jpg
}

if ((showSuggest = "no") || (showSuggest = "ERROR"))
{
;Gui, theSettings:Add, Picture, w117 h-1 vsOff gsuggestOff, %A_ScriptDir%\images\off.jpg
}
else if (showSuggest = "yes")
{
;Gui, theSettings:Add, Picture, w117 h-1 vsOn gsuggestOn, %A_ScriptDir%\images\on.jpg
}

Gui, theSettings:Font, S26, w700
Gui, theSettings:Add, Text, center CGray w550 vWb, Edit Your AutoHotkey Settings:
Gui, theSettings:Font, S16, w700
Gui, theSettings:Add, Text, w300 CGray vtargetText, Launch websites in a new window instead of a new tab
; Gui, theSettings:Add, Text, w300 CGray vsuggestHotkeys, Suggest hotkey commands based on text
GuiControl, theSettings:Move, Logo, x210

if ((showTarget = "same") || (showTarget = "ERROR"))
{
GuiControl, theSettings:Move, Off, x425 y215
}
else if (showTarget = "new")
{
GuiControl, theSettings:Move, On, x425 y215
}

if ((showSuggest = "no") || (showSuggest = "ERROR"))
{
; GuiControl, theSettings:Move, sOff, x425 y305
}
else if (showSuggest = "yes")
{
; GuiControl, theSettings:Move, sOn, x425 y305
}
GuiControl, theSettings:Move, targetText, x85 y225
; GuiControl, theSettings:Move, suggestHotkeys, y320 x85
GuiControl, theSettings:Move, reloadWarning1, x45 y350
GuiControl, theSettings:Move, Wb, x20 y139
GuiControl, theSettings:Move, Selection, x20 y179
GuiControl, theSettings:Move, GoBack, x140 y430
GuiControl, theSettings:Move, Exit, x310 y430
Gui, theSettings:Font, S10, w700
Gui, theSettings:Add, Text, center y475 w570 x20 vFeedback gFeedback, Feedback
Gui, theSettings:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Edit AutoHotkey Settings

Gui, theChoice:destroy
Gui, theHeyDesign:destroy
Gui, openingHK:destroy
Gui, theCustom:destroy
Gui, theSettings1:destroy
Return

targetOff:
xValue := Xpos
yValue := Ypos
Gui, theSettings:destroy
IniWrite, new, %ini%, targetSettings, KEY1
send, !^+L
gosub, Settings
Return

targetOn:
xValue := Xpos
yValue := Ypos
Gui, theSettings:destroy
IniWrite, same, %ini%, targetSettings, KEY1
send, !^+L
gosub, Settings
Return

SuggestOff:
xValue := Xpos
yValue := Ypos
Gui, theSettings:destroy
IniWrite, yes, %ini%, suggestSettings, KEY1
send, !^+L
gosub, Settings
Return

SuggestOn:
xValue := Xpos
yValue := Ypos
Gui, theSettings:destroy
IniWrite, no, %ini%, suggestSettings, KEY1
closingFile = testfile.ahk ; Terminate this script if it's currently running.

	DetectHiddenWindows On
	SetTitleMatchMode RegEx
	IfWinExist, i)%closingFile%.* ahk_class AutoHotkey
		{
		WinClose
		WinWaitClose, i)%closingFile%.* ahk_class AutoHotkey, , 2
		}
send, !^+L
gosub, Settings
Return

Custom:
WinGetPos, Xpos, Ypos
IniRead, showSettings, %ini%, targetSettings, KEY1

height = 500
GuiWidth = 600

Gui, theHotkeyChoice:Color, FFFFFF

Gui, theHotkeyChoice:Add, Picture, w180 h-1 vLogo gLogo, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theHotkeyChoice:Add, Picture, w140 h-1 vExit gGuiClose, %A_ScriptDir%\images\exit.jpg
Gui, theHotkeyChoice:Add, Picture, w140 h-1 vGoBack gCustomHotkeys, %A_ScriptDir%\images\go_back.jpg
; Gui, theHotkeyChoice:Add, Picture, w50 h-1 vNew, %A_ScriptDir%\images\new.jpg
;Gui, theHotkeyChoice:Add, Picture, w50 h-1 vChatNew, %A_ScriptDir%\images\new.jpg
Gui, theHotkeyChoice:Font, S26, w700
Gui, theHotkeyChoice:Add, Text, center CGray x20 h50 w550 y129, Edit Your AutoHotkeys:
Gui, theHotkeyChoice:Font, S14, w700
Gui, theHotkeyChoice:Add, Text, center CGray x175 y+20 w250 gOpenHotkeys, Edit Opening Hotkeys
Gui, theHotkeyChoice:Add, Text, center CGray x175 y+20 w250 gClosingHotkeys, Edit Closing Hotkeys
Gui, theHotkeyChoice:Add, Text, center CGray x175 y+20 w250 gFollowUpHotkeys, Edit Follow Up Hotkeys
;Gui, theHotkeyChoice:Add, Text, center CGray x200 y+20 w200 gCustomChat, Edit Chat Hotkeys
;Gui, theHotkeyChoice:Add, Text, center CGray x200 y+20 w200 gCustomList, My Custom Hotkeys
Gui, theHotkeyChoice:Font, S10, w700
GuiControl, theHotkeyChoice:Move, Logo, x210
GuiControl, theHotkeyChoice:Move, Exit, x310 y430
GuiControl, theHotkeyChoice:Move, GoBack, x140 y430
GuiControl, theHotkeyChoice:Move, New, x145 y330
GuiControl, theHotkeyChoice:Move, ChatNew, x145 y375
Gui, theHotkeyChoice:Add, Text, center y475 w570 x20 vFeedback gFeedback, Feedback
Gui, theHotkeyChoice:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Edit AutoHotkeys - Categories

Gui, theCustom:destroy
Gui, theHeyDesign:destroy
Gui, theHeyPricing:destroy
Gui, openingHK:destroy
Gui, closingHK:destroy
Gui, followHK:destroy
Gui, theFUDesign:destroy
Gui, theFUGeneral:destroy
Gui, theFUFix:destroy
Gui, theFUOrder:destroy
Gui, theFUQuote:destroy
Gui, userHotkeys:destroy
Gui, theCustomList:destroy
Gui, theCustomList2:destroy
Gui, theCustomChat:destroy
Gui, theCustomChat2:destroy
Gui, theSpellingMenu:destroy
Gui, theSpellingList:destroy
Gui, theSpellingList2:destroy

Return

FollowUpHotkeys:
WinGetPos, Xpos, Ypos
height = 500
GuiWidth = 600

Gui, followHK:Add, Picture, w180 h-1 vLogo gLogo, %A_ScriptDir%\images\ahk_manual.jpg
Gui, followHK:Add, Picture, w140 h-1 vExit gGuiClose, %A_ScriptDir%\images\exit.jpg
Gui, followHK:Add, Picture, w140 h-1 vGoBack gCustom, %A_ScriptDir%\images\go_back.jpg
Gui, followHK:Color, FFFFFF
Gui, followHK:Font, S24, w700
Gui, followHK:Add, Text, center CGray x20 y129 w550, Click on a Hotkey to edit
Gui, followHK:Font, S14, w700
Gui, followHK:Add, Text, center CGray x175 y+30 w250 gFUDesign, Follow Up/Design
Gui, followHK:Add, Text, center CGray x175 y+20 w250 gFUGeneral, Follow Up/General
Gui, followHK:Add, Text, center CGray x175 y+20 w250 gFUFix, Follow Up/Fix
Gui, followHK:Add, Text, center CGray x175 y+20 w250 gFUOrder, Follow Up/Order
Gui, followHK:Add, Text, center CGray x175 y+20 w250 gFUQuote, Follow Up/Quote
Gui, followHK:Font, S10, w700
GuiControl, followHK:Move, Logo, x210
GuiControl, followHK:Move, Exit, x310 y430
GuiControl, followHK:Move, GoBack, x140 y430
Gui, followHK:Add, Text, center y475 w570 x20 vFeedback gFeedback, Feedback
Gui, followHK:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Edit AutoHotkeys - Follow Up Hotkeys

Gui, theCustom:destroy
Gui, theHeyDesign:destroy
Gui, theHeyPricing:destroy
Gui, theHotkeyChoice:destroy
Gui, theFUDesign:destroy
Gui, theFUGeneral:destroy
Gui, theFUFix:destroy
Gui, theFUOrder:destroy
Gui, theFUQuote:destroy
Return

FUDesign:
WinGetPos, Xpos, Ypos
IniRead, CustomFUDesign, %ini%, origFUDesign, KEY1

if (CustomFUDesign = "no")
{

FileRead, FUDesignText, %A_ScriptDir%\text_files\fu_design.txt

}
else
{

prevClip := Clipboard

clipboard=
(
Thank you so much for your call today! I loved talking about ____________________. I wanted to make sure I sent over the design that we created together today.

***Paste Design Link Here***
)
FUDesignText := Clipboard
clipboard := prevClip
}
tp := 6

height = 500
GuiWidth = 600

Gui, theFUDesign:Add, Picture, w180 h-1 vLogo gLogo, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theFUDesign:Add, Picture, w140 h-1 vOutputFUDesign gOutputFUDesign, %A_ScriptDir%\images\save.jpg
Gui, theFUDesign:Add, Picture, w140 h-1 vGoBack gFollowUpHotkeys, %A_ScriptDir%\images\go_back.jpg
Gui, theFUDesign:Add, Picture, w140 h-1 vRestore gFUDesignDefault, %A_ScriptDir%\images\restore_default.jpg
Gui, theFUDesign:Color, FFFFFF
Gui, theFUDesign:Font, S18, w700
Gui, theFUDesign:Add, Text, center CGray x20 y129 w550, Current text for Hotkey #followdesign
Gui, theFUDesign:Font, S10, w700
Gui, theFUDesign:Add, Edit, xs-10 CGray x80 y169 w440 h190 +0x200 hwndEdit vNewFUDesignText, %FUDesignText%
Gui, theFUDesign:Font, S10, w700
Gui, theFUDesign:Add, Text, center CGray x80 y370 w440, *Enter the new text for #followdesign*
GuiControl, theFUDesign:Move, Logo, x210
GuiControl, theFUDesign:Move, OutputFUDesign, x380 y430
GuiControl, theFUDesign:Move, GoBack, x80 y430
GuiControl, theFUDesign:Move, Restore, x230 y430
Gui, theFUDesign:Add, Text, center y475 w570 x20 vFeedback gFeedback, Feedback
Gui, theFUDesign:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Edit AutoHotkeys - Follow Up - #followdesign

Gui, openingHK:destroy
Gui, theHotkeyChoice:destroy
Gui, followHK:destroy

GuiControl, theFUDesign:Focus, NewFUDesignText

VarSetCapacity( R, 16, 0 )

SendMessage, 0xB2,, % &R,, ahk_id %Edit%

x1:=NumGet( &R+0 ), y1:=NumGet( &R+4 )

x2:=NumGet( &R+8 ), y2:=NumGet( &R+12 )

NumPut( (x1+tp), &R, 0 ), NumPut( (y1+tp), &R, 4 )

NumPut( (x2+1), &R, 8 ), NumPut( (y2+y1+1), &R, 12 ) ; <-- compensation for upper padding

SendMessage, 0xB3, 0x0, % &R,, ahk_id %Edit%
Return

FUDesignDefault:

IniWrite, yes, %ini%, origFUDesign, KEY1
TrayTip, Custom Follow Up Design Hotkey Restored to Default!, #followdesign has been restored to the default text..., , 3000
gosub, FollowUpHotkeys
Return

OutputFUDesign:
GuiControl, disable, OutputFUDesign
GuiControl, disable, FUDesignDefault
GuiControl, disable, theFUDesign
Gui, Submit, NoHide

; create a list of your edit control vars

;need to check to make sure that the e-mail address is correct and also includes CustomInk.com

emptyfields = NewFUDesignText
loop, parse, emptyfields, `,, %A_Space% 				; loop through the list
{
	GuiControlGet, OutputVar, Enabled, %A_LoopField%
		If !(%A_LoopField%) && OutputVar ; if the value of the variable whose name is saved in A_LoopField is empty and is enabled
		{
			if A_LoopField = NewFUDesignText
			{
			required = Your New Hotkey Text
			}
			
			MsgBox A required field is empty: %required%	; show error message
			GuiControl, enable, OutputFUDesign
			GuiControl, enable, FUDesignDefault
			GuiControl, enable, theFUDesign
			return						; stop
		}
}
;~ ; if you're here then all vars are not empty

gosub, EditFUDesign
Return

EditFUDesign:
; Save custom hotkey text to a text file.

theFile = %A_ScriptDir%\text_files\fu_design.txt

if FileExist(theFile) 
{
FileDelete, %theFile%
}

FileAppend, %NewFUDesignText%, %A_ScriptDir%\text_files\fu_design.txt

IniWrite, no, %ini%, origFUDesign, KEY1

TrayTip, Custom Hotkey Saved!, Your custom hotkey is ready to use..., , 3000
gosub, FollowUpHotkeys
Return

FUGeneral:
WinGetPos, Xpos, Ypos
IniRead, CustomFUGeneral, %ini%, origFUGeneral, KEY1

if (CustomFUGeneral = "no")
{

FileRead, FUGeneralText, %A_ScriptDir%\text_files\fu_general.txt

}
else
{

prevClip := Clipboard

clipboard=
(
Thank you for choosing CustomInk! It was a pleasure (***speaking, chatting, emailing, etc.***) with you earlier and I'm happy to be able to help you!

Whether you need some help in creating a design from scratch, touching up some artwork, or selecting the perfect product, please feel free to reach out to me with anything you need. My contact details are listed below. Thanks again for choosing CustomInk and I hope you have a wonderful day!
)
FUGeneralText := Clipboard
clipboard := prevClip
}
tp := 6

height = 500
GuiWidth = 600

Gui, theFUGeneral:Add, Picture, w180 h-1 vLogo gLogo, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theFUGeneral:Add, Picture, w140 h-1 vOutputFUGeneral gOutputFUGeneral, %A_ScriptDir%\images\save.jpg
Gui, theFUGeneral:Add, Picture, w140 h-1 vGoBack gFollowUpHotkeys, %A_ScriptDir%\images\go_back.jpg
Gui, theFUGeneral:Add, Picture, w140 h-1 vRestore gFUGeneralDefault, %A_ScriptDir%\images\restore_default.jpg
Gui, theFUGeneral:Color, FFFFFF
Gui, theFUGeneral:Font, S18, w700
Gui, theFUGeneral:Add, Text, center CGray x20 y129 w550, Current text for Hotkey #followup
Gui, theFUGeneral:Font, S10, w700
Gui, theFUGeneral:Font, S10, w700
Gui, theFUGeneral:Add, Edit, xs-10 x80 CGray y169 w440 h190 +0x200 hwndEdit vNewFUGeneralText, %FUGeneralText%
Gui, theFUGeneral:Font, S10, w700
Gui, theFUGeneral:Add, Text, center CGray x80 y370 w440, *Enter the new text for #followup*
GuiControl, theFUGeneral:Move, Logo, x210
GuiControl, theFUGeneral:Move, OutputFUGeneral, x380 y430
GuiControl, theFUGeneral:Move, GoBack, x80 y430
GuiControl, theFUGeneral:Move, Restore, x230 y430
Gui, theFUGeneral:Add, Text, center y475 w570 x20 vFeedback gFeedback, Feedback
Gui, theFUGeneral:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Edit AutoHotkeys - Follow Up - #followup

Gui, openingHK:destroy
Gui, theHotkeyChoice:destroy
Gui, theHotkeyChoice:destroy
Gui, followHK:destroy

GuiControl, theFUGeneral:Focus, NewFUGeneralText

VarSetCapacity( R, 16, 0 )

SendMessage, 0xB2,, % &R,, ahk_id %Edit%

x1:=NumGet( &R+0 ), y1:=NumGet( &R+4 )

x2:=NumGet( &R+8 ), y2:=NumGet( &R+12 )

NumPut( (x1+tp), &R, 0 ), NumPut( (y1+tp), &R, 4 )

NumPut( (x2+1), &R, 8 ), NumPut( (y2+y1+1), &R, 12 ) ; <-- compensation for upper padding

SendMessage, 0xB3, 0x0, % &R,, ahk_id %Edit%
Return

FUGeneralDefault:
IniWrite, yes, %ini%, origFUGeneral, KEY1
TrayTip, Custom Follow Up General Hotkey Restored to Default!, #followup has been restored to the default text..., , 3000
gosub, FollowUpHotkeys
Return

OutputFUGeneral:
GuiControl, disable, OutputFUGeneral
GuiControl, disable, FUGeneralDefault
GuiControl, disable, theFUGeneral
Gui, Submit, NoHide

; create a list of your edit control vars

;need to check to make sure that the e-mail address is correct and also includes CustomInk.com

emptyfields = NewFUGeneralText
loop, parse, emptyfields, `,, %A_Space% 				; loop through the list
{
	GuiControlGet, OutputVar, Enabled, %A_LoopField%
		If !(%A_LoopField%) && OutputVar ; if the value of the variable whose name is saved in A_LoopField is empty and is enabled
		{
			if A_LoopField = NewFUGeneralText
			{
			required = Your New Hotkey Text
			}
			
			MsgBox A required field is empty: %required%	; show error message
			GuiControl, enable, OutputFUGeneral
			GuiControl, enable, FUGeneralDefault
			GuiControl, enable, theFUGeneral
			return						; stop
		}
}
;~ ; if you're here then all vars are not empty

gosub, EditFUGeneral
Return

EditFUGeneral:
; Save custom hotkey text to a text file.

theFile = %A_ScriptDir%\text_files\fu_general.txt

if FileExist(theFile) 
{
FileDelete, %theFile%
}

FileAppend, %NewFUGeneralText%, %A_ScriptDir%\text_files\fu_general.txt

IniWrite, no, %ini%, origFUGeneral, KEY1

TrayTip, Custom Hotkey Saved!, Your custom hotkey is ready to use..., , 3000
gosub, FollowUpHotkeys
Return

FUOrder:
WinGetPos, Xpos, Ypos
IniRead, CustomFUOrder, %ini%, origFUOrder, KEY1

if (CustomFUOrder = "no")
{

FileRead, FUOrderText, %A_ScriptDir%\text_files\fu_order.txt

}
else
{

prevClip := Clipboard

clipboard=
(
I just wanted to send you a personal thank you for ordering with us. I think that these shirts are going to be perfect for your _________________________. Please know that my service does not end here and if there is anything else that I can do to help, let me know. I’ve included all of my contact information below just for you.

Thanks again, and I hope that you have a great rest of your day!
)
FUOrderText := Clipboard
clipboard := prevClip
}
tp := 6

height = 500
GuiWidth = 600

Gui, theFUOrder:Add, Picture, w180 h-1 vLogo gLogo, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theFUOrder:Add, Picture, w140 h-1 vOutputFUOrder gOutputFUOrder, %A_ScriptDir%\images\save.jpg
Gui, theFUOrder:Add, Picture, w140 h-1 vGoBack gFollowUpHotkeys, %A_ScriptDir%\images\go_back.jpg
Gui, theFUOrder:Add, Picture, w140 h-1 vRestore gFUOrderDefault, %A_ScriptDir%\images\restore_default.jpg
Gui, theFUOrder:Color, FFFFFF
Gui, theFUOrder:Font, S18, w700
Gui, theFUOrder:Add, Text, center CGray x20 y129 w550, Current text for Hotkey #followorder
Gui, theFUOrder:Font, S10, w700
Gui, theFUOrder:Font, S10, w700
Gui, theFUOrder:Add, Edit, xs-10 x80 cGray y169 w440 h190 +0x200 hwndEdit vNewFUOrderText, %FUOrderText%
Gui, theFUOrder:Font, S10, w700
Gui, theFUOrder:Add, Text, center CGray x80 y370 w440, *Enter the new text for #followorder*
GuiControl, theFUOrder:Move, Logo, x210
GuiControl, theFUOrder:Move, OutputFUOrder, x380 y430
GuiControl, theFUOrder:Move, GoBack, x80 y430
GuiControl, theFUOrder:Move, Restore, x230 y430
Gui, theFUOrder:Add, Text, center y475 w570 x20 vFeedback gFeedback, Feedback
Gui, theFUOrder:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Edit AutoHotkeys - Follow Up - #followorder

Gui, openingHK:destroy
Gui, theHotkeyChoice:destroy
Gui, theHotkeyChoice:destroy
Gui, followHK:destroy

GuiControl, theFUOrder:Focus, NewFUOrderText

VarSetCapacity( R, 16, 0 )

SendMessage, 0xB2,, % &R,, ahk_id %Edit%

x1:=NumGet( &R+0 ), y1:=NumGet( &R+4 )

x2:=NumGet( &R+8 ), y2:=NumGet( &R+12 )

NumPut( (x1+tp), &R, 0 ), NumPut( (y1+tp), &R, 4 )

NumPut( (x2+1), &R, 8 ), NumPut( (y2+y1+1), &R, 12 ) ; <-- compensation for upper padding

SendMessage, 0xB3, 0x0, % &R,, ahk_id %Edit%
Return

FUOrderDefault:
IniWrite, yes, %ini%, origFUOrder, KEY1
TrayTip, Custom Follow Up Order Hotkey Restored to Default!, #followorder has been restored to the default text..., , 3000
gosub, FollowUpHotkeys
Return

OutputFUOrder:
GuiControl, disable, OutputFUOrder
GuiControl, disable, FUOrderDefault
GuiControl, disable, theFUOrder
Gui, Submit, NoHide

; create a list of your edit control vars

;need to check to make sure that the e-mail address is correct and also includes CustomInk.com

emptyfields = NewFUOrderText
loop, parse, emptyfields, `,, %A_Space% 				; loop through the list
{
	GuiControlGet, OutputVar, Enabled, %A_LoopField%
		If !(%A_LoopField%) && OutputVar ; if the value of the variable whose name is saved in A_LoopField is empty and is enabled
		{
			if A_LoopField = NewFUOrderText
			{
			required = Your New Hotkey Text
			}
			
			MsgBox A required field is empty: %required%	; show error message
			GuiControl, enable, OutputFUOrder
			GuiControl, enable, FUOrderDefault
			GuiControl, enable, theFUOrder
			return						; stop
		}
}
;~ ; if you're here then all vars are not empty

gosub, EditFUOrder
Return

EditFUOrder:
; Save custom hotkey text to a text file.

theFile = %A_ScriptDir%\text_files\fu_order.txt

if FileExist(theFile) 
{
FileDelete, %theFile%
}

FileAppend, %NewFUOrderText%, %A_ScriptDir%\text_files\fu_order.txt

IniWrite, no, %ini%, origFUOrder, KEY1

TrayTip, Custom Hotkey Saved!, Your custom hotkey is ready to use..., , 3000
gosub, FollowUpHotkeys
Return

FUQuote:
WinGetPos, Xpos, Ypos
IniRead, CustomFUQuote, %ini%, origFUQuote, KEY1

if (CustomFUQuote = "no")
{

FileRead, FUQuoteText, %A_ScriptDir%\text_files\fu_quote.txt

}
else
{

prevClip := Clipboard

clipboard=
(
Thank you so much for your call today! I loved talking about _________________. I wanted to make sure that I sent over the quote that we had discussed.

***Paste Quote Here***
)
FUQuoteText := Clipboard
clipboard := prevClip
}
tp := 6

height = 500
GuiWidth = 600

Gui, theFUQuote:Add, Picture, w180 h-1 vLogo gLogo, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theFUQuote:Add, Picture, w140 h-1 vOutputFUQuote gOutputFUQuote, %A_ScriptDir%\images\save.jpg
Gui, theFUQuote:Add, Picture, w140 h-1 vGoBack gFollowUpHotkeys, %A_ScriptDir%\images\go_back.jpg
Gui, theFUQuote:Add, Picture, w140 h-1 vRestore gFUQuoteDefault, %A_ScriptDir%\images\restore_default.jpg
Gui, theFUQuote:Color, FFFFFF
Gui, theFUQuote:Font, S20, w700
Gui, theFUQuote:Add, Text, center cGray w700 x20 y129 w550, Current text for Hotkey #followquote
Gui, theFUQuote:Font, S10, w700
Gui, theFUQuote:Font, S10, w700
Gui, theFUQuote:Add, Edit, xs-10 x80 cGray y169 w440 h190 +0x200 hwndEdit vNewFUQuoteText, %FUQuoteText%
Gui, theFUQuote:Font, S12, w700
Gui, theFUQuote:Add, Text, center CGray x80 y370 w440, *Enter the new text for #followquote*
GuiControl, theFUQuote:Move, Logo, x210
GuiControl, theFUQuote:Move, OutputFUQuote, x380 y430
GuiControl, theFUQuote:Move, GoBack, x80 y430
GuiControl, theFUQuote:Move, Restore, x230 y430
Gui, theFUQuote:Font, S10, w700
Gui, theFUQuote:Add, Text, center y475 w570 x20 vFeedback gFeedback, Feedback
Gui, theFUQuote:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Edit AutoHotkeys - Follow Up - #followquote

Gui, openingHK:destroy
Gui, theHotkeyChoice:destroy
Gui, theHotkeyChoice:destroy
Gui, followHK:destroy

GuiControl, theFUQuote:Focus, NewFUQuoteText

VarSetCapacity( R, 16, 0 )

SendMessage, 0xB2,, % &R,, ahk_id %Edit%

x1:=NumGet( &R+0 ), y1:=NumGet( &R+4 )

x2:=NumGet( &R+8 ), y2:=NumGet( &R+12 )

NumPut( (x1+tp), &R, 0 ), NumPut( (y1+tp), &R, 4 )

NumPut( (x2+1), &R, 8 ), NumPut( (y2+y1+1), &R, 12 ) ; <-- compensation for upper padding

SendMessage, 0xB3, 0x0, % &R,, ahk_id %Edit%
Return

FUQuoteDefault:
IniWrite, yes, %ini%, origFUQuote, KEY1
TrayTip, Custom Follow Up Quote Hotkey Restored to Default!, #followquote has been restored to the default text..., , 3000
gosub, FollowUpHotkeys
Return

OutputFUQuote:
GuiControl, disable, OutputFUQuote
GuiControl, disable, FUQuoteDefault
GuiControl, disable, theFUQuote
Gui, Submit, NoHide

; create a list of your edit control vars

;need to check to make sure that the e-mail address is correct and also includes CustomInk.com

emptyfields = NewFUQuoteText
loop, parse, emptyfields, `,, %A_Space% 				; loop through the list
{
	GuiControlGet, OutputVar, Enabled, %A_LoopField%
		If !(%A_LoopField%) && OutputVar ; if the value of the variable whose name is saved in A_LoopField is empty and is enabled
		{
			if A_LoopField = NewFUQuoteText
			{
			required = Your New Hotkey Text
			}
			
			MsgBox A required field is empty: %required%	; show error message
			GuiControl, enable, OutputFUQuote
			GuiControl, enable, FUQuoteDefault
			GuiControl, enable, theFUQuote
			return						; stop
		}
}
;~ ; if you're here then all vars are not empty

gosub, EditFUQuote
Return

EditFUQuote:
; Save custom hotkey text to a text file.

theFile = %A_ScriptDir%\text_files\fu_quote.txt

if FileExist(theFile) 
{
FileDelete, %theFile%
}

FileAppend, %NewFUQuoteText%, %A_ScriptDir%\text_files\fu_quote.txt

IniWrite, no, %ini%, origFUQuote, KEY1

TrayTip, Custom Hotkey Saved!, Your custom hotkey is ready to use..., , 3000
gosub, FollowUpHotkeys
Return


FUFix:
WinGetPos, Xpos, Ypos
IniRead, CustomFUFix, %ini%, origFUFix, KEY1

if (CustomFUFix = "no")
{

FileRead, FUFixText, %A_ScriptDir%\text_files\fu_fix.txt

}
else
{

prevClip := Clipboard

clipboard=
(
Thank you so much for hanging in there! I saw that your replacements delivered recently, and wanted to check in with you and see how you liked them. I hope they look exactly as you were hoping this time around. What do you think?
)
FUFixText := Clipboard
clipboard := prevClip
}
tp := 6

height = 500
GuiWidth = 600

Gui, theFUFix:Add, Picture, w180 h-1 vLogo gLogo, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theFUFix:Add, Picture, w140 h-1 vOutputFUFix gOutputFUFix, %A_ScriptDir%\images\save.jpg
Gui, theFUFix:Add, Picture, w140 h-1 vGoBack gFollowUpHotkeys, %A_ScriptDir%\images\go_back.jpg
Gui, theFUFix:Add, Picture, w140 h-1 vRestore gFUFixDefault, %A_ScriptDir%\images\restore_default.jpg
Gui, theFUFix:Color, FFFFFF
Gui, theFUFix:Font, S20, w700
Gui, theFUFix:Add, Text, center cGray w700 x20 y129 w550, Current text for Hotkey #followfix
Gui, theFUFix:Font, S10, w700
Gui, theFUFix:Font, S10, w700
Gui, theFUFix:Add, Edit, xs-10 x80 cGray y169 w440 h190 +0x200 hwndEdit vNewFUFixText, %FUFixText%
Gui, theFUFix:Font, S12, w700
Gui, theFUFix:Add, Text, center CGray x80 y370 w440, *Enter the new text for #followfix*
GuiControl, theFUFix:Move, Logo, x210
GuiControl, theFUFix:Move, OutputFUFix, x380 y430
GuiControl, theFUFix:Move, GoBack, x80 y430
GuiControl, theFUFix:Move, Restore, x230 y430
Gui, theFUFix:Font, S10, w700
Gui, theFUFix:Add, Text, center y475 w570 x20 vFeedback gFeedback, Feedback
Gui, theFUFix:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Edit AutoHotkeys - Follow Up - #followfix

Gui, openingHK:destroy
Gui, theHotkeyChoice:destroy
Gui, theHotkeyChoice:destroy
Gui, followHK:destroy

GuiControl, theFUFix:Focus, NewFUFixText

VarSetCapacity( R, 16, 0 )

SendMessage, 0xB2,, % &R,, ahk_id %Edit%

x1:=NumGet( &R+0 ), y1:=NumGet( &R+4 )

x2:=NumGet( &R+8 ), y2:=NumGet( &R+12 )

NumPut( (x1+tp), &R, 0 ), NumPut( (y1+tp), &R, 4 )

NumPut( (x2+1), &R, 8 ), NumPut( (y2+y1+1), &R, 12 ) ; <-- compensation for upper padding

SendMessage, 0xB3, 0x0, % &R,, ahk_id %Edit%
Return

FUFixDefault:
IniWrite, yes, %ini%, origFUFix, KEY1
TrayTip, Custom Follow Up Fix Hotkey Restored to Default!, #followfix has been restored to the default text..., , 3000
gosub, FollowUpHotkeys
Return

OutputFUFix:
GuiControl, disable, OutputFUFix
GuiControl, disable, FUFixDefault
GuiControl, disable, theFUFix
Gui, Submit, NoHide

; create a list of your edit control vars

;need to check to make sure that the e-mail address is correct and also includes CustomInk.com

emptyfields = NewFUFixText
loop, parse, emptyfields, `,, %A_Space% 				; loop through the list
{
	GuiControlGet, OutputVar, Enabled, %A_LoopField%
		If !(%A_LoopField%) && OutputVar ; if the value of the variable whose name is saved in A_LoopField is empty and is enabled
		{
			if A_LoopField = NewFUFixText
			{
			required = Your New Hotkey Text
			}
			
			MsgBox A required field is empty: %required%	; show error message
			GuiControl, enable, OutputFUFix
			GuiControl, enable, FUFixDefault
			GuiControl, enable, theFUFix
			return						; stop
		}
}
;~ ; if you're here then all vars are not empty

gosub, EditFUFix
Return

EditFUFix:
; Save custom hotkey text to a text file.

theFile = %A_ScriptDir%\text_files\fu_fix.txt

if FileExist(theFile) 
{
FileDelete, %theFile%
}

FileAppend, %NewFUFixText%, %A_ScriptDir%\text_files\fu_fix.txt

IniWrite, no, %ini%, origFUFix, KEY1

TrayTip, Custom Hotkey Saved!, Your custom hotkey is ready to use..., , 3000
gosub, FollowUpHotkeys
Return

OpenHotkeys:
WinGetPos, Xpos, Ypos
height = 500
GuiWidth = 600

Gui, openingHK:Add, Picture, w180 h-1 vLogo gLogo, %A_ScriptDir%\images\ahk_manual.jpg
Gui, openingHK:Add, Picture, w140 h-1 vGoBack gCustom, %A_ScriptDir%\images\go_back.jpg
Gui, openingHK:Add, Picture, w140 h-1 vExit gGuiClose, %A_ScriptDir%\images\exit.jpg
Gui, openingHK:Color, FFFFFF
Gui, openingHK:Font, S24, w700
Gui, openingHK:Add, Text, center CGray x20 y129 w550, Click on a Hotkey to edit
Gui, openingHK:Font, S14, w700
Gui, openingHK:Add, Text, center CGray x175 y+30 w250 gHeyDesign, Greeting/Design
Gui, openingHK:Add, Text, center CGray x175 y+20 w250 gHeyPricing, Greeting/Pricing
Gui, openingHK:Font, S10, w700
GuiControl, openingHK:Move, Logo, x210
GuiControl, openingHK:Move, GoBack, x140 y430
GuiControl, openingHK:Move, Exit, x310 y430
Gui, openingHK:Add, Text, center y475 w570 x20 vFeedback gFeedback, Feedback
Gui, openingHK:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Edit AutoHotkeys - Opening Hotkeys

Gui, theCustom:destroy
Gui, theHeyDesign:destroy
Gui, theHeyPricing:destroy
Gui, theHotkeyChoice:destroy
Return

HeyDesign:
WinGetPos, Xpos, Ypos
IniRead, CustomHeyDesign, %ini%, origHeyDesign, KEY1

if (CustomHeyDesign = "no")
{

FileRead, HeyDesignText, %A_ScriptDir%\text_files\hey_design.txt

}
else
{
HeyDesignText = Thank you for choosing CustomInk! I'm happy to help you with your design and you can count on me to help with anything you need while we bring your custom design to life!
}
tp := 6

height = 500
GuiWidth = 600

Gui, theHeyDesign:Add, Picture, w180 h-1 vLogo gLogo, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theHeyDesign:Add, Picture, w140 h-1 vOutputHeyDesign gOutputHeyDesign, %A_ScriptDir%\images\save.jpg
Gui, theHeyDesign:Add, Picture, w140 h-1 vGoBack gOpenHotkeys, %A_ScriptDir%\images\go_back.jpg
Gui, theHeyDesign:Add, Picture, w140 h-1 vRestore gDesignDefault, %A_ScriptDir%\images\restore_default.jpg
Gui, theHeyDesign:Color, FFFFFF
Gui, theHeyDesign:Font, S18, w700
Gui, theHeyDesign:Add, Text, center CGray x20 y129 w550, Current text for Hotkey #heydesign
Gui, theHeyDesign:Font, S10, w700
Gui, theHeyDesign:Font, S10, w700
Gui, theHeyDesign:Add, Edit, xs-10 CGray x80 y169 w440 h190 +0x200 hwndEdit vNewHeyDesignText, %HeyDesignText%
Gui, theHeyDesign:Font, S10, w700
Gui, theHeyDesign:Add, Text, center CGray x80 y370 w440, *Enter the new text for #heydesign*
GuiControl, theHeyDesign:Move, Logo, x210
GuiControl, theHeyDesign:Move, OutputHeyDesign, x380 y430
GuiControl, theHeyDesign:Move, GoBack, x80 y430
GuiControl, theHeyDesign:Move, Restore, x230 y430
Gui, theHeyDesign:Add, Text, center y475 w570 x20 vFeedback gFeedback, Feedback
Gui, theHeyDesign:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Edit AutoHotkeys - Opening - #heydesign

Gui, openingHK:destroy
Gui, theHotkeyChoice:destroy

GuiControl, theHeyDesign:Focus, NewHeyDesignText

VarSetCapacity( R, 16, 0 )

SendMessage, 0xB2,, % &R,, ahk_id %Edit%

x1:=NumGet( &R+0 ), y1:=NumGet( &R+4 )

x2:=NumGet( &R+8 ), y2:=NumGet( &R+12 )

NumPut( (x1+tp), &R, 0 ), NumPut( (y1+tp), &R, 4 )

NumPut( (x2+1), &R, 8 ), NumPut( (y2+y1+1), &R, 12 ) ; <-- compensation for upper padding

SendMessage, 0xB3, 0x0, % &R,, ahk_id %Edit%

Return

DesignDefault:
IniWrite, yes, %ini%, origHeyDesign, KEY1
TrayTip, Custom Hotkey Restored to Default!, #heydesign has been restored to the default text..., , 3000
gosub, Custom
Return

PricingDefault:
IniWrite, yes, %ini%, origHeyPricing, KEY1
TrayTip, Custom Hotkey Restored to Default!, #heypricing has been restored to the default text..., , 3000
gosub, Custom
Return

OutputHeyDesign:
GuiControl, disable, OutputHeyDesign
GuiControl, disable, DesignDefault
GuiControl, disable, OpenHotkeys
Gui, Submit, NoHide

; create a list of your edit control vars

;need to check to make sure that the e-mail address is correct and also includes CustomInk.com

emptyfields = NewHeyDesignText
loop, parse, emptyfields, `,, %A_Space% 				; loop through the list
{
	GuiControlGet, OutputVar, Enabled, %A_LoopField%
		If !(%A_LoopField%) && OutputVar ; if the value of the variable whose name is saved in A_LoopField is empty and is enabled
		{
			if A_LoopField = NewHeyDesignText
			{
			required = Your New Hotkey Text
			}
			
			MsgBox A required field is empty: %required%	; show error message
			GuiControl, enable, OutputHeyDesign
			GuiControl, enable, DesignDefault
			GuiControl, enable, Custom
			return						; stop
		}
}
;~ ; if you're here then all vars are not empty

gosub, EditHeyDesign
Return

EditHeyDesign:
; Save custom hotkey text to a text file.

theFile = %A_ScriptDir%\text_files\hey_design.txt

if FileExist(theFile) 
{
FileDelete, %theFile%
}

FileAppend, %NewHeyDesignText%, %A_ScriptDir%\text_files\hey_design.txt

IniWrite, no, %ini%, origHeyDesign, KEY1

TrayTip, Custom Hotkey Saved!, Your custom hotkey is ready to use..., , 3000
gosub, OpenHotkeys
Return

HeyPricing:
WinGetPos, Xpos, Ypos
IniRead, CustomHeyPricing, %ini%, origHeyPricing, KEY1

if (CustomHeyPricing = "no")
{
FileRead, HeyPricingText, %A_ScriptDir%\text_files\hey_pricing.txt
}
else
{
HeyPricingText = Thank you for choosing CustomInk! I'm happy to help put together a quote for your custom design and you can count on me to make sure that your experience with us is outstanding!

}
tp := 6

height = 500
GuiWidth = 600

Gui, theHeyPricing:Add, Picture, w180 h-1 vLogo gLogo, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theHeyPricing:Add, Picture, w140 h-1 vOutputHeyPricing gOutputHeyPricing, %A_ScriptDir%\images\save.jpg
Gui, theHeyPricing:Add, Picture, w140 h-1 vGoBack gOpenHotkeys, %A_ScriptDir%\images\go_back.jpg
Gui, theHeyPricing:Add, Picture, w140 h-1 vRestore gPricingDefault, %A_ScriptDir%\images\restore_default.jpg
Gui, theHeyPricing:Color, FFFFFF
Gui, theHeyPricing:Font, S18, w700
Gui, theHeyPricing:Add, Text, center CGray x20 y129 w550, Current text for Hotkey #heypricing
Gui, theHeyPricing:Font, S10, w700
Gui, theHeyPricing:Add, Edit, xs-10 CGray x80 y169 w440 h190 +0x200 hwndEdit vNewHeyPricingText, %HeyPricingText%
Gui, theHeyPricing:Font, S10, w700
Gui, theHeyPricing:Add, Text, center CGray x80 y370 w440, *Enter the new text for #heypricing*
GuiControl, theHeyPricing:Move, Logo, x210
GuiControl, theHeyPricing:Move, OutputHeyPricing, x380 y430
GuiControl, theHeyPricing:Move, GoBack, x80 y430
GuiControl, theHeyPricing:Move, Restore, x230 y430
Gui, theHeyPricing:Add, Text, center y475 w570 x20 vFeedback gFeedback, Feedback
Gui, theHeyPricing:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Edit AutoHotkeys - Opening - #heypricing

Gui, openingHK:destroy
Gui, theHotkeyChoice:destroy

GuiControl, theHeyPricing:Focus, NewHeyPricingText

VarSetCapacity( R, 16, 0 )

SendMessage, 0xB2,, % &R,, ahk_id %Edit%

x1:=NumGet( &R+0 ), y1:=NumGet( &R+4 )

x2:=NumGet( &R+8 ), y2:=NumGet( &R+12 )

NumPut( (x1+tp), &R, 0 ), NumPut( (y1+tp), &R, 4 )

NumPut( (x2+1), &R, 8 ), NumPut( (y2+y1+1), &R, 12 ) ; <-- compensation for upper padding

SendMessage, 0xB3, 0x0, % &R,, ahk_id %Edit%

Return

OutputHeyPricing:
GuiControl, disable, OutputHeyPricing
GuiControl, disable, PricingDefault
GuiControl, disable, OpenHotkeys
Gui, Submit, NoHide
Gui, Submit, NoHide

; create a list of your edit control vars

;need to check to make sure that the e-mail address is correct and also includes CustomInk.com

emptyfields = NewHeyPricingText
loop, parse, emptyfields, `,, %A_Space% ; loop through the list
{
	GuiControlGet, OutputVar, Enabled, %A_LoopField%
		If !(%A_LoopField%) && OutputVar ; if the value of the variable whose name is saved in A_LoopField is empty and is enabled
		{
			if A_LoopField = NewHeyPricingText
			{
			required = Your New Hotkey Text
			}
			
			MsgBox A required field is empty: %required% ; show error message
			GuiControl, enable, OutputHeyDesign
			GuiControl, enable, PricingDefault
			GuiControl, enable, OpenHotkeys
			return						; stop
		}
}
;~ ; if you're here then all vars are not empty

gosub, EditHeyPricing
Return

EditHeyPricing:

; Save custom hotkey text to a text file.

theFile = %A_ScriptDir%\text_files\hey_pricing.txt

if FileExist(theFile) 
{
FileDelete, %theFile%
}

FileAppend, %NewHeyPricingText%, %A_ScriptDir%\text_files\hey_pricing.txt

IniWrite, no, %ini%, origHeyPricing, KEY1

TrayTip, Custom Hotkey Saved!, Your custom hotkey is ready to use..., , 3000
gosub, OpenHotkeys
Return

ClosingHotkeys:
WinGetPos, Xpos, Ypos
height = 500
GuiWidth = 600

Gui, closingHK:Add, Picture, w180 h-1 vLogo gLogo, %A_ScriptDir%\images\ahk_manual.jpg
Gui, closingHK:Add, Picture, w140 h-1 vGoBack gCustom, %A_ScriptDir%\images\go_back.jpg
Gui, closingHK:Add, Picture, w140 h-1 vExit gGuiClose, %A_ScriptDir%\images\exit.jpg
Gui, closingHK:Color, FFFFFF
Gui, closingHK:Font, S24, w700
Gui, closingHK:Add, Text, center CGray x20 y129 w550, Click on a Hotkey to edit
Gui, closingHK:Font, S14, w700
Gui, closingHK:Add, Text, center CGray x175 y+30 w250 gGeneralClosing, General Closing
Gui, closingHK:Add, Text, center CGray x175 y+20 w250 gByeOrder, Post-Quote Closing
Gui, closingHK:Font, S10, w700
GuiControl, closingHK:Move, Logo, x210
GuiControl, closingHK:Move, GoBack, x140 y430
GuiControl, closingHK:Move, Exit, x310 y430
Gui, closingHK:Add, Text, center y475 w570 x20 vFeedback gFeedback, Feedback
Gui, closingHK:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Edit AutoHotkeys - Closing Hotkeys

Gui, theCustom:destroy
Gui, theGeneralClosing:destroy
Gui, theByeOrder:destroy
Gui, theHotkeyChoice:destroy
Return

GeneralClosing:
WinGetPos, Xpos, Ypos
IniRead, CustomGeneralClosing, %ini%, origGeneralClosing, KEY1

if (CustomGeneralClosing = "no")
{

FileRead, Close, %A_ScriptDir%\text_files\close.txt

}
else
{
Close = Please feel free to respond to this e-mail or give me a call if you have any questions and I'll be happy to help! My personal contact details are listed below. Thank you again for choosing CustomInk and I hope you have a wonderful day!

}
tp := 6

height = 500
GuiWidth = 600

Gui, theGeneralClosing:Add, Picture, w180 h-1 vLogo gLogo, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theGeneralClosing:Add, Picture, w140 h-1 vOutputClose gOutputClose, %A_ScriptDir%\images\save.jpg
Gui, theGeneralClosing:Add, Picture, w140 h-1 vGoBack gClosingHotkeys, %A_ScriptDir%\images\go_back.jpg
Gui, theGeneralClosing:Add, Picture, w140 h-1 vRestore gCloseDefault, %A_ScriptDir%\images\restore_default.jpg
Gui, theGeneralClosing:Color, FFFFFF
Gui, theGeneralClosing:Font, S18, w700
Gui, theGeneralClosing:Add, Text, center CGray x20 y129 w550, Current text for Hotkey #close
Gui, theGeneralClosing:Font, S10, w700
Gui, theGeneralClosing:Add, Edit, xs-10 CGray x80 y169 w440 h190 +0x200 hwndEdit vNewGeneralClosing, %Close%
Gui, theGeneralClosing:Font, S10, w700
Gui, theGeneralClosing:Add, Text, center CGray x80 y370 w440, *Enter the new text for #close*
GuiControl, theGeneralClosing:Move, Logo, x210
GuiControl, theGeneralClosing:Move, OutputClose, x380 y430
GuiControl, theGeneralClosing:Move, GoBack, x80 y430
GuiControl, theGeneralClosing:Move, Restore, x230 y430
Gui, theGeneralClosing:Add, Text, center y475 w570 x20 vFeedback gFeedback, Feedback
Gui, theGeneralClosing:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Edit AutoHotkeys - Closing - #close

Gui, closingHK:destroy


GuiControl, theGeneralClosing:Focus, NewGeneralClosing

VarSetCapacity( R, 16, 0 )

SendMessage, 0xB2,, % &R,, ahk_id %Edit%

x1:=NumGet( &R+0 ), y1:=NumGet( &R+4 )

x2:=NumGet( &R+8 ), y2:=NumGet( &R+12 )

NumPut( (x1+tp), &R, 0 ), NumPut( (y1+tp), &R, 4 )

NumPut( (x2+1), &R, 8 ), NumPut( (y2+y1+1), &R, 12 ) ; <-- compensation for upper padding

SendMessage, 0xB3, 0x0, % &R,, ahk_id %Edit%

Return

CloseDefault:
IniWrite, yes, %ini%, origGeneralClosing, KEY1
TrayTip, Custom Hotkey Restored to Default!, #close has been restored to the default text..., , 3000
gosub, ClosingHotkeys
Return

ByeOrderDefault:
IniWrite, yes, %ini%, origByeOrder, KEY1
TrayTip, Custom Hotkey Restored to Default!, #byeorder has been restored to the default text..., , 3000
gosub, ClosingHotkeys
Return

OutputClose:
GuiControl, disable, OutputClose 
GuiControl, disable, CloseDefault
GuiControl, disable, OpenHotkeys
Gui, Submit, NoHide

; create a list of your edit control vars

;need to check to make sure that the e-mail address is correct and also includes CustomInk.com

emptyfields = NewGeneralClosing
loop, parse, emptyfields, `,, %A_Space% 				; loop through the list
{
	GuiControlGet, OutputVar, Enabled, %A_LoopField%
		If !(%A_LoopField%) && OutputVar ; if the value of the variable whose name is saved in A_LoopField is empty and is enabled
		{
			if A_LoopField = NewGeneralClosing
			{
			required = Your New Hotkey Text
			}
			
			MsgBox A required field is empty: %required%	; show error message
			GuiControl, enable, OutputHeyDesign
			GuiControl, enable, CloseDefault
			GuiControl, enable, Custom
			return						; stop
		}
}
;~ ; if you're here then all vars are not empty

gosub, EditClose
Return

EditClose:
; Save custom hotkey text to a text file.

theFile = %A_ScriptDir%\text_files\close.txt

if FileExist(theFile) 
{
FileDelete, %theFile%
}

FileAppend, %NewGeneralClosing%, %A_ScriptDir%\text_files\close.txt

IniWrite, no, %ini%, origGeneralClosing, KEY1

TrayTip, Custom Hotkey Saved!, Your custom hotkey is ready to use..., , 3000
gosub, ClosingHotkeys
Return

ByeOrder:
WinGetPos, Xpos, Ypos
IniRead, CustomByeOrder, %ini%, origByeOrder, KEY1

if (CustomByeOrder = "no")
{
FileRead, ByeOrderText, %A_ScriptDir%\text_files\bye_order.txt
}
else
{
ByeOrderText = Do these prices work within your budget?  If not, please let me know and I can get going on a quote that works better for you.`n`nIf you have any other questions along the way, feel free to reply to this email or call me directly.  Once I hear back, we'll be able to take the next steps in making your design  come to life.  I've included all of my personal contact information below. Thanks again for choosing CustomInk. I look forward to hearing from you!


}
tp := 6

height = 500
GuiWidth = 600

Gui, theByeOrder:Add, Picture, w180 h-1 vLogo gLogo, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theByeOrder:Add, Picture, w140 h-1 vOutputByeOrder gOutputByeOrder, %A_ScriptDir%\images\save.jpg
Gui, theByeOrder:Add, Picture, w140 h-1 vGoBack gClosingHotkeys, %A_ScriptDir%\images\go_back.jpg
Gui, theByeOrder:Add, Picture, w140 h-1 vRestore gByeOrderDefault, %A_ScriptDir%\images\restore_default.jpg
Gui, theByeOrder:Color, FFFFFF
Gui, theByeOrder:Font, S18, w700
Gui, theByeOrder:Add, Text, center CGray x20 y129 w550, Current text for Hotkey #byeorder
Gui, theByeOrder:Font, S10, w700
Gui, theByeOrder:Add, Edit, xs-10 CGray x80 y169 w440 h190 +0x200 hwndEdit vNewByeOrderText, %ByeOrderText%
Gui, theByeOrder:Font, S10, w700
Gui, theByeOrder:Add, Text, center CGray x80 y370 w440, *Enter the new text for #byeorder*
GuiControl, theByeOrder:Move, Logo, x210
GuiControl, theByeOrder:Move, OutputByeOrder, x380 y430
GuiControl, theByeOrder:Move, GoBack, x80 y430
GuiControl, theByeOrder:Move, Restore, x230 y430
Gui, theByeOrder:Add, Text, center y475 w570 x20 vFeedback gFeedback, Feedback
Gui, theByeOrder:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Edit AutoHotkeys - Closing - #byeorder

Gui, closingHK:destroy

GuiControl, theByeOrder:Focus, NewByeOrderText

VarSetCapacity( R, 16, 0 )

SendMessage, 0xB2,, % &R,, ahk_id %Edit%

x1:=NumGet( &R+0 ), y1:=NumGet( &R+4 )

x2:=NumGet( &R+8 ), y2:=NumGet( &R+12 )

NumPut( (x1+tp), &R, 0 ), NumPut( (y1+tp), &R, 4 )

NumPut( (x2+1), &R, 8 ), NumPut( (y2+y1+1), &R, 12 ) ; <-- compensation for upper padding

SendMessage, 0xB3, 0x0, % &R,, ahk_id %Edit%

Return

OutputByeOrder:
GuiControl, disable, OutputByeOrder
GuiControl, disable, ByeOrderDefault
GuiControl, disable, ClosingHotkeys
Gui, Submit, NoHide
Gui, Submit, NoHide

; create a list of your edit control vars

;need to check to make sure that the e-mail address is correct and also includes CustomInk.com

emptyfields = NewByeOrderText
loop, parse, emptyfields, `,, %A_Space% ; loop through the list
{
	GuiControlGet, OutputVar, Enabled, %A_LoopField%
		If !(%A_LoopField%) && OutputVar ; if the value of the variable whose name is saved in A_LoopField is empty and is enabled
		{
			if A_LoopField = NewByeOrderText
			{
			required = Your New Hotkey Text
			}
			
			MsgBox A required field is empty: %required% ; show error message
			GuiControl, enable, OutputByeOrder
			GuiControl, enable, ByeOrderDefault
			GuiControl, enable, ClosingHotkeys
			return						; stop
		}
}
;~ ; if you're here then all vars are not empty

gosub, EditByeOrder
Return

EditByeOrder:

; Save custom hotkey text to a text file.

theFile = %A_ScriptDir%\text_files\bye_order.txt

if FileExist(theFile) 
{
FileDelete, %theFile%
}

FileAppend, %NewByeOrderText%, %A_ScriptDir%\text_files\bye_order.txt

IniWrite, no, %ini%, origByeOrder, KEY1

TrayTip, Custom Hotkey Saved!, Your custom hotkey is ready to use..., , 3000
gosub, ClosingHotkeys
Return

$F9::return ; disabling F9 key while tool is open.

UserHotkeys01:
WinGetPos, Xpos, Ypos
IniRead, CustomHotkeyText1, %ini%, custHotkey01, KEY1
IniRead, CustomHotkeyCommand1, %ini%, custHotkey01, KEY2

if (CustomHotkeyText1 = "yes")
{
FileRead, UserHotkeyText1, %A_ScriptDir%\text_files\custHotkey01.txt
}

tp := 6

height = 500
GuiWidth = 600
CustHotkey = 1
theCustFilename = custHotkey01

Gui, userHotkeys01:Add, Picture, w180 h-1 vLogo gLogo, %A_ScriptDir%\images\ahk_manual.jpg
Gui, userHotkeys01:Add, Picture, w140 h-1 vOutputClose gUHOutputClose, %A_ScriptDir%\images\save.jpg
Gui, userHotkeys01:Add, Picture, w140 h-1 vGoBack gCustomList, %A_ScriptDir%\images\go_back.jpg
if (CustomHotkeyText1 = "yes")
{
Gui, userHotkeys01:Add, Picture, w140 h-1 vDelete gDeleteCustomHotkey, %A_ScriptDir%\images\delete.jpg
}
Gui, userHotkeys01:Color, FFFFFF
Gui, userHotkeys01:Font, S14, w700
Gui, userHotkeys01:Add, Text, center CGray x80 y129 w440, *Create Your Custom Hotkey*
Gui, userHotkeys01:Font, S12, w700
if (CustomHotkeyText1 = "yes")
{
Gui, userHotkeys01:Add, Edit, xs-10 CGray x115 y169 w370 h35 +0x200 hwndEdit vNewUserHotkeyCommand, %CustomHotkeyCommand1%
}
else
{
Gui, userHotkeys01:Add, Edit, xs-10 CGray x115 y169 w370 h35 +0x200 hwndEdit vNewUserHotkeyCommand, Enter the hotkey command starting with #.
}
Gui, userHotkeys01:Font, S12, w700
if (CustomHotkeyText1 = "yes")
{
Gui, userHotkeys01:Add, Edit, xs-10 CGray x80 y219 w440 h190 +0x200 hwndEdit vNewUserHotkeyText, %UserHotkeyText1%
}
else
{
Gui, userHotkeys01:Add, Edit, xs-10 CGray x80 y219 w440 h190 +0x200 hwndEdit vNewUserHotkeyText, Enter your hotkey text here.
}
Gui, userHotkeys01:Font, S10, w700
GuiControl, userHotkeys01:Move, Logo, x210
GuiControl, userHotkeys01:Move, OutputClose, x380 y430
GuiControl, userHotkeys01:Move, GoBack, x80 y430
if (CustomHotkeyText1 = "yes")
{
GuiControl, userHotkeys01:Move, Delete, x230 y430
}
Gui, userHotkeys01:Add, Text, center y475 w570 x20 vFeedback gFeedback, Feedback
Gui, userHotkeys01:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Add Custom Hotkey

Gui, theHotkeyChoice:destroy
Gui, theCustomList:destroy

GuiControl, userHotkeys01:Focus, NewUserHotkeyCommand

VarSetCapacity( R, 16, 0 )

SendMessage, 0xB2,, % &R,, ahk_id %Edit%

x1:=NumGet( &R+0 ), y1:=NumGet( &R+4 )

x2:=NumGet( &R+8 ), y2:=NumGet( &R+12 )

NumPut( (x1+tp), &R, 0 ), NumPut( (y1+tp), &R, 4 )

NumPut( (x2+1), &R, 8 ), NumPut( (y2+y1+1), &R, 12 ) ; <-- compensation for upper padding

SendMessage, 0xB3, 0x0, % &R,, ahk_id %Edit%

Return

UHOutputClose:
GuiControl, disable, OutputClose

if (CustHotkey = 1)
{
Gui, userHotkeys01:Submit, NoHide
}
else if (CustHotkey = 2)
{
Gui, userHotkeys02:Submit, NoHide
}
else if (CustHotkey = 3)
{
Gui, userHotkeys03:Submit, NoHide
}
else if (CustHotkey = 4)
{
Gui, userHotkeys04:Submit, NoHide
}
else if (CustHotkey = 5)
{
Gui, userHotkeys05:Submit, NoHide
}
else if (CustHotkey = 6)
{
Gui, userHotkeys06:Submit, NoHide
}
else if (CustHotkey = 7)
{
Gui, userHotkeys07:Submit, NoHide
}
else if (CustHotkey = 8)
{
Gui, userHotkeys08:Submit, NoHide
}
else if (CustHotkey = 9)
{
Gui, userHotkeys09:Submit, NoHide
}
else if (CustHotkey = 10)
{
Gui, userHotkeys10:Submit, NoHide
}



If (NewUserHotkeyCommand = "Enter the hotkey command starting with #.")
{
MsgBox Please enter a valid hotkey command	; show error message
			GuiControl, enable, OutputClose
			return						; stop
}

If (NewUserHotkeyText = "Enter your hotkey text here.")
{
MsgBox Please enter the text for your hotkey	; show error message
			GuiControl, enable, OutputClose
			return						; stop
}
	
	begOperator = #
	x := SubStr(NewUserHotkeyCommand, 1, 1)
	if (x = begOperator)
	{
	}
	else
	{
	MsgBox The hotkey command must start with #. Please try again.	; show error message
			GuiControl, enable, OutputClose
			return		
	}


emptyfields1 = NewUserHotkeyCommand, NewUserHotkeyText, 
loop, parse, emptyfields1, `,, %A_Space% 				; loop through the list
{
	GuiControlGet, OutputClose, Enabled, %A_LoopField%
		If !(%A_LoopField%) && OutputClose ; if the value of the variable whose name is saved in A_LoopField is empty and is enabled
		{
		if A_LoopField = NewUserHotkeyCommand
			{
			required = Hotkey Command
			}
			else if A_LoopField = NewUserHotkeyText
			{
			required = Hotkey Text
			}

			MsgBox A required field is empty: %required%	; show error message
			GuiControl, enable, OutputClose
			return						; stop
		}
}

emptyfields = #branding, #colormax, #combinecolors, #combinedesigns, #combinestyles, #cs, #designhelp, #designing, #designlink, #designsaved, #designteam, #dpi, #dpibulk, #dpisingles, #embroidery, #inkchange, #pers, #pms, #pmsdigital, #pps, #redraw, #retrieve, #rotate, #sleevehelp, #spvsdig, #subtleblank, #uploadhelp, #uploadwhite, #vss, #bulkperks, #byeorder, #checking, #close, #email, #followdesign, #followfix, #followorder, #followquote, #followup, #help, #heydesign, #heypricing, #me, #ooo, #singlesperks, #preaddress, #preconfirm, #precontact, #preshipping, #presingles, #vouchercode, #cancelorder, #checkinfo, #orderdone, #orderdonelink, #peml, #poinfo, #bands, #celebs, #collegeno, #collegeyes, #content, #disney, #greek, #offensive, #sports, #videogames, #watermark, #ap, #budget, #highprice, #pricehelp, #pq1, #pq2, #pq3, #pq4, #pq5, #quotebulk, #quoteonly, #quotesingles, #quotespec, #quote, #sleeveprice, #confirmfix, #crookedphoto, #crookedreport, #ghosting, #partial, #probfull, #probhelp, #probphoto, #probreturn, #probreview, #probsizing, #probtones, #swappackage, #voucher, #canadasingles, #minimum, #booster, #charity, #discount, #pear, #callforyou, #chatforyou, #allshipping, #dd, #international, #logistics, #rush, #sr, #standard, #bottles, #canadablanks, #cups, #glasses, #koozies, #magnets, #mousepads, #mugs, #paper, #pens, #sample, #stickers, #gof, #gofcancel, #gofprice, #gofsetup, #vsslink, #contentlink, #halftoneslink, #printlink, #contentno, #peml?, #gof$, #hiquote, #hidesign, #hidelivery, #createdesign, #hihelp 

loop, parse, emptyfields, `,, %A_Space% 				; loop through the list
{
	GuiControlGet, OutputClose, Enabled, %A_LoopField%
		If (NewUserHotkeyCommand = A_LoopField) 
		{
			MsgBox The hotkey command you've selected is already taken. Please enter a different command name.	; show error message
			GuiControl, enable, OutputClose
			return						; stop
		}
}

forbidden = #fuck, #beaner, #fucktard, #shit, #ass, #asshole, #assfuck, #asswipe, #bitch, #bitches, #bitchass, #blowjob, #buttfucker, #chink, #cock, #cocksucker, #cockface, #coon, #cum, #cuntrag, #dick, #dickhead, #dicks, #douche, #dyke, #dumbshit, #fag, #faggot, #fuckboy, #fuckface, #fucking, #fuckstick, #fuckwad, #gay, #gaywad, #goddamn, #gook, #horseshit, #honkey, #hoe, #jackass, #jerkoff, #jizz, #kyke, #kunt, #lesbian, #lesbo, #mothafucka, #muff, #niggers, #niglet, #nigga, #penis, #piss, #poon, #pussy, #pussies, #queer, #queef, #slut, #spic, #retard, #tard, #tits, #tit, #twat, #twats, #vag, #vagina, #whore, #wetback, #cunt, #damn, #bullshit, #motherfucker, #fucker, #nigger, #jew, #kike

loop, parse, forbidden, `,, %A_Space% 				; loop through the list
{
	GuiControlGet, OutputClose, Enabled, %A_LoopField%
		If (NewUserHotkeyCommand = A_LoopField) 
		{
			MsgBox This hotkey command you've entered is not work appropriate. Please enter a different term.	; show error message
			GuiControl, enable, OutputClose
			return						; stop
		}
}
gosub, PushCustomHotkey
Return

DeleteCustomHotkey:

theFile = %A_ScriptDir%\text_files\%theCustFilename%.txt

if FileExist(theFile) 
{
FileDelete, %theFile%
}

INI=%A_scriptdir%\settings.ini


IniRead, CustomHotkeyCommand1, %ini%, custHotkey01, KEY2, thecustHotkey01
IniRead, CustomHotkeyCommand2, %ini%, custHotkey02, KEY2, thecustHotkey02
IniRead, CustomHotkeyCommand3, %ini%, custHotkey03, KEY2, thecustHotkey03
IniRead, CustomHotkeyCommand4, %ini%, custHotkey04, KEY2, thecustHotkey04
IniRead, CustomHotkeyCommand5, %ini%, custHotkey05, KEY2, thecustHotkey05
IniRead, CustomHotkeyCommand6, %ini%, custHotkey06, KEY2, thecustHotkey06
IniRead, CustomHotkeyCommand7, %ini%, custHotkey07, KEY2, thecustHotkey07
IniRead, CustomHotkeyCommand8, %ini%, custHotkey08, KEY2, thecustHotkey08
IniRead, CustomHotkeyCommand9, %ini%, custHotkey09, KEY2, thecustHotkey09
IniRead, CustomHotkeyCommand10, %ini%, custHotkey10, KEY2, thecustHotkey10

FileRead, UserHotkeyText1, %A_ScriptDir%\text_files\custHotkey01.txt
if ErrorLevel
{
UserHotkeyText1 = Press F9 to set up your custom hotkeys!
}

FileRead, UserHotkeyText2, %A_ScriptDir%\text_files\custHotkey02.txt
if ErrorLevel
{
UserHotkeyText2 = Press F9 to set up your custom hotkeys!
}

FileRead, UserHotkeyText3, %A_ScriptDir%\text_files\custHotkey03.txt
if ErrorLevel
{
UserHotkeyText3 = Press F9 to set up your custom hotkeys!
}
FileRead, UserHotkeyText4, %A_ScriptDir%\text_files\custHotkey04.txt
if ErrorLevel
{
UserHotkeyText4 = Press F9 to set up your custom hotkeys!
}
FileRead, UserHotkeyText5, %A_ScriptDir%\text_files\custHotkey05.txt
if ErrorLevel
{
UserHotkeyText5 = Press F9 to set up your custom hotkeys!
}
FileRead, UserHotkeyText6, %A_ScriptDir%\text_files\custHotkey06.txt
if ErrorLevel
{
UserHotkeyText6 = Press F9 to set up your custom hotkeys!
}
FileRead, UserHotkeyText7, %A_ScriptDir%\text_files\custHotkey07.txt
if ErrorLevel
{
UserHotkeyText7 = Press F9 to set up your custom hotkeys!
}
FileRead, UserHotkeyText8, %A_ScriptDir%\text_files\custHotkey08.txt
if ErrorLevel
{
UserHotkeyText8 = Press F9 to set up your custom hotkeys!
}
FileRead, UserHotkeyText9, %A_ScriptDir%\text_files\custHotkey09.txt
if ErrorLevel
{
UserHotkeyText9 = Press F9 to set up your custom hotkeys!
}
FileRead, UserHotkeyText10, %A_ScriptDir%\text_files\custHotkey10.txt
if ErrorLevel
{
UserHotkeyText10 = Press F9 to set up your custom hotkeys!
}

if (theCustFilename = "custHotkey01")
{
opening := "("
closing := ")"
clipboard=
(
#Persistent
#NoTrayIcon

clipboard=
(
::thecustHotkey01::
clipboard=
%opening%
Press F9 to set up your custom hotkeys!
%closing%
send ^v
Return

::%CustomHotkeyCommand2%::
clipboard=
%opening%
%UserHotkeyText2%
%closing%
send ^v
Return

::%CustomHotkeyCommand3%::
clipboard=
%opening%
%UserHotkeyText3%
%closing%
send ^v
Return

::%CustomHotkeyCommand4%::
clipboard=
%opening%
%UserHotkeyText4%
%closing%
send ^v
Return

::%CustomHotkeyCommand5%::
clipboard=
%opening%
%UserHotkeyText5%
%closing%
send ^v
Return

::%CustomHotkeyCommand6%::
clipboard=
%opening%
%UserHotkeyText6%
%closing%
send ^v
Return

::%CustomHotkeyCommand7%::
clipboard=
%opening%
%UserHotkeyText7%
%closing%
send ^v
Return

::%CustomHotkeyCommand8%::
clipboard=
%opening%
%UserHotkeyText8%
%closing%
send ^v
Return

::%CustomHotkeyCommand9%::
clipboard=
%opening%	
%UserHotkeyText9%
%closing%
send ^v
Return

::%CustomHotkeyCommand10%::
clipboard=
%opening%
%UserHotkeyText10%
%closing%
send ^v
Return
)
}
else if (theCustFilename = "custHotkey03")
{
opening := "("
closing := ")"
clipboard=
(
#Persistent
#NoTrayIcon

::thecustHotkey03::
clipboard=
%opening%
Press F9 to set up your custom hotkeys!
%closing%
send ^v
Return

::%CustomHotkeyCommand1%::
clipboard=
%opening%
%UserHotkeyText1%
%closing%
send ^v
Return

::%CustomHotkeyCommand2%::
clipboard=
%opening%
%UserHotkeyText2%
%closing%
send ^v
Return

::%CustomHotkeyCommand4%::
clipboard=
%opening%
%UserHotkeyText4%
%closing%
send ^v
Return

::%CustomHotkeyCommand5%::
clipboard=
%opening%
%UserHotkeyText5%
%closing%
send ^v
Return

::%CustomHotkeyCommand6%::
clipboard=
%opening%
%UserHotkeyText6%
%closing%
send ^v
Return

::%CustomHotkeyCommand7%::
clipboard=
%opening%
%UserHotkeyText7%
%closing%
send ^v
Return

::%CustomHotkeyCommand8%::
clipboard=
%opening%
%UserHotkeyText8%
%closing%
send ^v
Return

::%CustomHotkeyCommand9%::
clipboard=
%opening%
%UserHotkeyText9%
%closing%
send ^v
Return

::%CustomHotkeyCommand10%::
clipboard=
%opening%
%UserHotkeyText10%
%closing%
send ^v
Return
)
}
else if (theCustFilename = "custHotkey02")
{
opening := "("
closing := ")"
clipboard=
(
#Persistent
#NoTrayIcon

::thecustHotkey02::
clipboard=
%opening%
Press F9 to set up your custom hotkeys!
%closing%
send ^v
Return

::%CustomHotkeyCommand1%::
clipboard=
%opening%
%UserHotkeyText1%
%closing%
send ^v
Return

::%CustomHotkeyCommand3%::
clipboard=
%opening%
%UserHotkeyText3%
%closing%
send ^v
Return

::%CustomHotkeyCommand4%::
clipboard=
%opening%
%UserHotkeyText4%
%closing%
send ^v
Return

::%CustomHotkeyCommand5%::
clipboard=
%opening%
%UserHotkeyText5%
%closing%
send ^v
Return

::%CustomHotkeyCommand6%::
clipboard=
%opening%
%UserHotkeyText6%
%closing%
send ^v
Return

::%CustomHotkeyCommand7%::
clipboard=
%opening%
%UserHotkeyText7%
%closing%
send ^v
Return

::%CustomHotkeyCommand8%::
clipboard=
%opening%
%UserHotkeyText8%
%closing%
send ^v
Return

::%CustomHotkeyCommand9%::
clipboard=
%opening%
%UserHotkeyText9%
%closing%
send ^v
Return

::%CustomHotkeyCommand10%::
clipboard=
%opening%
%UserHotkeyText10%
%closing%
send ^v
Return
)
}
else if (theCustFilename = "custHotkey04")
{
opening := "("
closing := ")"
clipboard=
(
#Persistent
#NoTrayIcon

::thecustHotkey04::
clipboard=
%opening%
Press F9 to set up your custom hotkeys!
%closing%
send ^v
Return

::%CustomHotkeyCommand2%::
clipboard=
%opening%
%UserHotkeyText2%
%closing%
send ^v
Return

::%CustomHotkeyCommand3%::
clipboard=
%opening%
%UserHotkeyText3%
%closing%
send ^v
Return

::%CustomHotkeyCommand1%::
clipboard=
%opening%
%UserHotkeyText1%
%closing%
send ^v
Return

::%CustomHotkeyCommand5%::
clipboard=
%opening%
%UserHotkeyText5%
%closing%
send ^v
Return

::%CustomHotkeyCommand6%::
clipboard=
%opening%
%UserHotkeyText6%
%closing%
send ^v
Return

::%CustomHotkeyCommand7%::
clipboard=
%opening%
%UserHotkeyText7%
%closing%
send ^v
Return

::%CustomHotkeyCommand8%::
clipboard=
%opening%
%UserHotkeyText8%
%closing%
send ^v
Return

::%CustomHotkeyCommand9%::
clipboard=
%opening%
%UserHotkeyText9%
%closing%
send ^v
Return

::%CustomHotkeyCommand10%::
clipboard=
%opening%
%UserHotkeyText10%
%closing%
send ^v
Return
)

}
else if (theCustFilename = "custHotkey05")
{
opening := "("
closing := ")"
clipboard=
(
#Persistent
#NoTrayIcon

::thecustHotkey05::
clipboard=
%opening%
Press F9 to set up your custom hotkeys!
%closing%
send ^v
Return

::%CustomHotkeyCommand2%::
clipboard=
%opening%
%UserHotkeyText2%
%closing%
send ^v
Return

::%CustomHotkeyCommand3%::
clipboard=
%opening%
%UserHotkeyText3%
%closing%
send ^v
Return

::%CustomHotkeyCommand4%::
clipboard=
%opening%
%UserHotkeyText4%
%closing%
send ^v
Return

::%CustomHotkeyCommand1%::
clipboard=
%opening%
%UserHotkeyText1%
%closing%
send ^v
Return

::%CustomHotkeyCommand6%::
clipboard=
%opening%
%UserHotkeyText6%
%closing%
send ^v
Return

::%CustomHotkeyCommand7%::
clipboard=
%opening%
%UserHotkeyText7%
%closing%
send ^v
Return

::%CustomHotkeyCommand8%::
clipboard=
%opening%
%UserHotkeyText8%
%closing%
send ^v
Return

::%CustomHotkeyCommand9%::
clipboard=
%opening%
%UserHotkeyText9%
%closing%
send ^v
Return

::%CustomHotkeyCommand10%::
clipboard=
%opening%
%UserHotkeyText10%
%closing%
send ^v
Return
)

}
else if (theCustFilename = "custHotkey06")
{
opening := "("
closing := ")"
clipboard=
(
#Persistent
#NoTrayIcon

::thecustHotkey06::
clipboard=
%opening%
Press F9 to set up your custom hotkeys!
%closing%
send ^v
Return

::%CustomHotkeyCommand2%::
clipboard=
%opening%
%UserHotkeyText2%
%closing%
send ^v
Return

::%CustomHotkeyCommand3%::
clipboard=
%opening%
%UserHotkeyText3%
%closing%
send ^v
Return

::%CustomHotkeyCommand4%::
clipboard=
%opening%
%UserHotkeyText4%
%closing%
send ^v
Return

::%CustomHotkeyCommand5%::
clipboard=
%opening%
%UserHotkeyText5%
%closing%
send ^v
Return

::%CustomHotkeyCommand1%::
clipboard=
%opening%
%UserHotkeyText1%
%closing%
send ^v
Return

::%CustomHotkeyCommand7%::
clipboard=
%opening%
%UserHotkeyText7%
%closing%
send ^v
Return

::%CustomHotkeyCommand8%::
clipboard=
%opening%
%UserHotkeyText8%
%closing%
send ^v
Return

::%CustomHotkeyCommand9%::
clipboard=
%opening%
%UserHotkeyText9%
%closing%
send ^v
Return

::%CustomHotkeyCommand10%::
clipboard=
%opening%
%UserHotkeyText10%
%closing%
send ^v
Return
)

}
else if (theCustFilename = "custHotkey07")
{
opening := "("
closing := ")"
clipboard=
(
#Persistent
#NoTrayIcon

::thecustHotkey07::
clipboard=
%opening%
Press F9 to set up your custom hotkeys!
%closing%
send ^v
Return

::%CustomHotkeyCommand2%::
clipboard=
%opening%
%UserHotkeyText2%
%closing%
send ^v
Return

::%CustomHotkeyCommand3%::
clipboard=
%opening%
%UserHotkeyText3%
%closing%
send ^v
Return

::%CustomHotkeyCommand1%::
clipboard=
%opening%
%UserHotkeyText1%
%closing%
send ^v
Return

::%CustomHotkeyCommand5%::
clipboard=
%opening%
%UserHotkeyText5%
%closing%
send ^v
Return

::%CustomHotkeyCommand6%::
clipboard=
%opening%
%UserHotkeyText6%
%closing%
send ^v
Return

::%CustomHotkeyCommand1%::
clipboard=
%opening%
%UserHotkeyText1%
%closing%
send ^v
Return

::%CustomHotkeyCommand8%::
clipboard=
%opening%
%UserHotkeyText8%
%closing%
send ^v
Return

::%CustomHotkeyCommand9%::
clipboard=
%opening%
%UserHotkeyText9%
%closing%
send ^v
Return

::%CustomHotkeyCommand10%::
clipboard=
%opening%
%UserHotkeyText10%
%closing%
send ^v
Return
)

}
else if (theCustFilename = "custHotkey08")
{
opening := "("
closing := ")"
clipboard=
(
#Persistent
#NoTrayIcon

::thecustHotkey08::
clipboard=
%opening%
Press F9 to set up your custom hotkeys!
%closing%
send ^v
Return

::%CustomHotkeyCommand2%::
clipboard=
%opening%
%UserHotkeyText2%
%closing%
send ^v
Return

::%CustomHotkeyCommand3%::
clipboard=
%opening%
%UserHotkeyText3%
%closing%
send ^v
Return

::%CustomHotkeyCommand1%::
clipboard=
%opening%
%UserHotkeyText1%
%closing%
send ^v
Return

::%CustomHotkeyCommand5%::
clipboard=
%opening%
%UserHotkeyText5%
%closing%
send ^v
Return

::%CustomHotkeyCommand6%::
clipboard=
%opening%
%UserHotkeyText6%
%closing%
send ^v
Return

::%CustomHotkeyCommand7%::
clipboard=
%opening%
%UserHotkeyText7%
%closing%
send ^v
Return

::%CustomHotkeyCommand1%::
clipboard=
%opening%
%UserHotkeyText1%
%closing%
send ^v
Return

::%CustomHotkeyCommand9%::
clipboard=
%opening%
%UserHotkeyText9%
%closing%
send ^v
Return

::%CustomHotkeyCommand10%::
clipboard=
%opening%
%UserHotkeyText10%
%closing%
send ^v
Return
)

}
else if (theCustFilename = "custHotkey09")
{
opening := "("
closing := ")"
clipboard=
(
#Persistent
#NoTrayIcon

::thecustHotkey09::
clipboard=
%opening%
Press F9 to set up your custom hotkeys!
%closing%
send ^v
Return

::%CustomHotkeyCommand2%::
clipboard=
%opening%
%UserHotkeyText2%
%closing%
send ^v
Return

::%CustomHotkeyCommand3%::
clipboard=
%opening%
%UserHotkeyText3%
%closing%
send ^v
Return

::%CustomHotkeyCommand1%::
clipboard=
%opening%
%UserHotkeyText1%
%closing%
send ^v
Return

::%CustomHotkeyCommand5%::
clipboard=
%opening%
%UserHotkeyText5%
%closing%
send ^v
Return

::%CustomHotkeyCommand6%::
clipboard=
%opening%
%UserHotkeyText6%
%closing%
send ^v
Return

::%CustomHotkeyCommand7%::
clipboard=
%opening%
%UserHotkeyText7%
%closing%
send ^v
Return

::%CustomHotkeyCommand8%::
clipboard=
%opening%
%UserHotkeyText8%
%closing%
send ^v
Return

::%CustomHotkeyCommand1%::
clipboard=
%opening%
%UserHotkeyText1%
%closing%
send ^v
Return

::%CustomHotkeyCommand10%::
clipboard=
%opening%
%UserHotkeyText10%
%closing%
send ^v
Return
)

}
else if (theCustFilename = "custHotkey10")
{
opening := "("
closing := ")"
clipboard=
(
#Persistent
#NoTrayIcon

::thecustHotkey10::
clipboard=
%opening%
Press F9 to set up your custom hotkeys!
%closing%
send ^v
Return

::%CustomHotkeyCommand2%::
clipboard=
%opening%
%UserHotkeyText2%
%closing%
send ^v
Return

::%CustomHotkeyCommand3%::
clipboard=
%opening%
%UserHotkeyText3%
%closing%
send ^v
Return

::%CustomHotkeyCommand1%::
clipboard=
%opening%
%UserHotkeyText1%
%closing%
send ^v
Return

::%CustomHotkeyCommand5%::
clipboard=
%opening%
%UserHotkeyText5%
%closing%
send ^v
Return

::%CustomHotkeyCommand6%::
clipboard=
%opening%
%UserHotkeyText6%
%closing%
send ^v
Return

::%CustomHotkeyCommand7%::
clipboard=
%opening%
%UserHotkeyText7%
%closing%
send ^v
Return

::%CustomHotkeyCommand8%::
clipboard=
%opening%
%UserHotkeyText8%
%closing%
send ^v
Return

::%CustomHotkeyCommand9%::
clipboard=
%opening%
%UserHotkeyText9%
%closing%
send ^v
Return

::%CustomHotkeyCommand1%::
clipboard=
%opening%
%UserHotkeyText1%
%closing%
send ^v
Return
)
}

replacing := Clipboard

closingFile = userCreated.ahk

	DetectHiddenWindows On
	SetTitleMatchMode RegEx
	IfWinExist, i)%closingFile%.* ahk_class AutoHotkey
		{
		WinClose
		WinWaitClose, i)%closingFile%.* ahk_class AutoHotkey, , 2
		}	

FileDelete, %A_ScriptDir%\userCreated.ahk

FileAppend, %replacing%, %A_ScriptDir%\userCreated.ahk

	
Run, %A_ScriptDir%\userCreated.ahk

; IniDelete, Filename, Section [, Key]

IniDelete, %A_ScriptDir%\settings.ini, %theCustFilename%,

gosub, CustomList
Return

PushCustomHotkey:

; Save custom hotkey text to a text file.

theFile = %A_ScriptDir%\text_files\%theCustFilename%.txt

if FileExist(theFile) 
{
FileDelete, %theFile%
}

FileAppend, %NewUserHotkeyText%, %A_ScriptDir%\text_files\%theCustFilename%.txt

INI=%A_scriptdir%\settings.ini


IniRead, CustomHotkeyCommand1, %ini%, custHotkey01, KEY2, thecustHotkey01
IniRead, CustomHotkeyCommand2, %ini%, custHotkey02, KEY2, thecustHotkey02
IniRead, CustomHotkeyCommand3, %ini%, custHotkey03, KEY2, thecustHotkey03
IniRead, CustomHotkeyCommand4, %ini%, custHotkey04, KEY2, thecustHotkey04
IniRead, CustomHotkeyCommand5, %ini%, custHotkey05, KEY2, thecustHotkey05
IniRead, CustomHotkeyCommand6, %ini%, custHotkey06, KEY2, thecustHotkey06
IniRead, CustomHotkeyCommand7, %ini%, custHotkey07, KEY2, thecustHotkey07
IniRead, CustomHotkeyCommand8, %ini%, custHotkey08, KEY2, thecustHotkey08
IniRead, CustomHotkeyCommand9, %ini%, custHotkey09, KEY2, thecustHotkey09
IniRead, CustomHotkeyCommand10, %ini%, custHotkey10, KEY2, thecustHotkey10

FileRead, UserHotkeyText1, %A_ScriptDir%\text_files\custHotkey01.txt
if ErrorLevel
{
UserHotkeyText1 = Press F9 to set up your custom hotkeys!
}

FileRead, UserHotkeyText2, %A_ScriptDir%\text_files\custHotkey02.txt
if ErrorLevel
{
UserHotkeyText2 = Press F9 to set up your custom hotkeys!
}

FileRead, UserHotkeyText3, %A_ScriptDir%\text_files\custHotkey03.txt
if ErrorLevel
{
UserHotkeyText3 = Press F9 to set up your custom hotkeys!
}
FileRead, UserHotkeyText4, %A_ScriptDir%\text_files\custHotkey04.txt
if ErrorLevel
{
UserHotkeyText4 = Press F9 to set up your custom hotkeys!
}
FileRead, UserHotkeyText5, %A_ScriptDir%\text_files\custHotkey05.txt
if ErrorLevel
{
UserHotkeyText5 = Press F9 to set up your custom hotkeys!
}
FileRead, UserHotkeyText6, %A_ScriptDir%\text_files\custHotkey06.txt
if ErrorLevel
{
UserHotkeyText6 = Press F9 to set up your custom hotkeys!
}
FileRead, UserHotkeyText7, %A_ScriptDir%\text_files\custHotkey07.txt
if ErrorLevel
{
UserHotkeyText7 = Press F9 to set up your custom hotkeys!
}
FileRead, UserHotkeyText8, %A_ScriptDir%\text_files\custHotkey08.txt
if ErrorLevel
{
UserHotkeyText8 = Press F9 to set up your custom hotkeys!
}
FileRead, UserHotkeyText9, %A_ScriptDir%\text_files\custHotkey09.txt
if ErrorLevel
{
UserHotkeyText9 = Press F9 to set up your custom hotkeys!
}
FileRead, UserHotkeyText10, %A_ScriptDir%\text_files\custHotkey10.txt
if ErrorLevel
{
UserHotkeyText10 = Press F9 to set up your custom hotkeys!
}

if (theCustFilename = "custHotkey01")
{
exiting = customlist
opening := "("
closing := ")"
clipboard=
(
#Persistent
#NoTrayIcon

::%NewUserHotkeyCommand%::
clipboard=
%opening%
%NewUserHotkeyText%
%closing%
send ^v
Return

::%CustomHotkeyCommand2%::
clipboard=
%opening%
%UserHotkeyText2%
%closing%
send ^v
Return

::%CustomHotkeyCommand3%::
clipboard=
%opening%
%UserHotkeyText3%
%closing%
send ^v
Return

::%CustomHotkeyCommand4%::
clipboard=
%opening%
%UserHotkeyText4%
%closing%
send ^v
Return

::%CustomHotkeyCommand5%::
clipboard=
%opening%
%UserHotkeyText5%
%closing%
send ^v
Return

::%CustomHotkeyCommand6%::
clipboard=
%opening%
%UserHotkeyText6%
%closing%
send ^v
Return

::%CustomHotkeyCommand7%::
clipboard=
%opening%
%UserHotkeyText7%
%closing%
send ^v
Return

::%CustomHotkeyCommand8%::
clipboard=
%opening%
%UserHotkeyText8%
%closing%
send ^v
Return

::%CustomHotkeyCommand9%::
clipboard=
%opening%	
%UserHotkeyText9%
%closing%
send ^v
Return

::%CustomHotkeyCommand10%::
clipboard=
%opening%
%UserHotkeyText10%
%closing%
send ^v
Return
)
}
else if (theCustFilename = "custHotkey03")
{
exiting = customlist
opening := "("
closing := ")"
clipboard=
(
#Persistent
#NoTrayIcon

::%NewUserHotkeyCommand%::
clipboard=
%opening%
%NewUserHotkeyText%
%closing%
send ^v
Return

::%CustomHotkeyCommand1%::
clipboard=
%opening%
%UserHotkeyText1%
%closing%
send ^v
Return

::%CustomHotkeyCommand2%::
clipboard=
%opening%
%UserHotkeyText2%
%closing%
send ^v
Return

::%CustomHotkeyCommand4%::
clipboard=
%opening%
%UserHotkeyText4%
%closing%
send ^v
Return

::%CustomHotkeyCommand5%::
clipboard=
%opening%
%UserHotkeyText5%
%closing%
send ^v
Return

::%CustomHotkeyCommand6%::
clipboard=
%opening%
%UserHotkeyText6%
%closing%
send ^v
Return

::%CustomHotkeyCommand7%::
clipboard=
%opening%
%UserHotkeyText7%
%closing%
send ^v
Return

::%CustomHotkeyCommand8%::
clipboard=
%opening%
%UserHotkeyText8%
%closing%
send ^v
Return

::%CustomHotkeyCommand9%::
clipboard=
%opening%
%UserHotkeyText9%
%closing%
send ^v
Return

::%CustomHotkeyCommand10%::
clipboard=
%opening%
%UserHotkeyText10%
%closing%
send ^v
Return
)
}
else if (theCustFilename = "custHotkey02")
{
exiting = customlist
opening := "("
closing := ")"
clipboard=
(
#Persistent
#NoTrayIcon

::%NewUserHotkeyCommand%::
clipboard=
%opening%
%NewUserHotkeyText%
%closing%
send ^v
Return

::%CustomHotkeyCommand1%::
clipboard=
%opening%
%UserHotkeyText1%
%closing%
send ^v
Return

::%CustomHotkeyCommand3%::
clipboard=
%opening%
%UserHotkeyText3%
%closing%
send ^v
Return

::%CustomHotkeyCommand4%::
clipboard=
%opening%
%UserHotkeyText4%
%closing%
send ^v
Return

::%CustomHotkeyCommand5%::
clipboard=
%opening%
%UserHotkeyText5%
%closing%
send ^v
Return

::%CustomHotkeyCommand6%::
clipboard=
%opening%
%UserHotkeyText6%
%closing%
send ^v
Return

::%CustomHotkeyCommand7%::
clipboard=
%opening%
%UserHotkeyText7%
%closing%
send ^v
Return

::%CustomHotkeyCommand8%::
clipboard=
%opening%
%UserHotkeyText8%
%closing%
send ^v
Return

::%CustomHotkeyCommand9%::
clipboard=
%opening%
%UserHotkeyText9%
%closing%
send ^v
Return

::%CustomHotkeyCommand10%::
clipboard=
%opening%
%UserHotkeyText10%
%closing%
send ^v
Return
)
}
else if (theCustFilename = "custHotkey04")
{
exiting = customlist
opening := "("
closing := ")"
clipboard=
(
#Persistent
#NoTrayIcon

::%NewUserHotkeyCommand%::
clipboard=
%opening%
%NewUserHotkeyText%
%closing%
send ^v
Return

::%CustomHotkeyCommand2%::
clipboard=
%opening%
%UserHotkeyText2%
%closing%
send ^v
Return

::%CustomHotkeyCommand3%::
clipboard=
%opening%
%UserHotkeyText3%
%closing%
send ^v
Return

::%CustomHotkeyCommand1%::
clipboard=
%opening%
%UserHotkeyText1%
%closing%
send ^v
Return

::%CustomHotkeyCommand5%::
clipboard=
%opening%
%UserHotkeyText5%
%closing%
send ^v
Return

::%CustomHotkeyCommand6%::
clipboard=
%opening%
%UserHotkeyText6%
%closing%
send ^v
Return

::%CustomHotkeyCommand7%::
clipboard=
%opening%
%UserHotkeyText7%
%closing%
send ^v
Return

::%CustomHotkeyCommand8%::
clipboard=
%opening%
%UserHotkeyText8%
%closing%
send ^v
Return

::%CustomHotkeyCommand9%::
clipboard=
%opening%
%UserHotkeyText9%
%closing%
send ^v
Return

::%CustomHotkeyCommand10%::
clipboard=
%opening%
%UserHotkeyText10%
%closing%
send ^v
Return
)

}
else if (theCustFilename = "custHotkey05")
{
exiting = customlist
opening := "("
closing := ")"
clipboard=
(
#Persistent
#NoTrayIcon

::%NewUserHotkeyCommand%::
clipboard=
%opening%
%NewUserHotkeyText%
%closing%
send ^v
Return

::%CustomHotkeyCommand2%::
clipboard=
%opening%
%UserHotkeyText2%
%closing%
send ^v
Return

::%CustomHotkeyCommand3%::
clipboard=
%opening%
%UserHotkeyText3%
%closing%
send ^v
Return

::%CustomHotkeyCommand4%::
clipboard=
%opening%
%UserHotkeyText4%
%closing%
send ^v
Return

::%CustomHotkeyCommand1%::
clipboard=
%opening%
%UserHotkeyText1%
%closing%
send ^v
Return

::%CustomHotkeyCommand6%::
clipboard=
%opening%
%UserHotkeyText6%
%closing%
send ^v
Return

::%CustomHotkeyCommand7%::
clipboard=
%opening%
%UserHotkeyText7%
%closing%
send ^v
Return

::%CustomHotkeyCommand8%::
clipboard=
%opening%
%UserHotkeyText8%
%closing%
send ^v
Return

::%CustomHotkeyCommand9%::
clipboard=
%opening%
%UserHotkeyText9%
%closing%
send ^v
Return

::%CustomHotkeyCommand10%::
clipboard=
%opening%
%UserHotkeyText10%
%closing%
send ^v
Return
)

}
else if (theCustFilename = "custHotkey06")
{
exiting = customlist2
opening := "("
closing := ")"
clipboard=
(
#Persistent
#NoTrayIcon

::%NewUserHotkeyCommand%::
clipboard=
%opening%
%NewUserHotkeyText%
%closing%
send ^v
Return

::%CustomHotkeyCommand2%::
clipboard=
%opening%
%UserHotkeyText2%
%closing%
send ^v
Return

::%CustomHotkeyCommand3%::
clipboard=
%opening%
%UserHotkeyText3%
%closing%
send ^v
Return

::%CustomHotkeyCommand4%::
clipboard=
%opening%
%UserHotkeyText4%
%closing%
send ^v
Return

::%CustomHotkeyCommand5%::
clipboard=
%opening%
%UserHotkeyText5%
%closing%
send ^v
Return

::%CustomHotkeyCommand1%::
clipboard=
%opening%
%UserHotkeyText1%
%closing%
send ^v
Return

::%CustomHotkeyCommand7%::
clipboard=
%opening%
%UserHotkeyText7%
%closing%
send ^v
Return

::%CustomHotkeyCommand8%::
clipboard=
%opening%
%UserHotkeyText8%
%closing%
send ^v
Return

::%CustomHotkeyCommand9%::
clipboard=
%opening%
%UserHotkeyText9%
%closing%
send ^v
Return

::%CustomHotkeyCommand10%::
clipboard=
%opening%
%UserHotkeyText10%
%closing%
send ^v
Return
)

}
else if (theCustFilename = "custHotkey07")
{
exiting = customlist2
opening := "("
closing := ")"
clipboard=
(
#Persistent
#NoTrayIcon

::%NewUserHotkeyCommand%::
clipboard=
%opening%
%NewUserHotkeyText%
%closing%
send ^v
Return

::%CustomHotkeyCommand2%::
clipboard=
%opening%
%UserHotkeyText2%
%closing%
send ^v
Return

::%CustomHotkeyCommand3%::
clipboard=
%opening%
%UserHotkeyText3%
%closing%
send ^v
Return

::%CustomHotkeyCommand1%::
clipboard=
%opening%
%UserHotkeyText1%
%closing%
send ^v
Return

::%CustomHotkeyCommand5%::
clipboard=
%opening%
%UserHotkeyText5%
%closing%
send ^v
Return

::%CustomHotkeyCommand6%::
clipboard=
%opening%
%UserHotkeyText6%
%closing%
send ^v
Return

::%CustomHotkeyCommand1%::
clipboard=
%opening%
%UserHotkeyText1%
%closing%
send ^v
Return

::%CustomHotkeyCommand8%::
clipboard=
%opening%
%UserHotkeyText8%
%closing%
send ^v
Return

::%CustomHotkeyCommand9%::
clipboard=
%opening%
%UserHotkeyText9%
%closing%
send ^v
Return

::%CustomHotkeyCommand10%::
clipboard=
%opening%
%UserHotkeyText10%
%closing%
send ^v
Return
)

}
else if (theCustFilename = "custHotkey08")
{
exiting = customlist2
opening := "("
closing := ")"
clipboard=
(
#Persistent
#NoTrayIcon

::%NewUserHotkeyCommand%::
clipboard=
%opening%
%NewUserHotkeyText%
%closing%
send ^v
Return

::%CustomHotkeyCommand2%::
clipboard=
%opening%
%UserHotkeyText2%
%closing%
send ^v
Return

::%CustomHotkeyCommand3%::
clipboard=
%opening%
%UserHotkeyText3%
%closing%
send ^v
Return

::%CustomHotkeyCommand1%::
clipboard=
%opening%
%UserHotkeyText1%
%closing%
send ^v
Return

::%CustomHotkeyCommand5%::
clipboard=
%opening%
%UserHotkeyText5%
%closing%
send ^v
Return

::%CustomHotkeyCommand6%::
clipboard=
%opening%
%UserHotkeyText6%
%closing%
send ^v
Return

::%CustomHotkeyCommand7%::
clipboard=
%opening%
%UserHotkeyText7%
%closing%
send ^v
Return

::%CustomHotkeyCommand1%::
clipboard=
%opening%
%UserHotkeyText1%
%closing%
send ^v
Return

::%CustomHotkeyCommand9%::
clipboard=
%opening%
%UserHotkeyText9%
%closing%
send ^v
Return

::%CustomHotkeyCommand10%::
clipboard=
%opening%
%UserHotkeyText10%
%closing%
send ^v
Return
)

}
else if (theCustFilename = "custHotkey09")
{
exiting = customlist2
opening := "("
closing := ")"
clipboard=
(
#Persistent
#NoTrayIcon

::%NewUserHotkeyCommand%::
clipboard=
%opening%
%NewUserHotkeyText%
%closing%
send ^v
Return

::%CustomHotkeyCommand2%::
clipboard=
%opening%
%UserHotkeyText2%
%closing%
send ^v
Return

::%CustomHotkeyCommand3%::
clipboard=
%opening%
%UserHotkeyText3%
%closing%
send ^v
Return

::%CustomHotkeyCommand1%::
clipboard=
%opening%
%UserHotkeyText1%
%closing%
send ^v
Return

::%CustomHotkeyCommand5%::
clipboard=
%opening%
%UserHotkeyText5%
%closing%
send ^v
Return

::%CustomHotkeyCommand6%::
clipboard=
%opening%
%UserHotkeyText6%
%closing%
send ^v
Return

::%CustomHotkeyCommand7%::
clipboard=
%opening%
%UserHotkeyText7%
%closing%
send ^v
Return

::%CustomHotkeyCommand8%::
clipboard=
%opening%
%UserHotkeyText8%
%closing%
send ^v
Return

::%CustomHotkeyCommand1%::
clipboard=
%opening%
%UserHotkeyText1%
%closing%
send ^v
Return

::%CustomHotkeyCommand10%::
clipboard=
%opening%
%UserHotkeyText10%
%closing%
send ^v
Return
)

}
else if (theCustFilename = "custHotkey10")
{
exiting = customlist2
opening := "("
closing := ")"
clipboard=
(
#Persistent
#NoTrayIcon

::%NewUserHotkeyCommand%::
clipboard=
%opening%
%NewUserHotkeyText%
%closing%
send ^v
Return

::%CustomHotkeyCommand2%::
clipboard=
%opening%
%UserHotkeyText2%
%closing%
send ^v
Return

::%CustomHotkeyCommand3%::
clipboard=
%opening%
%UserHotkeyText3%
%closing%
send ^v
Return

::%CustomHotkeyCommand1%::
clipboard=
%opening%
%UserHotkeyText1%
%closing%
send ^v
Return

::%CustomHotkeyCommand5%::
clipboard=
%opening%
%UserHotkeyText5%
%closing%
send ^v
Return

::%CustomHotkeyCommand6%::
clipboard=
%opening%
%UserHotkeyText6%
%closing%
send ^v
Return

::%CustomHotkeyCommand7%::
clipboard=
%opening%
%UserHotkeyText7%
%closing%
send ^v
Return

::%CustomHotkeyCommand8%::
clipboard=
%opening%
%UserHotkeyText8%
%closing%
send ^v
Return

::%CustomHotkeyCommand9%::
clipboard=
%opening%
%UserHotkeyText9%
%closing%
send ^v
Return

::%CustomHotkeyCommand1%::
clipboard=
%opening%
%UserHotkeyText1%
%closing%
send ^v
Return
)
}

replacing := Clipboard

closingFile = userCreated.ahk

	DetectHiddenWindows On
	SetTitleMatchMode RegEx
	IfWinExist, i)%closingFile%.* ahk_class AutoHotkey
		{
		WinClose
		WinWaitClose, i)%closingFile%.* ahk_class AutoHotkey, , 2
		}	

FileDelete, %A_ScriptDir%\userCreated.ahk

FileAppend, %replacing%, %A_ScriptDir%\userCreated.ahk

	
Run, %A_ScriptDir%\userCreated.ahk

IniWrite, yes, %ini%, %theCustFilename%, KEY1
IniWrite, %NewUserHotkeyCommand%, %ini%, %theCustFilename%, KEY2

TrayTip, Custom Hotkey Saved!, Your custom hotkey is ready to use..., , 3000

gosub, CustomList
Return

CustomChat:
WinGetPos, Xpos, Ypos
height = 500
GuiWidth = 600

Gui, theCustomChat:Add, Picture, w180 h-1 vLogo gLogo, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theCustomChat:Add, Picture, w140 h-1 vGoBack gCustom, %A_ScriptDir%\images\go_back.jpg
Gui, theCustomChat:Add, Picture, w140 h-1 vExit gGuiClose, %A_ScriptDir%\images\exit.jpg
Gui, theCustomChat:Add, Picture, w140 h-1 vNext gCustomChat2, %A_ScriptDir%\images\next.jpg
Gui, theCustomChat:Color, FFFFFF
Gui, theCustomChat:Font, S24, w700
Gui, theCustomChat:Add, Text, center CGray x20 y129 w550, Click on a Hotkey to edit
Gui, theCustomChat:Font, S14, w700
Gui, theCustomChat:Add, Text, center CGray x175 y+30 w250 gAltN, Simple Intro / Name
Gui, theCustomChat:Add, Text, center CGray x175 y+20 w250 gAltI, Simple Intro / No Name
Gui, theCustomChat:Add, Text, center CGray x175 y+20 w250 gAltH, Survey Greeting / Name
Gui, theCustomChat:Add, Text, center CGray x175 y+20 w250 gAltS, Survey Greeting / No Name
Gui, theCustomChat:Add, Text, center CGray x175 y+20 w250 gAltX, Goodbye Survey
Gui, theCustomChat:Font, S10, w700
GuiControl, theCustomChat:Move, Logo, x210
GuiControl, theCustomChat:Move, Exit, x230 y430
GuiControl, theCustomChat:Move, GoBack, x80 y430
GuiControl, theCustomChat:Move, Next, x380 y430
Gui, theCustomChat:Add, Text, center y475 w570 x20 vFeedback gFeedback, Feedback
Gui, theCustomChat:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Edit AutoHotkeys - Chat Hotkeys

Gui, theCustom:destroy
Gui, theAltN:destroy
Gui, theAltI:destroy
Gui, theAltH:destroy
Gui, theAltS:destroy
Gui, theAltX:destroy
Gui, theHotkeyChoice:destroy
Gui, theCustomChat2:destroy
Return

CustomChat2:
WinGetPos, Xpos, Ypos
height = 500
GuiWidth = 600

Gui, theCustomChat2:Add, Picture, w180 h-1 vLogo gLogo, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theCustomChat2:Add, Picture, w140 h-1 vGoBack gCustomChat, %A_ScriptDir%\images\go_back.jpg
Gui, theCustomChat2:Add, Picture, w140 h-1 vExit gGuiClose, %A_ScriptDir%\images\exit.jpg
Gui, theCustomChat2:Color, FFFFFF
Gui, theCustomChat2:Font, S24, w700
Gui, theCustomChat2:Add, Text, center CGray x20 y129 w550, Click on a Hotkey to edit
Gui, theCustomChat2:Font, S14, w700
Gui, theCustomChat2:Add, Text, center CGray x175 y+30 w250 gAltD, Discounts
Gui, theCustomChat2:Add, Text, center CGray x175 y+20 w250 gAltG, Group Order Form
Gui, theCustomChat2:Add, Text, center CGray x175 y+20 w250 gAltZ, International
Gui, theCustomChat2:Add, Text, center CGray x175 y+20 w250 gAltC, No Communication
Gui, theCustomChat2:Add, Text, center CGray x175 y+20 w250 gAltB, Unresponsive
Gui, theCustomChat2:Font, S10, w700
GuiControl, theCustomChat2:Move, Logo, x210
GuiControl, theCustomChat2:Move, Exit, x230 y430
GuiControl, theCustomChat2:Move, GoBack, x80 y430
Gui, theCustomChat2:Add, Text, center y475 w570 x20 vFeedback gFeedback, Feedback
Gui, theCustomChat2:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Edit AutoHotkeys - Chat Hotkeys

Gui, theCustom:destroy
Gui, theAltD:destroy
Gui, theAltG:destroy
Gui, theAltZ:destroy
Gui, theAltC:destroy
Gui, theAltB:destroy
Gui, theHotkeyChoice:destroy
Gui, theCustomChat:destroy
Return

AltN:
WinGetPos, Xpos, Ypos
IniRead, CustomAltN, %ini%, origAltN, KEY1

if (CustomAltN = "no")
{

FileRead, Close, %A_ScriptDir%\text_files\AltN.txt

}
else
{
Close = Hi $!{vars.get("identifier")}! Thanks for chatting with CustomInk. I'm more than happy to personally help you with anything you may need!

}
tp := 6

height = 500
GuiWidth = 600

Gui, theAltN:Add, Picture, w180 h-1 vLogo gLogo, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theAltN:Add, Picture, w140 h-1 vOutputAltN gOutputAltN, %A_ScriptDir%\images\save.jpg
Gui, theAltN:Add, Picture, w140 h-1 vGoBack gCustomChat, %A_ScriptDir%\images\go_back.jpg
Gui, theAltN:Add, Picture, w140 h-1 vRestore gAltNDefault, %A_ScriptDir%\images\restore_default.jpg
Gui, theAltN:Color, FFFFFF
Gui, theAltN:Font, S18, w700
Gui, theAltN:Add, Text, center CGray x20 y129 w550, Current text for Hotkey Alt+N
Gui, theAltN:Font, S10, w700
Gui, theAltN:Add, Edit, xs-10 CGray x80 y169 w440 h190 +0x200 hwndEdit vNewAltN, %Close%
Gui, theAltN:Font, S10, w700
Gui, theAltN:Add, Text, center CGray x80 y370 w440, *Enter the new text for Alt+N*
Gui, theAltN:Add, Text, CGray vOpening, Use     
Gui, theAltN:Add, Text, CGray vEnding, to list the customer's name.  
Gui, theAltN:Font, S10, w900              
Gui, theAltN:Add, Text, Cred vCust w100, $!{vars.get("identifier")}
GuiControl, theAltN:Move, Logo, x210
GuiControl, theAltN:Move, Cust, x165 y395
GuiControl, theAltN:Move, Opening, x135 y395
GuiControl, theAltN:Move, Ending, x310 y395
GuiControl, theAltN:Move, OutputAltN, x380 y430
GuiControl, theAltN:Move, GoBack, x80 y430
GuiControl, theAltN:Move, Restore, x230 y430
Gui, theAltN:Add, Text, center y475 w570 x20 vFeedback gFeedback, Feedback
Gui, theAltN:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Edit AutoHotkeys - Chat - Alt+N

Gui, theCustomChat:destroy


GuiControl, theAltN:Focus, NewAltN

VarSetCapacity( R, 16, 0 )

SendMessage, 0xB2,, % &R,, ahk_id %Edit%

x1:=NumGet( &R+0 ), y1:=NumGet( &R+4 )

x2:=NumGet( &R+8 ), y2:=NumGet( &R+12 )

NumPut( (x1+tp), &R, 0 ), NumPut( (y1+tp), &R, 4 )

NumPut( (x2+1), &R, 8 ), NumPut( (y2+y1+1), &R, 12 ) ; <-- compensation for upper padding

SendMessage, 0xB3, 0x0, % &R,, ahk_id %Edit%

Return

AltNDefault:
IniWrite, yes, %ini%, origAltN, KEY1
TrayTip, Custom Hotkey Restored to Default!, Alt+N has been restored to the default text..., , 3000
gosub, CustomChat
Return

OutputAltN:
GuiControl, disable, OutputAltN
GuiControl, disable, AltNDefault
Gui, Submit, NoHide

; create a list of your edit control vars

;need to check to make sure that the e-mail address is correct and also includes CustomInk.com

emptyfields = NewAltN
loop, parse, emptyfields, `,, %A_Space% 				; loop through the list
{
	GuiControlGet, OutputVar, Enabled, %A_LoopField%
		If !(%A_LoopField%) && OutputVar ; if the value of the variable whose name is saved in A_LoopField is empty and is enabled
		{
			if A_LoopField = NewAltN
			{
			required = Your New Hotkey Text
			}
			
			MsgBox A required field is empty: %required%	; show error message
			GuiControl, enable, OutputAltN
			GuiControl, enable, AltNDefault
			return						; stop
		}
}
;~ ; if you're here then all vars are not empty

gosub, EditAltN
Return

EditAltN:
; Save custom hotkey text to a text file.

theFile = %A_ScriptDir%\text_files\AltN.txt

if FileExist(theFile) 
{
FileDelete, %theFile%
}

FileAppend, %NewAltN%, %A_ScriptDir%\text_files\AltN.txt

IniWrite, no, %ini%, origAltN, KEY1

TrayTip, Custom Hotkey Saved!, Your custom Alt+N hotkey is ready to use..., , 3000
gosub, CustomChat
Return

AltI:
WinGetPos, Xpos, Ypos
IniRead, CustomAltI, %ini%, origAltI, KEY1

if (CustomAltI = "no")
{

FileRead, Close, %A_ScriptDir%\text_files\AltI.txt

}
else
{
Close = Hey there, thanks for chatting with CustomInk! I'm more than happy to personally help with anything you may need!

}
tp := 6

height = 500
GuiWidth = 600

Gui, theAltI:Add, Picture, w180 h-1 vLogo gLogo, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theAltI:Add, Picture, w140 h-1 vOutputAltI gOutputAltI, %A_ScriptDir%\images\save.jpg
Gui, theAltI:Add, Picture, w140 h-1 vGoBack gCustomChat, %A_ScriptDir%\images\go_back.jpg
Gui, theAltI:Add, Picture, w140 h-1 vRestore gAltIDefault, %A_ScriptDir%\images\restore_default.jpg
Gui, theAltI:Color, FFFFFF
Gui, theAltI:Font, S18, w700
Gui, theAltI:Add, Text, center CGray x20 y129 w550, Current text for Hotkey Alt+I
Gui, theAltI:Font, S10, w700
Gui, theAltI:Add, Edit, xs-10 CGray x80 y169 w440 h190 +0x200 hwndEdit vNewAltI, %Close%
Gui, theAltI:Font, S10, w700
Gui, theAltI:Add, Text, center CGray x80 y370 w440, *Enter the new text for Alt+I*
GuiControl, theAltI:Move, Logo, x210
GuiControl, theAltI:Move, OutputAltI, x380 y430
GuiControl, theAltI:Move, GoBack, x80 y430
GuiControl, theAltI:Move, Restore, x230 y430
Gui, theAltI:Add, Text, center y475 w570 x20 vFeedback gFeedback, Feedback
Gui, theAltI:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Edit AutoHotkeys - Chat - Alt+I

Gui, theCustomChat:destroy


GuiControl, theAltI:Focus, NewAltI

VarSetCapacity( R, 16, 0 )

SendMessage, 0xB2,, % &R,, ahk_id %Edit%

x1:=NumGet( &R+0 ), y1:=NumGet( &R+4 )

x2:=NumGet( &R+8 ), y2:=NumGet( &R+12 )

NumPut( (x1+tp), &R, 0 ), NumPut( (y1+tp), &R, 4 )

NumPut( (x2+1), &R, 8 ), NumPut( (y2+y1+1), &R, 12 ) ; <-- compensation for upper padding

SendMessage, 0xB3, 0x0, % &R,, ahk_id %Edit%

Return

AltIDefault:
IniWrite, yes, %ini%, origAltI, KEY1
TrayTip, Custom Hotkey Restored to Default!, Alt+I has been restored to the default text..., , 3000
gosub, CustomChat
Return

OutputAltI:
GuiControl, disable, OutputAltI
GuiControl, disable, AltIDefault
Gui, Submit, NoHide

; create a list of your edit control vars

;need to check to make sure that the e-mail address is correct and also includes CustomInk.com

emptyfields = NewAltI
loop, parse, emptyfields, `,, %A_Space% 				; loop through the list
{
	GuiControlGet, OutputVar, Enabled, %A_LoopField%
		If !(%A_LoopField%) && OutputVar ; if the value of the variable whose name is saved in A_LoopField is empty and is enabled
		{
			if A_LoopField = NewAltI
			{
			required = Your New Hotkey Text
			}
			
			MsgBox A required field is empty: %required%	; show error message
			GuiControl, enable, OutputAltI
			GuiControl, enable, AltIDefault
			return						; stop
		}
}
;~ ; if you're here then all vars are not empty

gosub, EditAltI
Return

EditAltI:
; Save custom hotkey text to a text file.

theFile = %A_ScriptDir%\text_files\AltI.txt

if FileExist(theFile) 
{
FileDelete, %theFile%
}

FileAppend, %NewAltI%, %A_ScriptDir%\text_files\AltI.txt

IniWrite, no, %ini%, origAltI, KEY1

TrayTip, Custom Hotkey Saved!, Your custom Alt+I hotkey is ready to use..., , 3000
gosub, CustomChat
Return

AltH:
WinGetPos, Xpos, Ypos
IniRead, CustomAltH, %ini%, origAltH, KEY1

if (CustomAltH = "no")
{

FileRead, Close, %A_ScriptDir%\text_files\AltH.txt

}
else
{
Close = Hi $!{vars.get("identifier")}! Thank you for chatting with CustomInk! I'll quickly review the form you filled out to see what I can personally help you with today.

}
tp := 6

height = 500
GuiWidth = 600

Gui, theAltH:Add, Picture, w180 h-1 vLogo gLogo, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theAltH:Add, Picture, w140 h-1 vOutputAltH gOutputAltH, %A_ScriptDir%\images\save.jpg
Gui, theAltH:Add, Picture, w140 h-1 vGoBack gCustomChat, %A_ScriptDir%\images\go_back.jpg
Gui, theAltH:Add, Picture, w140 h-1 vRestore gAltHDefault, %A_ScriptDir%\images\restore_default.jpg
Gui, theAltH:Color, FFFFFF
Gui, theAltH:Font, S18, w700
Gui, theAltH:Add, Text, center CGray x20 y129 w550, Current text for Hotkey Alt+H
Gui, theAltH:Font, S10, w700
Gui, theAltH:Add, Edit, xs-10 CGray x80 y169 w440 h190 +0x200 hwndEdit vNewAltH, %Close%
Gui, theAltH:Font, S10, w700
Gui, theAltH:Add, Text, center CGray x80 y370 w440, *Enter the new text for Alt+H*
Gui, theAltH:Add, Text, CGray vOpening, Use     
Gui, theAltH:Add, Text, CGray vEnding, to list the customer's name.  
Gui, theAltH:Font, S10, w900              
Gui, theAltH:Add, Text, Cred vCust w100, $!{vars.get("identifier")}
GuiControl, theAltH:Move, Logo, x210
GuiControl, theAltH:Move, Cust, x165 y395
GuiControl, theAltH:Move, Opening, x135 y395
GuiControl, theAltH:Move, Ending, x310 y395
GuiControl, theAltH:Move, OutputAltH, x380 y430
GuiControl, theAltH:Move, GoBack, x80 y430
GuiControl, theAltH:Move, Restore, x230 y430
Gui, theAltH:Add, Text, center y475 w570 x20 vFeedback gFeedback, Feedback
Gui, theAltH:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Edit AutoHotkeys - Chat - Alt+H

Gui, theCustomChat:destroy


GuiControl, theAltH:Focus, NewAltH

VarSetCapacity( R, 16, 0 )

SendMessage, 0xB2,, % &R,, ahk_id %Edit%

x1:=NumGet( &R+0 ), y1:=NumGet( &R+4 )

x2:=NumGet( &R+8 ), y2:=NumGet( &R+12 )

NumPut( (x1+tp), &R, 0 ), NumPut( (y1+tp), &R, 4 )

NumPut( (x2+1), &R, 8 ), NumPut( (y2+y1+1), &R, 12 ) ; <-- compensation for upper padding

SendMessage, 0xB3, 0x0, % &R,, ahk_id %Edit%

Return

AltHDefault:
IniWrite, yes, %ini%, origAltH, KEY1
TrayTip, Custom Hotkey Restored to Default!, Alt+H has been restored to the default text..., , 3000
gosub, CustomChat
Return

OutputAltH:
GuiControl, disable, OutputAltH
GuiControl, disable, AltHDefault
Gui, Submit, NoHide

; create a list of your edit control vars

;need to check to make sure that the e-mail address is correct and also includes CustomInk.com

emptyfields = NewAltH
loop, parse, emptyfields, `,, %A_Space% 				; loop through the list
{
	GuiControlGet, OutputVar, Enabled, %A_LoopField%
		If !(%A_LoopField%) && OutputVar ; if the value of the variable whose name is saved in A_LoopField is empty and is enabled
		{
			if A_LoopField = NewAltH
			{
			required = Your New Hotkey Text
			}
			
			MsgBox A required field is empty: %required%	; show error message
			GuiControl, enable, OutputAltH
			GuiControl, enable, AltHDefault
			return						; stop
		}
}
;~ ; if you're here then all vars are not empty

gosub, EditAltH
Return

EditAltH:
; Save custom hotkey text to a text file.

theFile = %A_ScriptDir%\text_files\AltH.txt

if FileExist(theFile) 
{
FileDelete, %theFile%
}

FileAppend, %NewAltH%, %A_ScriptDir%\text_files\AltH.txt

IniWrite, no, %ini%, origAltH, KEY1

TrayTip, Custom Hotkey Saved!, Your custom Alt+H hotkey is ready to use..., , 3000
gosub, CustomChat
Return

AltS:
WinGetPos, Xpos, Ypos
IniRead, CustomAltS, %ini%, origAltS, KEY1

if (CustomAltS = "no")
{

FileRead, Close, %A_ScriptDir%\text_files\AltS.txt

}
else
{
Close = Hey there, thank you for chatting with CustomInk! I'm quickly reviewing the survey you filled out to see what I can personally help you with today.

}
tp := 6

height = 500
GuiWidth = 600

Gui, theAltS:Add, Picture, w180 h-1 vLogo gLogo, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theAltS:Add, Picture, w140 h-1 vOutputAltS gOutputAltS, %A_ScriptDir%\images\save.jpg
Gui, theAltS:Add, Picture, w140 h-1 vGoBack gCustomChat, %A_ScriptDir%\images\go_back.jpg
Gui, theAltS:Add, Picture, w140 h-1 vRestore gAltSDefault, %A_ScriptDir%\images\restore_default.jpg
Gui, theAltS:Color, FFFFFF
Gui, theAltS:Font, S18, w700
Gui, theAltS:Add, Text, center CGray x20 y129 w550, Current text for Hotkey Alt+S
Gui, theAltS:Font, S10, w700
Gui, theAltS:Add, Edit, xs-10 CGray x80 y169 w440 h190 +0x200 hwndEdit vNewAltS, %Close%
Gui, theAltS:Font, S10, w700
Gui, theAltS:Add, Text, center CGray x80 y370 w440, *Enter the new text for Alt+S*
GuiControl, theAltS:Move, Logo, x210
GuiControl, theAltS:Move, OutputAltS, x380 y430
GuiControl, theAltS:Move, GoBack, x80 y430
GuiControl, theAltS:Move, Restore, x230 y430
Gui, theAltS:Add, Text, center y475 w570 x20 vFeedback gFeedback, Feedback
Gui, theAltS:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Edit AutoHotkeys - Chat - Alt+S

Gui, theCustomChat:destroy


GuiControl, theAltS:Focus, NewAltS

VarSetCapacity( R, 16, 0 )

SendMessage, 0xB2,, % &R,, ahk_id %Edit%

x1:=NumGet( &R+0 ), y1:=NumGet( &R+4 )

x2:=NumGet( &R+8 ), y2:=NumGet( &R+12 )

NumPut( (x1+tp), &R, 0 ), NumPut( (y1+tp), &R, 4 )

NumPut( (x2+1), &R, 8 ), NumPut( (y2+y1+1), &R, 12 ) ; <-- compensation for upper padding

SendMessage, 0xB3, 0x0, % &R,, ahk_id %Edit%

Return

AltSDefault:
IniWrite, yes, %ini%, origAltS, KEY1
TrayTip, Custom Hotkey Restored to Default!, Alt+S has been restored to the default text..., , 3000
gosub, CustomChat
Return

OutputAltS:
GuiControl, disable, OutputAltS
GuiControl, disable, AltSDefault
Gui, Submit, NoHide

; create a list of your edit control vars

;need to check to make sure that the e-mail address is correct and also includes CustomInk.com

emptyfields = NewAltS
loop, parse, emptyfields, `,, %A_Space% 				; loop through the list
{
	GuiControlGet, OutputVar, Enabled, %A_LoopField%
		If !(%A_LoopField%) && OutputVar ; if the value of the variable whose name is saved in A_LoopField is empty and is enabled
		{
			if A_LoopField = NewAltS
			{
			required = Your New Hotkey Text
			}
			
			MsgBox A required field is empty: %required%	; show error message
			GuiControl, enable, OutputAltS
			GuiControl, enable, AltSDefault
			return						; stop
		}
}
;~ ; if you're here then all vars are not empty

gosub, EditAltS
Return

EditAltS:
; Save custom hotkey text to a text file.

theFile = %A_ScriptDir%\text_files\AltS.txt

if FileExist(theFile) 
{
FileDelete, %theFile%
}

FileAppend, %NewAltS%, %A_ScriptDir%\text_files\AltS.txt

IniWrite, no, %ini%, origAltS, KEY1

TrayTip, Custom Hotkey Saved!, Your custom Alt+S hotkey is ready to use..., , 3000
gosub, CustomChat
Return

AltX:
WinGetPos, Xpos, Ypos
IniRead, CustomAltX, %ini%, origAltX, KEY1

if (CustomAltX = "no")
{

FileRead, Close, %A_ScriptDir%\text_files\AltX.txt

}
else
{
Close = Thank you again for chatting with CustomInk, where T-shirts Unite! If you have future questions, my name was $!{operator.nickname} and you can always request my assistance over our chat service, or through email at service@customink.com.

}
tp := 6

height = 500
GuiWidth = 600

Gui, theAltX:Add, Picture, w180 h-1 vLogo gLogo, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theAltX:Add, Picture, w140 h-1 vOutputAltX gOutputAltX, %A_ScriptDir%\images\save.jpg
Gui, theAltX:Add, Picture, w140 h-1 vGoBack gCustomChat, %A_ScriptDir%\images\go_back.jpg
Gui, theAltX:Add, Picture, w140 h-1 vRestore gAltXDefault, %A_ScriptDir%\images\restore_default.jpg
Gui, theAltX:Color, FFFFFF
Gui, theAltX:Font, S18, w700
Gui, theAltX:Add, Text, center CGray x20 y129 w550, Current text for Hotkey Alt+X
Gui, theAltX:Font, S10, w700
Gui, theAltX:Add, Edit, xs-10 CGray x80 y169 w440 h190 +0x200 hwndEdit vNewAltX, %Close%
Gui, theAltX:Font, S10, w700
Gui, theAltX:Add, Text, center CGray x80 y370 w440, *Enter the new text for Alt+X*
GuiControl, theAltX:Move, Logo, x210
GuiControl, theAltX:Move, OutputAltX, x380 y430
GuiControl, theAltX:Move, GoBack, x80 y430
GuiControl, theAltX:Move, Restore, x230 y430
Gui, theAltX:Add, Text, center y475 w570 x20 vFeedback gFeedback, Feedback
Gui, theAltX:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Edit AutoHotkeys - Chat - Alt+X

Gui, theCustomChat:destroy


GuiControl, theAltX:Focus, NewAltX

VarSetCapacity( R, 16, 0 )

SendMessage, 0xB2,, % &R,, ahk_id %Edit%

x1:=NumGet( &R+0 ), y1:=NumGet( &R+4 )

x2:=NumGet( &R+8 ), y2:=NumGet( &R+12 )

NumPut( (x1+tp), &R, 0 ), NumPut( (y1+tp), &R, 4 )

NumPut( (x2+1), &R, 8 ), NumPut( (y2+y1+1), &R, 12 ) ; <-- compensation for upper padding

SendMessage, 0xB3, 0x0, % &R,, ahk_id %Edit%

Return

AltXDefault:
IniWrite, yes, %ini%, origAltX, KEY1
TrayTip, Custom Hotkey Restored to Default!, Alt+X has been restored to the default text..., , 3000
gosub, CustomChat
Return

OutputAltX:
GuiControl, disable, OutputAltX
GuiControl, disable, AltXDefault
Gui, Submit, NoHide

; create a list of your edit control vars

;need to check to make sure that the e-mail address is correct and also includes CustomInk.com

emptyfields = NewAltX
loop, parse, emptyfields, `,, %A_Space% 				; loop through the list
{
	GuiControlGet, OutputVar, Enabled, %A_LoopField%
		If !(%A_LoopField%) && OutputVar ; if the value of the variable whose name is saved in A_LoopField is empty and is enabled
		{
			if A_LoopField = NewAltX
			{
			required = Your New Hotkey Text
			}
			
			MsgBox A required field is empty: %required%	; show error message
			GuiControl, enable, OutputAltX
			GuiControl, enable, AltXDefault
			return						; stop
		}
}
;~ ; if you're here then all vars are not empty

gosub, EditAltX
Return

EditAltX:
; Save custom hotkey text to a text file.

theFile = %A_ScriptDir%\text_files\AltX.txt

if FileExist(theFile) 
{
FileDelete, %theFile%
}

FileAppend, %NewAltX%, %A_ScriptDir%\text_files\AltX.txt

IniWrite, no, %ini%, origAltX, KEY1

TrayTip, Custom Hotkey Saved!, Your custom Alt+X hotkey is ready to use..., , 3000
gosub, CustomChat
Return

AltD:
WinGetPos, Xpos, Ypos
IniRead, CustomAltD, %ini%, origAltD, KEY1

if (CustomAltD = "no")
{

FileRead, Close, %A_ScriptDir%\text_files\AltD.txt

}
else
{
Close = We often get requests for discounts for specific groups and since we are unable to accommodate all requests, we have chosen to offer an alternative for our customers. Here, or dedicated sponsorship website, can help groups raise sponsorship dollars from local and National Brands by gathering support from your friends and family. It's completely free and very easy to sign up and do you think this would work for your group?
}
tp := 6

height = 500
GuiWidth = 600

Gui, theAltD:Add, Picture, w180 h-1 vLogo gLogo, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theAltD:Add, Picture, w140 h-1 vOutputAltD gOutputAltD, %A_ScriptDir%\images\save.jpg
Gui, theAltD:Add, Picture, w140 h-1 vGoBack gCustomChat2, %A_ScriptDir%\images\go_back.jpg
Gui, theAltD:Add, Picture, w140 h-1 vRestore gAltDDefault, %A_ScriptDir%\images\restore_default.jpg
Gui, theAltD:Color, FFFFFF
Gui, theAltD:Font, S18, w700
Gui, theAltD:Add, Text, center CGray x20 y129 w550, Current text for Hotkey Alt+D
Gui, theAltD:Font, S10, w700
Gui, theAltD:Add, Edit, xs-10 CGray x80 y169 w440 h190 +0x200 hwndEdit vNewAltD, %Close%
Gui, theAltD:Font, S10, w700
Gui, theAltD:Add, Text, center CGray x80 y370 w440, *Enter the new text for Alt+D*
GuiControl, theAltD:Move, Logo, x210
GuiControl, theAltD:Move, OutputAltD, x380 y430
GuiControl, theAltD:Move, GoBack, x80 y430
GuiControl, theAltD:Move, Restore, x230 y430
Gui, theAltD:Add, Text, center y475 w570 x20 vFeedback gFeedback, Feedback
Gui, theAltD:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Edit AutoHotkeys - Chat - Alt+D

Gui, theCustomChat2:destroy


GuiControl, theAltD:Focus, NewAltD

VarSetCapacity( R, 16, 0 )

SendMessage, 0xB2,, % &R,, ahk_id %Edit%

x1:=NumGet( &R+0 ), y1:=NumGet( &R+4 )

x2:=NumGet( &R+8 ), y2:=NumGet( &R+12 )

NumPut( (x1+tp), &R, 0 ), NumPut( (y1+tp), &R, 4 )

NumPut( (x2+1), &R, 8 ), NumPut( (y2+y1+1), &R, 12 ) ; <-- compensation for upper padding

SendMessage, 0xB3, 0x0, % &R,, ahk_id %Edit%

Return

AltDDefault:
IniWrite, yes, %ini%, origAltD, KEY1
TrayTip, Custom Hotkey Restored to Default!, Alt+D has been restored to the default text..., , 3000
gosub, CustomChat2
Return

OutputAltD:
GuiControl, disable, OutputAltD
GuiControl, disable, AltDDefault
Gui, Submit, NoHide

; create a list of your edit control vars

;need to check to make sure that the e-mail address is correct and also includes CustomInk.com

emptyfields = NewAltD
loop, parse, emptyfields, `,, %A_Space% 				; loop through the list
{
	GuiControlGet, OutputVar, Enabled, %A_LoopField%
		If !(%A_LoopField%) && OutputVar ; if the value of the variable whose name is saved in A_LoopField is empty and is enabled
		{
			if A_LoopField = NewAltD
			{
			required = Your New Hotkey Text
			}
			
			MsgBox A required field is empty: %required%	; show error message
			GuiControl, enable, OutputAltD
			GuiControl, enable, AltDDefault
			return						; stop
		}
}
;~ ; if you're here then all vars are not empty

gosub, EditAltD
Return

EditAltD:
; Save custom hotkey text to a text file.

theFile = %A_ScriptDir%\text_files\AltD.txt

if FileExist(theFile) 
{
FileDelete, %theFile%
}

FileAppend, %NewAltD%, %A_ScriptDir%\text_files\AltD.txt

IniWrite, no, %ini%, origAltD, KEY1

TrayTip, Custom Hotkey Saved!, Your custom Alt+D hotkey is ready to use..., , 3000
gosub, CustomChat2
Return

AltG:
WinGetPos, Xpos, Ypos
IniRead, CustomAltG, %ini%, origAltG, KEY1

if (CustomAltG = "no")
{

FileRead, Close, %A_ScriptDir%\text_files\AltG.txt

}
else
{
Close = We often get requests for discounts for specific groups and since we are unable to accommodate all requests, we have chosen to offer an alternative for our customers. Here, or dedicated sponsorship website, can help groups raise sponsorship dollars from local and National Brands by gathering support from your friends and family. It's completely free and very easy to sign up and do you think this would work for your group?
}
tp := 6

height = 500
GuiWidth = 600

Gui, theAltG:Add, Picture, w180 h-1 vLogo gLogo, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theAltG:Add, Picture, w140 h-1 vOutputAltG gOutputAltG, %A_ScriptDir%\images\save.jpg
Gui, theAltG:Add, Picture, w140 h-1 vGoBack gCustomChat2, %A_ScriptDir%\images\go_back.jpg
Gui, theAltG:Add, Picture, w140 h-1 vRestore gAltGDefault, %A_ScriptDir%\images\restore_default.jpg
Gui, theAltG:Color, FFFFFF
Gui, theAltG:Font, S18, w700
Gui, theAltG:Add, Text, center CGray x20 y129 w550, Current text for Hotkey Alt+G
Gui, theAltG:Font, S10, w700
Gui, theAltG:Add, Edit, xs-10 CGray x80 y169 w440 h190 +0x200 hwndEdit vNewAltG, %Close%
Gui, theAltG:Font, S10, w700
Gui, theAltG:Add, Text, center CGray x80 y370 w440, *Enter the new text for Alt+G*
GuiControl, theAltG:Move, Logo, x210
GuiControl, theAltG:Move, OutputAltG, x380 y430
GuiControl, theAltG:Move, GoBack, x80 y430
GuiControl, theAltG:Move, Restore, x230 y430
Gui, theAltG:Add, Text, center y475 w570 x20 vFeedback gFeedback, Feedback
Gui, theAltG:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Edit AutoHotkeys - Chat - Alt+G

Gui, theCustomChat2:destroy


GuiControl, theAltG:Focus, NewAltG

VarSetCapacity( R, 16, 0 )

SendMessage, 0xB2,, % &R,, ahk_id %Edit%

x1:=NumGet( &R+0 ), y1:=NumGet( &R+4 )

x2:=NumGet( &R+8 ), y2:=NumGet( &R+12 )

NumPut( (x1+tp), &R, 0 ), NumPut( (y1+tp), &R, 4 )

NumPut( (x2+1), &R, 8 ), NumPut( (y2+y1+1), &R, 12 ) ; <-- compensation for upper padding

SendMessage, 0xB3, 0x0, % &R,, ahk_id %Edit%

Return

AltGDefault:
IniWrite, yes, %ini%, origAltG, KEY1
TrayTip, Custom Hotkey Restored to Default!, Alt+G has been restored to the default text..., , 3000
gosub, CustomChat2
Return

OutputAltG:
GuiControl, disable, OutputAltG
GuiControl, disable, AltGDefault
Gui, Submit, NoHide

; create a list of your edit control vars

;need to check to make sure that the e-mail address is correct and also includes CustomInk.com

emptyfields = NewAltG
loop, parse, emptyfields, `,, %A_Space% 				; loop through the list
{
	GuiControlGet, OutputVar, Enabled, %A_LoopField%
		If !(%A_LoopField%) && OutputVar ; if the value of the variable whose name is saved in A_LoopField is empty and is enabled
		{
			if A_LoopField = NewAltG
			{
			required = Your New Hotkey Text
			}
			
			MsgBox A required field is empty: %required%	; show error message
			GuiControl, enable, OutputAltG
			GuiControl, enable, AltGDefault
			return						; stop
		}
}
;~ ; if you're here then all vars are not empty

gosub, EditAltG
Return

EditAltG:
; Save custom hotkey text to a text file.

theFile = %A_ScriptDir%\text_files\AltG.txt

if FileExist(theFile) 
{
FileDelete, %theFile%
}

FileAppend, %NewAltG%, %A_ScriptDir%\text_files\AltG.txt

IniWrite, no, %ini%, origAltG, KEY1

TrayTip, Custom Hotkey Saved!, Your custom Alt+G hotkey is ready to use..., , 3000
gosub, CustomChat2
Return

AltZ:
WinGetPos, Xpos, Ypos
IniRead, CustomAltZ, %ini%, origAltZ, KEY1

if (CustomAltZ = "no")
{

FileRead, Close, %A_ScriptDir%\text_files\AltZ.txt

}
else
{
Close = We often get requests for discounts for specific groups and since we are unable to accommodate all requests, we have chosen to offer an alternative for our customers. Here, or dedicated sponsorship website, can help groups raise sponsorship dollars from local and National Brands by gathering support from your friends and family. It's completely free and very easy to sign up and do you think this would work for your group?
}
tp := 6

height = 500
GuiWidth = 600

Gui, theAltZ:Add, Picture, w180 h-1 vLogo gLogo, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theAltZ:Add, Picture, w140 h-1 vOutputAltZ gOutputAltZ, %A_ScriptDir%\images\save.jpg
Gui, theAltZ:Add, Picture, w140 h-1 vGoBack gCustomChat2, %A_ScriptDir%\images\go_back.jpg
Gui, theAltZ:Add, Picture, w140 h-1 vRestore gAltZDefault, %A_ScriptDir%\images\restore_default.jpg
Gui, theAltZ:Color, FFFFFF
Gui, theAltZ:Font, S18, w700
Gui, theAltZ:Add, Text, center CGray x20 y129 w550, Current text for Hotkey Alt+Z
Gui, theAltZ:Font, S10, w700
Gui, theAltZ:Add, Edit, xs-10 CGray x80 y169 w440 h190 +0x200 hwndEdit vNewAltZ, %Close%
Gui, theAltZ:Font, S10, w700
Gui, theAltZ:Add, Text, center CGray x80 y370 w440, *Enter the new text for Alt+Z*
GuiControl, theAltZ:Move, Logo, x210
GuiControl, theAltZ:Move, OutputAltZ, x380 y430
GuiControl, theAltZ:Move, GoBack, x80 y430
GuiControl, theAltZ:Move, Restore, x230 y430
Gui, theAltZ:Add, Text, center y475 w570 x20 vFeedback gFeedback, Feedback
Gui, theAltZ:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Edit AutoHotkeys - Chat - Alt+Z

Gui, theCustomChat2:destroy


GuiControl, theAltZ:Focus, NewAltZ

VarSetCapacity( R, 16, 0 )

SendMessage, 0xB2,, % &R,, ahk_id %Edit%

x1:=NumGet( &R+0 ), y1:=NumGet( &R+4 )

x2:=NumGet( &R+8 ), y2:=NumGet( &R+12 )

NumPut( (x1+tp), &R, 0 ), NumPut( (y1+tp), &R, 4 )

NumPut( (x2+1), &R, 8 ), NumPut( (y2+y1+1), &R, 12 ) ; <-- compensation for upper padding

SendMessage, 0xB3, 0x0, % &R,, ahk_id %Edit%

Return

AltZDefault:
IniWrite, yes, %ini%, origAltZ, KEY1
TrayTip, Custom Hotkey Restored to Default!, Alt+Z has been restored to the default text..., , 3000
gosub, CustomChat2
Return

OutputAltZ:
GuiControl, disable, OutputAltZ
GuiControl, disable, AltZDefault
Gui, Submit, NoHide

; create a list of your edit control vars

;need to check to make sure that the e-mail address is correct and also includes CustomInk.com

emptyfields = NewAltZ
loop, parse, emptyfields, `,, %A_Space% 				; loop through the list
{
	GuiControlGet, OutputVar, Enabled, %A_LoopField%
		If !(%A_LoopField%) && OutputVar ; if the value of the variable whose name is saved in A_LoopField is empty and is enabled
		{
			if A_LoopField = NewAltZ
			{
			required = Your New Hotkey Text
			}
			
			MsgBox A required field is empty: %required%	; show error message
			GuiControl, enable, OutputAltZ
			GuiControl, enable, AltZDefault
			return						; stop
		}
}
;~ ; if you're here then all vars are not empty

gosub, EditAltZ
Return

EditAltZ:
; Save custom hotkey text to a text file.

theFile = %A_ScriptDir%\text_files\AltZ.txt

if FileExist(theFile) 
{
FileDelete, %theFile%
}

FileAppend, %NewAltZ%, %A_ScriptDir%\text_files\AltZ.txt

IniWrite, no, %ini%, origAltZ, KEY1

TrayTip, Custom Hotkey Saved!, Your custom Alt+Z hotkey is ready to use..., , 3000
gosub, CustomChat2
Return

AltC:
WinGetPos, Xpos, Ypos
IniRead, CustomAltC, %ini%, origAltC, KEY1

if (CustomAltC = "no")
{

FileRead, Close, %A_ScriptDir%\text_files\AltC.txt

}
else
{
Close = It looks like we weren't able to chat with you this time around. If you got your question answered - that's great! If not, chat us again, shoot me an e-mail at service@customink.com, or give us a ring at 1-800-293-4232, and any of our t-shirt ambassadors would be happy to help!

}
tp := 6

height = 500
GuiWidth = 600

Gui, theAltC:Add, Picture, w180 h-1 vLogo gLogo, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theAltC:Add, Picture, w140 h-1 vOutputAltC gOutputAltC, %A_ScriptDir%\images\save.jpg
Gui, theAltC:Add, Picture, w140 h-1 vGoBack gCustomChat2, %A_ScriptDir%\images\go_back.jpg
Gui, theAltC:Add, Picture, w140 h-1 vRestore gAltCDefault, %A_ScriptDir%\images\restore_default.jpg
Gui, theAltC:Color, FFFFFF
Gui, theAltC:Font, S18, w700
Gui, theAltC:Add, Text, center CGray x20 y129 w550, Current text for Hotkey Alt+C
Gui, theAltC:Font, S10, w700
Gui, theAltC:Add, Edit, xs-10 CGray x80 y169 w440 h190 +0x200 hwndEdit vNewAltC, %Close%
Gui, theAltC:Font, S10, w700
Gui, theAltC:Add, Text, center CGray x80 y370 w440, *Enter the new text for Alt+C*
GuiControl, theAltC:Move, Logo, x210
GuiControl, theAltC:Move, OutputAltC, x380 y430
GuiControl, theAltC:Move, GoBack, x80 y430
GuiControl, theAltC:Move, Restore, x230 y430
Gui, theAltC:Add, Text, center y475 w570 x20 vFeedback gFeedback, Feedback
Gui, theAltC:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Edit AutoHotkeys - Chat - Alt+C

Gui, theCustomChat2:destroy


GuiControl, theAltC:Focus, NewAltC

VarSetCapacity( R, 16, 0 )

SendMessage, 0xB2,, % &R,, ahk_id %Edit%

x1:=NumGet( &R+0 ), y1:=NumGet( &R+4 )

x2:=NumGet( &R+8 ), y2:=NumGet( &R+12 )

NumPut( (x1+tp), &R, 0 ), NumPut( (y1+tp), &R, 4 )

NumPut( (x2+1), &R, 8 ), NumPut( (y2+y1+1), &R, 12 ) ; <-- compensation for upper padding

SendMessage, 0xB3, 0x0, % &R,, ahk_id %Edit%

Return

AltCDefault:
IniWrite, yes, %ini%, origAltC, KEY1
TrayTip, Custom Hotkey Restored to Default!, Alt+C has been restored to the default text..., , 3000
gosub, CustomChat2
Return

OutputAltC:
GuiControl, disable, OutputAltC
GuiControl, disable, AltCDefault
Gui, Submit, NoHide

; create a list of your edit control vars

;need to check to make sure that the e-mail address is correct and also includes CustomInk.com

emptyfields = NewAltC
loop, parse, emptyfields, `,, %A_Space% 				; loop through the list
{
	GuiControlGet, OutputVar, Enabled, %A_LoopField%
		If !(%A_LoopField%) && OutputVar ; if the value of the variable whose name is saved in A_LoopField is empty and is enabled
		{
			if A_LoopField = NewAltC
			{
			required = Your New Hotkey Text
			}
			
			MsgBox A required field is empty: %required%	; show error message
			GuiControl, enable, OutputAltC
			GuiControl, enable, AltCDefault
			return						; stop
		}
}
;~ ; if you're here then all vars are not empty

gosub, EditAltC
Return

EditAltC:
; Save custom hotkey text to a text file.

theFile = %A_ScriptDir%\text_files\AltC.txt

if FileExist(theFile) 
{
FileDelete, %theFile%
}

FileAppend, %NewAltC%, %A_ScriptDir%\text_files\AltC.txt

IniWrite, no, %ini%, origAltC, KEY1

TrayTip, Custom Hotkey Saved!, Your custom Alt+C hotkey is ready to use..., , 3000
gosub, CustomChat2
Return

AltB:
WinGetPos, Xpos, Ypos
IniRead, CustomAltB, %ini%, origAltB, KEY1

if (CustomAltB = "no")
{

FileRead, Close, %A_ScriptDir%\text_files\AltB.txt

}
else
{
Close = I'm so sorry, it looks like I've lost you at the moment! I definitely want to continue personally assisting you, so I've saved everything we've spoken about to your account and we can pick up right where we left off when you can reach us again. Please feel free to give me another chat, shoot me an email at service@customink.com, or give us a ring at 1-800-293-4232, and any of our t-shirt ambassadors would be happy to help.

}
tp := 6

height = 500
GuiWidth = 600

Gui, theAltB:Add, Picture, w180 h-1 vLogo gLogo, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theAltB:Add, Picture, w140 h-1 vOutputAltB gOutputAltB, %A_ScriptDir%\images\save.jpg
Gui, theAltB:Add, Picture, w140 h-1 vGoBack gCustomChat2, %A_ScriptDir%\images\go_back.jpg
Gui, theAltB:Add, Picture, w140 h-1 vRestore gAltBDefault, %A_ScriptDir%\images\restore_default.jpg
Gui, theAltB:Color, FFFFFF
Gui, theAltB:Font, S18, w700
Gui, theAltB:Add, Text, center CGray x20 y129 w550, Current text for Hotkey Alt+B
Gui, theAltB:Font, S10, w700
Gui, theAltB:Add, Edit, xs-10 CGray x80 y169 w440 h190 +0x200 hwndEdit vNewAltB, %Close%
Gui, theAltB:Font, S10, w700
Gui, theAltB:Add, Text, center CGray x80 y370 w440, *Enter the new text for Alt+B*
GuiControl, theAltB:Move, Logo, x210
GuiControl, theAltB:Move, OutputAltB, x380 y430
GuiControl, theAltB:Move, GoBack, x80 y430
GuiControl, theAltB:Move, Restore, x230 y430
Gui, theAltB:Add, Text, center y475 w570 x20 vFeedback gFeedback, Feedback
Gui, theAltB:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Edit AutoHotkeys - Chat - Alt+B

Gui, theCustomChat2:destroy


GuiControl, theAltB:Focus, NewAltB

VarSetCapacity( R, 16, 0 )

SendMessage, 0xB2,, % &R,, ahk_id %Edit%

x1:=NumGet( &R+0 ), y1:=NumGet( &R+4 )

x2:=NumGet( &R+8 ), y2:=NumGet( &R+12 )

NumPut( (x1+tp), &R, 0 ), NumPut( (y1+tp), &R, 4 )

NumPut( (x2+1), &R, 8 ), NumPut( (y2+y1+1), &R, 12 ) ; <-- compensation for upper padding

SendMessage, 0xB3, 0x0, % &R,, ahk_id %Edit%

Return

AltBDefault:
IniWrite, yes, %ini%, origAltB, KEY1
TrayTip, Custom Hotkey Restored to Default!, Alt+B has been restored to the default text..., , 3000
gosub, CustomChat2
Return

OutputAltB:
GuiControl, disable, OutputAltB
GuiControl, disable, AltBDefault
Gui, Submit, NoHide

; create a list of your edit control vars

;need to check to make sure that the e-mail address is correct and also includes CustomInk.com

emptyfields = NewAltB
loop, parse, emptyfields, `,, %A_Space% 				; loop through the list
{
	GuiControlGet, OutputVar, Enabled, %A_LoopField%
		If !(%A_LoopField%) && OutputVar ; if the value of the variable whose name is saved in A_LoopField is empty and is enabled
		{
			if A_LoopField = NewAltB
			{
			required = Your New Hotkey Text
			}
			
			MsgBox A required field is empty: %required%	; show error message
			GuiControl, enable, OutputAltB
			GuiControl, enable, AltBDefault
			return						; stop
		}
}
;~ ; if you're here then all vars are not empty

gosub, EditAltB
Return

EditAltB:
; Save custom hotkey text to a text file.

theFile = %A_ScriptDir%\text_files\AltB.txt

if FileExist(theFile) 
{
FileDelete, %theFile%
}

FileAppend, %NewAltB%, %A_ScriptDir%\text_files\AltB.txt

IniWrite, no, %ini%, origAltB, KEY1

TrayTip, Custom Hotkey Saved!, Your custom Alt+B hotkey is ready to use..., , 3000
gosub, CustomChat2
Return


Spelling:
spellini = %A_ScriptDir%\spellaid\settings.ini
WinGetPos, Xpos, Ypos

if Xpos is space
{
Xpos = Center
Ypos = Center
}
height = 500
GuiWidth = 600

Gui, theSpellingMenu:Add, Picture, w180 h-1 vLogo gLogo, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theSpellingMenu:Add, Picture, w150 h-1 vSuggest gSuggest, %A_ScriptDir%\images\suggest.jpg
Gui, theSpellingMenu:Add, Picture, w150 h-1 vOnorOff gSpellingList, %A_ScriptDir%\images\onoroff.jpg
Gui, theSpellingMenu:Add, Picture, w140 h-1 vExit gGuiClose, %A_ScriptDir%\images\exit.jpg
Gui, theSpellingMenu:Add, Picture, w140 h-1 vGoBack gCustomHotkeys, %A_ScriptDir%\images\go_back.jpg
Gui, theSpellingMenu:Color, FFFFFF
Gui, theSpellingMenu:Font, S26, w700
Gui, theSpellingMenu:Add, Text, CGray vSelection, Make your selection below:
GuiControl, theSpellingMenu:Move, Logo, x210
GuiControl, theSpellingMenu:Move, OnorOff, x310 y230
GuiControl, theSpellingMenu:Move, Suggest, x130 y230
GuiControl, theSpellingMenu:Move, Selection, x100 y140
GuiControl, theSpellingMenu:Move, Exit, x310 y430
GuiControl, theSpellingMenu:Move, GoBack, x150 y430

Gui, theSpellingMenu:Font, S10, w700
Gui, theSpellingMenu:Add, Text, center y475 w570 x20 vFeedback gFeedback, Feedback
Gui, theSpellingMenu:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Spelling Menu

Gui, theCustom:destroy
Gui, theSpellingList:destroy
Gui, theSpellingList2:destroy
Gui, theSuggestSpelling:destroy
Gui, thesubmitloading:destroy

Return

Suggest:
WinGetPos, Xpos, Ypos
height = 500
GuiWidth = 600

Gui, theSuggestSpelling:Add, Picture, w180 h-1 vLogo gLogo, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theSuggestSpelling:Add, Picture, w140 h-1 vExit gGuiClose, %A_ScriptDir%\images\exit.jpg
Gui, theSuggestSpelling:Add, Picture, w140 h-1 vGoBack gSpelling, %A_ScriptDir%\images\go_back.jpg
Gui, theSuggestSpelling:Add, Picture, w140 h-1 vOutputSuggest gOutputSuggest, %A_ScriptDir%\images\save.jpg
Gui, theSuggestSpelling:Color, FFFFFF
Gui, theSuggestSpelling:Font, S18, w700
Gui, theSuggestSpelling:Add, Text, Center CGray vSelection, Enter your corrected spelling suggestion below:
Gui, theSuggestSpelling:Font, S12, w700
Gui, theSuggestSpelling:Add, Edit, xs-10 CGray x115 y169 w370 h35 +0x200 vcorrectWord, Enter the correct spelling (ex: singles)
Gui, theSuggestSpelling:Add, Edit, xs-10 CGray x80 y219 w440 h190 +0x200 vincorrectSpelling, Enter your incorrect spellings of the word above and use a comma between each spelling (ex: signles, singals).
GuiControl, theSuggestSpelling:Move, Logo, x210
GuiControl, theSuggestSpelling:Move, Selection, x40 y115
GuiControl, theSuggestSpelling:Move, Exit, x230 y430
GuiControl, theSuggestSpelling:Move, GoBack, x80 y430
GuiControl, theSuggestSpelling:Move, OutputSuggest, x380 y430

Gui, theSuggestSpelling:Font, S10, w700
Gui, theSuggestSpelling:Add, Text, center y475 w570 x20 vFeedback gFeedback, Feedback
Gui, theSuggestSpelling:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Spelling Suggestion

Gui, theCustom:destroy
Gui, theSpellingMenu:destroy
Return

OutputSuggest:
SendMode Input
SetKeyDelay, 0
Gui, Submit, NoHide

sendingword = %correctWord%
sendingincorrect = %incorrectSpelling%

WinGetPos, Xpos, Ypos
height = 500
GuiWidth = 600

Gui, thesubmitloading:Add, Picture, w380 h-1 vDelivery, %A_ScriptDir%\images\delivery.jpg
Gui, thesubmitloading:Color, FFFFFF
Gui, thesubmitloading:Font, S20, w700
Gui, thesubmitloading:Add, Text, Center CGray vtext1, Your suggestion
Gui, thesubmitloading:Add, Text, Center CGray vtext2, is being delivered!
Gui, thesubmitloading:Font, S12, w700
Gui, thesubmitloading:Add, Text, Center CBlack vtext3, This page will close momentarily.
GuiControl, thesubmitloading:Move, text1, x70 y190
GuiControl, thesubmitloading:Move, text2, x305 y190
GuiControl, thesubmitloading:Move, text3, x180 y440
GuiControl, thesubmitloading:Move, Delivery, x110 y30

Gui, thesubmitloading:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Thanks for the suggestion!

Gui, theCustom:destroy
Gui, theSuggestSpelling:destroy

INI=%A_scriptdir%\settings.ini
IniRead, showFull, %ini%, clientName, KEY1
IniRead, showSkill, %ini%, clientSkill, KEY1

StringLower, showFull, showFull

DetectHiddenWindows, On 
SetTitleMatchMode, 2

IE := ComObjCreate("InternetExplorer.Application")
IE.Visible := false

url = https://docs.google.com/forms/d/17_vRwPh5KZbALtyusWjAeeXO4tWFrJxb1kbZwxgWZLk/viewform?entry.673702248=%sendingword%&entry.1640652264=%sendingincorrect%&entry.1269629944=%showFull%&entry.958974122=%showSkill%

IE.Navigate(url)
While IE.busy
Sleep 100

IE.document.getElementsByClassName("quantumWizButtonPaperbuttonEl quantumWizButtonPaperbuttonFlat quantumWizButtonPaperbuttonDark quantumWizButtonPaperbutton2El2 freebirdFormviewerViewNavigationSubmitButton")[0].click()
sleep 2000
IE.quit
gosub, Spelling
Return


SpellingList:
WinGetPos, Xpos, Ypos

if (Xpos = "")
{
Xpos = 582
Ypos = 187
}

height = 500
GuiWidth = 600

IniRead, toggle01, %spellini%, spellaid01, KEY1
IniRead, toggle02, %spellini%, spellaid02, KEY1
IniRead, toggle03, %spellini%, spellaid03, KEY1
IniRead, toggle04, %spellini%, spellaid04, KEY1
IniRead, toggle05, %spellini%, spellaid05, KEY1
IniRead, toggle06, %spellini%, spellaid06, KEY1
IniRead, toggle07, %spellini%, spellaid07, KEY1
IniRead, toggle08, %spellini%, spellaid08, KEY1
IniRead, toggle09, %spellini%, spellaid09, KEY1
IniRead, toggle10, %spellini%, spellaid10, KEY1
IniRead, toggle11, %spellini%, spellaid11, KEY1
IniRead, toggle12, %spellini%, spellaid12, KEY1
IniRead, toggle13, %spellini%, spellaid13, KEY1
IniRead, toggle14, %spellini%, spellaid14, KEY1


Gui, theSpellingList:Add, Picture, w180 h-1 vLogo gLogo, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theSpellingList:Add, Picture, w140 h-1 vGoBack gSpelling, %A_ScriptDir%\images\go_back.jpg
Gui, theSpellingList:Add, Picture, w140 h-1 vSave gSpellingProcess, %A_ScriptDir%\images\save.jpg
Gui, theSpellingList:Add, Picture, w140 h-1 vNext gSpellingList2, %A_ScriptDir%\images\next.jpg
Gui, theSpellingList:Color, FFFFFF
Gui, theSpellingList:Font, S26, w700
Gui, theSpellingList:Add, Text, center CGray x20 y119 w550, AutoCorrect Spelling List
Gui, theSpellingList:Font, S10, w700


Gui, theSpellingList:Add, Checkbox, Checked%toggle01% v01on, On
Gui, theSpellingList:Add, Checkbox, Checked%toggle02% v02on, On
Gui, theSpellingList:Add, Checkbox, Checked%toggle03% v03on, On
Gui, theSpellingList:Add, Checkbox, v04on Checked%toggle04%, On
Gui, theSpellingList:Add, Checkbox, v05on Checked%toggle05%, On
Gui, theSpellingList:Add, Checkbox, v06on Checked%toggle06%, On
Gui, theSpellingList:Add, Checkbox, v07on Checked%toggle07%, On
Gui, theSpellingList:Add, Checkbox, v08on Checked%toggle08%, On
Gui, theSpellingList:Add, Checkbox, v09on Checked%toggle09%, On
Gui, theSpellingList:Add, Checkbox, v10on Checked%toggle10%, On
Gui, theSpellingList:Add, Checkbox, v11on Checked%toggle11%, On
Gui, theSpellingList:Add, Checkbox, v12on Checked%toggle12%, On
Gui, theSpellingList:Add, Checkbox, v13on Checked%toggle13%, On
Gui, theSpellingList:Add, Checkbox, v14on Checked%toggle14%, On



Gui, theSpellingList:Font, S14, bold
Gui, theSpellingList:Add, Text, CBlue v01word, I'm
Gui, theSpellingList:Add, Text, CBlue v02word, inconvenience
Gui, theSpellingList:Add, Text, CBlue v03word, convenience
Gui, theSpellingList:Add, Text, CBlue v04word, doesn't
Gui, theSpellingList:Add, Text, CBlue v05word, don't
Gui, theSpellingList:Add, Text, CBlue v06word, they're
Gui, theSpellingList:Add, Text, CBlue v07word, t-shirt
Gui, theSpellingList:Add, Text, CBlue v08word, sweatshirt
Gui, theSpellingList:Add, Text, CBlue v09word, guaranteed
Gui, theSpellingList:Add, Text, CBlue v10word, necessary
Gui, theSpellingList:Add, Text, CBlue v11word, necessarily
Gui, theSpellingList:Add, Text, CBlue v12word, just
Gui, theSpellingList:Add, Text, CBlue v13word, available
Gui, theSpellingList:Add, Text, CBlue v14word, occasionally



GuiControl, theSpellingList:Move, Logo, x210
GuiControl, theSpellingList:Move, Save, x230 y430
GuiControl, theSpellingList:Move, GoBack, x80 y430
GuiControl, theSpellingList:Move, Next, x380 y430

GuiControl, theSpellingList:Move, 01on, x85 y180
GuiControl, theSpellingList:Move, 01word, x130 y175

GuiControl, theSpellingList:Move, 02on, x85 y210
GuiControl, theSpellingList:Move, 02word, x130 y205

GuiControl, theSpellingList:Move, 03on, x85 y240
GuiControl, theSpellingList:Move, 03word, x130 y235

GuiControl, theSpellingList:Move, 04on, x85 y270
GuiControl, theSpellingList:Move, 04word, x130 y265

GuiControl, theSpellingList:Move, 05on, x85 y300
GuiControl, theSpellingList:Move, 05word, x130 y295

GuiControl, theSpellingList:Move, 06on, x85 y330
GuiControl, theSpellingList:Move, 06word, x130 y325

GuiControl, theSpellingList:Move, 07on, x85 y360
GuiControl, theSpellingList:Move, 07word, x130 y355

GuiControl, theSpellingList:Move, 08on, x365 y360
GuiControl, theSpellingList:Move, 08word, x410 y355

GuiControl, theSpellingList:Move, 09on, x365 y180
GuiControl, theSpellingList:Move, 09word, x410 y175

GuiControl, theSpellingList:Move, 10on, x365 y210
GuiControl, theSpellingList:Move, 10word, x410 y205

GuiControl, theSpellingList:Move, 11on, x365 y240
GuiControl, theSpellingList:Move, 11word, x410 y235

GuiControl, theSpellingList:Move, 12on, x365 y270
GuiControl, theSpellingList:Move, 12word, x410 y265

GuiControl, theSpellingList:Move, 13on, x365 y300
GuiControl, theSpellingList:Move, 13word, x410 y295

GuiControl, theSpellingList:Move, 14on, x365 y330
GuiControl, theSpellingList:Move, 14word, x410 y325


Gui, theSpellingList:Font, S10, w700
Gui, theSpellingList:Add, Text, center y475 w570 x20 vFeedback gFeedback, Feedback
Gui, theSpellingList:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Spelling List (1 of 2)


Gui, theSpellingMenu:destroy
Gui, theSpellingList2:destroy
Return

SpellingList2:
WinGetPos, Xpos, Ypos

if (Xpos = "")
{
Xpos = 582
Ypos = 187
}

height = 500
GuiWidth = 600


IniRead, toggle15, %spellini%, spellaid15, KEY1
IniRead, toggle16, %spellini%, spellaid16, KEY1
IniRead, toggle17, %spellini%, spellaid17, KEY1
IniRead, toggle18, %spellini%, spellaid18, KEY1
IniRead, toggle19, %spellini%, spellaid19, KEY1
IniRead, toggle20, %spellini%, spellaid20, KEY1
IniRead, toggle21, %spellini%, spellaid21, KEY1
IniRead, toggle22, %spellini%, spellaid22, KEY1
IniRead, toggle23, %spellini%, spellaid23, KEY1
IniRead, toggle24, %spellini%, spellaid24, KEY1
IniRead, toggle25, %spellini%, spellaid25, KEY1
IniRead, toggle26, %spellini%, spellaid26, KEY1
IniRead, toggle27, %spellini%, spellaid27, KEY1
IniRead, toggle28, %spellini%, spellaid28, KEY1
IniRead, toggle29, %spellini%, spellaid29, KEY1

Gui, theSpellingList2:Add, Picture, w180 h-1 vLogo gLogo, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theSpellingList2:Add, Picture, w140 h-1 vGoBack gSpellingList, %A_ScriptDir%\images\go_back.jpg
Gui, theSpellingList2:Add, Picture, w140 h-1 vSave gSpellingProcess2, %A_ScriptDir%\images\save.jpg

Gui, theSpellingList2:Color, FFFFFF
Gui, theSpellingList2:Font, S26, w700
Gui, theSpellingList2:Add, Text, center CGray x20 y119 w550, AutoCorrect Spelling List
Gui, theSpellingList2:Font, S10, w700

Gui, theSpellingList2:Add, Checkbox, v15on Checked%toggle15%, On
Gui, theSpellingList2:Add, Checkbox, v16on Checked%toggle16%, On
Gui, theSpellingList2:Add, Checkbox, Checked%toggle17% v17on, On
Gui, theSpellingList2:Add, Checkbox, Checked%toggle18% v18on, On
Gui, theSpellingList2:Add, Checkbox, Checked%toggle19% v19on, On
Gui, theSpellingList2:Add, Checkbox, v20on Checked%toggle20%, On
Gui, theSpellingList2:Add, Checkbox, v21on Checked%toggle21%, On
Gui, theSpellingList2:Add, Checkbox, v22on Checked%toggle22%, On
Gui, theSpellingList2:Add, Checkbox, v23on Checked%toggle23%, On
Gui, theSpellingList2:Add, Checkbox, v24on Checked%toggle24%, On
Gui, theSpellingList2:Add, Checkbox, v25on Checked%toggle25% , On
Gui, theSpellingList2:Add, Checkbox, v26on Checked%toggle26%, On
Gui, theSpellingList2:Add, Checkbox, v27on Checked%toggle27%, On
Gui, theSpellingList2:Add, Checkbox, v28on Checked%toggle28%, On
Gui, theSpellingList2:Add, Checkbox, v29on Checked%toggle29%, On


Gui, theSpellingList2:Font, S14, bold
Gui, theSpellingList2:Add, Text, CBlue v15word, definitely
Gui, theSpellingList2:Add, Text, CBlue v16word, tie-dye
Gui, theSpellingList2:Add, Text, CBlue v17word, I
Gui, theSpellingList2:Add, Text, CBlue v18word, CustomInk
Gui, theSpellingList2:Add, Text, CBlue v19word, congratulations
Gui, theSpellingList2:Add, Text, CBlue v20word, retrieve
Gui, theSpellingList2:Add, Text, CBlue v21word, achieve
Gui, theSpellingList2:Add, Text, CBlue v22word, initially
Gui, theSpellingList2:Add, Text, CBlue v23word, similar
Gui, theSpellingList2:Add, Text, CBlue v24word, proportionate
Gui, theSpellingList2:Add, Text, CBlue v25word, technique
Gui, theSpellingList2:Add, Text, CBlue v26word, subtlety
Gui, theSpellingList2:Add, Text, CBlue v27word, relevant
Gui, theSpellingList2:Add, Text, CBlue v28word, receipt
Gui, theSpellingList2:Add, Text, CBlue v29word, underneath


GuiControl, theSpellingList2:Move, Logo, x210
GuiControl, theSpellingList2:Move, Save, x230 y430
GuiControl, theSpellingList2:Move, GoBack, x80 y430


GuiControl, theSpellingList2:Move, 15on, x365 y360
GuiControl, theSpellingList2:Move, 15word, x410 y355

GuiControl, theSpellingList2:Move, 16on, x365 y390
GuiControl, theSpellingList2:Move, 16word, x410 y385

GuiControl, theSpellingList2:Move, 17on, x85 y180
GuiControl, theSpellingList2:Move, 17word, x130 y175

GuiControl, theSpellingList2:Move, 18on, x85 y210
GuiControl, theSpellingList2:Move, 18word, x130 y205

GuiControl, theSpellingList2:Move, 19on, x85 y240
GuiControl, theSpellingList2:Move, 19word, x130 y235

GuiControl, theSpellingList2:Move, 20on, x85 y270
GuiControl, theSpellingList2:Move, 20word, x130 y265

GuiControl, theSpellingList2:Move, 21on, x85 y300
GuiControl, theSpellingList2:Move, 21word, x130 y295

GuiControl, theSpellingList2:Move, 22on, x85 y330
GuiControl, theSpellingList2:Move, 22word, x130 y325

GuiControl, theSpellingList2:Move, 23on, x85 y360
GuiControl, theSpellingList2:Move, 23word, x130 y355

GuiControl, theSpellingList2:Move, 24on, x365 y330
GuiControl, theSpellingList2:Move, 24word, x410 y325

GuiControl, theSpellingList2:Move, 25on, x365 y180
GuiControl, theSpellingList2:Move, 25word, x410 y175

GuiControl, theSpellingList2:Move, 26on, x365 y210
GuiControl, theSpellingList2:Move, 26word, x410 y205

GuiControl, theSpellingList2:Move, 27on, x365 y240
GuiControl, theSpellingList2:Move, 27word, x410 y235

GuiControl, theSpellingList2:Move, 28on, x365 y270
GuiControl, theSpellingList2:Move, 28word, x410 y265

GuiControl, theSpellingList2:Move, 29on, x365 y300
GuiControl, theSpellingList2:Move, 29word, x410 y295

Gui, theSpellingList2:Font, S10, w700
Gui, theSpellingList2:Add, Text, center y475 w570 x20 vFeedback gFeedback, Feedback
Gui, theSpellingList2:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Spelling List (2 of 2)


Gui, theSpellingMenu:destroy
Gui, theSpellingList:destroy
Return

SpellingProcess:
ini = %A_ScriptDir%\spellaid\settings.ini

Gui, Submit, NoHide

if (01on = 1)
{
IniWrite, 1, %ini%, spellaid01, KEY1
}
else
{
IniWrite, 0, %ini%, spellaid01, KEY1
}

if (02on = 1)
{
IniWrite, 1, %ini%, spellaid02, KEY1
}
else
{
IniWrite, 0, %ini%, spellaid02, KEY1
}

if (03on = 1)
{
IniWrite, 1, %ini%, spellaid03, KEY1
}
else
{
IniWrite, 0, %ini%, spellaid03, KEY1
}

if (04on = 1)
{
IniWrite, 1, %ini%, spellaid04, KEY1
}
else
{
IniWrite, 0, %ini%, spellaid04, KEY1
}

if (05on = 1)
{
IniWrite, 1, %ini%, spellaid05, KEY1
}
else
{
IniWrite, 0, %ini%, spellaid05, KEY1
}

if (06on = 1)
{
IniWrite, 1, %ini%, spellaid06, KEY1
}
else
{
IniWrite, 0, %ini%, spellaid06, KEY1
}

if (07on = 1)
{
IniWrite, 1, %ini%, spellaid07, KEY1
}
else
{
IniWrite, 0, %ini%, spellaid07, KEY1
}

if (08on = 1)
{
IniWrite, 1, %ini%, spellaid08, KEY1
}
else
{
IniWrite, 0, %ini%, spellaid08, KEY1
}

if (09on = 1)
{
IniWrite, 1, %ini%, spellaid09, KEY1
}
else
{
IniWrite, 0, %ini%, spellaid09, KEY1
}

if (10on = 1)
{
IniWrite, 1, %ini%, spellaid10, KEY1
}
else
{
IniWrite, 0, %ini%, spellaid10, KEY1
}

if (11on = 1)
{
IniWrite, 1, %ini%, spellaid11, KEY1
}
else
{
IniWrite, 0, %ini%, spellaid11, KEY1
}

if (12on = 1)
{
IniWrite, 1, %ini%, spellaid12, KEY1
}
else
{
IniWrite, 0, %ini%, spellaid12, KEY1
}

if (13on = 1)
{
IniWrite, 1, %ini%, spellaid13, KEY1
}
else
{
IniWrite, 0, %ini%, spellaid13, KEY1
}

if (14on = 1)
{
IniWrite, 1, %ini%, spellaid14, KEY1
}
else
{
IniWrite, 0, %ini%, spellaid14, KEY1
}

if (15on = 1)
{
IniWrite, 1, %ini%, spellaid15, KEY1
}
else
{
IniWrite, 0, %ini%, spellaid15, KEY1
}

if (16on = 1)
{
IniWrite, 1, %ini%, spellaid16, KEY1
}
else
{
IniWrite, 0, %ini%, spellaid16, KEY1
}

Gui, theSpellingList:destroy
send, !^+J
gosub, SpellingList
Return

SpellingProcess2:
ini = %A_ScriptDir%\spellaid\settings.ini

Gui, Submit, NoHide

if (17on = 1)
{
IniWrite, 1, %ini%, spellaid17, KEY1
}
else
{
IniWrite, 0, %ini%, spellaid17, KEY1
}

if (18on = 1)
{
IniWrite, 1, %ini%, spellaid18, KEY1
}
else
{
IniWrite, 0, %ini%, spellaid18, KEY1
}

if (19on = 1)
{
IniWrite, 1, %ini%, spellaid19, KEY1
}
else
{
IniWrite, 0, %ini%, spellaid19, KEY1
}

if (20on = 1)
{
IniWrite, 1, %ini%, spellaid20, KEY1
}
else
{
IniWrite, 0, %ini%, spellaid20, KEY1
}

if (21on = 1)
{
IniWrite, 1, %ini%, spellaid21, KEY1
}
else
{
IniWrite, 0, %ini%, spellaid21, KEY1
}


if (22on = 1)
{
IniWrite, 1, %ini%, spellaid22, KEY1
}
else
{
IniWrite, 0, %ini%, spellaid22, KEY1
}

if (23on = 1)
{
IniWrite, 1, %ini%, spellaid23, KEY1
}
else
{
IniWrite, 0, %ini%, spellaid23, KEY1
}

if (24on = 1)
{
IniWrite, 1, %ini%, spellaid24, KEY1
}
else
{
IniWrite, 0, %ini%, spellaid24, KEY1
}

if (25on = 1)
{
IniWrite, 1, %ini%, spellaid25, KEY1
}
else
{
IniWrite, 0, %ini%, spellaid25, KEY1
}

if (26on = 1)
{
IniWrite, 1, %ini%, spellaid26, KEY1
}
else
{
IniWrite, 0, %ini%, spellaid26, KEY1
}

if (27on = 1)
{
IniWrite, 1, %ini%, spellaid27, KEY1
}
else
{
IniWrite, 0, %ini%, spellaid27, KEY1
}

if (28on = 1)
{
IniWrite, 1, %ini%, spellaid28, KEY1
}
else
{
IniWrite, 0, %ini%, spellaid28, KEY1
}

if (29on = 1)
{
IniWrite, 1, %ini%, spellaid29, KEY1
}
else
{
IniWrite, 0, %ini%, spellaid29, KEY1
}

Gui, theSpellingList2:destroy
send, !^+J
gosub, SpellingList2
Return

CustomList:

WinGetPos, Xpos, Ypos
if Xpos is space
{
Xpos = Center
Ypos = Center
}
height = 500
GuiWidth = 600

IniRead, CustomHotkeyText1, %ini%, custHotkey01, KEY1
IniRead, CustomHotkeyCommand1, %ini%, custHotkey01, KEY2

IniRead, CustomHotkeyText2, %ini%, custHotkey02, KEY1
IniRead, CustomHotkeyCommand2, %ini%, custHotkey02, KEY2

IniRead, CustomHotkeyText3, %ini%, custHotkey03, KEY1
IniRead, CustomHotkeyCommand3, %ini%, custHotkey03, KEY2

IniRead, CustomHotkeyText4, %ini%, custHotkey04, KEY1
IniRead, CustomHotkeyCommand4, %ini%, custHotkey04, KEY2

IniRead, CustomHotkeyText5, %ini%, custHotkey05, KEY1
IniRead, CustomHotkeyCommand5, %ini%, custHotkey05, KEY2

Gui, theCustomList:Add, Picture, w180 h-1 vLogo gLogo, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theCustomList:Add, Picture, w140 h-1 vExit gGuiClose, %A_ScriptDir%\images\exit.jpg
Gui, theCustomList:Add, Picture, w140 h-1 vGoBack gCustom, %A_ScriptDir%\images\go_back.jpg
Gui, theCustomList:Add, Picture, w140 h-1 vNext gCustomList2, %A_ScriptDir%\images\next.jpg
Gui, theCustomList:Color, FFFFFF
Gui, theCustomList:Font, S24, w700
Gui, theCustomList:Add, Text, center CGray x20 y129 w550, Click on a Hotkey to edit
Gui, theCustomList:Font, S14, w700
if (CustomHotkeyText1 = "yes")
{
Gui, theCustomList:Add, Text, center CGreen x175 y+30 w250 gUserHotkeys01, %CustomHotkeyCommand1%
}
else
{
Gui, theCustomList:Add, Text, center CRed x175 y+30 w250 gUserHotkeys01, Custom Hotkey 01
}
if (CustomHotkeyText2 = "yes")
{
Gui, theCustomList:Add, Text, center CGreen x175 y+20 w250 gUserHotkeys02, %CustomHotkeyCommand2%
}
else
{
Gui, theCustomList:Add, Text, center CRed x175 y+20 w250 gUserHotkeys02, Custom Hotkey 02
}
if (CustomHotkeyText3 = "yes")
{
Gui, theCustomList:Add, Text, center CGreen x175 y+20 w250 gUserHotkeys03, %CustomHotkeyCommand3%
}
else
{
Gui, theCustomList:Add, Text, center CRed x175 y+20 w250 gUserHotkeys03, Custom Hotkey 03
}
if (CustomHotkeyText4 = "yes")
{
Gui, theCustomList:Add, Text, center CGreen x175 y+20 w250 gUserHotkeys04, %CustomHotkeyCommand4%
}
else
{
Gui, theCustomList:Add, Text, center CRed x175 y+20 w250 gUserHotkeys04, Custom Hotkey 04
}
if (CustomHotkeyText5 = "yes")
{
Gui, theCustomList:Add, Text, center CGreen x175 y+20 w250 gUserHotkeys05, %CustomHotkeyCommand5%
}
else
{
Gui, theCustomList:Add, Text, center CRed x175 y+20 w250 gUserHotkeys05, Custom Hotkey 05
}
Gui, theCustomList:Font, S10, w700
GuiControl, theCustomList:Move, Logo, x210
GuiControl, theCustomList:Move, Exit, x230 y430
GuiControl, theCustomList:Move, GoBack, x80 y430
GuiControl, theCustomList:Move, Next, x380 y430
Gui, theCustomList:Add, Text, center y475 w570 x20 vFeedback gFeedback, Feedback
Gui, theCustomList:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Edit AutoHotkeys - Custom Hotkeys 1 of 2

Gui, theCustom:destroy
Gui, userHotkeys01:destroy
Gui, userHotkeys02:destroy
Gui, userHotkeys03:destroy
Gui, userHotkeys04:destroy
Gui, userHotkeys05:destroy
Gui, userHotkeys06:destroy
Gui, userHotkeys07:destroy
Gui, userHotkeys08:destroy
Gui, userHotkeys09:destroy
Gui, userHotkeys10:destroy
Gui, theHotkeyChoice:destroy
Gui, theCustomList2:destroy

Return

CustomList2:

IniRead, CustomHotkeyText6, %ini%, custHotkey06, KEY1
IniRead, CustomHotkeyCommand6, %ini%, custHotkey06, KEY2

IniRead, CustomHotkeyText7, %ini%, custHotkey07, KEY1
IniRead, CustomHotkeyCommand7, %ini%, custHotkey07, KEY2

IniRead, CustomHotkeyText8, %ini%, custHotkey08, KEY1
IniRead, CustomHotkeyCommand8, %ini%, custHotkey08, KEY2

IniRead, CustomHotkeyText9, %ini%, custHotkey09, KEY1
IniRead, CustomHotkeyCommand9, %ini%, custHotkey09, KEY2

IniRead, CustomHotkeyText10, %ini%, custHotkey10, KEY1
IniRead, CustomHotkeyCommand10, %ini%, custHotkey10, KEY2

WinGetPos, Xpos, Ypos

height = 500
GuiWidth = 600

Gui, theCustomList2:Add, Picture, w180 h-1 vLogo gLogo, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theCustomList2:Add, Picture, w140 h-1 vExit gGuiClose, %A_ScriptDir%\images\exit.jpg
Gui, theCustomList2:Add, Picture, w140 h-1 vGoBack gCustomList, %A_ScriptDir%\images\go_back.jpg
Gui, theCustomList2:Color, FFFFFF
Gui, theCustomList2:Font, S24, w700
Gui, theCustomList2:Add, Text, center CGray x20 y129 w550, Click on a Hotkey to edit
Gui, theCustomList2:Font, S14, w700
if (CustomHotkeyText6 = "yes")
{
Gui, theCustomList2:Add, Text, center CGreen x175 y+30 w250 gUserHotkeys06, %CustomHotkeyCommand6%
}
else
{
Gui, theCustomList2:Add, Text, center CRed x175 y+30 w250 gUserHotkeys06, Custom Hotkey 06
}
if (CustomHotkeyText7 = "yes")
{
Gui, theCustomList2:Add, Text, center CGreen x175 y+20 w250 gUserHotkeys07, %CustomHotkeyCommand7%
}
else
{
Gui, theCustomList2:Add, Text, center CRed x175 y+20 w250 gUserHotkeys07, Custom Hotkey 07
}
if (CustomHotkeyText8 = "yes")
{
Gui, theCustomList2:Add, Text, center CGreen x175 y+20 w250 gUserHotkeys08, %CustomHotkeyCommand8%
}
else
{
Gui, theCustomList2:Add, Text, center CRed x175 y+20 w250 gUserHotkeys08, Custom Hotkey 08
}
if (CustomHotkeyText9 = "yes")
{
Gui, theCustomList2:Add, Text, center CGreen x175 y+20 w250 gUserHotkeys09, %CustomHotkeyCommand9%
}
else
{
Gui, theCustomList2:Add, Text, center CRed x175 y+20 w250 gUserHotkeys09, Custom Hotkey 09
}
if (CustomHotkeyText10 = "yes")
{
Gui, theCustomList2:Add, Text, center CGreen x175 y+20 w250 gUserHotkeys10, %CustomHotkeyCommand10%
}
else
{
Gui, theCustomList2:Add, Text, center CRed x175 y+20 w250 gUserHotkeys10, Custom Hotkey 10
}
Gui, theCustomList2:Font, S10, w700
GuiControl, theCustomList2:Move, Logo, x210
GuiControl, theCustomList2:Move, Exit, x230 y430
GuiControl, theCustomList2:Move, GoBack, x80 y430
Gui, theCustomList2:Add, Text, center y475 w570 x20 vFeedback gFeedback, Feedback
Gui, theCustomList2:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Edit AutoHotkeys - Custom Hotkeys 2 of 2

Gui, theCustomList:destroy
Gui, userHotkeys06:destroy
Gui, userHotkeys07:destroy
Gui, userHotkeys08:destroy
Gui, userHotkeys09:destroy
Gui, userHotkeys10:destroy
Return

UserHotkeys02:
WinGetPos, Xpos, Ypos
IniRead, CustomHotkeyText2, %ini%, custHotkey02, KEY1
IniRead, CustomHotkeyCommand2, %ini%, custHotkey02, KEY2

if (CustomHotkeyText2 = "yes")
{
FileRead, UserHotkeyText2, %A_ScriptDir%\text_files\custHotkey02.txt
}

tp := 6

height = 500
GuiWidth = 600
CustHotkey = 2
theCustFilename = custHotkey02

Gui, userHotkeys02:Add, Picture, w180 h-1 vLogo gLogo, %A_ScriptDir%\images\ahk_manual.jpg
Gui, userHotkeys02:Add, Picture, w140 h-1 vOutputClose gUHOutputClose, %A_ScriptDir%\images\save.jpg
Gui, userHotkeys02:Add, Picture, w140 h-1 vGoBack gCustomList, %A_ScriptDir%\images\go_back.jpg
if (CustomHotkeyText2 = "yes")
{
Gui, userHotkeys02:Add, Picture, w140 h-1 vDelete gDeleteCustomHotkey, %A_ScriptDir%\images\delete.jpg
}
Gui, userHotkeys02:Color, FFFFFF
Gui, userHotkeys02:Font, S14, w700
Gui, userHotkeys02:Add, Text, center CGray x80 y129 w440, *Create Your Custom Hotkey*
Gui, userHotkeys02:Font, S12, w700
if (CustomHotkeyText2 = "yes")
{
Gui, userHotkeys02:Add, Edit, xs-10 CGray x115 y169 w370 h35 +0x200 hwndEdit vNewUserHotkeyCommand, %CustomHotkeyCommand2%
}
else
{
Gui, userHotkeys02:Add, Edit, xs-10 CGray x115 y169 w370 h35 +0x200 hwndEdit vNewUserHotkeyCommand, Enter the hotkey command starting with #.
}
Gui, userHotkeys02:Font, S12, w700
if (CustomHotkeyText2 = "yes")
{
Gui, userHotkeys02:Add, Edit, xs-10 CGray x80 y219 w440 h190 +0x200 hwndEdit vNewUserHotkeyText, %UserHotkeyText2%
}
else
{
Gui, userHotkeys02:Add, Edit, xs-10 CGray x80 y219 w440 h190 +0x200 hwndEdit vNewUserHotkeyText, Enter your hotkey text here.
}
Gui, userHotkeys02:Font, S10, w700
GuiControl, userHotkeys02:Move, Logo, x210
GuiControl, userHotkeys02:Move, OutputClose, x380 y430
GuiControl, userHotkeys02:Move, GoBack, x80 y430
if (CustomHotkeyText2 = "yes")
{
GuiControl, userHotkeys02:Move, Delete, x230 y430
}
Gui, userHotkeys02:Add, Text, center y475 w570 x20 vFeedback gFeedback, Feedback
Gui, userHotkeys02:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Add Custom Hotkey

Gui, theHotkeyChoice:destroy
Gui, theCustomList:destroy

GuiControl, userHotkeys02:Focus, NewUserHotkeyCommand

VarSetCapacity( R, 16, 0 )

SendMessage, 0xB2,, % &R,, ahk_id %Edit%

x1:=NumGet( &R+0 ), y1:=NumGet( &R+4 )

x2:=NumGet( &R+8 ), y2:=NumGet( &R+12 )

NumPut( (x1+tp), &R, 0 ), NumPut( (y1+tp), &R, 4 )

NumPut( (x2+1), &R, 8 ), NumPut( (y2+y1+1), &R, 12 ) ; <-- compensation for upper padding

SendMessage, 0xB3, 0x0, % &R,, ahk_id %Edit%

Return

UserHotkeys03:
WinGetPos, Xpos, Ypos
IniRead, CustomHotkeyText3, %ini%, custHotkey03, KEY1
IniRead, CustomHotkeyCommand3, %ini%, custHotkey03, KEY2

if (CustomHotkeyText3 = "yes")
{
FileRead, UserHotkeyText3, %A_ScriptDir%\text_files\custHotkey03.txt
}

tp := 6

height = 500
GuiWidth = 600
CustHotkey = 3
theCustFilename = custHotkey03

Gui, userHotkeys03:Add, Picture, w180 h-1 vLogo gLogo, %A_ScriptDir%\images\ahk_manual.jpg
Gui, userHotkeys03:Add, Picture, w140 h-1 vOutputClose gUHOutputClose, %A_ScriptDir%\images\save.jpg
Gui, userHotkeys03:Add, Picture, w140 h-1 vGoBack gCustomList, %A_ScriptDir%\images\go_back.jpg
if (CustomHotkeyText3 = "yes")
{
Gui, userHotkeys03:Add, Picture, w140 h-1 vDelete gDeleteCustomHotkey, %A_ScriptDir%\images\delete.jpg
}
Gui, userHotkeys03:Color, FFFFFF
Gui, userHotkeys03:Font, S14, w700
Gui, userHotkeys03:Add, Text, center CGray x80 y129 w440, *Create Your Custom Hotkey*
Gui, userHotkeys03:Font, S12, w700
if (CustomHotkeyText3 = "yes")
{
Gui, userHotkeys03:Add, Edit, xs-10 CGray x115 y169 w370 h35 +0x200 hwndEdit vNewUserHotkeyCommand, %CustomHotkeyCommand3%
}
else
{
Gui, userHotkeys03:Add, Edit, xs-10 CGray x115 y169 w370 h35 +0x200 hwndEdit vNewUserHotkeyCommand, Enter the hotkey command starting with #.
}
Gui, userHotkeys03:Font, S12, w700
if (CustomHotkeyText3 = "yes")
{
Gui, userHotkeys03:Add, Edit, xs-10 CGray x80 y219 w440 h190 +0x200 hwndEdit vNewUserHotkeyText, %UserHotkeyText3%
}
else
{
Gui, userHotkeys03:Add, Edit, xs-10 CGray x80 y219 w440 h190 +0x200 hwndEdit vNewUserHotkeyText, Enter your hotkey text here.
}
Gui, userHotkeys03:Font, S10, w700
GuiControl, userHotkeys03:Move, Logo, x210
GuiControl, userHotkeys03:Move, OutputClose, x380 y430
GuiControl, userHotkeys03:Move, GoBack, x80 y430
if (CustomHotkeyText3 = "yes")
{
GuiControl, userHotkeys03:Move, Delete, x230 y430
}
Gui, userHotkeys03:Add, Text, center y475 w570 x20 vFeedback gFeedback, Feedback
Gui, userHotkeys03:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Add Custom Hotkey

Gui, theHotkeyChoice:destroy
Gui, theCustomList:destroy

GuiControl, userHotkeys03:Focus, NewUserHotkeyCommand

VarSetCapacity( R, 16, 0 )

SendMessage, 0xB2,, % &R,, ahk_id %Edit%

x1:=NumGet( &R+0 ), y1:=NumGet( &R+4 )

x2:=NumGet( &R+8 ), y2:=NumGet( &R+12 )

NumPut( (x1+tp), &R, 0 ), NumPut( (y1+tp), &R, 4 )

NumPut( (x2+1), &R, 8 ), NumPut( (y2+y1+1), &R, 12 ) ; <-- compensation for upper padding

SendMessage, 0xB3, 0x0, % &R,, ahk_id %Edit%

Return

UserHotkeys04:
WinGetPos, Xpos, Ypos
IniRead, CustomHotkeyText4, %ini%, custHotkey04, KEY1
IniRead, CustomHotkeyCommand4, %ini%, custHotkey04, KEY2

if (CustomHotkeyText4 = "yes")
{
FileRead, UserHotkeyText4, %A_ScriptDir%\text_files\custHotkey04.txt
}

tp := 6

height = 500
GuiWidth = 600
CustHotkey = 4
theCustFilename = custHotkey04

Gui, userHotkeys04:Add, Picture, w180 h-1 vLogo gLogo, %A_ScriptDir%\images\ahk_manual.jpg
Gui, userHotkeys04:Add, Picture, w140 h-1 vOutputClose gUHOutputClose, %A_ScriptDir%\images\save.jpg
Gui, userHotkeys04:Add, Picture, w140 h-1 vGoBack gCustomList, %A_ScriptDir%\images\go_back.jpg
if (CustomHotkeyText4 = "yes")
{
Gui, userHotkeys04:Add, Picture, w140 h-1 vDelete gDeleteCustomHotkey, %A_ScriptDir%\images\delete.jpg
}
Gui, userHotkeys04:Color, FFFFFF
Gui, userHotkeys04:Font, S14, w700
Gui, userHotkeys04:Add, Text, center CGray x80 y129 w440, *Create Your Custom Hotkey*
Gui, userHotkeys04:Font, S12, w700
if (CustomHotkeyText4 = "yes")
{
Gui, userHotkeys04:Add, Edit, xs-10 CGray x115 y169 w370 h35 +0x200 hwndEdit vNewUserHotkeyCommand, %CustomHotkeyCommand4%
}
else
{
Gui, userHotkeys04:Add, Edit, xs-10 CGray x115 y169 w370 h35 +0x200 hwndEdit vNewUserHotkeyCommand, Enter the hotkey command starting with #.
}
Gui, userHotkeys04:Font, S12, w700
if (CustomHotkeyText4 = "yes")
{
Gui, userHotkeys04:Add, Edit, xs-10 CGray x80 y219 w440 h190 +0x200 hwndEdit vNewUserHotkeyText, %UserHotkeyText4%
}
else
{
Gui, userHotkeys04:Add, Edit, xs-10 CGray x80 y219 w440 h190 +0x200 hwndEdit vNewUserHotkeyText, Enter your hotkey text here.
}
Gui, userHotkeys04:Font, S10, w700
GuiControl, userHotkeys04:Move, Logo, x210
GuiControl, userHotkeys04:Move, OutputClose, x380 y430
GuiControl, userHotkeys04:Move, GoBack, x80 y430
if (CustomHotkeyText4 = "yes")
{
GuiControl, userHotkeys04:Move, Delete, x230 y430
}
Gui, userHotkeys04:Add, Text, center y475 w570 x20 vFeedback gFeedback, Feedback
Gui, userHotkeys04:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Add Custom Hotkey

Gui, theHotkeyChoice:destroy
Gui, theCustomList:destroy

GuiControl, userHotkeys04:Focus, NewUserHotkeyCommand

VarSetCapacity( R, 16, 0 )

SendMessage, 0xB2,, % &R,, ahk_id %Edit%

x1:=NumGet( &R+0 ), y1:=NumGet( &R+4 )

x2:=NumGet( &R+8 ), y2:=NumGet( &R+12 )

NumPut( (x1+tp), &R, 0 ), NumPut( (y1+tp), &R, 4 )

NumPut( (x2+1), &R, 8 ), NumPut( (y2+y1+1), &R, 12 ) ; <-- compensation for upper padding

SendMessage, 0xB3, 0x0, % &R,, ahk_id %Edit%

Return

UserHotkeys05:
WinGetPos, Xpos, Ypos
IniRead, CustomHotkeyText5, %ini%, custHotkey05, KEY1
IniRead, CustomHotkeyCommand5, %ini%, custHotkey05, KEY2

if (CustomHotkeyText5 = "yes")
{
FileRead, UserHotkeyText5, %A_ScriptDir%\text_files\custHotkey05.txt
}

tp := 6

height = 500
GuiWidth = 600
CustHotkey = 5
theCustFilename = custHotkey05

Gui, userHotkeys05:Add, Picture, w180 h-1 vLogo gLogo, %A_ScriptDir%\images\ahk_manual.jpg
Gui, userHotkeys05:Add, Picture, w140 h-1 vOutputClose gUHOutputClose, %A_ScriptDir%\images\save.jpg
Gui, userHotkeys05:Add, Picture, w140 h-1 vGoBack gCustomList, %A_ScriptDir%\images\go_back.jpg
if (CustomHotkeyText5 = "yes")
{
Gui, userHotkeys05:Add, Picture, w140 h-1 vDelete gDeleteCustomHotkey, %A_ScriptDir%\images\delete.jpg
}
Gui, userHotkeys05:Color, FFFFFF
Gui, userHotkeys05:Font, S14, w700
Gui, userHotkeys05:Add, Text, center CGray x80 y129 w440, *Create Your Custom Hotkey*
Gui, userHotkeys05:Font, S12, w700
if (CustomHotkeyText5 = "yes")
{
Gui, userHotkeys05:Add, Edit, xs-10 CGray x115 y169 w370 h35 +0x200 hwndEdit vNewUserHotkeyCommand, %CustomHotkeyCommand5%
}
else
{
Gui, userHotkeys05:Add, Edit, xs-10 CGray x115 y169 w370 h35 +0x200 hwndEdit vNewUserHotkeyCommand, Enter the hotkey command starting with #.
}
Gui, userHotkeys05:Font, S12, w700
if (CustomHotkeyText5 = "yes")
{
Gui, userHotkeys05:Add, Edit, xs-10 CGray x80 y219 w440 h190 +0x200 hwndEdit vNewUserHotkeyText, %UserHotkeyText5%
}
else
{
Gui, userHotkeys05:Add, Edit, xs-10 CGray x80 y219 w440 h190 +0x200 hwndEdit vNewUserHotkeyText, Enter your hotkey text here.
}
Gui, userHotkeys05:Font, S10, w700
GuiControl, userHotkeys05:Move, Logo, x210
GuiControl, userHotkeys05:Move, OutputClose, x380 y430
GuiControl, userHotkeys05:Move, GoBack, x80 y430
if (CustomHotkeyText5 = "yes")
{
GuiControl, userHotkeys05:Move, Delete, x230 y430
}
Gui, userHotkeys05:Add, Text, center y475 w570 x20 vFeedback gFeedback, Feedback
Gui, userHotkeys05:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Add Custom Hotkey

Gui, theHotkeyChoice:destroy
Gui, theCustomList:destroy

GuiControl, userHotkeys05:Focus, NewUserHotkeyCommand

VarSetCapacity( R, 16, 0 )

SendMessage, 0xB2,, % &R,, ahk_id %Edit%

x1:=NumGet( &R+0 ), y1:=NumGet( &R+4 )

x2:=NumGet( &R+8 ), y2:=NumGet( &R+12 )

NumPut( (x1+tp), &R, 0 ), NumPut( (y1+tp), &R, 4 )

NumPut( (x2+1), &R, 8 ), NumPut( (y2+y1+1), &R, 12 ) ; <-- compensation for upper padding

SendMessage, 0xB3, 0x0, % &R,, ahk_id %Edit%

Return

UserHotkeys06:
WinGetPos, Xpos, Ypos
IniRead, CustomHotkeyText6, %ini%, custHotkey06, KEY1
IniRead, CustomHotkeyCommand6, %ini%, custHotkey06, KEY2

if (CustomHotkeyText6 = "yes")
{
FileRead, UserHotkeyText6, %A_ScriptDir%\text_files\custHotkey06.txt
}

tp := 6

height = 500
GuiWidth = 600
CustHotkey = 6
theCustFilename = custHotkey06

Gui, userHotkeys06:Add, Picture, w180 h-1 vLogo gLogo, %A_ScriptDir%\images\ahk_manual.jpg
Gui, userHotkeys06:Add, Picture, w140 h-1 vOutputClose gUHOutputClose, %A_ScriptDir%\images\save.jpg
Gui, userHotkeys06:Add, Picture, w140 h-1 vGoBack gCustomList2, %A_ScriptDir%\images\go_back.jpg
if (CustomHotkeyText6 = "yes")
{
Gui, userHotkeys06:Add, Picture, w140 h-1 vDelete gDeleteCustomHotkey, %A_ScriptDir%\images\delete.jpg
}
Gui, userHotkeys06:Color, FFFFFF
Gui, userHotkeys06:Font, S14, w700
Gui, userHotkeys06:Add, Text, center CGray x80 y129 w440, *Create Your Custom Hotkey*
Gui, userHotkeys06:Font, S12, w700
if (CustomHotkeyText6 = "yes")
{
Gui, userHotkeys06:Add, Edit, xs-10 CGray x115 y169 w370 h35 +0x200 hwndEdit vNewUserHotkeyCommand, %CustomHotkeyCommand6%
}
else
{
Gui, userHotkeys06:Add, Edit, xs-10 CGray x115 y169 w370 h35 +0x200 hwndEdit vNewUserHotkeyCommand, Enter the hotkey command starting with #.
}
Gui, userHotkeys06:Font, S12, w700
if (CustomHotkeyText6 = "yes")
{
Gui, userHotkeys06:Add, Edit, xs-10 CGray x80 y219 w440 h190 +0x200 hwndEdit vNewUserHotkeyText, %UserHotkeyText6%
}
else
{
Gui, userHotkeys06:Add, Edit, xs-10 CGray x80 y219 w440 h190 +0x200 hwndEdit vNewUserHotkeyText, Enter your hotkey text here.
}
Gui, userHotkeys06:Font, S10, w700
GuiControl, userHotkeys06:Move, Logo, x210
GuiControl, userHotkeys06:Move, OutputClose, x380 y430
GuiControl, userHotkeys06:Move, GoBack, x80 y430
if (CustomHotkeyText6 = "yes")
{
GuiControl, userHotkeys06:Move, Delete, x230 y430
}
Gui, userHotkeys06:Add, Text, center y475 w570 x20 vFeedback gFeedback, Feedback
Gui, userHotkeys06:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Add Custom Hotkey

Gui, theHotkeyChoice:destroy
Gui, theCustomList2:destroy

GuiControl, userHotkeys06:Focus, NewUserHotkeyCommand

VarSetCapacity( R, 16, 0 )

SendMessage, 0xB2,, % &R,, ahk_id %Edit%

x1:=NumGet( &R+0 ), y1:=NumGet( &R+4 )

x2:=NumGet( &R+8 ), y2:=NumGet( &R+12 )

NumPut( (x1+tp), &R, 0 ), NumPut( (y1+tp), &R, 4 )

NumPut( (x2+1), &R, 8 ), NumPut( (y2+y1+1), &R, 12 ) ; <-- compensation for upper padding

SendMessage, 0xB3, 0x0, % &R,, ahk_id %Edit%

Return

UserHotkeys07:
WinGetPos, Xpos, Ypos
IniRead, CustomHotkeyText7, %ini%, custHotkey07, KEY1
IniRead, CustomHotkeyCommand7, %ini%, custHotkey07, KEY2

if (CustomHotkeyText7 = "yes")
{
FileRead, UserHotkeyText7, %A_ScriptDir%\text_files\custHotkey07.txt
}

tp := 6

height = 500
GuiWidth = 600
CustHotkey = 7
theCustFilename = custHotkey07

Gui, userHotkeys07:Add, Picture, w180 h-1 vLogo gLogo, %A_ScriptDir%\images\ahk_manual.jpg
Gui, userHotkeys07:Add, Picture, w140 h-1 vOutputClose gUHOutputClose, %A_ScriptDir%\images\save.jpg
Gui, userHotkeys07:Add, Picture, w140 h-1 vGoBack gCustomList2, %A_ScriptDir%\images\go_back.jpg
if (CustomHotkeyText7 = "yes")
{
Gui, userHotkeys07:Add, Picture, w140 h-1 vDelete gDeleteCustomHotkey, %A_ScriptDir%\images\delete.jpg
}
Gui, userHotkeys07:Color, FFFFFF
Gui, userHotkeys07:Font, S14, w700
Gui, userHotkeys07:Add, Text, center CGray x80 y129 w440, *Create Your Custom Hotkey*
Gui, userHotkeys07:Font, S12, w700
if (CustomHotkeyText7 = "yes")
{
Gui, userHotkeys07:Add, Edit, xs-10 CGray x115 y169 w370 h35 +0x200 hwndEdit vNewUserHotkeyCommand, %CustomHotkeyCommand7%
}
else
{
Gui, userHotkeys07:Add, Edit, xs-10 CGray x115 y169 w370 h35 +0x200 hwndEdit vNewUserHotkeyCommand, Enter the hotkey command starting with #.
}
Gui, userHotkeys07:Font, S12, w700
if (CustomHotkeyText7 = "yes")
{
Gui, userHotkeys07:Add, Edit, xs-10 CGray x80 y219 w440 h190 +0x200 hwndEdit vNewUserHotkeyText, %UserHotkeyText7%
}
else
{
Gui, userHotkeys07:Add, Edit, xs-10 CGray x80 y219 w440 h190 +0x200 hwndEdit vNewUserHotkeyText, Enter your hotkey text here.
}
Gui, userHotkeys07:Font, S10, w700
GuiControl, userHotkeys07:Move, Logo, x210
GuiControl, userHotkeys07:Move, OutputClose, x380 y430
GuiControl, userHotkeys07:Move, GoBack, x80 y430
if (CustomHotkeyText7 = "yes")
{
GuiControl, userHotkeys07:Move, Delete, x230 y430
}
Gui, userHotkeys07:Add, Text, center y475 w570 x20 vFeedback gFeedback, Feedback
Gui, userHotkeys07:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Add Custom Hotkey

Gui, theHotkeyChoice:destroy
Gui, theCustomList2:destroy

GuiControl, userHotkeys07:Focus, NewUserHotkeyCommand

VarSetCapacity( R, 16, 0 )

SendMessage, 0xB2,, % &R,, ahk_id %Edit%

x1:=NumGet( &R+0 ), y1:=NumGet( &R+4 )

x2:=NumGet( &R+8 ), y2:=NumGet( &R+12 )

NumPut( (x1+tp), &R, 0 ), NumPut( (y1+tp), &R, 4 )

NumPut( (x2+1), &R, 8 ), NumPut( (y2+y1+1), &R, 12 ) ; <-- compensation for upper padding

SendMessage, 0xB3, 0x0, % &R,, ahk_id %Edit%

Return

UserHotkeys08:
WinGetPos, Xpos, Ypos
IniRead, CustomHotkeyText8, %ini%, custHotkey08, KEY1
IniRead, CustomHotkeyCommand8, %ini%, custHotkey08, KEY2

if (CustomHotkeyText8 = "yes")
{
FileRead, UserHotkeyText8, %A_ScriptDir%\text_files\custHotkey08.txt
}

tp := 6

height = 500
GuiWidth = 600
CustHotkey = 8
theCustFilename = custHotkey08

Gui, userHotkeys08:Add, Picture, w180 h-1 vLogo gLogo, %A_ScriptDir%\images\ahk_manual.jpg
Gui, userHotkeys08:Add, Picture, w140 h-1 vOutputClose gUHOutputClose, %A_ScriptDir%\images\save.jpg
Gui, userHotkeys08:Add, Picture, w140 h-1 vGoBack gCustomList2, %A_ScriptDir%\images\go_back.jpg
if (CustomHotkeyText8 = "yes")
{
Gui, userHotkeys08:Add, Picture, w140 h-1 vDelete gDeleteCustomHotkey, %A_ScriptDir%\images\delete.jpg
}
Gui, userHotkeys08:Color, FFFFFF
Gui, userHotkeys08:Font, S14, w700
Gui, userHotkeys08:Add, Text, center CGray x80 y129 w440, *Create Your Custom Hotkey*
Gui, userHotkeys08:Font, S12, w700
if (CustomHotkeyText8 = "yes")
{
Gui, userHotkeys08:Add, Edit, xs-10 CGray x115 y169 w370 h35 +0x200 hwndEdit vNewUserHotkeyCommand, %CustomHotkeyCommand8%
}
else
{
Gui, userHotkeys08:Add, Edit, xs-10 CGray x115 y169 w370 h35 +0x200 hwndEdit vNewUserHotkeyCommand, Enter the hotkey command starting with #.
}
Gui, userHotkeys08:Font, S12, w700
if (CustomHotkeyText8 = "yes")
{
Gui, userHotkeys08:Add, Edit, xs-10 CGray x80 y219 w440 h190 +0x200 hwndEdit vNewUserHotkeyText, %UserHotkeyText8%
}
else
{
Gui, userHotkeys08:Add, Edit, xs-10 CGray x80 y219 w440 h190 +0x200 hwndEdit vNewUserHotkeyText, Enter your hotkey text here.
}
Gui, userHotkeys08:Font, S10, w700
GuiControl, userHotkeys08:Move, Logo, x210
GuiControl, userHotkeys08:Move, OutputClose, x380 y430
GuiControl, userHotkeys08:Move, GoBack, x80 y430
if (CustomHotkeyText8 = "yes")
{
GuiControl, userHotkeys08:Move, Delete, x230 y430
}
Gui, userHotkeys08:Add, Text, center y475 w570 x20 vFeedback gFeedback, Feedback
Gui, userHotkeys08:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Add Custom Hotkey

Gui, theHotkeyChoice:destroy
Gui, theCustomList2:destroy

GuiControl, userHotkeys08:Focus, NewUserHotkeyCommand

VarSetCapacity( R, 16, 0 )

SendMessage, 0xB2,, % &R,, ahk_id %Edit%

x1:=NumGet( &R+0 ), y1:=NumGet( &R+4 )

x2:=NumGet( &R+8 ), y2:=NumGet( &R+12 )

NumPut( (x1+tp), &R, 0 ), NumPut( (y1+tp), &R, 4 )

NumPut( (x2+1), &R, 8 ), NumPut( (y2+y1+1), &R, 12 ) ; <-- compensation for upper padding

SendMessage, 0xB3, 0x0, % &R,, ahk_id %Edit%

Return

UserHotkeys09:
WinGetPos, Xpos, Ypos
IniRead, CustomHotkeyText9, %ini%, custHotkey09, KEY1
IniRead, CustomHotkeyCommand9, %ini%, custHotkey09, KEY2

if (CustomHotkeyText9 = "yes")
{
FileRead, UserHotkeyText9, %A_ScriptDir%\text_files\custHotkey09.txt
}

tp := 6

height = 500
GuiWidth = 600
CustHotkey = 9
theCustFilename = custHotkey09

Gui, userHotkeys09:Add, Picture, w180 h-1 vLogo gLogo, %A_ScriptDir%\images\ahk_manual.jpg
Gui, userHotkeys09:Add, Picture, w140 h-1 vOutputClose gUHOutputClose, %A_ScriptDir%\images\save.jpg
Gui, userHotkeys09:Add, Picture, w140 h-1 vGoBack gCustomList2, %A_ScriptDir%\images\go_back.jpg
if (CustomHotkeyText9 = "yes")
{
Gui, userHotkeys09:Add, Picture, w140 h-1 vDelete gDeleteCustomHotkey, %A_ScriptDir%\images\delete.jpg
}
Gui, userHotkeys09:Color, FFFFFF
Gui, userHotkeys09:Font, S14, w700
Gui, userHotkeys09:Add, Text, center CGray x80 y129 w440, *Create Your Custom Hotkey*
Gui, userHotkeys09:Font, S12, w700
if (CustomHotkeyText9 = "yes")
{
Gui, userHotkeys09:Add, Edit, xs-10 CGray x115 y169 w370 h35 +0x200 hwndEdit vNewUserHotkeyCommand, %CustomHotkeyCommand9%
}
else
{
Gui, userHotkeys09:Add, Edit, xs-10 CGray x115 y169 w370 h35 +0x200 hwndEdit vNewUserHotkeyCommand, Enter the hotkey command starting with #.
}
Gui, userHotkeys09:Font, S12, w700
if (CustomHotkeyText9 = "yes")
{
Gui, userHotkeys09:Add, Edit, xs-10 CGray x80 y219 w440 h190 +0x200 hwndEdit vNewUserHotkeyText, %UserHotkeyText9%
}
else
{
Gui, userHotkeys09:Add, Edit, xs-10 CGray x80 y219 w440 h190 +0x200 hwndEdit vNewUserHotkeyText, Enter your hotkey text here.
}
Gui, userHotkeys09:Font, S10, w700
GuiControl, userHotkeys09:Move, Logo, x210
GuiControl, userHotkeys09:Move, OutputClose, x380 y430
GuiControl, userHotkeys09:Move, GoBack, x80 y430
if (CustomHotkeyText9 = "yes")
{
GuiControl, userHotkeys09:Move, Delete, x230 y430
}
Gui, userHotkeys09:Add, Text, center y475 w570 x20 vFeedback gFeedback, Feedback
Gui, userHotkeys09:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Add Custom Hotkey

Gui, theHotkeyChoice:destroy
Gui, theCustomList2:destroy

GuiControl, userHotkeys09:Focus, NewUserHotkeyCommand

VarSetCapacity( R, 16, 0 )

SendMessage, 0xB2,, % &R,, ahk_id %Edit%

x1:=NumGet( &R+0 ), y1:=NumGet( &R+4 )

x2:=NumGet( &R+8 ), y2:=NumGet( &R+12 )

NumPut( (x1+tp), &R, 0 ), NumPut( (y1+tp), &R, 4 )

NumPut( (x2+1), &R, 8 ), NumPut( (y2+y1+1), &R, 12 ) ; <-- compensation for upper padding

SendMessage, 0xB3, 0x0, % &R,, ahk_id %Edit%
Return

UserHotkeys10:
WinGetPos, Xpos, Ypos
IniRead, CustomHotkeyText10, %ini%, custHotkey10, KEY1
IniRead, CustomHotkeyCommand10, %ini%, custHotkey10, KEY2

if (CustomHotkeyText10 = "yes")
{
FileRead, UserHotkeyText10, %A_ScriptDir%\text_files\custHotkey10.txt
}

tp := 6

height = 500
GuiWidth = 600
CustHotkey = 10
theCustFilename = custHotkey10

Gui, userHotkeys10:Add, Picture, w180 h-1 vLogo gLogo, %A_ScriptDir%\images\ahk_manual.jpg
Gui, userHotkeys10:Add, Picture, w140 h-1 vOutputClose gUHOutputClose, %A_ScriptDir%\images\save.jpg
Gui, userHotkeys10:Add, Picture, w140 h-1 vGoBack gCustomList2, %A_ScriptDir%\images\go_back.jpg
if (CustomHotkeyText10 = "yes")
{
Gui, userHotkeys10:Add, Picture, w140 h-1 vDelete gDeleteCustomHotkey, %A_ScriptDir%\images\delete.jpg
}
Gui, userHotkeys10:Color, FFFFFF
Gui, userHotkeys10:Font, S14, w700
Gui, userHotkeys10:Add, Text, center CGray x80 y129 w440, *Create Your Custom Hotkey*
Gui, userHotkeys10:Font, S12, w700
if (CustomHotkeyText10 = "yes")
{
Gui, userHotkeys10:Add, Edit, xs-10 CGray x115 y169 w370 h35 +0x200 hwndEdit vNewUserHotkeyCommand, %CustomHotkeyCommand10%
}
else
{
Gui, userHotkeys10:Add, Edit, xs-10 CGray x115 y169 w370 h35 +0x200 hwndEdit vNewUserHotkeyCommand, Enter the hotkey command starting with #.
}
Gui, userHotkeys10:Font, S12, w700
if (CustomHotkeyText10 = "yes")
{
Gui, userHotkeys10:Add, Edit, xs-10 CGray x80 y219 w440 h190 +0x200 hwndEdit vNewUserHotkeyText, %UserHotkeyText10%
}
else
{
Gui, userHotkeys10:Add, Edit, xs-10 CGray x80 y219 w440 h190 +0x200 hwndEdit vNewUserHotkeyText, Enter your hotkey text here.
}
Gui, userHotkeys10:Font, S10, w700
GuiControl, userHotkeys10:Move, Logo, x210
GuiControl, userHotkeys10:Move, OutputClose, x380 y430
GuiControl, userHotkeys10:Move, GoBack, x80 y430
if (CustomHotkeyText10 = "yes")
{
GuiControl, userHotkeys10:Move, Delete, x230 y430
}
Gui, userHotkeys10:Add, Text, center y475 w570 x20 vFeedback gFeedback, Feedback
Gui, userHotkeys10:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Add Custom Hotkey

Gui, theHotkeyChoice:destroy
Gui, theCustomList2:destroy

GuiControl, userHotkeys10:Focus, NewUserHotkeyCommand

VarSetCapacity( R, 16, 0 )

SendMessage, 0xB2,, % &R,, ahk_id %Edit%

x1:=NumGet( &R+0 ), y1:=NumGet( &R+4 )

x2:=NumGet( &R+8 ), y2:=NumGet( &R+12 )

NumPut( (x1+tp), &R, 0 ), NumPut( (y1+tp), &R, 4 )

NumPut( (x2+1), &R, 8 ), NumPut( (y2+y1+1), &R, 12 ) ; <-- compensation for upper padding

SendMessage, 0xB3, 0x0, % &R,, ahk_id %Edit%
Return


GuiCloseLaunch:
ExitApp
Return

theHotkeyChoiceGuiClose:
ExitApp

theFUDesignGuiClose:
ExitApp

theFUGeneralGuiClose:
ExitApp

theFUOrderGuiClose:
ExitApp

theFUFixGuiClose:
ExitApp

theFUQuoteGuiClose:
ExitApp

theMenuGuiClose:
ExitApp

theNickGuiClose:
ExitApp

theEmailGuiClose:
ExitApp

theChoiceGuiClose:
ExitApp

theCustomGuiClose:
ExitApp

openingHKGuiClose:
ExitApp

theHeyDesignGuiClose:
ExitApp

theHeyPricingGuiClose:
ExitApp

theSettings1GuiClose:
ExitApp

theSettingsGuiClose:
ExitApp

closingHKGuiClose:
ExitApp

theGeneralClosingGuiClose:
ExitApp

theByeOrderGuiClose:
ExitApp

userHotkeys01GuiClose:
ExitApp

userHotkeys02GuiClose:
ExitApp

userHotkeys03GuiClose:
ExitApp

userHotkeys04GuiClose:
ExitApp

userHotkeys05GuiClose:
ExitApp

userHotkeys06GuiClose:
ExitApp

userHotkeys07GuiClose:
ExitApp

userHotkeys08GuiClose:
ExitApp

userHotkeys09GuiClose:
ExitApp

userHotkeys10GuiClose:
ExitApp

theCustomListGuiClose:
ExitApp

theCustomList2GuiClose:
ExitApp

theCustomChatGuiClose:
ExitApp

theCustomChat2GuiClose:
ExitApp

theAltNGuiClose:
ExitApp

theAltIGuiClose:
ExitApp

theAltHGuiClose:
ExitApp

theAltSGuiClose:
ExitApp

theAltXGuiClose:
ExitApp

theAltDGuiClose:
ExitApp

theAltGGuiClose:
ExitApp

theAltZGuiClose:
ExitApp

theAltCGuiClose:
ExitApp

theAltBGuiClose:
ExitApp

theSpellingMenuGuiClose:
ExitApp

theSpellingListGuiClose:
ExitApp

theSpellingList2GuiClose:
ExitApp

theSuggestSpellingGuiClose:
ExitApp

GuiClose:
ExitApp
