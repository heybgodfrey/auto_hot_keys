#SingleInstance Force
DetectHiddenWindows On

INI=%A_ScriptDir%\settings.ini

IniRead, skill, %ini%, clientSkill, KEY1
IniRead, showNick, %ini%, clientNick, KEY1
IniRead, showEmail, %ini%, clientEmail, KEY1
IniRead, showName, %ini%, clientName, KEY1
IniRead, showTeam, %ini%, clientTeam, KEY1

GuiWidth = 965
GuiHeight = 630

Opening:
WinGetPos, Xpos, Ypos	

if (!Xpos) || (!Ypos)
{
Xpos = Center
Ypos = Center
}

if (showTeam = "Magenta")
{
TeamPic = %A_ScriptDir%\images\magenta1.jpg
TeamURL = https://sites.google.com/customink.com/magenta-team-site/home
}
else if (showTeam = "Navy")
{
TeamPic = %A_ScriptDir%\images\navy1.jpg
TeamURL = https://sites.google.com/customink.com/navydillos/home
}
else if (showTeam = "Purple")
{
TeamPic = %A_ScriptDir%\images\purple.jpg
TeamURL = https://docs.google.com/spreadsheets/d/1AQky4qwVD9_paLq3GZG-E-jYDH3RvIb-iaLVv7OF9JM/edit?usp=sharing
}
else
{
TeamPic = %A_ScriptDir%\images\problem_reporting.jpg
TeamURL = https://inkernet.customink.com/display/ss/Problem+Reporting
}

Gui, Opening: New
Gui, Opening: Color, DFDDDA
Gui, Opening: Font, S26 Norm, Arial Bold Italic
Gui, Opening: Add, Picture, w200 h33 x22 y15 vLogo, %A_ScriptDir%\images\logo.jpg
;Gui, Opening: Add, Picture, w20 h20 x920 y20 vMenu, %A_ScriptDir%\images\menu.jpg
Gui, Opening: Add, Picture, w225 h267 x485 y65 vBG2 gRSU, %A_ScriptDir%\images\bg2.jpg
Gui, Opening: Add, Picture, w225 h267 x715 y65 vBG3 gSwap, %A_ScriptDir%\images\swapped_packages.jpg
Gui, Opening: Add, Picture, w225 h267 x25 y337 vcalculator gCalculator, %A_ScriptDir%\images\calculator.jpg
Gui, Opening: Add, Picture, w225 h267 x255 y337 vDPS gDPS, %A_ScriptDir%\images\dps.jpg
Gui, Opening: Add, Picture, w225 h267 x485 y337 vDYO gDYO, %A_ScriptDir%\images\copytodyo.jpg
Gui, Opening: Add, Picture, w225 h267 x25 y65 vTeamPage gTeamURL, %TeamPic%
Gui, Opening: Add, Picture, w225 h267 x255 y65 vReturnsChat gReturnsChat, %A_ScriptDir%\images\returnschat.jpg
Gui, Opening: Add, Picture, w225 h267 x715 y337 vReturn gUPSTool, %A_ScriptDir%\images\return.jpg ; Add gUPSTool later on
Gui, Opening: Show, x%Xpos% y%Ypos% w%GuiWidth% h%GuiHeight%, Main Menu
Gui, Calculator:destroy
Gui, UPS:destroy
Gui, WizardOpening:destroy
Gui, BlanksMenu:destroy
Gui, Sizing:destroy
Gui, Swap:destroy
Gui, Swap1:destroy
processing=
Return

TeamURL:
Run, %TeamURL%
Return

DYO:
Run, http://home.customink.com/backend/design/copy_to_dyo
Return

ReturnsChat:
Run, http://order-chat.in.customink.com/home
Return

DPS:
Run, http:\\goo.gl/13b5sC
Return


RSU:
Run, https://inkernet.customink.com/pages/viewpage.action?pageId=705757381
Return

SingleSwap:
WinGetPos, Xpos, Ypos

Gui, SingleSwap: New
Gui, SingleSwap: Color, DFDDDA

Gui, SingleSwap: Add, Picture, w965 h91 x0 y0 vheader, %A_ScriptDir%\images\swap\header_2.jpg
Gui, SingleSwap: Add, Text, w225 h40 x230 BackgroundTrans y35 gSwap,


Gui, SingleSwap: Add, Picture, w200 h33 x22 y15 vLogo gOpening, %A_ScriptDir%\images\logo.jpg
;Gui, SingleSwap: Add, Picture, w20 h20 x920 y20 vMenu, %A_ScriptDir%\images\menu.jpg

Gui, SingleSwap: Show, x%Xpos% y%yPos% w%GuiWidth% h%GuiHeight%, Swapped Packages
Gui, Swap:destroy
Gui, Opening:destroy
Return

Swap:
WinGetPos, Xpos, Ypos

Gui, Swap: New
Gui, Swap: Color, DFDDDA

Gui, Swap: Add, Picture, w965 h91 x0 y0 vheader, %A_ScriptDir%\images\swap\header_1.jpg
Gui, Swap: Add, Text, w300 h40 x465 y35 BackgroundTrans gSingleSwap,


Gui, Swap: Add, Picture, w200 h33 x22 y15 vLogo gOpening, %A_ScriptDir%\images\logo.jpg
;Gui, Swap: Add, Picture, w20 h20 x920 y20 vMenu, %A_ScriptDir%\images\menu.jpg

Gui, Swap:Font, S11, Arial Bold
Gui, Swap: Add, Edit, w235 h24 x210 y160 -Vscroll vCustAName Limit35, %CustAName%
Gui, Swap: Add, Picture, w41 h20 x210 y140 vCustAN, %A_ScriptDir%\images\swap\name.jpg

Gui, Swap: Add, Edit, w235 h24 x210 y215 -Vscroll vCustAAddress1 Limit35, %CustAAddress1%
Gui, Swap: Add, Picture, w98 h22 x210 y190 vCustAAL1, %A_ScriptDir%\images\swap\address_line_1.jpg

Gui, Swap: Add, Edit, w235 h24 x210 y275 -Vscroll vCustAAddress2 Limit35, %CustAAddress2%
Gui, Swap: Add, Picture, w102 h20 x210 y253 vCustAAL2, %A_ScriptDir%\images\swap\address_line_2.jpg

Gui, Swap: Add, Edit, w235 h24 x210 y330 -Vscroll vCustACity Limit35, %CustACity%
Gui, Swap: Add, Picture, w27 h17 x212 y309 vCustAC, %A_ScriptDir%\images\swap\city.jpg

Gui, Swap: Add, Edit, w100 h24 x210 y385 -Vscroll vCustAZipCode Number Limit5, %CustAZipCode%
Gui, Swap: Add, Picture, w63 h22 x210 y360 vCustAZC, %A_ScriptDir%\images\swap\zip_code.jpg

Gui, Swap:Font, S10, Arial Bold
if (CustAAddyType = "Residential") or (CustAAddyType = "")
Gui, Swap: Add, DropDownList, w125 h75 x320 y385 -Tabstop vCustAAddyType, Residential||Business
else
Gui, Swap: Add, DropDownList, w125 h75 x320 y39 vCustAAddyType, Business||Residential

Gui, Swap: Add, Picture, w93 h23 x320 y358 vCustAAT, %A_ScriptDir%\images\swap\address_type.jpg

Gui, Swap:Font, S11, Arial Bold
Gui, Swap: Add, Edit, w200 h20 x530 y160 -Vscroll vCustAEventDate Limit35, %CustAEventDate%
Gui, Swap: Add, Picture, w71 h16 x530 y140 vCustAED, %A_ScriptDir%\images\swap\event_date.jpg

Gui, Swap:Font, S11, Arial Bold
Gui, Swap: Add, Edit, w200 h24 x530 y230 -Vscroll vCustAOrderNumberPlaced Limit8 Number, %CustAOrderNumberPlaced%
Gui, Swap: Add, Picture, w150 h22 x530 y205 vCustAONP, %A_ScriptDir%\images\swap\order_number_placed.jpg

Gui, Swap:Font, S10, Arial Bold
if (CustADeliveryMethod = "Return Label") or (!CustADeliveryMethod)
Gui, Swap: Add, DropDownList, x530 y300 -Tabstop vCustADeliveryMethod, Return Label||Pickup
else
Gui, Swap: Add, DropDownList, x530 y300 -Tabstop vCustADeliveryMethod, Pickup||Return Label

Gui, Swap: Add, Picture, w160 h16 x530 y278 vCustADM, %A_ScriptDir%\images\swap\delivery_method_needed.jpg

Gui, Swap:Font, S11, Arial Bold

Gui, Swap: Add, Picture, x530 y350 w150 h15 vCustACCOff gCustACC, %A_ScriptDir%\images\swap\customer_contacted_off.jpg

Gui, Swap: Add, Picture, x530 y350 w150 h15 vCustACCOn gCustACC, %A_ScriptDir%\images\swap\customer_contacted_on.jpg


Gui, Swap: Add, Picture, w61 h15 x527 y390 vCustAContactPhoneOn gCustAPhone, %A_ScriptDir%\images\swap\phone_on.jpg

Gui, Swap: Add, Picture, w61 h15 x527 y390 vCustAContactPhoneOff gCustAPhone, %A_ScriptDir%\images\swap\phone_off.jpg

Gui, Swap: Add, Picture, w58 h15 x600 y390 BackgroundTrans vCustAContactEmailOn gCustAEmail, %A_ScriptDir%\images\swap\email_on.jpg

Gui, Swap: Add, Picture, w58 h15 x600 y390 BackgroundTrans vCustAContactEmailOff gCustAEmail, %A_ScriptDir%\images\swap\email_off.jpg

GuiControl, Hide, CustACCOn
GuiControl, Hide, CustACCOff
GuiControl, Hide, CustAContactPhoneOn
GuiControl, Hide, CustAContactPhoneOff
GuiControl, Hide, CustAContactEmailOn
GuiControl, Hide, CustAContactEmailOff

if (CustAContacted = "0") or (CustAContacted = "")
{
GuiControl, Hide, CustACCOn
GuiControl, Show, CustACCOff
}
else
{
GuiControl, Hide, CustACCOff
GuiControl, Show, CustACCOn
}

if (!CustAContacted)
{
GuiControl, Hide, CustAContactPhoneOn
GuiControl, Hide, CustAContactPhoneOff
GuiControl, Hide, CustAContactEmailOn
GuiControl, Hide, CustAContactEmailOff
GuiControl, Hide, CustACMP
GuiControl, Hide, CustACME
}
else
{
	if (CustAPhoneStatus = "On")
	{
	GuiControl, Hide, CustAContactPhoneOff
	GuiControl, Show, CustAContactPhoneOn
	}
	else
	{
	GuiControl, Hide, CustAContactPhoneOn
	GuiControl, Show, CustAContactPhoneOff
	}
	
	if (CustAEmailStatus = "On")
	{
	GuiControl, Hide, CustAContactEmailOff
	GuiControl, Show, CustAContactEmailOn
	}
	else
	{
	GuiControl, Hide, CustAContactEmailOn
	GuiControl, Show, CustAContactEmailOff
	}
}

Gui, Swap:Font, S11, Arial Bold

Gui, Swap: Add, Edit, w150 h24 x210 y465 -Vscroll vCustAMerchDescription, %CustAMerchDescription%
Gui, Swap: Add, Picture, w98 h22 x210 y435 vCustAMD, %A_ScriptDir%\images\swap\merchandise_description.jpg

Gui, Swap:Font, S10, Arial Bold

if (CustAOrderNumberPackagesRecd  = 1) or (CustAOrderNumberPackagesRecd = "")
Gui, Swap: Add, DropDownList, w105 h125 x420 y465 -Vscroll -Tabstop vCustAOrderNumberPackagesRecd gCustANumPackages, 1||2|3|4|5
else if (CustAOrderNumberPackagesRecd = 2)
Gui, Swap: Add, DropDownList, w105 h125 x420 y465 -Vscroll -Tabstop vCustAOrderNumberPackagesRecd gCustANumPackages, 1|2||3|4|5
else if (CustAOrderNumberPackagesRecd = 3)
Gui, Swap: Add, DropDownList, w105 h125 x420 y465 -Vscroll -Tabstop vCustAOrderNumberPackagesRecd gCustANumPackages, 1|2|3||4|5
else if (CustAOrderNumberPackagesRecd = 4)
Gui, Swap: Add, DropDownList, w105 h125 x420 y465 -Vscroll -Tabstop vCustAOrderNumberPackagesRecd gCustANumPackages, 1|2|3|4||5
else if (CustAOrderNumberPackagesRecd = 5)
Gui, Swap: Add, DropDownList, w105 h125 x420 y465 -Vscroll -Tabstop vCustAOrderNumberPackagesRecd gCustANumPackages, 1|2|3|4|5||

Gui, Swap: Add, Picture, w166 h22 x385 y435 vCustANPC, %A_ScriptDir%\images\swap\number_of_packages.jpg

if (CustAServiceType = "Next Day Air") or (CustAServiceType = "")
Gui, Swap: Add, DropDownList, w150 h100 x600 y465 -Vscroll -Tabstop vCustAServiceType, Ground Service|Next Day Air||
else
Gui, Swap: Add, DropDownList, w150 h100 x600 y465 -Vscroll -Tabstop vCustAServiceType, Ground Service||Next Day Air
Gui, Swap: Add, Picture, w82 h16 x600 y440 vCustAST, %A_ScriptDir%\images\swap\service_type.jpg

Gui, Swap: Add, Picture, w20 h265 x480 y160 vCustVertSpacer, %A_ScriptDir%\images\swap\vertical_spacer.jpg

Gui, Swap: Add, Picture, w600 h7 x185 y510 vCustSpacer1_A, %A_ScriptDir%\images\swap\spacer_1.jpg

Gui, Swap: Add, Picture, w600 h7 x185 y420 vCustSpacer1, %A_ScriptDir%\images\swap\spacer_1.jpg

Gui, Swap: Add, Picture, w212 h25 x380 y100 vCustADetails, %A_ScriptDir%\images\swap\customer_A_details.jpg

Gui, Swap:Font, S11, Arial Bold

Gui, Swap: Add, Edit, w100 h24 x440 y550 vCustAWeight1 Limit2 Number -vscroll, %CustAWeight1%
Gui, Swap: Add, Picture, w45 h18 x465 y525 vCustAWeightTitle1, %A_ScriptDir%\images\swap\weight_1.jpg

Gui, Swap: Add, Edit, w100 h24 x500 y550 vCustAWeight2 -vscroll Limit2 Number, %CustAWeight2%
Gui, Swap: Add, Picture, w67 h17 x515 y525 vCustAWeightTitle2, %A_ScriptDir%\images\swap\weight_2.jpg

Gui, Swap: Add, Edit, w100 h24 x560 y550 vCustAWeight3 -vscroll Limit2 Number, %CustAWeight3%
Gui, Swap: Add, Picture, w67 h17 x575 y525 vCustAWeightTitle3, %A_ScriptDir%\images\swap\weight_3.jpg

Gui, Swap: Add, Edit, w100 h24 x620 y550 vCustAWeight4 -vscroll Limit2 Number, %CustAWeight4%
Gui, Swap: Add, Picture, w67 h17 x640 y525 vCustAWeightTitle4, %A_ScriptDir%\images\swap\weight_4.jpg
	
Gui, Swap: Add, Edit, w100 h24 x680 y550 vCustAWeight5 -vscroll Limit2 Number, %CustAWeight5%
Gui, Swap: Add, Picture, w67 h17 x700 y525 vCustAWeightTitle5, %A_ScriptDir%\images\swap\weight_5.jpg


Gui, Swap: Add, Picture, w110 h40 x10 y580 vExitToMenu gOpening, %A_ScriptDir%\images\UPS_exit.jpg

Gui, Swap: Add, Picture, w110 h40 x840 y580 vContinue gSwapEval, %A_ScriptDir%\images\swap\continue.jpg

Gui, Swap:Add, Picture, x600 y100 h25 w25 gRunAddy1, %A_ScriptDir%\images\UPS_paste.jpg

if (!CustAOrderNumberPackagesRecd)
goSub, CustANumPackages
else
goSub, CustANumPackages

Gui, Swap: Add, Picture, w41 h20 x190 y140 vCustANError, %A_ScriptDir%\images\swap\name_error.jpg
GuiControl, Hide, CustANError

Gui, Swap: Add, Picture, w98 h22 x190 y200 vCustAAL1Error, %A_ScriptDir%\images\swap\address_line_1_error.jpg
GuiControl, Hide, CustAAL1Error

Gui, Swap: Add, Picture, w102 h20 x190 y265 vCustAAL2Error, %A_ScriptDir%\images\swap\address_line_2_error.jpg
GuiControl, Hide, CustAAL2Error

Gui, Swap: Add, Picture, w27 h17 x192 y309 vCustACError, %A_ScriptDir%\images\swap\city_error.jpg
GuiControl, Hide, CustACError

Gui, Swap: Add, Picture, w71 h16 x510 y140 vCustAEDError, %A_ScriptDir%\images\swap\event_date_error.jpg
GuiControl, Hide, CustAEDError

Gui, Swap: Add, Picture, w150 h22 x510 y310 vCustAONPError, %A_ScriptDir%\images\swap\order_number_placed_error.jpg
GuiControl, Hide, CustAONPError

Gui, Swap: Add, Picture, w63 h22 x190 y330 vCustAZCError, %A_ScriptDir%\images\swap\zip_code_error.jpg
GuiControl, Hide, CustAZCError

Gui, Swap: Add, Picture, w98 h22 x210 y435 vCustAMerchError, %A_ScriptDir%\images\swap\merchandise_error.jpg
GuiControl, Hide, CustAMerchError

Gui, Swap: Add, Picture, w45 h18 x445 y510 vCustAWeightTitle1Error, %A_ScriptDir%\images\swap\weight_1_error.jpg
GuiControl, Hide, CustAWeightTitle1Error

Gui, Swap: Add, Picture, w67 h17 x495 y510 vCustAWeightTitle2Error, %A_ScriptDir%\images\swap\weight_2_error.jpg
GuiControl, Hide, CustAWeightTitle2Error

Gui, Swap: Add, Picture, w67 h17 x555 y510 vCustAWeightTitle3Error, %A_ScriptDir%\images\swap\weight_3_error.jpg
GuiControl, Hide, CustAWeightTitle3Error

Gui, Swap: Add, Picture, w67 h17 x620 y510 vCustAWeightTitle4Error, %A_ScriptDir%\images\swap\weight_4_error.jpg
GuiControl, Hide, CustAWeightTitle4Error

Gui, Swap: Add, Picture, w67 h17 x680 y510 vCustAWeightTitle5Error, %A_ScriptDir%\images\swap\weight_5_error.jpg
GuiControl, Hide, CustAWeightTitle5Error

Gui, Swap: Show, x%Xpos% y%yPos% w%GuiWidth% h%GuiHeight%, Swapped Packages
Gui, Swap1:destroy
Gui, Opening:destroy
Gui, SingleSwap:destroy
Gui, FinalDualSwap:destroy
Return

CustAEmail:
if (!CustAEmailStatus) or (CustAEmailStatus = "Off")
{
GuiControl, Hide, CustAContactEmailOff
GuiControl, Show, CustAContactEmailOn
GuiControl, Hide, CustAContactPhoneOn
GuiControl, Show, CustAContactPhoneOff
CustAEmailStatus = On
CustAPhoneStatus = Off
}

if (CustAEmailStatus = "On")
{
;do nothing
}
Return

CustAPhone:
if (!CustAPhoneStatus) or (CustAPhoneStatus = "Off")
{
GuiControl, Hide, CustAContactPhoneOff
GuiControl, Show, CustAContactPhoneOn
GuiControl, Hide, CustAContactEmailOn
GuiControl, Show, CustAContactEmailOff
CustAEmailStatus = Off
CustAPhoneStatus = On
}

CustBEmail:
if (!CustBEmailStatus) or (CustBEmailStatus = "Off")
{
GuiControl, Hide, CustBContactEmailOff
GuiControl, Show, CustBContactEmailOn
GuiControl, Hide, CustBContactPhoneOn
GuiControl, Show, CustBContactPhoneOff
CustBEmailStatus = On
CustBPhoneStatus = Off
}

if (CustBEmailStatus = "On")
{
;do nothing
}
Return

CustBPhone:
if (!CustBPhoneStatus) or (CustBPhoneStatus = "Off")
{
GuiControl, Hide, CustBContactPhoneOff
GuiControl, Show, CustBContactPhoneOn
GuiControl, Hide, CustBContactEmailOn
GuiControl, Show, CustBContactEmailOff
CustBEmailStatus = Off
CustBPhoneStatus = On
}

if (CustAPhoneStatus = "On")
{
;do nothing
}
Return

SwapEval:
Gui, Swap:Submit, NoHide

if (!CustAName) 
{
GuiControlGet, CustAN, Pos
GuiControl, MoveDraw, CustANError, x%CustANX% y%CustANY%
	GuiControl, Hide, CustAN
	Sleep, 300
	GuiControl, Show, CustANError
	Sleep, 700
	GuiControl, Hide, CustANError
	Sleep, 300
	GuiControl, Show, CustAN
	Sleep, 700

ErrorOut = yes
}

if (!CustAAddress1) 
{
GuiControlGet, CustAAL1, Pos
GuiControl, MoveDraw, CustAAL1Error, x%CustAAL1X% y%CustAAL1Y%
	GuiControl, Hide, CustAAL1
	Sleep, 300
	GuiControl, Show, CustAAL1Error
	Sleep, 700
	GuiControl, Hide, CustAAL1Error
	Sleep, 300
	GuiControl, Show, CustAAL1
	Sleep, 700

ErrorOut = yes
}

if (!CustACity) 
{
GuiControlGet, CustAC, Pos
GuiControl, MoveDraw, CustACError, x%CustACX% y%CustACY%

	GuiControl, Hide, CustAC
	Sleep, 300
	GuiControl, Show, CustACError
	Sleep, 700
	GuiControl, Hide, CustACError
	Sleep, 300
	GuiControl, Show, CustAC
	Sleep, 700

ErrorOut = yes
}


if (!CustAZipCode) 
{
GuiControlGet, CustAZC, Pos
GuiControl, MoveDraw, CustAZCError, x%CustAZCX% y%CustAZCY%
	GuiControl, Hide, CustAZC
	Sleep, 300
	GuiControl, Show, CustAZCError
	Sleep, 700
	GuiControl, Hide, CustAZCError
	Sleep, 300
	GuiControl, Show, CustAZC
	Sleep, 700

ErrorOut = yes
}

if (!CustAEventDate) 
{
GuiControlGet, CustAED, Pos
GuiControl, MoveDraw, CustAEDError, x%CustAEDX% y%CustAEDY%
	GuiControl, Hide, CustAED
	Sleep, 300
	GuiControl, Show, CustAEDError
	Sleep, 700
	GuiControl, Hide, CustAEDError
	Sleep, 300
	GuiControl, Show, CustAED
	Sleep, 700

ErrorOut = yes
}

if (!CustAOrderNumberPlaced) 
{
GuiControlGet, CustAONP, Pos
GuiControl, MoveDraw, CustAONPError, x%CustAONPX% y%CustAONPY%

	GuiControl, Hide, CustAONP
	Sleep, 300
	GuiControl, Show, CustAONPError
	Sleep, 700
	GuiControl, Hide, CustAONPError
	Sleep, 300
	GuiControl, Show, CustAONP
	Sleep, 700

ErrorOut = yes
}

if (!CustAMerchDescription) 
{
GuiControlGet, CustAMD, Pos
GuiControl, MoveDraw, CustCustAMerchError, x%CustAMDX% y%CustAMDY%

	GuiControl, Hide, CustAMD
	Sleep, 300
	GuiControl, Show, CustAMerchError
	Sleep, 700
	GuiControl, Hide, CustAMerchError
	Sleep, 300
	GuiControl, Show, CustAMD
	Sleep, 700

ErrorOut = yes
}

if (!CustAWeight1) 
{
GuiControlGet, CustAWeightTitle1, Pos
GuiControl, MoveDraw, CustAWeightTitle1Error, x%CustAWeightTitle1X% y%CustAWeightTitle1Y%


	GuiControl, Hide, CustAWeightTitle1
	Sleep, 300
	GuiControl, Show, CustAWeightTitle1Error
	Sleep, 700
	GuiControl, Hide, CustAWeightTitle1Error
	Sleep, 300
	GuiControl, Show, CustAWeightTitle1
	Sleep, 700

ErrorOut = yes
}

if ((!CustAWeight2) && (CustAOrderNumberPackagesRecd > 1))
{
GuiControlGet, CustAWeightTitle2, Pos
GuiControl, MoveDraw, CustAWeightTitle2, x%CustAWeightTitle2X% y%CustAWeightTitle2Y%
GuiControl, MoveDraw, CustAWeightTitle2Error, x%CustAWeightTitle2X% y%CustAWeightTitle2Y%

	GuiControl, Hide, CustAWeightTitle2
	Sleep, 300
	GuiControl, Show, CustAWeightTitle2Error
	Sleep, 700
	GuiControl, Hide, CustAWeightTitle2Error
	Sleep, 300
	GuiControl, Show, CustAWeightTitle2
	Sleep, 700

ErrorOut = yes
}

if ((!CustAWeight3) && (CustAOrderNumberPackagesRecd > 2))
{

GuiControlGet, CustAWeightTitle3, Pos
GuiControl, MoveDraw, CustAWeightTitle3, x%CustAWeightTitle3X% y%CustAWeightTitle3Y%
GuiControl, MoveDraw, CustAWeightTitle3Error, x%CustAWeightTitle3X% y%CustAWeightTitle3Y%


	GuiControl, Hide, CustAWeightTitle3
	Sleep, 300
	GuiControl, Show, CustAWeightTitle3Error
	Sleep, 700
	GuiControl, Hide, CustAWeightTitle3Error
	Sleep, 300
	GuiControl, Show, CustAWeightTitle3
	Sleep, 700

ErrorOut = yes
}

if ((!CustAWeight4) && (CustAOrderNumberPackagesRecd > 3))
{

GuiControlGet, CustAWeightTitle4, Pos
GuiControl, MoveDraw, CustAWeightTitle4, x%CustAWeightTitle4X% y%CustAWeightTitle4Y%
GuiControl, MoveDraw, CustAWeightTitle4Error, x%CustAWeightTitle4X% y%CustAWeightTitle4Y%


	GuiControl, Hide, CustAWeightTitle4
	Sleep, 300
	GuiControl, Show, CustAWeightTitle4Error
	Sleep, 700
	GuiControl, Hide, CustAWeightTitle4Error
	Sleep, 300
	GuiControl, Show, CustAWeightTitle4
	Sleep, 700

ErrorOut = yes
}

if ((!CustAWeight5) && (CustAOrderNumberPackagesRecd > 4))
{

GuiControlGet, CustAWeightTitle5, Pos
GuiControl, MoveDraw, CustAWeightTitle5, x%CustAWeightTitle5X% y%CustAWeightTitle5Y%
GuiControl, MoveDraw, CustAWeightTitle5Error, x%CustAWeightTitle5X% y%CustAWeightTitle5Y%

	GuiControl, Hide, CustAWeightTitle5
	Sleep, 300
	GuiControl, Show, CustAWeightTitle5Error
	Sleep, 700
	GuiControl, Hide, CustAWeightTitle5Error
	Sleep, 300
	GuiControl, Show, CustAWeightTitle5
	Sleep, 700

ErrorOut = yes
}

if (ErrorOut = "")
{
; Get state

FileRead, RunningThese, %A_ScriptDir%\zipchecker.ini

ZipCode := CustAZipCode

StringLeft, midLoc, ZipCode, 1
if midLoc = "0"
StringTrimLeft, location, midLoc, 1
else
location := ZipCode


Loop, parse, RunningThese, `,
{
	Loop, parse, A_LoopField, /
	{
	
		if (A_Index = 1) ; First zip code
		FirstZip := A_LoopField
		else if (A_Index = 2) ; Second zip code
		SecondZip := A_LoopField
		else if (A_Index = 3) ; Third zip code
		loginName := A_LoopField
		else if (A_Index = 4) ; theState code
		theState := A_LoopField
		else if (A_Index = 5) ; State name
		StateName := A_LoopField
	}
	
	if location between %FirstZip% and %SecondZip%
	break
	
}

CustAState := theState
CustAStateName := StateName
theState=
StateName=
location=
}

if (ErrorOut = "yes")
{
ErrorOut=
GuiControl, enable, Continue
Return
}
else
goSub, Swap1

Return

Swap1:
Gui, Swap:Submit, NoHide

WinGetPos, Xpos, Ypos

GuiControl, enable, Continue

Gui, Swap1: New
Gui, Swap1: Color, DFDDDA

Gui, Swap1: Add, Picture, w965 h91 x0 y0 vheader, %A_ScriptDir%\images\swap\header_1.jpg
Gui, Swap1: Add, Text, w300 h40 x465 y35 BackgroundTrans gSingleSwap,


Gui, Swap1: Add, Picture, w200 h33 x22 y15 vLogo gOpening, %A_ScriptDir%\images\logo.jpg
;Gui, Swap1: Add, Picture, w20 h20 x920 y20 vMenu, %A_ScriptDir%\images\menu.jpg

Gui, Swap1:Font, S11, Arial Bold
Gui, Swap1: Add, Edit, w235 h24 x210 y160 -Vscroll vCustBName Limit35, %CustBName%
Gui, Swap1: Add, Picture, w41 h20 x210 y140 vCustBN, %A_ScriptDir%\images\swap\name.jpg

Gui, Swap1: Add, Edit, w235 h24 x210 y215 -Vscroll vCustBAddress1 Limit35, %CustBAddress1%
Gui, Swap1: Add, Picture, w98 h22 x210 y190 vCustBAL1, %A_ScriptDir%\images\swap\address_line_1.jpg

Gui, Swap1: Add, Edit, w235 h24 x210 y275 -Vscroll vCustBAddress2 Limit35, %CustBAddress2%
Gui, Swap1: Add, Picture, w102 h20 x210 y253 vCustBAL2, %A_ScriptDir%\images\swap\address_line_2.jpg

Gui, Swap1: Add, Edit, w235 h24 x210 y330 -Vscroll vCustBCity Limit35, %CustBCity%
Gui, Swap1: Add, Picture, w27 h17 x212 y309 vCustBC, %A_ScriptDir%\images\swap\city.jpg

Gui, Swap1: Add, Edit, w100 h24 x210 y385 -Vscroll vCustBZipCode Number Limit5, %CustBZipCode%
Gui, Swap1: Add, Picture, w63 h22 x210 y360 vCustBZC, %A_ScriptDir%\images\swap\zip_code.jpg

Gui, Swap1:Font, S10, Arial Bold
if (CustBAddyType = "Residential") or (CustBAddyType = "")
Gui, Swap1: Add, DropDownList, w125 h75 x320 y385 -Tabstop vCustBAddyType, Residential||Business
else
Gui, Swap1: Add, DropDownList, w125 h75 x320 y39 vCustBAddyType, Business||Residential

Gui, Swap1: Add, Picture, w93 h23 x320 y358 vCustBAT, %A_ScriptDir%\images\swap\address_type.jpg

Gui, Swap1:Font, S11, Arial Bold
Gui, Swap1: Add, Edit, w200 h20 x530 y160 -Vscroll vCustBEventDate Limit35, %CustBEventDate%
Gui, Swap1: Add, Picture, w71 h16 x530 y140 vCustBED, %A_ScriptDir%\images\swap\event_date.jpg

Gui, Swap1:Font, S11, Arial Bold
Gui, Swap1: Add, Edit, w200 h24 x530 y230 -Vscroll vCustBOrderNumberPlaced Limit8 Number, %CustBOrderNumberPlaced%
Gui, Swap1: Add, Picture, w150 h22 x530 y205 vCustBONP, %A_ScriptDir%\images\swap\order_number_placed.jpg

Gui, Swap1:Font, S10, Arial Bold
if (CustBDeliveryMethod = "Return Label") or (!CustBDeliveryMethod)
Gui, Swap1: Add, DropDownList, x530 y300 -Tabstop vCustBDeliveryMethod, Return Label||Pickup
else
Gui, Swap1: Add, DropDownList, x530 y300 -Tabstop vCustBDeliveryMethod, Pickup||Return Label
Gui, Swap1: Add, Picture, w160 h16 x530 y278 vCustBDM, %A_ScriptDir%\images\swap\delivery_method_needed.jpg

Gui, Swap1:Font, S11, Arial Bold

Gui, Swap1: Add, Picture, x530 y350 w150 h15 vCustBCCOff gCustBCC, %A_ScriptDir%\images\swap\customer_contacted_off.jpg

Gui, Swap1: Add, Picture, x530 y350 w150 h15 vCustBCCOn gCustBCC, %A_ScriptDir%\images\swap\customer_contacted_on.jpg


Gui, Swap1: Add, Picture, w61 h15 x527 y390 vCustBContactPhoneOn gCustBPhone, %A_ScriptDir%\images\swap\phone_on.jpg

Gui, Swap1: Add, Picture, w61 h15 x527 y390 vCustBContactPhoneOff gCustBPhone, %A_ScriptDir%\images\swap\phone_off.jpg

Gui, Swap1: Add, Picture, w58 h15 x600 y390 BackgroundTrans vCustBContactEmailOn gCustBEmail, %A_ScriptDir%\images\swap\email_on.jpg

Gui, Swap1: Add, Picture, w58 h15 x600 y390 BackgroundTrans vCustBContactEmailOff gCustBEmail, %A_ScriptDir%\images\swap\email_off.jpg

GuiControl, Hide, CustBCCOn
GuiControl, Hide, CustBCCOff
GuiControl, Hide, CustBContactPhoneOn
GuiControl, Hide, CustBContactPhoneOff
GuiControl, Hide, CustBContactEmailOn
GuiControl, Hide, CustBContactEmailOff

if (CustBContacted = "0") or (CustBContacted = "")
{
GuiControl, Hide, CustBCCOn
GuiControl, Show, CustBCCOff
}
else
{
GuiControl, Hide, CustBCCOff
GuiControl, Show, CustBCCOn
}

if (!CustBContacted)
{
GuiControl, Hide, CustBContactPhoneOn
GuiControl, Hide, CustBContactPhoneOff
GuiControl, Hide, CustBContactEmailOn
GuiControl, Hide, CustBContactEmailOff
GuiControl, Hide, CustBCMP
GuiControl, Hide, CustBCME
}
else
{
	if (CustBPhoneStatus = "On")
	{
	GuiControl, Hide, CustBContactPhoneOff
	GuiControl, Show, CustBContactPhoneOn
	}
	else
	{
	GuiControl, Hide, CustBContactPhoneOn
	GuiControl, Show, CustBContactPhoneOff
	}
	
	if (CustBEmailStatus = "On")
	{
	GuiControl, Hide, CustBContactEmailOff
	GuiControl, Show, CustBContactEmailOn
	}
	else
	{
	GuiControl, Hide, CustBContactEmailOn
	GuiControl, Show, CustBContactEmailOff
	}
}

Gui, Swap1:Font, S11, Arial Bold

Gui, Swap1: Add, Edit, w150 h24 x210 y465 -Vscroll vCustBMerchDescription, %CustBMerchDescription%
Gui, Swap1: Add, Picture, w98 h22 x210 y435 vCustBMD, %A_ScriptDir%\images\swap\merchandise_description.jpg

Gui, Swap1:Font, S10, Arial Bold

if (CustBOrderNumberPackagesRecd  = 1) or (CustBOrderNumberPackagesRecd = "")
Gui, Swap1: Add, DropDownList, w105 h125 x420 y465 -Vscroll -Tabstop vCustBOrderNumberPackagesRecd gCustBNumPackages, 1||2|3|4|5
else if (CustBOrderNumberPackagesRecd = 2)
Gui, Swap1: Add, DropDownList, w105 h125 x420 y465 -Vscroll -Tabstop vCustBOrderNumberPackagesRecd gCustBNumPackages, 1|2||3|4|5
else if (CustBOrderNumberPackagesRecd = 3)
Gui, Swap1: Add, DropDownList, w105 h125 x420 y465 -Vscroll -Tabstop vCustBOrderNumberPackagesRecd gCustBNumPackages, 1|2|3||4|5
else if (CustBOrderNumberPackagesRecd = 4)
Gui, Swap1: Add, DropDownList, w105 h125 x420 y465 -Vscroll -Tabstop vCustBOrderNumberPackagesRecd gCustBNumPackages, 1|2|3|4||5
else if (CustBOrderNumberPackagesRecd = 5)
Gui, Swap1: Add, DropDownList, w105 h125 x420 y465 -Vscroll -Tabstop vCustBOrderNumberPackagesRecd gCustBNumPackages, 1|2|3|4|5||

Gui, Swap1: Add, Picture, w166 h22 x385 y435 vCustBNPC, %A_ScriptDir%\images\swap\number_of_packages.jpg

if (CustBServiceType = "Next Day Air") or (CustBServiceType = "")
Gui, Swap1: Add, DropDownList, w150 h100 x600 y465 -Vscroll -Tabstop vCustBServiceType, Ground Service|Next Day Air||
else
Gui, Swap1: Add, DropDownList, w150 h100 x600 y465 -Vscroll -Tabstop vCustBServiceType, Ground Service||Next Day Air
Gui, Swap1: Add, Picture, w82 h16 x600 y440 vCustBST, %A_ScriptDir%\images\swap\service_type.jpg

Gui, Swap1: Add, Picture, w20 h265 x480 y160 vCustVertSpacer, %A_ScriptDir%\images\swap\vertical_spacer.jpg

Gui, Swap1: Add, Picture, w600 h7 x185 y510 vCustSpacer1_A, %A_ScriptDir%\images\swap\spacer_1.jpg

Gui, Swap1: Add, Picture, w600 h7 x185 y420 vCustSpacer1, %A_ScriptDir%\images\swap\spacer_1.jpg

Gui, Swap1: Add, Picture, w212 h25 x380 y100 vCustBDetails, %A_ScriptDir%\images\swap\customer_B_details.jpg

Gui, Swap1:Font, S11, Arial Bold

Gui, Swap1: Add, Edit, w100 h24 x440 y550 vCustBWeight1 -vscroll Limit2 Number, %CustBWeight1%
Gui, Swap1: Add, Picture, w45 h18 x465 y525 vCustBWeightTitle1, %A_ScriptDir%\images\swap\weight_1.jpg

Gui, Swap1: Add, Edit, w100 h24 x500 y550 vCustBWeight2 -vscroll Limit2 Number, %CustBWeight2%
Gui, Swap1: Add, Picture, w67 h17 x515 y525 vCustBWeightTitle2, %A_ScriptDir%\images\swap\weight_2.jpg

Gui, Swap1: Add, Edit, w100 h24 x560 y550 vCustBWeight3 -vscroll Limit2 Number, %CustBWeight3%
Gui, Swap1: Add, Picture, w67 h17 x575 y525 vCustBWeightTitle3, %A_ScriptDir%\images\swap\weight_3.jpg

Gui, Swap1: Add, Edit, w100 h24 x620 y550 vCustBWeight4 -vscroll Limit2 Number, %CustBWeight4%
Gui, Swap1: Add, Picture, w67 h17 x640 y525 vCustBWeightTitle4, %A_ScriptDir%\images\swap\weight_4.jpg

Gui, Swap1: Add, Edit, w100 h24 x680 y550 vCustBWeight5 -vscroll Limit2 Number, %CustBWeight5%
Gui, Swap1: Add, Picture, w67 h17 x700 y525 vCustBWeightTitle5, %A_ScriptDir%\images\swap\weight_5.jpg


Gui, Swap1: Add, Picture, w110 h40 x10 y580 vBack gSwap, %A_ScriptDir%\images\swap\back.jpg

Gui, Swap1: Add, Picture, w110 h40 x840 y580 vContinue gSwapEval1, %A_ScriptDir%\images\swap\continue.jpg

Gui, Swap1:Add, Picture, x600 y100 h25 w25 gRunAddy2, %A_ScriptDir%\images\UPS_paste.jpg

if (!CustBOrderNumberPackagesRecd)
goSub, CustBNumPackages
else
goSub, CustBNumPackages

Gui, Swap1: Add, Picture, w41 h20 x190 y140 vCustBNError, %A_ScriptDir%\images\swap\name_error.jpg
GuiControl, Hide, CustBNError

Gui, Swap1: Add, Picture, w98 h22 x190 y200 vCustBAL1Error, %A_ScriptDir%\images\swap\address_line_1_error.jpg
GuiControl, Hide, CustBAL1Error

Gui, Swap1: Add, Picture, w102 h20 x190 y265 vCustBAL2Error, %A_ScriptDir%\images\swap\address_line_2_error.jpg
GuiControl, Hide, CustBAL2Error

Gui, Swap1: Add, Picture, w27 h17 x192 y309 vCustBCError, %A_ScriptDir%\images\swap\city_error.jpg
GuiControl, Hide, CustBCError

Gui, Swap1: Add, Picture, w71 h16 x510 y140 vCustBEDError, %A_ScriptDir%\images\swap\event_date_error.jpg
GuiControl, Hide, CustBEDError

Gui, Swap1: Add, Picture, w150 h22 x510 y310 vCustBONPError, %A_ScriptDir%\images\swap\order_number_placed_error.jpg
GuiControl, Hide, CustBONPError

Gui, Swap1: Add, Picture, w63 h22 x190 y330 vCustBZCError, %A_ScriptDir%\images\swap\zip_code_error.jpg
GuiControl, Hide, CustBZCError

Gui, Swap1: Add, Picture, w98 h22 x210 y435 vCustBMerchError, %A_ScriptDir%\images\swap\merchandise_error.jpg
GuiControl, Hide, CustBMerchError

Gui, Swap1: Add, Picture, w45 h18 x445 y510 vCustBWeightTitle1Error, %A_ScriptDir%\images\swap\weight_1_error.jpg
GuiControl, Hide, CustBWeightTitle1Error

Gui, Swap1: Add, Picture, w67 h17 x495 y510 vCustBWeightTitle2Error, %A_ScriptDir%\images\swap\weight_2_error.jpg
GuiControl, Hide, CustBWeightTitle2Error

Gui, Swap1: Add, Picture, w67 h17 x555 y510 vCustBWeightTitle3Error, %A_ScriptDir%\images\swap\weight_3_error.jpg
GuiControl, Hide, CustBWeightTitle3Error

Gui, Swap1: Add, Picture, w67 h17 x620 y510 vCustBWeightTitle4Error, %A_ScriptDir%\images\swap\weight_4_error.jpg
GuiControl, Hide, CustBWeightTitle4Error

Gui, Swap1: Add, Picture, w67 h17 x680 y510 vCustBWeightTitle5Error, %A_ScriptDir%\images\swap\weight_5_error.jpg
GuiControl, Hide, CustBWeightTitle5Error

Gui, Swap1: Show, x%Xpos% y%yPos% w%GuiWidth% h%GuiHeight%, Swapped Packages
Gui, Swap:destroy
Gui, FinalDualSwap:destroy
Return

SwapEval1:
ErrorOut=
Gui, Swap1:Submit, NoHide

if (!CustBName) 
{
GuiControlGet, CustBN, Pos
GuiControl, MoveDraw, CustBNError, x%CustBNX% y%CustBNY%
	GuiControl, Hide, CustBN
	Sleep, 300
	GuiControl, Show, CustBNError
	Sleep, 700
	GuiControl, Hide, CustBNError
	Sleep, 300
	GuiControl, Show, CustBN
	Sleep, 700

ErrorOut = yes
}

if (!CustBAddress1) 
{
GuiControlGet, CustBAL1, Pos
GuiControl, MoveDraw, CustBAL1Error, x%CustBAL1X% y%CustBAL1Y%
	GuiControl, Hide, CustBAL1
	Sleep, 300
	GuiControl, Show, CustBAL1Error
	Sleep, 700
	GuiControl, Hide, CustBAL1Error
	Sleep, 300
	GuiControl, Show, CustBAL1
	Sleep, 700

ErrorOut = yes
}

if (!CustBCity) 
{
GuiControlGet, CustBC, Pos
GuiControl, MoveDraw, CustBCError, x%CustBCX% y%CustBCY%

	GuiControl, Hide, CustBC
	Sleep, 300
	GuiControl, Show, CustBCError
	Sleep, 700
	GuiControl, Hide, CustBCError
	Sleep, 300
	GuiControl, Show, CustBC
	Sleep, 700

ErrorOut = yes
}


if (!CustBZipCode) 
{
GuiControlGet, CustBZC, Pos
GuiControl, MoveDraw, CustBZCError, x%CustBZCX% y%CustBZCY%
	GuiControl, Hide, CustBZC
	Sleep, 300
	GuiControl, Show, CustBZCError
	Sleep, 700
	GuiControl, Hide, CustBZCError
	Sleep, 300
	GuiControl, Show, CustBZC
	Sleep, 700

ErrorOut = yes
}

if (!CustBEventDate) 
{
GuiControlGet, CustBED, Pos
GuiControl, MoveDraw, CustBEDError, x%CustBEDX% y%CustBEDY%
	GuiControl, Hide, CustBED
	Sleep, 300
	GuiControl, Show, CustBEDError
	Sleep, 700
	GuiControl, Hide, CustBEDError
	Sleep, 300
	GuiControl, Show, CustBED
	Sleep, 700

ErrorOut = yes
}

if (!CustBOrderNumberPlaced) 
{
GuiControlGet, CustBONP, Pos
GuiControl, MoveDraw, CustBONPError, x%CustBONPX% y%CustBONPY%

	GuiControl, Hide, CustBONP
	Sleep, 300
	GuiControl, Show, CustBONPError
	Sleep, 700
	GuiControl, Hide, CustBONPError
	Sleep, 300
	GuiControl, Show, CustBONP
	Sleep, 700

ErrorOut = yes
}

if (!CustBMerchDescription) 
{
GuiControlGet, CustBMD, Pos
GuiControl, MoveDraw, CustCustBMerchError, x%CustBMDX% y%CustBMDY%

	GuiControl, Hide, CustBMD
	Sleep, 300
	GuiControl, Show, CustBMerchError
	Sleep, 700
	GuiControl, Hide, CustBMerchError
	Sleep, 300
	GuiControl, Show, CustBMD
	Sleep, 700

ErrorOut = yes
}

if (!CustBWeight1) 
{
GuiControlGet, CustBWeightTitle1, Pos
GuiControl, MoveDraw, CustBWeightTitle1Error, x%CustBWeightTitle1X% y%CustBWeightTitle1Y%


	GuiControl, Hide, CustBWeightTitle1
	Sleep, 300
	GuiControl, Show, CustBWeightTitle1Error
	Sleep, 700
	GuiControl, Hide, CustBWeightTitle1Error
	Sleep, 300
	GuiControl, Show, CustBWeightTitle1
	Sleep, 700

ErrorOut = yes
}

if ((!CustBWeight2) && (CustBOrderNumberPackagesRecd > 1))
{
GuiControlGet, CustBWeightTitle2, Pos
GuiControl, MoveDraw, CustBWeightTitle2, x%CustBWeightTitle2X% y%CustBWeightTitle2Y%
GuiControl, MoveDraw, CustBWeightTitle2Error, x%CustBWeightTitle2X% y%CustBWeightTitle2Y%

	GuiControl, Hide, CustBWeightTitle2
	Sleep, 300
	GuiControl, Show, CustBWeightTitle2Error
	Sleep, 700
	GuiControl, Hide, CustBWeightTitle2Error
	Sleep, 300
	GuiControl, Show, CustBWeightTitle2
	Sleep, 700

ErrorOut = yes
}

if ((!CustBWeight3) && (CustBOrderNumberPackagesRecd > 2))
{

GuiControlGet, CustBWeightTitle3, Pos
GuiControl, MoveDraw, CustBWeightTitle3, x%CustBWeightTitle3X% y%CustBWeightTitle3Y%
GuiControl, MoveDraw, CustBWeightTitle3Error, x%CustBWeightTitle3X% y%CustBWeightTitle3Y%


	GuiControl, Hide, CustBWeightTitle3
	Sleep, 300
	GuiControl, Show, CustBWeightTitle3Error
	Sleep, 700
	GuiControl, Hide, CustBWeightTitle3Error
	Sleep, 300
	GuiControl, Show, CustBWeightTitle3
	Sleep, 700

ErrorOut = yes
}

if ((!CustBWeight4) && (CustBOrderNumberPackagesRecd > 3))
{

GuiControlGet, CustBWeightTitle4, Pos
GuiControl, MoveDraw, CustBWeightTitle4, x%CustBWeightTitle4X% y%CustBWeightTitle4Y%
GuiControl, MoveDraw, CustBWeightTitle4Error, x%CustBWeightTitle4X% y%CustBWeightTitle4Y%


	GuiControl, Hide, CustBWeightTitle4
	Sleep, 300
	GuiControl, Show, CustBWeightTitle4Error
	Sleep, 700
	GuiControl, Hide, CustBWeightTitle4Error
	Sleep, 300
	GuiControl, Show, CustBWeightTitle4
	Sleep, 700

ErrorOut = yes
}

if ((!CustBWeight5) && (CustBOrderNumberPackagesRecd > 4))
{

GuiControlGet, CustBWeightTitle5, Pos
GuiControl, MoveDraw, CustBWeightTitle5, x%CustBWeightTitle5X% y%CustBWeightTitle5Y%
GuiControl, MoveDraw, CustBWeightTitle5Error, x%CustBWeightTitle5X% y%CustBWeightTitle5Y%

	GuiControl, Hide, CustBWeightTitle5
	Sleep, 300
	GuiControl, Show, CustBWeightTitle5Error
	Sleep, 700
	GuiControl, Hide, CustBWeightTitle5Error
	Sleep, 300
	GuiControl, Show, CustBWeightTitle5
	Sleep, 700

ErrorOut = yes
}


if (ErrorOut = "")
{
; Get state

FileRead, RunningThese, %A_ScriptDir%\zipchecker.ini

ZipCode := CustBZipCode

StringLeft, midLoc, ZipCode, 1
if midLoc = "0"
StringTrimLeft, location, midLoc, 1
else
location := ZipCode


Loop, parse, RunningThese, `,
{
	Loop, parse, A_LoopField, /
	{
	
		if (A_Index = 1) ; First zip code
		FirstZip := A_LoopField
		else if (A_Index = 2) ; Second zip code
		SecondZip := A_LoopField
		else if (A_Index = 3) ; Login name
		loginName := A_LoopField
		else if (A_Index = 4) ; theState code
		theState := A_LoopField
		else if (A_Index = 5) ; State name
		StateName := A_LoopField
	}
	
	if location between %FirstZip% and %SecondZip%
	break
	
}

CustBState := theState
CustBStateName := StateName
theState=
StateName=
location=
}

if (ErrorOut = "yes")
{
ErrorOut=
GuiControl, enable, Continue
Return
}
else
goSub, FinalDualSwap

Return

RunAddy1:
nameAddyString := clipboard

StringReplace, nameAddyString, nameAddyString, allordersdesignscommsquotesgroupsreminders, allordersdesignscommsquotesgroupsreminders, UseErrorLevel
if (ErrorLevel > 0)
{
; This is from Chrome, not Firefox. 
Chrome = 1
}
else
{
Chrome = 0
}

StringReplace, nameAddyString, nameAddyString, CUSTOMERS WAITING, CUSTOMERS WAITING, UseErrorLevel
if (ErrorLevel > 0)
{
StringReplace, nameAddyString, nameAddyString, %A_Space%%A_Space%%A_Space%%A_Space%,, All

nameAddyString = Starting`r`n%nameAddyString%
StringReplace, nameAddyString, nameAddyString, Help`r`n`r`n, ^, All

	Loop, parse, nameAddyString, ^
	{
	if (A_Index != 1)
	newString = %A_LoopField%

	nameAddyString := newString
	}
	
;msgbox, %nameAddyString%	

;StringReplace, nameAddyString, nameAddyString, `r`n`r`n,,1

;msgbox, %nameAddyString%	
}
else
{
StringReplace, nameAddyString, nameAddyString, %A_Space%%A_Space%%A_Space%%A_Space%,, All
;StringReplace, nameAddyString, nameAddyString, `r`n`r`n,`r`n, All
}

StringReplace, nameAddyString, nameAddyString, `r`n`r`n, ^, All

StringSplit, checkString, nameAddyString, ^

StringSplit, finalStrings, checkString1, `r

theName = %finalStrings1%

thePhone = %finalStrings2%

StringReplace, thePhone, thePhone, `n,,All

StringSplit, addyString, checkString2, `r

addy1 = %addyString1%

StringReplace, addyString2, addyString2, `,, `,, UseErrorLevel
if (ErrorLevel > 0)
foundComma = yes

StringReplace, addyString2, addyString2, -, -, UseErrorLevel
if (ErrorLevel > 0)
foundDash = yes

if ((foundComma = "yes") && (foundDash = "yes")) ; this is the city/state/zip
{
addy2 =
StringSplit, city, addyString2, `,
StringReplace, city1, city1,`n,,All
city = %city1%

StringTrimLeft, city2, city2, 3

FoundPos := RegExMatch(city2, "(.*)-", zipcode)

theZip = %zipCode1%

;msgbox, theZipcode is %zipcode1%

}
else
{
addy2 = %addyString2%

StringReplace, addy2, addy2, `n,,All

StringSplit, city, addyString3, `,
city = %city1%

StringReplace, city, city, `n,,All

StringTrimLeft, city2, city2, 3

FoundPos := RegExMatch(city2, "(.*)-", zipcode)

theZip = %zipCode1%
}

if (theZip)
{
GuiControl,, CustAName, %theName%
GuiControl,, CustAAddress1, %addy1%
GuiControl,, CustAAddress2, %addy2%
GuiControl,, CustACity, %city%
GuiControl,, CustAZipCode, %theZip%
GuiControl, Focus, CustAEventDate
}
else
{
TrayTip, Copy Customer Info to Swap Packages Tool, In order to use this button copy the customers information in Embassy and click again., 5
}

theName=
thePhone=
addy1=
addy2=
city=
theZip=

Return

RunAddy2:
nameAddyString := clipboard

StringReplace, nameAddyString, nameAddyString, allordersdesignscommsquotesgroupsreminders, allordersdesignscommsquotesgroupsreminders, UseErrorLevel
if (ErrorLevel > 0)
{
; This is from Chrome, not Firefox. 
Chrome = 1
}
else
{
Chrome = 0
}

StringReplace, nameAddyString, nameAddyString, CUSTOMERS WAITING, CUSTOMERS WAITING, UseErrorLevel
if (ErrorLevel > 0)
{
StringReplace, nameAddyString, nameAddyString, %A_Space%%A_Space%%A_Space%%A_Space%,, All

nameAddyString = Starting`r`n%nameAddyString%
StringReplace, nameAddyString, nameAddyString, Help`r`n`r`n, ^, All

	Loop, parse, nameAddyString, ^
	{
	if (A_Index != 1)
	newString = %A_LoopField%

	nameAddyString := newString
	}
	
;msgbox, %nameAddyString%	

;StringReplace, nameAddyString, nameAddyString, `r`n`r`n,,1

;msgbox, %nameAddyString%	
}
else
{
StringReplace, nameAddyString, nameAddyString, %A_Space%%A_Space%%A_Space%%A_Space%,, All
;StringReplace, nameAddyString, nameAddyString, `r`n`r`n,`r`n, All
}

StringReplace, nameAddyString, nameAddyString, `r`n`r`n, ^, All

StringSplit, checkString, nameAddyString, ^

StringSplit, finalStrings, checkString1, `r

theName = %finalStrings1%

thePhone = %finalStrings2%

StringReplace, thePhone, thePhone, `n,,All

StringSplit, addyString, checkString2, `r

addy1 = %addyString1%

StringReplace, addyString2, addyString2, `,, `,, UseErrorLevel
if (ErrorLevel > 0)
foundComma = yes

StringReplace, addyString2, addyString2, -, -, UseErrorLevel
if (ErrorLevel > 0)
foundDash = yes

if ((foundComma = "yes") && (foundDash = "yes")) ; this is the city/state/zip
{
addy2 =
StringSplit, city, addyString2, `,
StringReplace, city1, city1,`n,,All
city = %city1%

StringTrimLeft, city2, city2, 3

FoundPos := RegExMatch(city2, "(.*)-", zipcode)

theZip = %zipCode1%

;msgbox, theZipcode is %zipcode1%

}
else
{
addy2 = %addyString2%

StringReplace, addy2, addy2, `n,,All

StringSplit, city, addyString3, `,
city = %city1%

StringReplace, city, city, `n,,All

StringTrimLeft, city2, city2, 3

FoundPos := RegExMatch(city2, "(.*)-", zipcode)

theZip = %zipCode1%
}

if (theZip)
{
GuiControl,, CustBName, %theName%
GuiControl,, CustBAddress1, %addy1%
GuiControl,, CustBAddress2, %addy2%
GuiControl,, CustBCity, %city%
GuiControl,, CustBZipCode, %theZip%
GuiControl, Focus, CustBEventDate
}
else
{
TrayTip, Copy Customer Info to Swap Packages Tool, In order to use this button copy the customers information in Embassy and click again., 5
}

theName=
thePhone=
addy1=
addy2=
city=
theZip=

Return

CustACC:

if (ACCstatus = "") or (ACCstatus = "off")
{
GuiControl, Hide, CustACCOff
GuiControl, Show, CustACCOn
GuiControl, Show, CustAContactPhoneOff
GuiControl, Show, CustAContactEmailOff
ACCStatus = on
CustAContacted = 1
}
else
{
GuiControl, Hide, CustACCOn
GuiControl, Show, CustACCOff
GuiControl, Hide, CustAContactPhoneOff
GuiControl, Hide, CustAContactEmailOff
GuiControl, Hide, CustAContactPhoneOn
GuiControl, Hide, CustAContactEmailOn
ACCStatus = off
CustAPhoneStatus = Off
CustAEmailStatus = Off
CustAContacted=
}
Return

CustBCC:

if (BCCstatus = "") or (BCCstatus = "off")
{
GuiControl, Hide, CustBCCOff
GuiControl, Show, CustBCCOn
GuiControl, Show, CustBContactPhoneOff
GuiControl, Show, CustBContactEmailOff
BCCStatus = on
CustBContacted = 1
}
else
{
GuiControl, Hide, CustBCCOn
GuiControl, Show, CustBCCOff
GuiControl, Hide, CustBContactPhoneOff
GuiControl, Hide, CustBContactEmailOff
GuiControl, Hide, CustBContactPhoneOn
GuiControl, Hide, CustBContactEmailOn
BCCStatus = off
CustBPhoneStatus = Off
CustBEmailStatus = Off
CustBContacted=
}
Return

FinalDualSwap:

WinGetPos, Xpos, Ypos

Gui, FinalDualSwap: New
Gui, FinalDualSwap: Color, DFDDDA

Gui, FinalDualSwap: Add, Picture, w965 h91 x0 y0 vheader, %A_ScriptDir%\images\swap\header_1.jpg
Gui, FinalDualSwap: Add, Text, w300 h40 x465 y35 BackgroundTrans vSingleSwap gSingleSwap,


Gui, FinalDualSwap: Add, Picture, w200 h33 x22 y15 vLogo gOpening, %A_ScriptDir%\images\logo.jpg
;Gui, FinalDualSwap: Add, Picture, w20 h20 x920 y20 vMenu, %A_ScriptDir%\images\menu.jpg

Gui, FinalDualSwap:Font, S14, Arial Bold
Gui, FinalDualSwap: Add, Text, w185 h30 x32 y100 vCust1Details cBlue gCustAProb, Order %CustAOrderNumberPlaced% (A):
Gui, FinalDualSwap:Font, S8, Arial Bold
Gui, FinalDualSwap: Add, Text, w125 h20 x225 y105 gSwap cRed vEdit1, Edit
Gui, FinalDualSwap:Font, S10, Arial Bold
Gui, FinalDualSwap: Add, Text, w250 h20 x32 y130, Name: %CustAName%
Gui, FinalDualSwap: Add, Text, w300 h20 x32 y150, Address: %CustAAddress1%
Gui, FinalDualSwap: Add, Text, w300 h20 x32 y170, Address: %CustAAddress2%
Gui, FinalDualSwap: Add, Text, w250 h20 x32 y190, Zip Code: %CustAZipCode%
Gui, FinalDualSwap: Add, Text, w250 h20 x32 y210, Event Date: %CustAEventDate%
Gui, FinalDualSwap: Add, Picture, w200 h10 x28 y230, %A_ScriptDir%\images\swap\horz_spacer.jpg
Gui, FinalDualSwap:Font, S12, Arial Bold
Gui, FinalDualSwap: Add, Text, w250 h20 x32 y245, Outgoing Shipment:
Gui, FinalDualSwap:Font, S10, Arial Bold
Gui, FinalDualSwap: Add, Text, w250 h20 x32 y270, Delivery Method: %CustAServiceType%
Gui, FinalDualSwap: Add, Text, w300 h20 x32 y290, Ship Method: %CustADeliveryMethod%
if (CustAOrderNumberPackagesRecd = 1)
{
Gui, FinalDualSwap: Add, Text, w300 h20 x32 y310, Packages: %CustAOrderNumberPackagesRecd% total
Gui, FinalDualSwap: Add, Text, w300 h20 x32 y330, Weight: %CustAWeight1%lbs
}
else if (CustAOrderNumberPackagesRecd = 2)
{
Gui, FinalDualSwap: Add, Text, w300 h20 x32 y310, Packages: %CustAOrderNumberPackagesRecd% total
Gui, FinalDualSwap: Add, Text, w300 h20 x32 y330, Weight: %CustAWeight1%lbs/%CustAWeight2%lbs
}
else if (CustBOrderNumberPackagesRecd = 3)
{
Gui, FinalDualSwap: Add, Text, w300 h20 x32 y310, Packages: %CustAOrderNumberPackagesRecd% total
Gui, FinalDualSwap: Add, Text, w300 h20 x32 y330, Weight: %CustAWeight1%lbs/%CustAWeight2%lbs/%CustAWeight3%lbs
}
else if (CustBOrderNumberPackagesRecd = 4)
{
Gui, FinalDualSwap: Add, Text, w300 h20 x32 y310, Packages: %CustAOrderNumberPackagesRecd% total
Gui, FinalDualSwap: Add, Text, w300 h20 x32 y330, Weight: %CustAWeight1%lbs/%CustAWeight2%lbs/%CustAWeight3%lbs/%CustAWeight4%lbs
}
else if (CustBOrderNumberPackagesRecd = 5)
{
Gui, FinalDualSwap: Add, Text, w300 h20 x32 y310, Packages: %CustAOrderNumberPackagesRecd% total
Gui, FinalDualSwap: Add, Text, w300 h20 x32 y330, Weight: %CustAWeight1%lbs/%CustAWeight2%lbs/%CustAWeight3%lbs/%CustAWeight4%lbs/%CustAWeight5%lbs
}
Gui, FinalDualSwap: Add, Picture, w280 h20 x27 y350, %A_ScriptDir%\images\swap\horz_spacer.jpg
Gui, FinalDualSwap: Add, Picture, w125 h125 x92 y380 vProcessing1, %A_ScriptDir%\images\swap\processing.jpg
Gui, FinalDualSwap:Font, S9, Arial Bold
Gui, FinalDualSwap: Add, Text, w120 h20 x32 y390 vCustATrack1Title, Incoming Tracking:
Gui, FinalDualSwap:Font, S10, Arial
Gui, FinalDualSwap: Add, Edit, w145 h20 x147 y387 -Vscroll vCustATrack1,
Gui, FinalDualSwap:Font, S9, Arial Bold
Gui, FinalDualSwap: Add, Text, w120 h20 x32 y420 vCustATrack2Title, Incoming Tracking:
Gui, FinalDualSwap:Font, S10, Arial
Gui, FinalDualSwap: Add, Edit, w145 h20 x147 y417 -Vscroll vCustATrack2,
Gui, FinalDualSwap:Font, S9, Arial Bold
Gui, FinalDualSwap: Add, Text, w120 h20 x32 y450 vCustATrack3Title, Incoming Tracking:
Gui, FinalDualSwap:Font, S10, Arial
Gui, FinalDualSwap: Add, Edit, w145 h20 x147 y447 -Vscroll vCustATrack3,
Gui, FinalDualSwap:Font, S9, Arial Bold
Gui, FinalDualSwap: Add, Text, w120 h20 x32 y480 vCustATrack4Title, Incoming Tracking:
Gui, FinalDualSwap:Font, S10, Arial
Gui, FinalDualSwap: Add, Edit, w145 h20 x147 y477 -Vscroll vCustATrack4,
Gui, FinalDualSwap:Font, S9, Arial Bold
Gui, FinalDualSwap: Add, Text, w120 h20 x32 y510 vCustATrack5Title, Incoming Tracking:
Gui, FinalDualSwap:Font, S10, Arial
Gui, FinalDualSwap: Add, Edit, w145 h20 x147 y507 -Vscroll vCustATrack5,
Gui, FinalDualSwap:Font, S10, Arial Bold
if (CustADeliveryMethod = "Return Label")
{
Gui, FinalDualSwap: Add, Text, w200 h20 x32 y540 vCustALinksTitle, Email to Customer A:
Gui, FinalDualSwap:Font, S10, Arial
Gui, FinalDualSwap: Add, Edit, w260 h50 x32 y560 vCustALinks, 
}
else
{
Gui, FinalDualSwap: Add, Text, w200 h20 x97 y540 vCustALinksTitle, **Pickup Scheduled**
}


Gui, FinalDualSwap:Font, S14, Arial Bold
Gui, FinalDualSwap: Add, Text, w185 h30 x360 y100 vCust2Details cBlue gCustBProb, Order %CustBOrderNumberPlaced% (B):
Gui, FinalDualSwap:Font, S8, Arial Bold
Gui, FinalDualSwap: Add, Text, w125 h20 x555 y105 vEdit2 gSwap1 cRed, Edit
Gui, FinalDualSwap:Font, S10, Arial Bold
Gui, FinalDualSwap: Add, Text, w250 h20 x360 y130, Name: %CustBName%
Gui, FinalDualSwap: Add, Text, w300 h20 x360 y150, Address: %CustBAddress1%
Gui, FinalDualSwap: Add, Text, w300 h20 x360 y170, Address: %CustBAddress2%
Gui, FinalDualSwap: Add, Text, w250 h20 x360 y190, Zip Code: %CustBZipCode%
Gui, FinalDualSwap: Add, Text, w250 h20 x360 y210, Event Date: %CustBEventDate%
Gui, FinalDualSwap: Add, Picture, w200 h10 x357 y230, %A_ScriptDir%\images\swap\horz_spacer.jpg
Gui, FinalDualSwap:Font, S12, Arial Bold
Gui, FinalDualSwap: Add, Text, w250 h20 x360 y245, Outgoing Shipment:
Gui, FinalDualSwap:Font, S10, Arial Bold
Gui, FinalDualSwap: Add, Text, w250 h20 x360 y270, Delivery Method: %CustBServiceType%
Gui, FinalDualSwap: Add, Text, w300 h20 x360 y290, Ship Method: %CustBDeliveryMethod%
if (CustBOrderNumberPackagesRecd = 1)
{
Gui, FinalDualSwap: Add, Text, w300 h20 x360 y310, Packages: %CustBOrderNumberPackagesRecd% total
Gui, FinalDualSwap: Add, Text, w300 h20 x360 y330, Weight: %CustBWeight1%lbs
}
else if (CustBOrderNumberPackagesRecd = 2)
{
Gui, FinalDualSwap: Add, Text, w300 h20 x360 y310, Packages: %CustBOrderNumberPackagesRecd% total
Gui, FinalDualSwap: Add, Text, w300 h20 x360 y330, Weight: %CustBWeight1%lbs/%CustBWeight2%lbs
}
else if (CustBOrderNumberPackagesRecd = 3)
{
Gui, FinalDualSwap: Add, Text, w300 h20 x360 y310, Packages: %CustBOrderNumberPackagesRecd% total
Gui, FinalDualSwap: Add, Text, w300 h20 x360 y330, Weight: %CustBWeight1%lbs/%CustBWeight2%lbs/%CustBWeight3%lbs
}
else if (CustBOrderNumberPackagesRecd = 4)
{
Gui, FinalDualSwap: Add, Text, w300 h20 x360 y310, Packages: %CustBOrderNumberPackagesRecd% total
Gui, FinalDualSwap: Add, Text, w300 h20 x360 y330, Weight: %CustBWeight1%lbs/%CustBWeight2%lbs/%CustBWeight3%lbs/%CustBWeight4%lbs
}
else if (CustBOrderNumberPackagesRecd = 5)
{
Gui, FinalDualSwap: Add, Text, w300 h20 x360 y310, Packages: %CustBOrderNumberPackagesRecd% total
Gui, FinalDualSwap: Add, Text, w300 h20 x360 y330, Weight: %CustBWeight1%lbs/%CustBWeight2%lbs/%CustBWeight3%lbs/%CustBWeight4%lbs/%CustBWeight5%lbs
}
Gui, FinalDualSwap: Add, Picture, w280 h20 x355 y350, %A_ScriptDir%\images\swap\horz_spacer.jpg
Gui, FinalDualSwap: Add, Picture, w125 h125 x420 y380 vProcessing2, %A_ScriptDir%\images\swap\processing.jpg
Gui, FinalDualSwap:Font, S9, Arial Bold
Gui, FinalDualSwap: Add, Text, w120 h20 x360 y390 vCustBTrack1Title, Incoming Tracking:
Gui, FinalDualSwap:Font, S10, Arial
Gui, FinalDualSwap: Add, Edit, w145 h20 x475 y387 -Vscroll vCustBTrack1,
Gui, FinalDualSwap:Font, S9, Arial Bold
Gui, FinalDualSwap: Add, Text, w120 h20 x360 y420 vCustBTrack2Title, Incoming Tracking:
Gui, FinalDualSwap:Font, S10, Arial
Gui, FinalDualSwap: Add, Edit, w145 h20 x475 y417 -Vscroll vCustBTrack2,
Gui, FinalDualSwap:Font, S9, Arial Bold
Gui, FinalDualSwap: Add, Text, w120 h20 x360 y450 vCustBTrack3Title, Incoming Tracking:
Gui, FinalDualSwap:Font, S10, Arial
Gui, FinalDualSwap: Add, Edit, w145 h20 x475 y447 -Vscroll vCustBTrack3,
Gui, FinalDualSwap:Font, S9, Arial Bold
Gui, FinalDualSwap: Add, Text, w120 h20 x360 y480 vCustBTrack4Title, Incoming Tracking:
Gui, FinalDualSwap:Font, S10, Arial
Gui, FinalDualSwap: Add, Edit, w145 h20 x475 y477 -Vscroll vCustBTrack4,
Gui, FinalDualSwap:Font, S9, Arial Bold
Gui, FinalDualSwap: Add, Text, w120 h20 x360 y510 vCustBTrack5Title, Incoming Tracking:
Gui, FinalDualSwap:Font, S10, Arial
Gui, FinalDualSwap: Add, Edit, w145 h20 x475 y507 -Vscroll vCustBTrack5,
Gui, FinalDualSwap:Font, S10, Arial Bold
if (CustBDeliveryMethod = "Return Label")
{
Gui, FinalDualSwap: Add, Text, w200 h20 x360 y540 vCustBLinksTitle, Email to Customer B:
Gui, FinalDualSwap:Font, S10, Arial
Gui, FinalDualSwap: Add, Edit, w260 h50 x360 y560 vCustBLinks,
} 
else
{
Gui, FinalDualSwap: Add, Text, w200 h20 x425 y540 vCustBLinksTitle, **Pickup Scheduled**
}



GuiControl, Hide, Processing1
GuiControl, Hide, Processing2
GuiControl, Hide, CustATrack1Title
GuiControl, Hide, CustATrack1
GuiControl, Hide, CustATrack2Title
GuiControl, Hide, CustATrack2
GuiControl, Hide, CustATrack3Title
GuiControl, Hide, CustATrack3
GuiControl, Hide, CustATrack4Title
GuiControl, Hide, CustATrack4
GuiControl, Hide, CustATrack5Title
GuiControl, Hide, CustATrack5
GuiControl, Hide, CustALinksTitle
GuiControl, Hide, CustALinks
GuiControl, Hide, CustBTrack1Title
GuiControl, Hide, CustBTrack1
GuiControl, Hide, CustBTrack2Title
GuiControl, Hide, CustBTrack2
GuiControl, Hide, CustBTrack3Title
GuiControl, Hide, CustBTrack3
GuiControl, Hide, CustBTrack4Title
GuiControl, Hide, CustBTrack4
GuiControl, Hide, CustBTrack5Title
GuiControl, Hide, CustBTrack5
GuiControl, Hide, CustBLinksTitle
GuiControl, Hide, CustBLinks


Gui, FinalDualSwap:Font, S12, Arial Bold
Gui, FinalDualSwap: Add, Text, w250 h30 x675 y100 vNotesDetails, Notes:
Gui, FinalDualSwap:Font, S10, Arial

if (CustAContacted = 1) or (CustAContacted = "Contacted/Phone") or (CustAContacted = "Contacted/Email")
CustAContacted = Contacted
else
CustAContacted = Not Contacted

if (CustAContacted = "Contacted")
{
	if (CustAPhoneStatus = "On")
	contact_method = Phone
	else
	contact_method = Email
	
	CustAContacted = %CustAContacted%/%contact_method%
}

if (CustBContacted = 1) or (CustBContacted = "Contacted/Phone") or (CustBContacted = "Contacted/Email")
CustBContacted = Contacted
else
CustBContacted = Not Contacted

if (CustBContacted = "Contacted")
{
	if (CustBPhoneStatus = "On")
	contact_method = Phone
	else
	contact_method = Email
	
	CustBContacted = %CustBContacted%/%contact_method%
	
}

NotesTemplate=
(
Today's Date: %A_MM%/%A_DD%/%A_YYYY%

Order Numbers Involved:
(a) %CustAOrderNumberPlaced% - %CustAContacted%
(b) %CustBOrderNumberPlaced% - %CustBContacted%

Location Of Orders:
(a): %CustBAddress1% - %CustBCity%, %CustBStateName% %CustBZipCode%
(b): %CustAAddress1% - %CustACity%, %CustAStateName% %CustAZipCode%

Event Dates:
(a): %CustAEventDate%
(b): %CustBEventDate%

Investigation Steps:

Pick-up/Return Tracking Numbers, or Fix Order Numbers:
(a): 
(b):

Resolution Options:
)

Gui, FinalDualSwap: Add, Edit, w250 h400 x675 y140 BackgroundTrans vtheNotes,

GuiControl,,theNotes, %NotesTemplate%

Gui, FinalDualSwap: Add, Picture, w110 h40 x10 y580 vBackCustB gSwap1, %A_ScriptDir%\images\swap\back.jpg
Gui, FinalDualSwap: Add, Picture, w200 h40 x750 y580 vStartReturnSwap gStartReturnSwap, %A_ScriptDir%\images\UPS_start_return.jpg


Gui, FinalDualSwap: Show, x%Xpos% y%yPos% w%GuiWidth% h%GuiHeight%, Swapped Packages
Gui, Swap1:destroy


Return

CustAProb:
Run, https://home.customink.com/backend/order_actions/%CustAOrderNumberPlaced%?refresh_customer=false#problems
Return

CustBProb:
Run, https://home.customink.com/backend/order_actions/%CustBOrderNumberPlaced%?refresh_customer=false#problems
Return

StartReturnSwap:
GuiControl, Disable, SingleSwap
GuiControl, Hide, StartReturnSwap
GuiControl, Hide, BackCustB
GuiControl, Hide, Edit1
GuiControl, Hide, Edit2
instance = A
opposite = B
counter=0
myCounting = 1
ySpacing = 30
prefix = https://www.ups.com/uel/llp/

GuiControl, Show, Processing1

gosub, DualSwapLogin
Return

DualSwapLogin:


if (instance = "B")
{
	if (counter = CustAOrderNumberPackagesRecd)
	{
	YMath1 := 5 - CustAOrderNumberPackagesRecd
	YResult := YMath1 * YSpacing
	YFinal := 560 - YResult
	YFinalTitle := YFinal - 20
	GuiControl, Hide, Processing2
	
	Loop, parse, runningTrackInfoB, `,
	{
	GuiControl,,CustATrack%A_Index%, %A_LoopField%
	if (A_Index = 1)
	RunningALinks = %prefix%%A_Loopfield%
	else
	RunningALinks = %RunningALinks%`r`n%prefix%%A_LoopField%
	GuiControl, Show, CustATrack%A_Index%Title
	GuiControl, Show, CustATrack%A_Index%
	
		if (A_Index = CustBOrderNumberPackagesRecd)
		{
		GuiControl,,CustBLinks, %RunningALinks%
		GuiControl, MoveDraw, CustBLinks, y%YFinal%
		GuiControl, MoveDraw, CustBLinksTitle, y%YFinalTitle%
		GuiControl, Show, CustBLinksTitle
		GuiControl, Show, CustBLinks
		}	
	
	}
	
	YMath1 := 5 - CustBOrderNumberPackagesRecd
	YResult := YMath1 * YSpacing
	YFinal := 560 - YResult
	YFinalTitle := YFinal - 20
	
	Loop, parse, runningTrackInfoA, `,
	{
	GuiControl,,CustBTrack%A_Index%, %A_LoopField%
	if (A_Index = 1)
	RunningBLinks = %prefix%%A_Loopfield%
	else
	RunningBLinks = %RunningBLinks%`r`n%prefix%%A_LoopField%
	GuiControl, Show, CustBTrack%A_Index%Title
	GuiControl, Show, CustBTrack%A_Index%
	
		if (A_Index = CustAOrderNumberPackagesRecd)
		{
		GuiControl,,CustALinks, %RunningBLinks%
		GuiControl, MoveDraw, CustALinks, y%YFinal%
		GuiControl, MoveDraw, CustALinksTitle, y%YFinalTitle%
		GuiControl, Show, CustALinksTitle
		GuiControl, Show, CustALinks
		}	
	
	}
	
NotesTemplate=
(
Today's Date: %A_MM%/%A_DD%/%A_YYYY%

Order Numbers Involved:
(a) %CustAOrderNumberPlaced% - %CustAContacted%
(b) %CustBOrderNumberPlaced% - %CustBContacted%

Location Of Orders:
(a): %CustBAddress1% - %CustBCity%, %CustBStateName% %CustBZipCode%
(b): %CustAAddress1% - %CustACity%, %CustAStateName% %CustAZipCode%

Event Dates:
(a): %CustAEventDate%
(b): %CustBEventDate%

Investigation Steps:

Pick-up/Return Tracking Numbers, or Fix Order Numbers:

(a):
(To receive:) 
%runningTrackInfoB%
)

if (CustADeliveryMethod = "Return Label")
{
NotesTemplate=
(
%NotesTemplate%

(Label sent to Cust A): 
%RunningBLinks%
)
}
else
{
NotesTemplate=
(
%NotesTemplate%

Pickup Scheduled
)
}

NotesTemplate=
(
%NotesTemplate%

(b):
(To receive:)
%runningTrackInfoA%
)

if (CustBDeliveryMethod = "Return Label")
{
NotesTemplate=
(
%NotesTemplate%
 
(Label sent to Cust B): 
%RunningALinks%
)
}
else
{
NotesTemplate=
(
%NotesTemplate%

Pickup Scheduled
)
}

NotesTemplate=
(
%NotesTemplate%

Resolution Options:
)

	GuiControl,,theNotes, %NotesTemplate%

	Return
	}
}

if (instance = "A")
{
	if (counter = CustBOrderNumberPackagesRecd)
	{
	GuiControl, Hide, Processing1
	GuiControl, Show, Processing2
	instance = B
	opposite = A
	counter=0
	myCounting=1
	}
}

;msgbox, instance is %instance%

try
	wb := ComObjCreate("InternetExplorer.Application")  ; Create an IE object

	
wb.Visible := false

try
	{
		goURL = https://www.ups.com/one-to-one/logout?returnto=https`%3A`%2F`%2Fwww.campusship.ups.com

	URLToVar(goURL)
	}
	
wb.Navigate("https://www.ups.com/one-to-one/logout?returnto=https%3A%2F%2Fwww.campusship.ups.com")


While	wb.readyState != 4 || wb.document.readyState != "complete" || wb.busy
sleep 1000

gosub, DualSwapPass
Return

DualSwapPass:
		wb.document.forms[0].elements[0].value := "sales_service"
		wb.document.forms[0].elements[1].value := "Blanks12"
	
		WinGetTitle, thisTitle, ahk_class IEFrame
		wb.document.forms[0].login.click()

	While	wb.readyState != 4 || wb.document.readyState != "complete" || wb.busy
	sleep 1000

	gosub, DualSwapBeginReturn
	Return

	DualSwapBeginReturn:
	wb.Navigate("https://www.campusship.ups.com/cship/create?ActionOriginPair=CreateAReturn___StartSession")
	
	While	wb.readyState != 4 || wb.document.readyState != "complete" || wb.busy
	sleep 1000	
	
	
	
	goSub, DualSwapEvalReturnTo
	Return

DualSwapEvalReturnTo:
wb.document.getElementById("shipToEdit").click()	

While	wb.readyState != 4 || wb.document.readyState != "complete" || wb.busy
					sleep 1000	
					try
					{	
						If InStr(wb.document.body.innerHTML, "Edit Return To Address")
						{
						; We're in the right spot.
						}
						else
						{
						gosub, DualSwapBeginReturn
						Return
						}
					}
					
wb.document.getElementById("shipToNameValue").value := Cust%Instance%Name
wb.document.getElementById("shipToContactNameValue").value := "866-485-8160"
wb.document.getElementById("shipToStreetValue").value := Cust%Instance%Address1
wb.document.getElementById("shipToAddr2Value").value := Cust%Instance%Address2
wb.document.getElementById("shipToCityValue").value := Cust%Instance%City
wb.document.getElementById("shipToPostalValue").value := Cust%Instance%ZipCode
wb.document.getElementById("shipToStateValue").selectedIndex := Cust%Instance%State
wb.document.getElementById("shipToEmailValue").value := "service@customink.com"
;wb.document.getElementById("shipToSaveOption").selectedIndex := 5
wb.document.getElementById("shipToValidate").click()
sleep 2000
;wb.document.getElementsByName("next").click()
sleep 1500
while ( x:= wb.document.getElementsByTagName("input") ){
	if ( x[a_Index-1].value == "Update" ){
	x[a_Index-1].click() ;//Could also try x[a_index-1].submit()
	break
	}
}


While	wb.readyState != 4 || wb.document.readyState != "complete" || wb.busy
	sleep 1000
	
	
	wb.document.getElementById("enterNewAddressLink").click()
	While	wb.readyState != 4 || wb.document.readyState != "complete" || wb.busy
	sleep 1000
	
	gosub, DualSwapAddInfo
	Return
	
	
	DualSwapAddInfo:
	
	ReturnsNumber = 866-485-8160
		
	wb.document.getElementById("returnFromNameValue").value := Cust%opposite%Name
	wb.document.getElementById("returnFromStreetValue").value := Cust%opposite%Address1
	wb.document.getElementById("returnFromAddr2Value").value := Cust%opposite%Address2
	wb.document.getElementById("returnFromCityValue").value := Cust%opposite%City 
	wb.document.getElementById("returnFromStateValue").selectedIndex := Cust%opposite%State

			if (ZipCode between 00000 and 09999)
			{
			FinalZip := Cust%opposite%ZipCode
			wb.document.getElementById("returnFromPostalValue").value := FinalZip
			}
			else
			{
			wb.document.getElementById("returnFromPostalValue").value := Cust%opposite%ZipCode
			}


	;if (AddType = "Residential")
	;{
	wb.document.getElementById("usprResidential").click()
	;}
	wb.document.getElementById("packagingType").selectedIndex := 6
	
	if (Cust%Opposite%DeliveryMethod = "Return Label")
	returnType = 3
	else
	returnType = 1

	wb.document.getElementById("returnService").selectedIndex := returnType
	
		
	if (Cust%Opposite%ServiceType = "Ground Service")
	serviceType = 5
	else
	serviceType = 2

	wb.document.getElementById("service").selectedIndex := serviceType

		wb.document.getElementById("packageBean.weight").value := Cust%Opposite%Weight%myCounting%

		if (Cust%Opposite%OrderNumberPackagesRecd > 1)
		{
		labelRef := Cust%Opposite%OrderNumberPackagesRecd
		MerchDescription := Cust%Opposite%MerchDescription
		refString = %MerchDescription% (%myCounting% of %labelRef%)
		wb.document.getElementById("packageBean_merchandiseDescription").value := refString
		}
		else
		{
		wb.document.getElementById("packageBean_merchandiseDescription").value := Cust%Opposite%MerchDescription
		}
	wb.document.getElementById("reference_value1").value := Cust%Instance%OrderNumberPlaced
	wb.document.getElementById("returnFromPhoneValue").value := ReturnsNumber
	wb.document.getElementById("reference_value2").value := showNick
	wb.document.getElementByID("reviewDetails").click()
		wb.document.getElementById("next").click()
While	wb.readyState != 4 || wb.document.readyState != "complete" || wb.busy
	sleep 1000
	
	; Checking to see if there is an address error.
	
	try
	{	
		If InStr(wb.document.body.innerHTML, "(UPS: 81040)")
		{
		msgbox,16,Zip Code Error, The UPS website is recommending a different City/Zip than what you have entered. Please continue with processing your return on the CampusShip website. The UPS Tool will now close.
		wb.quit
		wb:=""
		ExitApp
		Return
		}
	}
	
	if (attemptNum = 1) || (attemptNum = 3)
	{
	While	wb.readyState != 4 || wb.document.readyState != "complete" || wb.busy
	sleep 1000
	gosub, Complete
	Return
	}

;wb.document.getElementsByName("electronicReturnLabelDetail.recipient#1.emailAddress").value := showEmail
;wb.document.forms[0].elements[8].value := showEmail

if (returnType = 3)
{

while ( x:= wb.document.getElementsByTagName("input") ){
						if ( x[a_Index-1].name == "electronicReturnLabelDetail.recipient#1.emailAddress" ){
						x[a_Index-1].value := showEmail ;//Could also try x[a_index-1].submit()
						break
						}
					}

tryThis = javascript:submitWithAOPair(document.mainPageForm,'Next','AdditionalReturnOptions','')`;

	wb.Navigate(tryThis)
	
						
While	wb.readyState != 4 || wb.document.readyState != "complete" || wb.busy
sleep 1000

}
else
{
GoSub, DualSwapComplete
Return
}


Try
{
	If InStr(wb.document.body.innerHTML, "(UPS: 81163)")
	{
	msgbox,16,E-mail Label Error, The UPS website is having difficulty processing the electronic return label. Specifically, there is an issue with the e-mail address that it is being sent to. Please screenshot this message and contact autohotkeys@customink.com for further assistance. In the meantime, you will need to process your return on the CampusShip website. The UPS Tool will now close.
	wb.quit
	wb:=""
	ExitApp
	Return
	}
}
	
	gosub, DualSwapComplete
	Return	
	
DualSwapComplete:
	
		try
		{
		theTrackInfo := wb.document.getElementsByTagName("dd")[0].innerText
		}
		
		;msgbox, Instance is %instance%
		
		if (runningTrackInfo%Opposite% = "")
		runningTrackInfo%Opposite% = %theTrackInfo%
		else
		{
		TempTrack := runningTrackInfo%Opposite%
		runningTrackInfo%Opposite% = %TempTrack%,%theTrackInfo%
		TempTrack=
		}
		
		counter++
		myCounting++
		
			
			wb.quit
			wb:=""
			gosub, DualSwapLogin
			Return

DualSwapFinished:
		/*if (NumberOfPackages > 1)
		{
			if ((AttemptNum = 1) || (AttemptNum = 3))
			{
			TrayTip, Return Pickups Scheduled, You have successfully scheduled %NumberOfPackages% UPS Pickups., 10000
			}
			else
			{
			TrayTip, Return Shipping Labels Created, You have successfully created UPS Return shipping labels. The labels have been e-mailed to you., 10000
			}
		}
		else
		{
			if ((AttemptNum = 1) || (AttemptNum = 3))
			{
			TrayTip, Return Pickup Scheduled, You have successfully scheduled a UPS Pickup. The tracking number is now in your clipboard., 10000
			}
			else
			{
			TrayTip, Return Shipping Label Created, You have successfully created a UPS return shipping label. The label has been e-mailed to you. The tracking number is now in your clipboard., 10000
			}
		}
		*/
		
		
		if ((AttemptNum = 1) || (AttemptNum = 3))
method = pickup
else
method = label

;NumberOfPackages = 3

row_height = 65

height := NumberOfPackages * row_height
GuiWidth = 400

prefix = https://www.ups.com/uel/llp/

initialSH = 70
resultSH := initialSH + height

newSW := A_ScreenWidth - 405
newSH := A_ScreenHeight - resultSH

Gui, Finished:+AlwaysOnTop 0x12
Gui, Finished:Color, 36A6E0

label_y = 10 
data_y = 30

if (method = "label")
{
	Loop, parse, runningTrackInfo, `,
	{

	Gui, Finished:Font, S11, Arial Bold
	Gui, Finished:Add, Text, y%label_y% x30 w100 h20 cWhite, Tracking:
	Gui, Finished:Add, Text, y%label_y% x190 w100 h20 cWhite, Label:
	Gui, Finished:Font, Arial S8, Arial
	Gui, Finished:Add, Edit, x30 y%data_y% w125 h22, %A_LoopField%
	CopyTrack%A_Index% = %A_LoopField%
	Gui, Finished:Add, Edit, x190 y%data_y% w200 h22, %prefix%%A_LoopField%
	Gui, Finished:Add, Picture, x5 y%data_y% h20 w20 gCopyTrack%A_Index%, %A_ScriptDir%\images\paste.jpg
	Gui, Finished:Add, Picture, x165 y%data_y% h20 w20 gCopyLink%A_Index%, %A_ScriptDir%\images\paste.jpg

	label_y := label_y + 65
	data_y := data_y + 65

	}
}
else
{
GuiWidth = 160
newSW := A_ScreenWidth - 170
	
	Loop, parse, runningTrackInfo, `,
	{

	Gui, Finished:Font, S11, Arial Bold
	Gui, Finished:Add, Text, y%label_y% x30 w100 h20 cWhite, Tracking:
	Gui, Finished:Font, Arial S8, Arial
	Gui, Finished:Add, Edit, x30 y%data_y% w125 h22 v_trackNum%A_Index%, %A_LoopField%

	Gui, Finished:Add, Picture, x5 y%data_y% h20 w20 gCopyTrack%A_Index%, %A_ScriptDir%\images\paste.jpg

	label_y := label_y + 65
	data_y := data_y + 65

	}



}



Gui, Finished:Show, x%newSW% y%newSH% h%height% w%GuiWidth%,UPS Tracking Information

wb.quit
wb:=""		
	
Return


HeaderSwitch:
if (headerChoice = "") or (header_choice = "dual")
goSub, Swap
else
goSub, SingleSwap

Return

CustANumPackages:
Gui, Swap:Submit, NoHide
if (CustAOrderNumberPackagesRecd = 2)
{
GuiControl, MoveDraw, CustAWeight1, x375
GuiControl, MoveDraw, CustAWeightTitle1, x400
GuiControl, MoveDraw, CustAWeight2, x500
GuiControl, MoveDraw, CustAWeightTitle2, x515
GuiControl, Show, CustAWeight2
GuiControl, Show, CustAWeightTitle2
GuiControl, Hide, CustAWeight3
GuiControl, Hide, CustAWeightTitle3
GuiControl, Hide, CustAWeight4
GuiControl, Hide, CustAWeightTitle4
GuiControl, Hide, CustAWeight5
GuiControl, Hide, CustAWeightTitle5
}
else if (CustAOrderNumberPackagesRecd = 3)
{
GuiControl, MoveDraw, CustAWeight1, x305
GuiControl, MoveDraw, CustAWeightTitle1, x335
GuiControl, MoveDraw, CustAWeight2, x435
GuiControl, MoveDraw, CustAWeightTitle2, x455
GuiControl, MoveDraw, CustAWeight3, x560
GuiControl, MoveDraw, CustAWeightTitle3, x575
GuiControl, Show, CustAWeight2
GuiControl, Show, CustAWeightTitle2
GuiControl, Show, CustAWeight3
GuiControl, Show, CustAWeightTitle3
GuiControl, Hide, CustAWeight4
GuiControl, Hide, CustAWeightTitle4
GuiControl, Hide, CustAWeight5
GuiControl, Hide, CustAWeightTitle5
}
else if (CustAOrderNumberPackagesRecd = 4)
{
GuiControl, MoveDraw, CustAWeight1, x260
GuiControl, MoveDraw, CustAWeightTitle1, x290
GuiControl, MoveDraw, CustAWeight2, x380
GuiControl, MoveDraw, CustAWeightTitle2, x400
GuiControl, MoveDraw, CustAWeight3, x500
GuiControl, MoveDraw, CustAWeightTitle3, x520
GuiControl, MoveDraw, CustAWeight4, x620
GuiControl, MoveDraw, CustAWeightTitle4, x640
GuiControl, Show, CustAWeight2
GuiControl, Show, CustAWeightTitle2
GuiControl, Show, CustAWeight3
GuiControl, Show, CustAWeightTitle3
GuiControl, Show, CustAWeight4
GuiControl, Show, CustAWeightTitle4
GuiControl, Hide, CustAWeight5
GuiControl, Hide, CustAWeightTitle5
}
else if (CustAOrderNumberPackagesRecd = 5)
{
GuiControl, MoveDraw, CustAWeight1, x210
GuiControl, MoveDraw, CustAWeightTitle1, x235
GuiControl, MoveDraw, CustAWeight2, x330
GuiControl, MoveDraw, CustAWeightTitle2, x350
GuiControl, MoveDraw, CustAWeight3, x450
GuiControl, MoveDraw, CustAWeightTitle3, x470
GuiControl, MoveDraw, CustAWeight4, x570
GuiControl, MoveDraw, CustAWeightTitle4, x590
GuiControl, MoveDraw, CustAWeight5, x690
GuiControl, MoveDraw, CustAWeightTitle5, x710
GuiControl, Show, CustAWeight2
GuiControl, Show, CustAWeightTitle2
GuiControl, Show, CustAWeight3
GuiControl, Show, CustAWeightTitle3
GuiControl, Show, CustAWeight4
GuiControl, Show, CustAWeightTitle4
GuiControl, Show, CustAWeight5
GuiControl, Show, CustAWeightTitle5
}
else if (CustAOrderNumberPackagesRecd = 1)
{
GuiControl, Hide, CustAWeight2
GuiControl, Hide, CustAWeightTitle2
GuiControl, Hide, CustAWeight3
GuiControl, Hide, CustAWeightTitle3
GuiControl, Hide, CustAWeight4
GuiControl, Hide, CustAWeightTitle4
GuiControl, Hide, CustAWeight5
GuiControl, Hide, CustAWeightTitle5
GuiControl, MoveDraw, CustAWeight1, x440
GuiControl, MoveDraw, CustAWeightTitle1, x465
}
Return

CustBNumPackages:
Gui, Swap1:Submit, NoHide
if (CustBOrderNumberPackagesRecd = 2)
{
GuiControl, MoveDraw, CustBWeight1, x375
GuiControl, MoveDraw, CustBWeightTitle1, x400
GuiControl, MoveDraw, CustBWeight2, x500
GuiControl, MoveDraw, CustBWeightTitle2, x515
GuiControl, Show, CustBWeight2
GuiControl, Show, CustBWeightTitle2
GuiControl, Hide, CustBWeight3
GuiControl, Hide, CustBWeightTitle3
GuiControl, Hide, CustBWeight4
GuiControl, Hide, CustBWeightTitle4
GuiControl, Hide, CustBWeight5
GuiControl, Hide, CustBWeightTitle5
}
else if (CustBOrderNumberPackagesRecd = 3)
{
GuiControl, MoveDraw, CustBWeight1, x305
GuiControl, MoveDraw, CustBWeightTitle1, x335
GuiControl, MoveDraw, CustBWeight2, x435
GuiControl, MoveDraw, CustBWeightTitle2, x455
GuiControl, MoveDraw, CustBWeight3, x560
GuiControl, MoveDraw, CustBWeightTitle3, x575
GuiControl, Show, CustBWeight2
GuiControl, Show, CustBWeightTitle2
GuiControl, Show, CustBWeight3
GuiControl, Show, CustBWeightTitle3
GuiControl, Hide, CustBWeight4
GuiControl, Hide, CustBWeightTitle4
GuiControl, Hide, CustBWeight5
GuiControl, Hide, CustBWeightTitle5
}
else if (CustBOrderNumberPackagesRecd = 4)
{
GuiControl, MoveDraw, CustBWeight1, x260
GuiControl, MoveDraw, CustBWeightTitle1, x290
GuiControl, MoveDraw, CustBWeight2, x380
GuiControl, MoveDraw, CustBWeightTitle2, x400
GuiControl, MoveDraw, CustBWeight3, x500
GuiControl, MoveDraw, CustBWeightTitle3, x520
GuiControl, MoveDraw, CustBWeight4, x620
GuiControl, MoveDraw, CustBWeightTitle4, x640
GuiControl, Show, CustBWeight2
GuiControl, Show, CustBWeightTitle2
GuiControl, Show, CustBWeight3
GuiControl, Show, CustBWeightTitle3
GuiControl, Show, CustBWeight4
GuiControl, Show, CustBWeightTitle4
GuiControl, Hide, CustBWeight5
GuiControl, Hide, CustBWeightTitle5
}
else if (CustBOrderNumberPackagesRecd = 5)
{
GuiControl, MoveDraw, CustBWeight1, x210
GuiControl, MoveDraw, CustBWeightTitle1, x235
GuiControl, MoveDraw, CustBWeight2, x330
GuiControl, MoveDraw, CustBWeightTitle2, x350
GuiControl, MoveDraw, CustBWeight3, x450
GuiControl, MoveDraw, CustBWeightTitle3, x470
GuiControl, MoveDraw, CustBWeight4, x570
GuiControl, MoveDraw, CustBWeightTitle4, x590
GuiControl, MoveDraw, CustBWeight5, x690
GuiControl, MoveDraw, CustBWeightTitle5, x710
GuiControl, Show, CustBWeight2
GuiControl, Show, CustBWeightTitle2
GuiControl, Show, CustBWeight3
GuiControl, Show, CustBWeightTitle3
GuiControl, Show, CustBWeight4
GuiControl, Show, CustBWeightTitle4
GuiControl, Show, CustBWeight5
GuiControl, Show, CustBWeightTitle5
}
else if (CustBOrderNumberPackagesRecd = 1)
{
GuiControl, Hide, CustBWeight2
GuiControl, Hide, CustBWeightTitle2
GuiControl, Hide, CustBWeight3
GuiControl, Hide, CustBWeightTitle3
GuiControl, Hide, CustBWeight4
GuiControl, Hide, CustBWeightTitle4
GuiControl, Hide, CustBWeight5
GuiControl, Hide, CustBWeightTitle5
GuiControl, MoveDraw, CustBWeight1, x440
GuiControl, MoveDraw, CustBWeightTitle1, x465
}
Return

Calculator:
WinGetPos, Xpos, Ypos	

Gui, Calculator: New
Gui, Calculator: Color, DFDDDA
Gui, Calculator: Add, Picture, w200 h33 x22 y15 vLogo gOpening, %A_ScriptDir%\images\logo.jpg
;Gui, Calculator: Add, Picture, w20 h20 x920 y20 vMenu, %A_ScriptDir%\images\menu.jpg
Gui, Calculator: Add, Picture, w225 h267 x25 y65 vPRPBO, %A_ScriptDir%\images\PR-percentage-by-order.jpg
Gui, Calculator: Font, S12 Norm, Arial Bold
Gui, Calculator: Add, Edit, w100 h25 x135 y128 -vscroll Limit8 vQtyOrderPercentage, 
Gui, Calculator: Add, Picture, w30 h28 x135 y170 v10_on gPROff, %A_ScriptDir%\images\10_on.jpg
Gui, Calculator: Add, Picture, w30 h28 x170 y170 v20_on gPROff, %A_ScriptDir%\images\20_on.jpg
Gui, Calculator: Add, Picture, w30 h28 x205 y170 v30_on gPROff, %A_ScriptDir%\images\30_on.jpg
Gui, Calculator: Add, Picture, w30 h28 x135 y200 v40_on gPROff, %A_ScriptDir%\images\40_on.jpg
Gui, Calculator: Add, Picture, w30 h28 x170 y200 v50_on gPROff, %A_ScriptDir%\images\50_on.jpg
GuiControl, Hide, 10_on
GuiControl, Hide, 20_on
GuiControl, Hide, 30_on
GuiControl, Hide, 40_on
GuiControl, Hide, 50_on
Gui, Calculator: Add, Picture, w30 h28 x135 y170 v10_off gPR10, %A_ScriptDir%\images\10_off.jpg
Gui, Calculator: Add, Picture, w30 h28 x170 y170 v20_off gPR20, %A_ScriptDir%\images\20_off.jpg
Gui, Calculator: Add, Picture, w30 h28 x205 y170 v30_off gPR30, %A_ScriptDir%\images\30_off.jpg
Gui, Calculator: Add, Picture, w30 h28 x135 y200 v40_off gPR40, %A_ScriptDir%\images\40_off.jpg
Gui, Calculator: Add, Picture, w30 h28 x170 y200 v50_off gPR50, %A_ScriptDir%\images\50_off.jpg
Gui, Calculator: Font, S10 Norm, Arial Bold
Gui, Calculator: Add, Edit, w20 h19 x210 y203 Limit2 Number vOther_off,
Gui, Calculator: Add, Picture, w30 h45 x205 y198 vother_off_icon gPROff, %A_ScriptDir%\images\other_off.jpg
Gui, Calculator: Add, Text, w200 h30 x45 y335 cRed vPRBOMsg BackgroundTrans,
Gui, Calculator: Font, S20 Norm, Arial Bold
Gui, Calculator: Add, Text, w150 h40 x120 y245 vPRBOResult cWhite BackgroundTrans, $0.00
Gui, Calculator: Add, Text, w44 h23 x116 y296 vPRBOSubmit gPRBOMath BackgroundTrans,
Gui, Calculator: Font, S12 Norm, Arial Bold Italic
Gui, Calculator: Show, x%Xpos% y%yPos% w%GuiWidth% h%GuiHeight%, Returns Calculator
Gui, Opening:destroy
Return

UPSTool:
WinGetPos, Xpos, Ypos	

Gui, UPS: New
Gui, UPS: Color, DFDDDA
Gui, UPS: Add, Picture, w200 h33 x22 y15 vLogo gOpening, %A_ScriptDir%\images\logo.jpg
;Gui, UPS: Add, Picture, w20 h20 x920 y20 vMenu, %A_ScriptDir%\images\menu.jpg
Gui, UPS: Add, Picture, w121 h482 x25 y65 vChoiceMenu, %A_ScriptDir%\images\UPS_all.jpg
Gui, UPS: Add, Picture, w540 h40 x170 y65 vUPS_customer_info BackgroundTrans, %A_ScriptDir%\images\UPS_customer_info_1.jpg
Gui, UPS: Add, Picture, w540 h40 x170 y355 vUPS_package_info, %A_ScriptDir%\images\UPS_package_info_1.jpg
Gui, UPS: Add, Text, w115 h117 x45 y70 vChoice1 gSingleLabel BackgroundTrans,
Gui, UPS: Add, Text, w115 h117 x45 y190 vChoice2 gMultiLabel BackgroundTrans,
Gui, UPS: Add, Text, w115 h117 x45 y310 vChoice3 gSinglePickup BackgroundTrans,
Gui, UPS: Add, Text, w115 h117 x45 y430 vChoice4 gMultiPickup BackgroundTrans,

Gui, UPS: Add, Picture, w300 h40 x170 y105 vNameTitle, %A_ScriptDir%\images\UPS_name.jpg
Gui, UPS: Add, Picture, w300 h40 x495 y106 vPhoneTitle, %A_ScriptDir%\images\UPS_phone.jpg
Gui, UPS: Add, Picture, w300 h40 x173 y176 vAddressLine1Title, %A_ScriptDir%\images\UPS_addy_1.jpg
Gui, UPS: Add, Picture, w300 h40 x448 y176 vAddressLine2Title, %A_ScriptDir%\images\UPS_addy_2.jpg
Gui, UPS: Add, Picture, w300 h40 x173 y246 vCityNameTitle, %A_ScriptDir%\images\UPS_city.jpg
Gui, UPS: Add, Picture, w300 h40 x398 y246 vZipcodeTitle, %A_ScriptDir%\images\UPS_zipcode.jpg
Gui, UPS: Add, Picture, w300 h40 x573 y246 vAddTypeTitle, %A_ScriptDir%\images\UPS_addy_type.jpg
Gui, UPS: Add, Picture, w134 h18 x573 y353 vNumOfPackagesTitle, %A_ScriptDir%\images\UPS_number_of_packages_titl.jpg
GuiControl, Hide, NumOfPackagesTitle

Gui, UPS: Font, S12 Norm, Arial Bold
Gui, UPS: Add, Edit, w300 h30 x175 y145 vName Limit35 -vscroll,
Gui, UPS: Add, Edit, w200 h30 x500 y145 vPhone Limit15 -vscroll,
Gui, UPS: Add, Edit, w250 h30 x175 y215 vAddressLine1 Limit35 -vscroll,
Gui, UPS: Add, Edit, w250 h30 x450 y215 vAddressLine2 Limit35 -vscroll,
Gui, UPS: Add, Edit, w200 h30 x175 y285 vCityName Limit35 -vscroll,
Gui, UPS: Add, Edit, w150 h30 x400 y285 vZipCode Limit5 Number -vscroll,
Gui, UPS: Add, DropDownList, w125 h120 x575 y285 vAddType, Residential||Business



Gui, UPS: Add, Picture, w300 h40 x250 y395 vServiceTitle, %A_ScriptDir%\images\UPS_service.jpg

Gui, UPS: Add, Picture, w300 h40 x475 y395 vOrderNumberTitle, %A_ScriptDir%\images\UPS_order_number.jpg
Gui, UPS: Add, Picture, w300 h40 x250 y465 vMerchDescriptionTitle, %A_ScriptDir%\images\UPS_merch.jpg

Gui, UPS: Font, S10 Norm, Arial Bold
Gui, UPS: Add, DropDownList, w175 h150 x250 y435 vService, UPS Ground Service||UPS Next Day Air|UPS 3 Day Select
Gui, UPS: Font, S12 Norm, Arial Bold
Gui, UPS: Add, Edit, w120 h30 x475 y435 vOrderNumber Limit9 Number, %OrderNumber%
Gui, UPS: Add, Edit, w200 h30 x250 y505 vMerchDescription Limit35 -vscroll,
Gui, UPS: Add, Edit, w95 h30 x500 y505 vWeight Limit3 Number,

Gui, UPS: Add, Edit, w90 h30 x175 y515 vWeight1 Limit3 Number,
Gui, UPS: Add, Edit, w90 h30 x285 y515 vWeight2 Limit3 Number,
Gui, UPS: Add, Edit, w90 h30 x395 y515 vWeight3 Limit3 Number,
Gui, UPS: Add, Edit, w90 h30 x505 y515 vWeight4 Limit3 Number,
Gui, UPS: Add, Edit, w90 h30 x615 y515 vWeight5 Limit3 Number,


Gui, UPS: Add, Picture, w56 h21 x190 y485 vWeight1Title, %A_ScriptDir%\images\UPS_weight1.jpg
Gui, UPS: Add, Picture, w56 h21 x300 y485 vWeight2Title, %A_ScriptDir%\images\UPS_weight2.jpg
Gui, UPS: Add, Picture, w56 h21 x410 y485 vWeight3Title, %A_ScriptDir%\images\UPS_weight3.jpg
Gui, UPS: Add, Picture, w56 h21 x520 y485 vWeight4Title, %A_ScriptDir%\images\UPS_weight4.jpg
Gui, UPS: Add, Picture, w56 h21 x630 y485 vWeight5Title, %A_ScriptDir%\images\UPS_weight5.jpg

Gui, UPS: Add, Picture, w90 h28 x618 y378 vUPS_package_numbers cWhite BackgroundTrans,
Gui, UPS: Font, S10 Norm, Arial Bold
Gui, UPS: Add, DropDownList, w100 h150 x600 y380 vNumOfPackages gNumPackages, Select One||2|3|4|5
GuiControl, Hide, NumOfPackages
Gui, UPS: Font, S12 Norm, Arial Bold
Gui, UPS: Add, Picture, w200 h485 x740 y65 vUPS_status, %A_ScriptDir%\images\UPS_status.jpg

Gui, UPS: Add, Picture, w72 h40 x500 y465 vWeightTitle, %A_ScriptDir%\images\UPS_weight.jpg

Gui, UPS: Add, Picture, w200 h50 x740 y95 vUPS_return_reno BackgroundTrans, %A_ScriptDir%\images\UPS_return_reno.jpg
Gui, UPS: Add, Picture, w200 h50 x740 y95 vUPS_return_cville BackgroundTrans, %A_ScriptDir%\images\UPS_return_cville.jpg
Gui, UPS: Add, Picture, w200 h50 x740 y95 vUPS_zipcode_not_found BackgroundTrans, %A_ScriptDir%\images\UPS_zipcode_not_found.jpg

Gui, UPS: Add, Picture, w200 h50 x740 y125 vUPS_required_incomplete BackgroundTrans, %A_ScriptDir%\images\UPS_fields_incomplete.jpg
Gui, UPS: Add, Picture, w200 h50 x740 y125 vUPS_required_complete BackgroundTrans, %A_ScriptDir%\images\UPS_fields_complete.jpg

Gui, UPS: Add, Picture, w200 h50 x740 vUPS_label_created BackgroundTrans, %A_ScriptDir%\images\UPS_label_created.jpg
Gui, UPS: Add, Picture, w200 h50 x740 vUPS_weight_missing BackgroundTrans, %A_ScriptDir%\images\UPS_weight_missing.jpg
Gui, UPS: Add, Picture, w200 h50 x740 vUPS_order_number_missing BackgroundTrans, %A_ScriptDir%\images\UPS_order_number_missing.jpg
Gui, UPS: Add, Picture, w200 h50 x740 vUPS_merchandise_missing BackgroundTrans, %A_ScriptDir%\images\UPS_merchandise_missing.jpg
Gui, UPS: Add, Picture, w200 h50 x740 vUPS_city_missing BackgroundTrans, %A_ScriptDir%\images\UPS_city_missing.jpg
Gui, UPS: Add, Picture, w200 h50 x740 vUPS_customer_name_missing BackgroundTrans, %A_ScriptDir%\images\UPS_customer_name_missing.jpg
Gui, UPS: Add, Picture, w200 h50 x740 vUPS_address_missing BackgroundTrans, %A_ScriptDir%\images\UPS_address_missing.jpg
Gui, UPS: Add, Picture, w200 h50 x740 vUPS_zipcode_missing BackgroundTrans, %A_ScriptDir%\images\UPS_zipcode_missing.jpg
Gui, UPS: Add, Picture, w200 h50 x740 vUPS_weight_exceeded BackgroundTrans, %A_ScriptDir%\images\UPS_weight_exceeded.jpg
Gui, UPS: Add, Picture, w200 h25 x740 vUPS_campusship_connected BackgroundTrans, %A_ScriptDir%\images\UPS_campusship_connected.jpg
Gui, UPS: Add, Picture, w200 h50 x740 vUPS_return_info BackgroundTrans, %A_ScriptDir%\images\UPS_return_info.jpg
Gui, UPS: Add, Picture, w175 h22 x750 vUPS_tracking_label_1 BackgroundTrans, %A_ScriptDir%\images\UPS_tracking_label.jpg
Gui, UPS: Add, Picture, w175 h22 x750 vUPS_tracking_label_2 BackgroundTrans, %A_ScriptDir%\images\UPS_tracking_label.jpg
Gui, UPS: Add, Picture, w175 h22 x750 vUPS_tracking_label_3 BackgroundTrans, %A_ScriptDir%\images\UPS_tracking_label.jpg
Gui, UPS: Add, Picture, w175 h22 x750 vUPS_tracking_label_4 BackgroundTrans, %A_ScriptDir%\images\UPS_tracking_label.jpg
Gui, UPS: Add, Picture, w175 h22 x750 vUPS_tracking_label_5 BackgroundTrans, %A_ScriptDir%\images\UPS_tracking_label.jpg
Gui, UPS: Add, Picture, w115 h25 x780 vUPS_tracking_pickup_1 BackgroundTrans, %A_ScriptDir%\images\UPS_tracking_pickup.jpg
Gui, UPS: Add, Picture, w115 h25 x780 vUPS_tracking_pickup_2 BackgroundTrans, %A_ScriptDir%\images\UPS_tracking_pickup.jpg
Gui, UPS: Add, Picture, w115 h25 x780 vUPS_tracking_pickup_3 BackgroundTrans, %A_ScriptDir%\images\UPS_tracking_pickup.jpg
Gui, UPS: Add, Picture, w115 h25 x780 vUPS_tracking_pickup_4 BackgroundTrans, %A_ScriptDir%\images\UPS_tracking_pickup.jpg
Gui, UPS: Add, Picture, w115 h25 x780 vUPS_tracking_pickup_5 BackgroundTrans, %A_ScriptDir%\images\UPS_tracking_pickup.jpg
Gui, UPS: Add, Picture, w200 h200 x740 vUPS_zipcode_not_found_msg BackgroundTrans, %A_ScriptDir%\images\UPS_zipcode_not_found_msg.jpg
Gui, UPS: Add, Picture, w190 h190 x745 vUPS_return_error BackgroundTrans, %A_ScriptDir%\images\UPS_return_error.jpg
Gui, UPS: Add, Picture, w190 h190 x745 vUPS_campusship_error BackgroundTrans, %A_ScriptDir%\images\UPS_campusship_error.jpg
Gui, UPS: Add, Picture, w190 h190 x745 vUPS_IE_launch_error BackgroundTrans, %A_ScriptDir%\images\UPS_IE_launch_error.jpg
Gui, UPS: Add, Picture, w190 h190 x745 vUPS_different_city_zip BackgroundTrans, %A_ScriptDir%\images\UPS_different_city_zip.jpg
Gui, UPS: Add, Picture, w190 h190 x745 vUPS_elabel_error BackgroundTrans, %A_ScriptDir%\images\UPS_elabel_error.jpg

Gui, UPS: Font, S10 Norm, Arial Bold
Gui, UPS: Add, DropDownList, w150 h200 x765 vZipState, Select a State||Alaska|Alabama|Arkansas|Arizona|California|Colorado|Connecticut|District of Columbia|Delaware|Florida|Georgia|Hawaii|Iowa|Idaho|Illinois|Indiana|Kansas|Kentucky|Louisiana|Massachusetts|Maryland|Maine|Michigan|Minnesota|Missouri|Mississippi|Montana|North Carolina|North Dakota|Nebraska|New Hampshire|New Jersey|New Mexico|Nevada|New York|Ohio|Oklahoma|Oregon|Pennsylvania|Rhode Island|South Carolina|South Dakota|Tennessee|Texas|Utah|Virginia|Vermont|Rhode Island|Washington|Wisconsin|West Virginia|Wyoming 

Gui, UPS: Font, S8 Norm, Arial Bold
Gui, UPS: Add, Text, w85 h22 x760 vCopyTrack1 gCopyTrack1 BackgroundTrans, 
Gui, UPS: Add, Text, w85 h22 x760 vCopyTrack2 gCopyTrack2 BackgroundTrans, 
Gui, UPS: Add, Text, w85 h22 x760 vCopyTrack3 gCopyTrack3 BackgroundTrans, 
Gui, UPS: Add, Text, w85 h22 x760 vCopyTrack4 gCopyTrack4 BackgroundTrans, 
Gui, UPS: Add, Text, w85 h22 x760 vCopyTrack5 gCopyTrack5 BackgroundTrans, 

Gui, UPS: Add, Text, w85 h22 x835 vCopyLabel1 gCopyLabel1 BackgroundTrans,
Gui, UPS: Add, Text, w85 h22 x835 vCopyLabel2 gCopyLabel2 BackgroundTrans,
Gui, UPS: Add, Text, w85 h22 x835 vCopyLabel3 gCopyLabel3 BackgroundTrans,
Gui, UPS: Add, Text, w85 h22 x835 vCopyLabel4 gCopyLabel4 BackgroundTrans,
Gui, UPS: Add, Text, w85 h22 x835 vCopyLabel5 gCopyLabel5 BackgroundTrans,

Gui, UPS: Font, S8 Norm, Arial Bold
Gui, UPS: Add, Text, w140 h50 x760 vTracking1 BackgroundTrans cGreen, 
Gui, UPS: Add, Text, w140 h50 x760 vTracking2 BackgroundTrans cGreen,
Gui, UPS: Add, Text, w140 h50 x760 vTracking3 BackgroundTrans cGreen,
Gui, UPS: Add, Text, w140 h50 x760 vTracking4 BackgroundTrans cGreen,
Gui, UPS: Add, Text, w140 h50 x760 vTracking5 BackgroundTrans cGreen,

HideList = CopyTrack1,CopyTrack2,CopyTrack3,CopyTrack4,CopyTrack5,CopyLabel1,CopyLabel2,CopyLabel3,CopyLabel4,CopyLabel5,Tracking1,Tracking2,Tracking3,Tracking4,Tracking5,UPS_required_complete,UPS_required_incomplete,UPS_label_created,UPS_begin_message,UPS_return_reno,UPS_return_cville,UPS_zipcode_not_found,UPS_weight_missing,UPS_order_number_missing,UPS_merchandise_missing,UPS_city_missing,UPS_customer_name_missing,UPS_address_missing,UPS_campusship_connected,UPS_return_info,UPS_tracking_label_1,UPS_tracking_label_2,UPS_tracking_label_3,UPS_tracking_label_4,UPS_tracking_label_5,UPS_tracking_pickup_1,UPS_tracking_pickup_2,UPS_tracking_pickup_3,UPS_tracking_pickup_4,UPS_tracking_pickup_5,UPS_zipcode_not_found_msg,UPS_return_error,UPS_campusship_error,UPS_IE_launch_error,UPS_different_city_zip,UPS_elabel_error,Weight1,Weight2,Weight3,Weight4,Weight5,Weight1Title,Weight2Title,Weight3Title,Weight4Title,Weight5Title,ZipState

Loop, parse, HideList, `,
GuiControl, Hide, %A_LoopField%

HideList=

Gui, UPS: Add, Picture, w200 h40 x740 y570 vUPS_start_return gStartReturn BackgroundTrans, %A_ScriptDir%\images\UPS_start_return.jpg

Gui, UPS: Add, Picture, w110 h40 x30 y570 vUPS_exit BackgroundTrans, %A_ScriptDir%\images\UPS_exit.jpg
GUi, UPS: Add, Text, w110 h40 x30 y570 cRed BackgroundTrans gOpening,

Gui, UPS: Add, Picture, w30 h30 x672 y90 vUPS_paste BackgroundTrans, %A_ScriptDir%\images\UPS_paste.jpg
Gui, UPS: Add, Text, w30 h30 x672 y90 vUPS_paste_button gRunAddy BackgroundTrans,

Gui, UPS: Show, x%XPos% y%Ypos% w%GuiWidth% h%GuiHeight%, UPS Tool
Gui, Opening:destroy
Return

StartReturn:

GuiControl, disable, UPS_start_return
Gui, Submit, NoHide

HideList = UPS_required_complete,UPS_required_incomplete,UPS_label_created,UPS_begin_message,UPS_return_reno,UPS_return_cville,UPS_zipcode_not_found,UPS_weight_missing,UPS_order_number_missing,UPS_merchandise_missing,UPS_city_missing,UPS_customer_name_missing,UPS_address_missing,UPS_campusship_connected,UPS_return_info,UPS_tracking_label_1,UPS_tracking_label_2,UPS_tracking_label_3,UPS_tracking_label_4,UPS_tracking_label_5,UPS_tracking_pickup_1,UPS_tracking_pickup_2,UPS_tracking_pickup_3,UPS_tracking_pickup_4,UPS_tracking_pickup_5,UPS_zipcode_not_found_msg


Loop, parse, HideList, `,
GuiControl, Hide, %A_LoopField%

HideList=

; Begin checking for empty fields.

yPos = 95

if (!Name)
{
GuiControl, Move, UPS_customer_name_missing, y%Ypos%
GuiControl, MoveDraw, UPS_customer_name_missing 
GuiControl, Show, UPS_customer_name_missing
Ypos := Ypos + 50
emptyfield = yes
}

if (!AddressLine1)
{
GuiControl, Move, UPS_address_missing, y%Ypos%
GuiControl, MoveDraw, UPS_address_missing
GuiControl, Show, UPS_address_missing
Ypos := Ypos + 50
emptyfield = yes
}


if (!CityName)
{
GuiControl, Move, UPS_city_missing, y%Ypos%
GuiControl, MoveDraw, UPS_city_missing
GuiControl, Show, UPS_city_missing
Ypos := Ypos + 50
emptyfield = yes
}

if (!ZipCode)
{
GuiControl, Move, UPS_zipcode_missing, y%Ypos%
GuiControl, MoveDraw, UPS_zipcode_missing
GuiControl, Show, UPS_zipcode_missing
Ypos := Ypos + 50
emptyfield = yes
}

if (!OrderNumber)
{
GuiControl, Move, UPS_order_number_missing, y%Ypos%
GuiControl, MoveDraw, UPS_order_number_missing
GuiControl, Show, UPS_order_number_missing
Ypos := Ypos + 50
emptyfield = yes
}

if (!MerchDescription)
{
GuiControl, Move, UPS_merchandise_missing, y%Ypos%
GuiControl, MoveDraw, UPS_merchandise_missing
GuiControl, Show, UPS_merchandise_missing
Ypos := Ypos + 50
emptyfield = yes
}

if (NumOfPackages != "Select One") ; Multi-pickup or multi-label
{
LoopWeight := NumOfPackages

	Loop, %LoopWeight%
	{
		if (!Weight%A_Index%)
		{
		GuiControl, Move, UPS_weight_missing, y%Ypos%
		GuiControl, MoveDraw, UPS_weight_missing, y%Ypos%
		GuiControl, enable, UPS_start_return
		Return
		}
	}
}
else if (!Weight)
{
GuiControl, Move, UPS_weight_missing, y%Ypos%
GuiControl, MoveDraw, UPS_weight_missing
GuiControl, Show, UPS_weight_missing
Ypos := Ypos + 50
emptyfield = yes
}


if (emptyfield = "yes")
{
GuiControl, enable, StartReturn
emptyfield=
Return
}
else
{
GuiControl, Move, UPS_required_complete, y%Ypos%
GuiControl, MoveDraw, UPS_required_complete
GuiControl, Show, UPS_required_complete
}

; End checking for empty fields.
; Begin validating fields.

#Warn All, Off  

#Include %A_ScriptDir%\zip_checker.ahk

yPos = 145

if (Weight > 150)
{
GuiControl, Move, UPS_weight_exceeded, y%Ypos%
GuiControl, MoveDraw, UPS_weight_exceeded
GuiControl, Show, UPS_weight_missing
Ypos := Ypos + 50
notvalid = yes
}

if (!theState)
{
	if (!zipOverride)
	{
	GuiControl, Move, UPS_zipcode_not_found, y%Ypos%
	GuiControl, MoveDraw, UPS_zipcode_not_found
	GuiControl, Show, UPS_zipcode_not_found

	yPos := Ypos + 30

	GuiControl, Move, UPS_zipcode_not_found_msg, y%Ypos%
	GuiControl, MoveDraw, UPS_zipcode_not_found_msg
	GuiControl, Show, UPS_zipcode_not_found_msg

	yPos := Ypos + 190

	GuiControl, Move, ZipState, y%Ypos%
	GuiControl, MoveDraw, ZipState
	GuiControl, Show, ZipState
	GuiControl, Enable, UPS_start_return
	zipOverride = yes
	Return
	}
	else
	{
		GuiControl, Hide, ZipState
		if (zipState = "Alaska")
		{
		loginname = sales_service
		theState = 2
		}
		else if (zipState = "Alabama")
		{
		loginname = sales_service
		theState = 1
		}
		else if (zipState = "Arkansas")
		{
		loginname = sales_service
		theState = 4
		}
		else if (zipState = "Arizona")
		{
		loginname = sales_service
		theState = 3
		}
		else if (zipState = "California")
		{
		loginname = sales_service
		theState = 5
		}
		else if (zipState = "Colorado")
		{
		loginname = sales_service
		theState = 6
		}
		else if (zipState = "Connecticut")
		{
		loginname = sales_service
		theState = 7
		}
		else if (zipState = "District of Columbia")
		{
		loginname = sales_service
		theState = 9
		}
		else if (zipState = "Delaware")
		{
		loginname = sales_service
		theState = 8
		}
		else if (zipState = "Florida")
		{
		loginname = sales_service
		theState = 10
		}
		else if (zipState = "Georgia")
		{
		loginname = sales_service
		theState = 11
		}
		else if (zipState = "Hawaii")
		{
		loginname = sales_service
		theState = 12
		}
		else if (zipState = "Iowa")
		{
		loginname = sales_service
		theState = 16
		}
		else if (zipState = "Idaho")
		{
		loginname = sales_service
		theState = 13
		}
		else if (zipState = "Illinois")
		{
		loginname = sales_service
		theState = 14
		}
		else if (zipState = "Indiana")
		{
		loginname = sales_service
		theState = 15
		}
		else if (zipState = "Kansas")
		{
		loginname = sales_service
		theState = 17
		}
		else if (zipState = "Kentucky")
		{
		loginname = sales_service
		theState = 18
		}
		else if (zipState = "Louisiana")
		{
		loginname = sales_service
		theState = 19
		}
		else if (zipState = "Massachusetts")
		{
		loginname = sales_service
		theState = 22
		}
		else if (zipState = "Maryland")
		{
		loginname = sales_service
		theState = 21
		}
		else if (zipState = "Maine")
		{
		loginname = sales_service
		theState = 20
		}
		else if (zipState = "Michigan")
		{
		loginname = sales_service
		theState = 23
		}
		else if (zipState = "Minnesota")
		{
		loginname = sales_service
		theState = 24
		}
		else if (zipState = "Missouri")
		{
		loginname = sales_service
		theState = 26
		}
		else if (zipState = "Mississippi")
		{
		loginname = sales_service
		theState = 25
		}
		else if (zipState = "Montana")
		{
		loginname = sales_service
		theState = 27
		}
		else if (zipState = "North Carolina")
		{
		loginname = sales_service
		theState = 34
		}
		else if (zipState = "North Dakota")
		{
		loginname = sales_service
		theState = 35
		}
		else if (zipState = "Nebraska")
		{
		loginname = sales_service
		theState = 28
		}
		else if (zipState = "New Hampshire")
		{
		loginname = sales_service
		theState = 30
		}
		else if (zipState = "New Jersey")
		{
		loginname = sales_service
		theState = 31
		}
		else if (zipState = "New Mexico")
		{
		loginname = sales_service
		theState = 32
		}
		else if (zipState = "Nevada")
		{
		loginname = sales_service
		theState = 29
		}
		else if (zipState = "New York")
		{
		loginname = sales_service
		theState = 33
		}
		else if (zipState = "Ohio")
		{
		loginname = sales_service
		theState = 36
		}
		else if (zipState = "Oklahoma")
		{
		loginname = sales_service
		theState = 37
		}
		else if (zipState = "Oregon")
		{
		loginname = sales_service
		theState = 38
		}
		else if (zipState = "Pennsylvania")
		{
		loginname = sales_service
		theState = 39
		}
		else if (zipState = "Rhode Island")
		{
		loginname = sales_service
		theState = 40
		}
		else if (zipState = "South Carolina")
		{
		loginname = sales_service
		theState = 41
		}
		else if (zipState = "South Dakota")
		{
		loginname = sales_service
		theState = 42
		}
		else if (zipState = "Tennessee")
		{
		loginname = sales_service
		theState = 43
		}
		else if (zipState = "Texas")
		{
		loginname = sales_service
		theState = 44
		}
		else if (zipState = "Utah")
		{
		loginname = sales_service
		theState = 45
		}
		else if (zipState = "Virginia")
		{
		loginname = sales_service
		theState = 47
		}
		else if (zipState = "Vermont")
		{
		loginname = sales_service
		theState = 46
		}
		else if (zipState = "Washington")
		{
		loginname = sales_service
		theState = 48
		}
		else if (zipState = "Wisconsin")
		{
		loginname = sales_service
		theState = 50
		}
		else if (zipState = "West Virginia")
		{
		loginname = sales_service
		theState = 49
		}
		else if (zipState = "Wyoming")
		{
		loginname = sales_service
		theState = 51
		}
	}

}
else
{
	if (loginname = "sales_service")
	{
	GuiControl, Move, UPS_return_cville, y%Ypos%
	GuiControl, MoveDraw, UPS_return_cville
	GuiControl, Show, UPS_return_cville
	}
	else if (loginname = "sales_service")
	{
	GuiControl, Move, UPS_return_cville, y%Ypos%
	GuiControl, MoveDraw, UPS_return_cville
	GuiControl, Show, UPS_return_cville
	}	
}


if (notvalid = "yes")
{
GuiControl, enable, StartReturn
notvalid=
Return
}


if (service = "UPS Ground Service")
serviceType = 5
else if (Service = "UPS Next Day Air")
serviceType = 2
else if (Service = "UPS 3 Day Select")
serviceType = 4

if (loginname = "sales_service")
GuiControl, Show, UPS_return_cville
else if (loginName = "sales_service")
GuiControl, Show, UPS_return_cville
else
GuiControl, Show, UPS_zipcode_not_found
GuiControl, Show, UPS_required_complete

myCounting = 1

GuiControl, Hide, UPS_start_return
processing = 1

if (NumOfPackages = "Select One")
NumOfPackages = 1

gosub, Login
Return

Login:

yPos = 195
GuiControl, Move, UPS_campusship_connected, y%Ypos%
GuiControl, MoveDraw, UPS_campusship_connected
GuiControl, Show, UPS_campusship_connected

try
	wb := ComObjCreate("InternetExplorer.Application")  ; Create an IE object
	
	wb.Visible := false

	
	try
	{
		goURL = https://www.ups.com/one-to-one/logout?returnto=https`%3A`%2F`%2Fwww.campusship.ups.com

	URLToVar(goURL)
	}
	

	wb.Navigate("https://www.ups.com/one-to-one/logout?returnto=https%3A%2F%2Fwww.campusship.ups.com")
	
	
	While	wb.readyState != 4 || wb.document.readyState != "complete" || wb.busy
	sleep 1000
	
	gosub, Pass
	Return

	Pass:
	
		wb.document.forms[0].elements[0].value := loginname
		wb.document.forms[0].elements[1].value := "Blanks12"
	
		WinGetTitle, thisTitle, ahk_class IEFrame
		wb.document.forms[0].login.click()

	While	wb.readyState != 4 || wb.document.readyState != "complete" || wb.busy
	sleep 1000

	gosub, BeginReturn
	Return
	
	BeginReturn:
	
	;*errorResult := 3 * NumberOfPackages
	
	if (numError > errorResult)
	{
	GuiControl, Hide, UPS_campusship_connected
	yPos = 195
	GuiControl, Move, UPS_return_error, y%Ypos%
	GuiControl, MoveDraw, UPS_return_error
	GuiControl, Show, UPS_return_error
	wb.quit
	wb:=""
	Return
	}
	
	
	wb.Navigate("https://www.campusship.ups.com/cship/create?ActionOriginPair=CreateAReturn___StartSession")
	
	While	wb.readyState != 4 || wb.document.readyState != "complete" || wb.busy
	sleep 1000	
	
	
	goSub, EvalReturnTo
	Return
	
	EvalReturnTo:

			if (sampleReturn = "yes")
			{
			serviceType = 5
			; Sending back the sample to the FFX or Reno office instead of IHP for inspection.

				if loginname = sales_service
				{
				; Send back to Reno

				wb.document.getElementById("shipToEdit").click()
					
					While	wb.readyState != 4 || wb.document.readyState != "complete" || wb.busy
					sleep 1000	
					try
					{	
						If InStr(wb.document.body.innerHTML, "Edit Return To Address")
						{
						; We're in the right spot.
						}
						else
						{
						gosub, BeginReturn
						Return
						}
					}
					
					; updating Return to address fields if we're returning from West Coast.
					
					wb.document.getElementById("shipToNameValue").value := "Kinsey Brown CustomInk"
					wb.document.getElementById("shipToStreetValue").value := "9390 Gateway Dr. Ste 150"
					wb.document.getElementById("shipToCityValue").value := "RENO"
					wb.document.getElementById("shipToPostalValue").value := "89521"
					wb.document.getElementById("returnFromStateValue").selectedIndex := 29
					;wb.document.getElementById("shipToPhoneValue").value := "8664858160"
					wb.document.getElementById("shipToEmailValue").value := "service@customink.com"
					;wb.document.getElementById("shipToSaveOption").selectedIndex := 5
					;wb.document.getElementsByName("next").click()
					sleep 2000
					while ( x:= wb.document.getElementsByTagName("input") ){
						if ( x[a_Index-1].value == "Update" ){
						x[a_Index-1].click() ;//Could also try x[a_index-1].submit()
						break
						}
					}
					
				}
				else if loginname = sales_service
				{
				; Send back to FFX

				wb.document.getElementById("shipToEdit").click()
				While	wb.readyState != 4 || wb.document.readyState != "complete" || wb.busy
					sleep 1000	
					
					try
					{	
						If InStr(wb.document.body.innerHTML, "Edit Return To Address")
						{
						; We're in the right spot.
						}
						else
						{
						gosub, BeginReturn
						Return
						}
					}
					
					; updating Return to address fields if we're returning from West Coast.
					
					wb.document.getElementById("shipToNameValue").value := "Keshaun Blunt"
					wb.document.getElementById("shipToStreetValue").value := "2910 District Ave 3rd Floor"
					wb.document.getElementById("shipToCityValue").value := "FAIRFAX"
					wb.document.getElementById("shipToPostalValue").value := "22031"
					wb.document.getElementById("returnFromStateValue").selectedIndex := 47
					;wb.document.getElementById("shipToPhoneValue").value := "8664858160"
					wb.document.getElementById("shipToEmailValue").value := "service@customink.com"
					;wb.document.getElementById("shipToSaveOption").selectedIndex := 5
					;wb.document.getElementsByName("next").click()
					while ( x:= wb.document.getElementsByTagName("input") ){
						if ( x[a_Index-1].value == "Update" ){
						x[a_Index-1].click() ;//Could also try x[a_index-1].submit()
						break
						}
					}
				}
			}
			else
			{

				if loginname = sales_service
				{

					wb.document.getElementById("shipToEdit").click()
					While	wb.readyState != 4 || wb.document.readyState != "complete" || wb.busy
					sleep 1000	
					
					try
					{	
						If InStr(wb.document.body.innerHTML, "Edit Return To Address")
						{
						; We're in the right spot.
						}
						else
						{
						gosub, BeginReturn
						Return
						}
					}
					
					; updating Return to address fields if we're returning from West Coast - Updated to East Coast as of 7/8
					
				
					wb.document.getElementsByTagName("input")[42].value := "CustomInk" ; shipToNameValue
					wb.document.getElementsByTagName("input")[43].value := "CustomInk Returns" ; shipToContactNameValue
					wb.document.getElementsByTagName("input")[44].value := "1180 Seminole Trail" ; shipToStreetValue
					wb.document.getElementsByTagName("input")[45].value := "Ste 480" ; shipToAddr2Value
					wb.document.getElementsByTagName("input")[46].value := ""
					wb.document.getElementsByTagName("input")[47].value := "CHARLOTTESVILLE" ; shipToCityValue
					wb.document.getElementsByTagName("input")[48].value := "229015713" ; shipToPostalValue
					wb.document.getElementsByTagName("select"[2]).selectedIndex := 47
					;wb.document.getElementById("shipToPhoneValue").value := "8664858160"
					wb.document.getElementsByTagName("input")[51].value := "service@customink.com" ; shipToEmailValue
					;wb.document.getElementsByTagName("select")[3].selectedIndex := 5
					;wb.document.getElementsByName("next").click()
					while ( x:= wb.document.getElementsByTagName("input") ){
						if ( x[a_Index-1].value == "Update" ){
						x[a_Index-1].click() ;//Could also try x[a_index-1].submit()
						break
						}
					}
					
					;sleep 5000
					
				}
				else if loginname = sales_service
				{

					wb.document.getElementById("shipToEdit").click()
					While	wb.readyState != 4 || wb.document.readyState != "complete" || wb.busy
					sleep 1000	
					
					try
					{	
						If InStr(wb.document.body.innerHTML, "Edit Return To Address")
						{
						; we're in the right spot.
						}
						else
						{
						gosub, BeginReturn
						Return
						}
					}
					
					; updating Return to address fields if we're returning from East Coast.
					
					wb.document.getElementsByTagName("input")[42].value := "CustomInk" ; shipToNameValue
					wb.document.getElementsByTagName("input")[43].value := "CustomInk Returns" ; shipToContactNameValue
					wb.document.getElementsByTagName("input")[44].value := "1180 Seminole Trail" ; shipToStreetValue
					wb.document.getElementsByTagName("input")[45].value := "Ste 480" ; shipToAddr2Value
					wb.document.getElementsByTagName("input")[46].value := ""
					wb.document.getElementsByTagName("input")[47].value := "CHARLOTTESVILLE" ; shipToCityValue
					wb.document.getElementsByTagName("input")[48].value := "229015713" ; shipToPostalValue
					wb.document.getElementsByTagName("select"[2]).selectedIndex := 47
					;wb.document.getElementById("shipToPhoneValue").value := "8664858160"
					wb.document.getElementsByTagName("input")[51].value := "service@customink.com" ; shipToEmailValue
					;wb.document.getElementsByTagName("select")[3].selectedIndex := 5
					;wb.document.getElementsByName("next").click()
					while ( x:= wb.document.getElementsByTagName("input") ){
						if ( x[a_Index-1].value == "Update" ){
						x[a_Index-1].click() ;//Could also try x[a_index-1].submit()
						break
						}
					}

					
				}
			}
			


	;sleep 5000
	
	; 7211 next button 
	
While	wb.readyState != 4 || wb.document.readyState != "complete" || wb.busy
	sleep 1000
	
	
	wb.document.getElementById("enterNewAddressLink").click()
	While	wb.readyState != 4 || wb.document.readyState != "complete" || wb.busy
	sleep 1000
	
	gosub, AddInfo
	Return
		
	AddInfo:
	
		
	wb.document.getElementById("returnFromNameValue").value := Name 
	wb.document.getElementById("returnFromStreetValue").value := AddressLine1
	wb.document.getElementById("returnFromAddr2Value").value := TestVar3
	wb.document.getElementById("returnFromCityValue").value := CityName 
	wb.document.getElementById("returnFromStateValue").selectedIndex := theState

			if (ZipCode between 00000 and 09999)
			{
			FinalZip = %ZipCode%
			wb.document.getElementById("returnFromPostalValue").value := FinalZip
			}
			else
			{
			wb.document.getElementById("returnFromPostalValue").value := ZipCode
			}

	wb.document.getElementById("returnFromPhoneValue").value := Phone


	;if (AddType = "Residential")
	;{
	wb.document.getElementById("usprResidential").click()
	;}
	wb.document.getElementById("packagingType").selectedIndex := 6

		if (AttemptNum = 3)
		{
		wb.document.getElementById("returnService").selectedIndex := 4	
		}
		else if (AttemptNum = 1)
		{
		wb.document.getElementById("returnService").selectedIndex := 1	
		}
		else
		{
		wb.document.getElementById("returnService").selectedIndex := 3	
		}

	wb.document.getElementById("service").selectedIndex := serviceType
	
		if (NumOfPackages > 1)
		{
		Weight := Weight%myCounting%
		}
		
		wb.document.getElementById("packageBean.weight").value := Weight
		
		
		
		
		if (NumOfPackages > 1)
		{
		refString = %MerchDescription% (%myCounting% of %NumOfPackages%)
		wb.document.getElementById("packageBean_merchandiseDescription").value := refString
		}
		else
		{
		wb.document.getElementById("packageBean_merchandiseDescription").value := MerchDescription
		}
	wb.document.getElementById("reference_value1").value := OrderNumber
	wb.document.getElementById("reference_value2").value := showNick
	
	wb.document.getElementByID("reviewDetails").click()
	wb.document.getElementById("next").click()
	
While	wb.readyState != 4 || wb.document.readyState != "complete" || wb.busy
	sleep 1000
	
	; Checking to see if there is an address error.
	
	try
	{	
		If InStr(wb.document.body.innerHTML, "(UPS: 81040)")
		{
		
		GuiControl, Hide, UPS_campusship_connected
		yPos = 195
		GuiControl, Move, UPS_different_city_zip, y%Ypos%
		GuiControl, MoveDraw, UPS_different_city_zip
		GuiControl, Show, UPS_different_city_zip
		
		wb.quit
		wb:=""

		Return
		}
	}
	
	if (attemptNum = 1) || (attemptNum = 3)
	{
	While	wb.readyState != 4 || wb.document.readyState != "complete" || wb.busy
	sleep 1000
	gosub, Complete
	Return
	}

;wb.document.getElementsByName("electronicReturnLabelDetail.recipient#1.emailAddress").value := showEmail
;wb.document.forms[0].elements[8].value := showEmail
while ( x:= wb.document.getElementsByTagName("input") ){
						if ( x[a_Index-1].name == "electronicReturnLabelDetail.recipient#1.emailAddress" ){
						x[a_Index-1].value := showEmail ;//Could also try x[a_index-1].submit()
						break
						}
					}

tryThis = javascript:submitWithAOPair(document.mainPageForm,'Next','AdditionalReturnOptions','')`;

	wb.Navigate(tryThis)
	
						
While	wb.readyState != 4 || wb.document.readyState != "complete" || wb.busy
sleep 1000


Try
{
	If InStr(wb.document.body.innerHTML, "(UPS: 81163)")
	{
		GuiControl, Hide, UPS_campusship_connected
		yPos = 195
		GuiControl, Move, UPS_elabel_error, y%Ypos%
		GuiControl, MoveDraw, UPS_elabel_error
		GuiControl, Show, UPS_elabel_error
	wb.quit
	wb:=""
	
	Return
	}
}
	
	gosub, Complete
	Return
	
	Complete:
	
		try
		{
		theTrackInfo := wb.document.getElementsByTagName("dd")[0].innerText
		}
		
		if (runningTrackInfo = "")
		runningTrackInfo = %theTrackInfo%
		else
		runningTrackInfo = %runningTrackInfo%,%theTrackInfo%
		
			
		if (NumOfPackages > 1)
		{
			if (NumOfPackages = myCounting)
			{
			wb.quit
			wb:=""
			gosub, Finished
			Return
			}
			else
			{
			myCounting++
			wb.quit
			wb:=""
			gosub, Login
			Return
			}
		
		}

Finished:
		/*if (NumOfPackages > 1)
		{
			if ((AttemptNum = 1) || (AttemptNum = 3))
			{
			TrayTip, Return Pickups Scheduled, You have successfully scheduled %NumOfPackages% UPS Pickups., 10000
			}
			else
			{
			TrayTip, Return Shipping Labels Created, You have successfully created UPS Return shipping labels. The labels have been e-mailed to you., 10000
			}
		}
		else
		{
			if ((AttemptNum = 1) || (AttemptNum = 3))
			{
			TrayTip, Return Pickup Scheduled, You have successfully scheduled a UPS Pickup. The tracking number is now in your clipboard., 10000
			}
			else
			{
			TrayTip, Return Shipping Label Created, You have successfully created a UPS return shipping label. The label has been e-mailed to you. The tracking number is now in your clipboard., 10000
			}
		}
		*/
		
yPos = 200
GuiControl, Move, UPS_return_info, y%Ypos%
GuiControl, MoveDraw, UPS_return_info
GuiControl, Show, UPS_return_info

sleep 1000		
		
		if ((AttemptNum = 1) || (AttemptNum = 3))
method = pickup
else
method = label

;NumberOfPackages = 3
if (NumOfPackages = "Select One")
NumOfPackages = 1

row_height = 65

height := NumOfPackages * row_height
GuiWidth = 400

prefix = https://www.ups.com/uel/llp/

initialSH = 70
resultSH := initialSH + height

newSW := A_ScreenWidth - 405
newSH := A_ScreenHeight - resultSH

Gui, Finished:+AlwaysOnTop 0x12
Gui, Finished:Color, 36A6E0

label_y = 10 
data_y = 30

yPos = 250

if (method = "label")
{
	Loop, parse, runningTrackInfo, `,
	{
	CopyTrack%A_Index% = %A_LoopField%

	GuiControl,, Tracking%A_Index%, %A_LoopField%
	GuiControl, Move, Tracking%A_Index%, y%Ypos%
	GuiControl, MoveDraw, Tracking%A_Index%
	GuiControl, Show, Tracking%A_Index%
	
	yPos := yPos + 25
	
	GuiControl, Move, UPS_tracking_label_%A_Index%, y%yPos%
	GuiControl, MoveDraw, UPS_tracking_label_%A_Index%
	GuiControl, Show, UPS_tracking_label_%A_Index%
	
	GuiControl, Move, CopyTrack%A_Index%, y%Ypos%
	GuiControl, MoveDraw, CopyTrack%A_Index%
	GuiControl, Show, CopyTrack%A_Index%
	
	GuiControl, Move, CopyLabel%A_Index%, y%Ypos%
	GuiControl, MoveDraw, CopyLabel%A_Index%
	GuiControl, Show, CopyLabel%A_Index%
		
	yPos := yPos + 30
	}
}
else
{
Loop, parse, runningTrackInfo, `,
	{
	CopyTrack%A_Index% = %A_LoopField%

	GuiControl,, Tracking%A_Index%, %A_LoopField%
	GuiControl, Move, Tracking%A_Index%, y%Ypos% x785
	GuiControl, MoveDraw, Tracking%A_Index%
	GuiControl, Show, Tracking%A_Index%
	
	yPos := yPos + 25
	
	GuiControl, Move, UPS_tracking_pickup_%A_Index%, y%yPos%
	GuiControl, MoveDraw, UPS_tracking_pickup_%A_Index%
	GuiControl, Show, UPS_tracking_pickup_%A_Index%
	
	GuiControl, Move, CopyTrack%A_Index%, y%Ypos% x785
	GuiControl, MoveDraw, CopyTrack%A_Index%
	GuiControl, Show, CopyTrack%A_Index%
		
	yPos := yPos + 30
	}

}

wb.quit
wb:=""

Return

CopyTrack1:
clipboard = %CopyTrack1%
TrayTip, Tracking Number Copied, The tracking number has been copied to your clipboard.
SetTimer, RemoveTrayTip, 2000
Return

CopyLabel1:
clipboard = %prefix%%CopyTrack1%
TrayTip, Return Label Link Copied, The return label link has been copied to your clipboard.
SetTimer, RemoveTrayTip, 2000
Return

CopyTrack2:
clipboard = %CopyTrack2%
TrayTip, Tracking Number Copied, The tracking number has been copied to your clipboard.
SetTimer, RemoveTrayTip, 2000
Return

CopyLabel2:
clipboard = %prefix%%CopyTrack2%
TrayTip, Return Label Link Copied, The return label link has been copied to your clipboard.
SetTimer, RemoveTrayTip, 2000
Return

CopyTrack3:
clipboard = %CopyTrack3%
TrayTip, Tracking Number Copied, The tracking number has been copied to your clipboard.
SetTimer, RemoveTrayTip, 2000
Return

CopyLabel3:
clipboard = %prefix%%CopyTrack3%
TrayTip, Return Label Link Copied, The return label link has been copied to your clipboard.
SetTimer, RemoveTrayTip, 2000
Return

CopyTrack4:
clipboard = %CopyTrack4%
TrayTip, Tracking Number Copied, The tracking number has been copied to your clipboard.
SetTimer, RemoveTrayTip, 2000
Return

CopyLabel4:
clipboard = %prefix%%CopyTrack4%
TrayTip, Return Label Link Copied, The return label link has been copied to your clipboard.
SetTimer, RemoveTrayTip, 2000
Return

CopyTrack5:
clipboard = %CopyTrack5%
TrayTip, Tracking Number Copied, The tracking number has been copied to your clipboard.
SetTimer, RemoveTrayTip, 2000
Return

CopyLabel5:
clipboard = %prefix%%CopyTrack5%
TrayTip, Return Label Link Copied, The return label link has been copied to your clipboard.
SetTimer, RemoveTrayTip, 2000
Return

RemoveTrayTip:
SetTimer, RemoveTrayTip, Off
TrayTip
Return


RunAddy:
nameAddyString := clipboard

StringReplace, nameAddyString, nameAddyString, CUSTOMERS WAITING, CUSTOMERS WAITING, UseErrorLevel
if (ErrorLevel > 0)
{
StringReplace, nameAddyString, nameAddyString, %A_Space%%A_Space%%A_Space%%A_Space%,, All

nameAddyString = Starting`r`n%nameAddyString%
StringReplace, nameAddyString, nameAddyString, Help`r`n`r`n, ^, All

	Loop, parse, nameAddyString, ^
	{
	if (A_Index != 1)
	newString = %A_LoopField%

	nameAddyString := newString
	}
	
}
else
{
StringReplace, nameAddyString, nameAddyString, %A_Space%%A_Space%%A_Space%%A_Space%,, All
;StringReplace, nameAddyString, nameAddyString, `r`n`r`n,`r`n, All
}

StringReplace, nameAddyString, nameAddyString, `r`n`r`n, ^, All

StringSplit, checkString, nameAddyString, ^

StringSplit, finalStrings, checkString1, `r

theName = %finalStrings1%

thePhone = %finalStrings2%

StringReplace, thePhone, thePhone, `n,,All

StringSplit, addyString, checkString2, `r

addy1 = %addyString1%

StringReplace, addyString2, addyString2, `,, `,, UseErrorLevel
if (ErrorLevel > 0)
foundComma = yes

StringReplace, addyString2, addyString2, -, -, UseErrorLevel
if (ErrorLevel > 0)
foundDash = yes

if ((foundComma = "yes") && (foundDash = "yes")) ; this is the city/state/zip
{
addy2 =
StringSplit, city, addyString2, `,
StringReplace, city1, city1,`n,,All
city = %city1%

StringTrimLeft, city2, city2, 3

FoundPos := RegExMatch(city2, "(.*)-", zipcode)

theZip = %zipCode1%

}
else
{
addy2 = %addyString2%

StringReplace, addy2, addy2, `n,,All

StringSplit, city, addyString3, `,
city = %city1%

StringReplace, city, city, `n,,All

StringTrimLeft, city2, city2, 3

FoundPos := RegExMatch(city2, "(.*)-", zipcode)

theZip = %zipCode1%
}

if (theZip)
{
GuiControl,, Name, %theName%
GuiControl,, Phone, %thePhone%
GuiControl,, AddressLine1, %addy1%
GuiControl,, TestVar3, %addy2%
GuiControl,, CityName, %city%
GuiControl,, ZipCode, %theZip%
}
else
{
TrayTip, Copy Customer Info to UPS Tool, In order to use this button copy the customers information in Embassy and click again., 5
}

theName=
thePhone=
addy1=
addy2=
city=
theZip=

Return
Return

NumPackages:
Guicontrolget, TotalPackages, , NumOfPackages, 

if (TotalPackages = 5)
{

HideList = Weight1Title,Weight2Title,Weight3Title,Weight4Title,Weight5Title,Weight1,Weight2,Weight3,Weight4,Weight5,NumOfPackagesTitle,NumOfPackages

Loop, parse, HideList, `,
GuiControl, Hide, %A_LoopField%

HideList=

ShowList = Weight1Title,Weight2Title,Weight3Title,Weight4Title,Weight5Title,Weight1,Weight2,Weight3,Weight4,Weight5

Loop, parse, ShowList, `,
GuiControl, Show, %A_LoopField%

ShowList=

GuiControl,, UPS_package_numbers, %A_ScriptDir%\images\UPS_PC_1of5.jpg
GuiControl, enable, UPS_start_return
}
else if (TotalPackages = 4)
{

HideList = Weight1Title,Weight2Title,Weight3Title,Weight4Title,Weight5Title,Weight1,Weight2,Weight3,Weight4,Weight5,NumOfPackagesTitle,NumOfPackages

Loop, parse, HideList, `,
GuiControl, Hide, %A_LoopField%

HideList=

ShowList = Weight1Title,Weight2Title,Weight3Title,Weight4Title,Weight1,Weight2,Weight3,Weight4

Loop, parse, ShowList, `,
GuiControl, Show, %A_LoopField%

ShowList=

GuiControl,, UPS_package_numbers, %A_ScriptDir%\images\UPS_PC_1of4.jpg
GuiControl, enable, UPS_start_return
}
else if (TotalPackages = 3)
{
HideList= Weight1Title,Weight2Title,Weight3Title,Weight4Title,Weight5Title,Weight1,Weight2,Weight3,Weight4,Weight5,NumOfPackagesTitle,NumOfPackages

Loop, parse, HideList, `,
GuiControl, Hide, %A_LoopField%

HideList= 

ShowList = Weight1Title,Weight2Title,Weight3Title,Weight1,Weight2,Weight3

Loop, parse, ShowList, `,
GuiControl, Show, %A_LoopField%

ShowList=

GuiControl,, UPS_package_numbers, %A_ScriptDir%\images\UPS_PC_1of3.jpg
GuiControl, enable, UPS_start_return
}
else if (TotalPackages = 2)
{
HideList= Weight1Title,Weight2Title,Weight3Title,Weight4Title,Weight5Title,Weight1,Weight2,Weight3,Weight4,Weight5,NumOfPackagesTitle,NumOfPackages

Loop, parse, HideList, `,
GuiControl, Hide, %A_LoopField%

ShowList = Weight1Title,Weight2Title,Weight1,Weight2

Loop, parse, ShowList, `,
GuiControl, Show, %A_LoopField%

ShowList=

GuiControl,, UPS_package_numbers, %A_ScriptDir%\images\UPS_PC_1of2.jpg
}
Return

SingleLabel:

if (processing = 1)
Return
else
{
HideList = NumOfPackages,NumOfPackagesTitle,UPS_package_numbers,Weight1Title,Weight2Title,Weight3Title,Weight4Title,Weight5Title,Weight1,Weight2,Weight3,Weight4,Weight5

Loop, parse, HideList, `,
GuiControl, Hide, %A_LoopField%

ShowList = Weight,WeightTitle

Loop, parse, ShowList, `,
GuiControl, Show, %A_LoopField%

ShowList=

GuiControl,, ChoiceMenu, %A_ScriptDir%\images\UPS_SL.jpg
GuiControl, MoveDraw, ChoiceMenu
GuiControl, Move, OrderNumber, x475 y435
GuiControl, MoveDraw, OrderNumber
GuiControl, Move, Weight, x500 y505
GuiControl, MoveDraw, Weight
GuiControl, Move, MerchDescription, x250 y505
GuiControl, MoveDraw, MerchDescription
GuiControl, Move, Service, x250 y435
GuiControl, MoveDraw, Service
GuiControl, Move, ServiceTitle, x250 y395
GuiControl, MoveDraw, ServiceTitle
GuiControl, Move, MerchDescriptionTitle, x250 y465
GuiControl, MoveDraw, MerchDescriptionTitle
GuiControl, Move, WeightTitle, x500 y465
GuiControl, MoveDraw, WeightTitle
GuiControl, Move, OrderNumberTitle, x475 y395
GuiControl, MoveDraw, OrderNumberTitle
}
AttemptNum=
Return

MultiLabel:

if (processing = 1)
Return
else
{
GuiControl, Hide, Weight
GuiControl,, ChoiceMenu, %A_ScriptDir%\images\UPS_ML.jpg
GuiControl, MoveDraw, ChoiceMenu
GuiControl, Move, Service, x175 y443
GuiControl, MoveDraw, Service
GuiControl, Move, ServiceTitle, x175 y400
GuiControl, MoveDraw, ServiceTitle

GuiControl, Move, MerchDescriptionTitle, x530 y400
GuiControl, MoveDraw, MerchDescriptionTitle
GuiControl, Move, MerchDescription, x530 y440 w175

GuiControl, Move, OrderNumber, x380 y440 w125
GuiControl, MoveDraw, OrderNumber
GuiControl, Move, OrderNumberTitle, x380 y400

GuiControl, Hide, WeightTitle
GuiControl, Show, NumOfPackages
GuiControl, Show, NumOfPackagesTitle
GuiControl, MoveDraw, UPS_status
}
AttemptNum=
Return

SinglePickup:

if (processing = 1)
Return
else
{
GuiControl, Hide, NumOfPackages
GuiControl, Hide, NumOfPackagesTitle
GuiControl, Hide, UPS_package_numbers
GuiControl, Hide, Weight1Title
GuiControl, Hide, Weight2Title
GuiControl, Hide, Weight3Title
GuiControl, Hide, Weight4Title
GuiControl, Hide, Weight5Title
GuiControl, Hide, Weight1
GuiControl, Hide, Weight2
GuiControl, Hide, Weight3
GuiControl, Hide, Weight4
GuiControl, Hide, Weight5
GuiControl, Show, Weight
GuiControl, Show, WeightTitle
GuiControl,, ChoiceMenu, %A_ScriptDir%\images\UPS_SP.jpg
GuiControl, MoveDraw, ChoiceMenu
GuiControl, Move, OrderNumber, x475 y435
GuiControl, MoveDraw, OrderNumber
GuiControl, Move, Weight, x500 y505
GuiControl, MoveDraw, Weight
GuiControl, Move, MerchDescription, x250 y505
GuiControl, MoveDraw, MerchDescription
GuiControl, Move, Service, x250 y435
GuiControl, MoveDraw, Service
GuiControl, Move, ServiceTitle, x250 y395
GuiControl, MoveDraw, ServiceTitle
GuiControl, Move, MerchDescriptionTitle, x250 y465
GuiControl, MoveDraw, MerchDescriptionTitle
GuiControl, Move, WeightTitle, x500 y465
GuiControl, MoveDraw, WeightTitle
GuiControl, Move, OrderNumberTitle, x475 y395
GuiControl, MoveDraw, OrderNumberTitle
}
AttemptNum = 1
Return

MultiPickup:
if (processing = 1)
Return
else
{
GuiControl, Hide, Weight
GuiControl,, ChoiceMenu, %A_ScriptDir%\images\UPS_MP.jpg
GuiControl, MoveDraw, ChoiceMenu
GuiControl, Move, Service, x175 y443
GuiControl, MoveDraw, Service
GuiControl, Move, ServiceTitle, x175 y400
GuiControl, MoveDraw, ServiceTitle

GuiControl, Move, MerchDescriptionTitle, x530 y400
GuiControl, MoveDraw, MerchDescriptionTitle
GuiControl, Move, MerchDescription, x530 y440 w175

GuiControl, Move, OrderNumber, x380 y440 w125
GuiControl, MoveDraw, OrderNumber
GuiControl, Move, OrderNumberTitle, x380 y400

GuiControl, Hide, WeightTitle
GuiControl, Show, NumOfPackages
GuiControl, Show, NumOfPackagesTitle
GuiControl, MoveDraw, UPS_status
}
AttemptNum = 1
Return

PRBOMath:
SetFormat, Float, 0.2
Gui, Submit, NoHide

if (Other_off)
{

	if ((Other_off > 0) && (Other_off < 10))
	Other_off = .0%Other_off%
	else
	Other_off = .%Other_off%

	if (Other_off is not digit)
	{
	GuiControl,, PRBOMsg, Enter a digit between 1 and 99
	GuiControl, enable, PRBOSubmit
	Return
	}


GuiControl, Hide, 10_on
GuiControl, Hide, 20_on
GuiControl, Hide, 30_on
GuiControl, Hide, 40_on
GuiControl, Hide, 50_on
GuiControl, Show, 10_off
GuiControl, Show, 20_off
GuiControl, Show, 30_off
GuiControl, Show, 40_off
GuiControl, Show, 50_off
RefundAmount := QtyOrderPercentage * Other_off

	if (RefundAmount = 0) || (!RefundAmount)
	{
	GuiControl,,PRBOResult, $0.00
	GuiControl, +cWhite, PRBOResult
	GuiControl, MoveDraw, PRBOResult
	}
	else
	{
	RefundAmount = $%RefundAmount%
	GuiControl,,PRBOResult, %RefundAmount%
	GuiControl, +cRed, PRBOResult
	GuiControl, MoveDraw, PRBOResult
	}

}
else
{

RefundAmount := QtyOrderPercentage * PercentTotal

	if (RefundAmount = 0) || (!RefundAmount)
	{
	GuiControl,,PRBOResult, $0.00
	GuiControl, +cWhite, PRBOResult
	GuiControl, MoveDraw, PRBOResult
	}
	else
	{
	RefundAmount = $%RefundAmount%
	GuiControl,,PRBOResult, %RefundAmount%
	GuiControl, +cRed, PRBOResult
	GuiControl, MoveDraw, PRBOResult
	}

}
RefundAmount=
Return

PROff:
PercentTotal=
GuiControl, Hide, 10_on
GuiControl, Hide, 20_on
GuiControl, Hide, 30_on
GuiControl, Hide, 40_on
GuiControl, Hide, 50_on
GuiControl, Show, 10_off
GuiControl, Show, 20_off
GuiControl, Show, 30_off
GuiControl, Show, 40_off
GuiControl, Show, 50_off
RefundAmount = $0.00
GuiControl, MoveDraw, PRBOResult
Return

PR10:
PercentTotal = .10
GuiControl, Show, 10_on
GuiControl, Show, 20_off
GuiControl, Show, 30_off
GuiControl, Show, 40_off
GuiControl, Show, 50_off
GuiControl, Hide, 10_off
GuiControl, Hide, 20_on
GuiControl, Hide, 30_on
GuiControl, Hide, 40_on
GuiControl, Hide, 50_on
GuiControl,, Other_off,
Return

PR20:
PercentTotal = .20
GuiControl, Hide, 10_on
GuiControl, Hide, 20_off
GuiControl, Show, 30_off
GuiControl, Show, 40_off
GuiControl, Show, 50_off
GuiControl, Show, 10_off
GuiControl, Show, 20_on
GuiControl, Hide, 30_on
GuiControl, Hide, 40_on
GuiControl, Hide, 50_on
GuiControl,, Other_off,
Return

PR30:
PercentTotal = .30
GuiControl, Hide, 10_on
GuiControl, Show, 20_off
GuiControl, Hide, 30_off
GuiControl, Show, 40_off
GuiControl, Show, 50_off
GuiControl, Show, 10_off
GuiControl, Hide, 20_on
GuiControl, Show, 30_on
GuiControl, Hide, 40_on
GuiControl, Hide, 50_on
GuiControl,, Other_off,
Return

PR40:
PercentTotal = .40
GuiControl, Hide, 10_on
GuiControl, Show, 20_off
GuiControl, Show, 30_off
GuiControl, Hide, 40_off
GuiControl, Show, 50_off
GuiControl, Show, 10_off
GuiControl, Hide, 20_on
GuiControl, Hide, 30_on
GuiControl, Show, 40_on
GuiControl, Hide, 50_on
GuiControl,, Other_off,
Return

PR50:
PercentTotal = .50
GuiControl, Hide, 10_on
GuiControl, Show, 20_off
GuiControl, Show, 30_off
GuiControl, Show, 40_off
GuiControl, Hide, 50_off
GuiControl, Show, 10_off
GuiControl, Hide, 20_on
GuiControl, Hide, 30_on
GuiControl, Hide, 40_on
GuiControl, Show, 50_on
GuiControl,, Other_off,
Return

Wizard:
WinGetPos, Xpos, Ypos	

if (!Xpos) || (!Ypos)
{
Xpos = Center
Ypos = Center
}

Gui, WizardOpening: New
Gui, WizardOpening: Color, DFDDDA
Gui, WizardOpening: Add, Picture, w200 h33 x22 y15 vLogo gOpening, %A_ScriptDir%\images\logo.jpg
Gui, WizardOpening: Add, Picture, w20 h20 x920 y20 vMenu, %A_ScriptDir%\images\menu.jpg
Gui, WizardOpening: Add, Picture, w117 h350 x25 y70 vBlanks_Menu, %A_ScriptDir%\images\Wiz_blanks_menu_1.jpg
Gui, WizardOpening: Add, Text, w117 h350 x25 y70 gBlanksMenu BackgroundTrans, 
Gui, WizardOpening: Add, Picture, w117 h350 x145 y70 gEMBMenu vEMB_Menu, %A_ScriptDir%\images\Wiz_EMB_menu.jpg
Gui, WizardOpening: Add, Picture, w117 h350 x700 y70 gShippingMenu vShipping_Menu, %A_ScriptDir%\images\Wiz_Shipping_menu.jpg
Gui, WizardOpening: Add, Picture, w117 h350 x580 y70 gPrintingMenu vPrinting_Menu, %A_ScriptDir%\images\Wiz_Printing_menu.jpg
Gui, WizardOpening: Add, Picture, w117 h350 x265 y70 gPERSMenu vPERS_Menu, %A_ScriptDir%\images\Wiz_PERS_menu.jpg
Gui, WizardOpening: Add, Picture, w117 h350 x820 y70 gSinglesMenu vSingles_Menu, %A_ScriptDir%\images\Wiz_Singles_menu.jpg
Gui, WizardOpening: Add, Picture, w200 h400 x385 y40 vWizard_Title, %A_ScriptDir%\images\wizard_title.jpg
status = off

Gui, WizardOpening: Add, Picture, w163 h32 x25 y450 gCrookedPrinting vWiz_title_link_crooked_printing, %A_ScriptDir%\images\wizard_menu_link_crooked_pr.jpg	
Gui, WizardOpening: Add, Picture, w163 h32 x210 y450 gInkComingOff vWiz_title_link_ink_coming_off, %A_ScriptDir%\images\wizard_menu_ink_coming_off.jpg
Gui, WizardOpening: Add, Picture, w163 h32 x395 y450 gHolesInBlanks vWiz_title_link_holes_in_blanks, %A_ScriptDir%\images\wizard_menu_link_holes_in_b.jpg
Gui, WizardOpening: Add, Picture, w175 h32 x580 y450 gBlanksSizing vWiz_title_link_blanks_sizing, %A_ScriptDir%\images\wizard_menu_link_blanks_siz.jpg
Gui, WizardOpening: Add, Picture, w163 h32 x775 y450 gExcessiveInk vWiz_title_link_excessive_ink, %A_ScriptDir%\images\wizard_menu_link_excessive_.jpg

Gui, WizardOpening: Add, Picture, w163 h32 x115 y510 gLateDelivery vWiz_title_link_late_delivery, %A_ScriptDir%\images\wizard_menu_link_late_deliv.jpg
Gui, WizardOpening: Add, Picture, w163 h32 x300 y510 gDyeMigration vWiz_title_link_dye_migration, %A_ScriptDir%\images\wizard_menu_link_dye_migrat.jpg
Gui, WizardOpening: Add, Picture, w163 h32 x485 y510 gStrayInkMarks vWiz_title_link_stray_ink_marks, %A_ScriptDir%\images\wizard_menu_link_stray_ink_.jpg
Gui, WizardOpening: Add, Picture, w185 h32 x670 y510 gPERSSpellingError vWiz_title_link_PERS_spelling_error, %A_ScriptDir%\images\wizard_menu_link_PERS_spell.jpg

Gui, WizardOpening: Add, Picture, w185 h32 x50 y570 gSwappedPackages vWiz_title_link_swapped_packages, %A_ScriptDir%\images\wizard_menu_link_swapped_pa.jpg
Gui, WizardOpening: Add, Picture, w163 h32 x260 y570 gMissingPERS vWiz_title_link_missing_pers, %A_ScriptDir%\images\wizard_menu_link_missing_pe.jpg
Gui, WizardOpening: Add, Picture, w225 h32 x445 y570 gUnclearCommunication vWiz_title_link_unclear_communication, %A_ScriptDir%\images\wizard_menu_link_unclear_co.jpg
Gui, WizardOpening: Add, Picture, w215 h32 x695 y570 gPoorPMSColorMatch vWiz_title_link_poor_pms_color_match, %A_ScriptDir%\images\wizard_menu_link_poor_pms_c.jpg

Gui, WizardOpening: Show, x%Xpos% y%Ypos% w%GuiWidth% h%GuiHeight%, Wizard
Gui, Opening:destroy
Gui, BlanksMenu:destroy
Return

BlanksMenu:
WinGetPos, Xpos, Ypos	

if (!Xpos) || (!Ypos)
{
Xpos = Center
Ypos = Center
}

Gui, BlanksMenu: New
Gui, BlanksMenu: Color, DFDDDA
Gui, BlanksMenu: Add, Picture, w200 h33 x22 y15 vLogo gOpening, %A_ScriptDir%\images\logo.jpg
Gui, BlanksMenu: Add, Picture, w20 h20 x920 y20 vMenu, %A_ScriptDir%\images\menu.jpg

Gui, BlanksMenu: Add, Picture, w200 h75 x250 y125 vWizard_blanks_sizing_issues gWizardBlanksSizingCategory, %A_ScriptDir%\images\Wizard_blanks_sizing_issues.jpg

Gui, BlanksMenu: Add, Picture, w200 h75 x485 y125 vWizard_blanks_color_issues gWizardBlanksColorCategory, %A_ScriptDir%\images\Wizard_blanks_color_issues.jpg

Gui, BlanksMenu: Add, Picture, w200 h75 x720 y125 vWizard_blanks_feel gWizardBlanksFeelCategory, %A_ScriptDir%\images\Wizard_blanks_feel.jpg

Gui, BlanksMenu: Add, Picture, w186 h500 x25 y70, %A_ScriptDir%\images\test_image.jpg
Gui, BlanksMenu: Add, Picture, w300 h50 x225 y60, %A_ScriptDir%\images\Wizard_blanks_menu_title.jpg

Gui, BlanksMenu: Add, Picture, w200 h50 x775 y70, %A_ScriptDir%\images\Wiz_blanks_menu_categories.jpg
Gui, BlanksMenu: Add, Picture, w200 h50 x740 y245, %A_ScriptDir%\images\Wiz_blanks_menu_common.jpg
Gui, BlanksMenu: Add, Picture, w200 h50 x780 y465, %A_ScriptDir%\images\Wiz_blanks_menu_resources.jpg

Gui, BlanksMenu: Add, Picture, w150 h50 x250 y300 gWizardBlanksColorDissatisfaction, %A_ScriptDir%\images\Wiz_blanks_com_color_dissat.jpg

Gui, BlanksMenu: Add, Picture, w150 h50 x425 y300 gWizardIncorrectSizesOrderedCust, %A_ScriptDir%\images\Wiz_blanks_com_incorrect_si.jpg

Gui, BlanksMenu: Add, Picture, w150 h50 x600 y300 gWizardBlankWeightDissatisfaction, %A_ScriptDir%\images\Wiz_blanks_com_weight_dissa.jpg

Gui, BlanksMenu: Add, Picture, w150 h50 x775 y300 gWizardIncorrectStyleShipped, %A_ScriptDir%\images\Wiz_blanks_com_ISS.jpg

Gui, BlanksMenu: Add, Picture, w150 h50 x250 y370 gWizardWrongBlanksOrderedRep, %A_ScriptDir%\images\Wiz_blanks_com_WBOR.jpg

Gui, BlanksMenu: Add, Picture, w150 h50 x425 y370 gWizardIncorrectSizedOrderedRep, %A_ScriptDir%\images\Wiz_blanks_com_ISOR.jpg

Gui, BlanksMenu: Add, Picture, w150 h50 x600 y370 gHolesInBlanks, %A_ScriptDir%\images\Wiz_blanks_com_HIB.jpg

Gui, BlanksMenu: Add, Picture, w150 h50 x775 y370 gWizardBlanksWithStains, %A_ScriptDir%\images\Wiz_blanks_com_BWS.jpg


Gui, BlanksMenu: Add, Picture, w150 h50 x250 y520 gConstraints, %A_ScriptDir%\images\Wiz_blanks_res_constraints.jpg

Gui, BlanksMenu: Add, Picture, w150 h50 x425 y520 gMATTool, %A_ScriptDir%\images\Wiz_blanks_res_MAT.jpg

Gui, BlanksMenu: Add, Picture, w150 h50 x600 y520 gSuperQuoter, %A_ScriptDir%\images\Wiz_blanks_res_SQ.jpg

Gui, BlanksMenu: Add, Picture, w150 h50 x775 y520 gReturnsChat, %A_ScriptDir%\images\Wiz_blanks_res_RC.jpg

Gui, BlanksMenu: Add, Picture, w175 h40 x25 y580 gWizard BackgroundTrans, %A_ScriptDir%\images\ExitToWizard.jpg


Gui, BlanksMenu: Show, x%Xpos% y%Ypos% w%GuiWidth% h%GuiHeight%, Blanks Wizard Menu
Gui, WizardOpening:destroy
Gui, Sizing:destroy
Return



EMBMenu:
Msgbox, You've clicked the Embroidery Menu!
Return

ShippingMenu:
Msgbox, You've clicked on the Shipping Menu!
Return

PrintingMenu:
Msgbox, You've clicked on the printing menu!
Return

PERSMenu:
Msgbox, You've clicked on the PERS menu!
Return

SinglesMenu:
Msgbox, You've clicked on the Singles menu!
Return

CrookedPrinting:
Msgbox, You've clicked on Crooked Printing!
Return

InkComingOff:
Msgbox, You've clicked on Ink Coming off!
Return

HolesInBlanks:
Msgbox, You've clicked on Holes In Blanks
Return

BlanksSizing:
Msgbox, You've clicked on Blanks Sizing!
Return

ExcessiveInk:
Msgbox, You've clicked on Excessive Ink!
Return

LateDelivery: 
Msgbox, You've clicked on Late Delivery!
Return

DyeMigration:
Msgbox, You've clicked on Dye Migration!
Return

StrayInkMarks:
Msgbox, You've clicked on Stray Ink Marks!
Return

PERSSpellingError:
Msgbox, You've clicked on PERS Spelling Error!
Return

SwappedPackages:
Msgbox, You've clicked on Swapped Packages!
Return

MissingPERS:
Msgbox, You've clicked on Missing PERS!
Return

UnclearCommunication:
Msgbox, You've clicked on Unclear Communication!
Return

PoorPMSColorMatch:
Msgbox, You've clicked on Poor PMS Color Match!
Return

WizardBlanksSizingCategory:
; Order Number
; Affected items Order Total
; Pieces Affected
; Product/Sizes Affected
; DD
; Prob photo rec'd

; Prob Scenes below:
; Incorrect Sizes - Blanks Provider
; Incorrect Sizes - Cust
; Incorrect Sizes

WinGetPos, Xpos, Ypos	

if (!Xpos) || (!Ypos)
{
Xpos = Center
Ypos = Center
}

Gui, Sizing: New
Gui, Sizing: Color, DFDDDA
Gui, Sizing: Add, Picture, w200 h33 x22 y15 vLogo gOpening, %A_ScriptDir%\images\logo.jpg
Gui, Sizing: Add, Picture, w20 h20 x920 y20 vMenu, %A_ScriptDir%\images\menu.jpg
Gui, Sizing: Add, Picture, w300 h50 x25 y60, %A_ScriptDir%\images\Wizard_sizing_menu.jpg

Gui, Sizing: Add, Picture, w175 h425 x25 y130, %A_ScriptDir%\images\Wizard_sizing_order_info.jpg

Gui, Sizing: Add, Edit, w125 h22 x50 y190 -vscroll,
Gui, Sizing: Add, Picture, w125 h20 x50 y213, %A_ScriptDir%\images\Wizard_sizing_title_orderin.jpg

Gui, Sizing: Add, Edit, w125 h22 x50 y240 -vscroll,
Gui, Sizing: Add, Picture, w125 h20 x50 y263, %A_ScriptDir%\images\Wizard_sizing_title_pieces.jpg

Gui, Sizing: Add, Edit, w125 h22 x50 y290 -vscroll,
Gui, Sizing: Add, Picture, w125 h20 x50 y313, %A_ScriptDir%\images\Wizard_sizing_title_event.jpg

Gui, Sizing: Add, Edit, w125 h22 x50 y340 -vscroll,
Gui, Sizing: Add, Picture, w125 h20 x50 y363, %A_ScriptDir%\images\Wizard_sizing_title_total.jpg

Gui, Sizing: Font, S8 Norm, Arial
Gui, Sizing: Add, DropDownList, w125 h50 x50 y395 -vscroll, No||Yes
Gui, Sizing: Add, Picture, w125 h20 x50 y418, %A_ScriptDir%\images\Wizard_sizing_title_prob.jpg

Gui, Sizing: Add, Picture, w175 h40 x25 y570 gBlanksMenu BackgroundTrans, %A_ScriptDir%\images\ExitToBlanksWizard.jpg


Gui, Sizing: Show, x%Xpos% y%Ypos% w%GuiWidth% h%GuiHeight%, Wizard / Blanks / Sizing
Gui, Opening:destroy
Gui, BlanksMenu:destroy
Return

WizardBlanksColorCategory:
Msgbox, You've clicked on the Color Category!
Return

WizardBlanksFeelCategory:
Msgbox, You've clicked on the Feel Category!
Return

WizardBlanksColorDissatisfaction:
Msgbox, You've clicked on Color Dissatisfaction!
Return

WizardIncorrectSizesOrderedCust:
Msgbox, You've clicked on Incorrect Sizes Ordered Cust!
Return

WizardBlankWeightDissatisfaction:
Msgbox, You've clicked on Blank Weight Dissatisfaction!
Return

WizardIncorrectStyleShipped:
Msgbox, You've clicked on Incorrect Style Shipped!
Return

WizardWrongBlanksOrderedRep:
Msgbox, You've clicked on Wrong Blanks Ordered - Rep!
Return

WizardIncorrectSizedOrderedRep:
Msgbox, You've clicked on Incorrect Sizes Ordered - Rep!
Return

WizardBlanksWithStains:
Msgbox, You've clicked on Blanks W/ Stains!
Return

Constraints:
Run, https://home.customink.com/backend/constraints/
Return

MATTool:
Run, http://home.customink.com/backend/ips
Return

SuperQuoter:
Run, https://www.customink.com/admin/quotes
Return

OpeningGuiClose:
ExitApp
Return

CalculatorGuiClose:
ExitApp
Return

URLToVar(URL) {
WebRequest := ComObjCreate("WinHttp.WinHttpRequest.5.1")
WebRequest.Open("GET", URL, true)
WebRequest.Send()
WebRequest.WaitForResponse()
Return WebRequest.ResponseText
}

BlinkingError(Name, Abb) ; work on this later.
{
xName = %Abb%X
yName = %Abb%Y
NameError = %Abb%Error
}
