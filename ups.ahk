#Include %A_ScriptDir%
INI=%A_scriptdir%\settings.ini

try
{
UrlDownloadToFile, https://drive.google.com/uc?export=download&id=0B13bYaJLlH0Ma0U0dTNENlBJS0U, %A_scriptdir%\images\paste1.jpg
}

try
{
UrlDownloadToFile, https://drive.google.com/uc?export=download&id=0B13bYaJLlH0MWlcwUmRTSFRMdWs, %A_scriptdir%\images\paste.jpg
}

DetectHiddenWindows, On

IniRead, skill, %ini%, clientSkill, KEY1
IniRead, showNick, %ini%, clientNick, KEY1
IniRead, showEmail, %ini%, clientEmail, KEY1
IniRead, showName, %ini%, clientName, KEY1

counter = 0

/* If the GUI is already open, we're going to send a traytip reminder and not launch another one.
IfWinExist, ahk_class AutoHotkeyGUI
{
TrayTip, UPS Tool Already Launched, Check to see if the tool is minimized..., , 3000
sleep 3000
return
}
*/



; Display the UPS Menu
FirstMenu:
Reporting("upstool")
height = 800
GuiWidth = 206
WinGetPos, Xpos, Ypos	

Gui, theMenu1:+AlwaysOnTop +0x40000 0x12
Gui, theMenu1:Add, Picture, w180 h-1, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theMenu1:Color, FFFFFF
Gui, theMenu1:Font, S26, w700
Gui, theMenu1:Add, Text, center ym-10 x12 y179 w180 h40 0x200 cBlue gLink1 v_Link1, E-Label
Gui, theMenu1:Font, s10, w700
Gui, theMenu1:Add, Text, center x12 y229 w180, Use this tool to quickly create a return shipping label.
Gui, theMenu1:Font, S26, w700
Gui, theMenu1:Add, Text, center ym-10 x12 y279 w180 h40 0x200 cBlue gLink2 v_Link2, Pickup
Gui, theMenu1:Font, s10, w700
Gui, theMenu1:Add, Text, center x12 y329 w180, Use this tool to schedule a UPS pickup.
;Gui, theMenu1:Font, S26, w700
;Gui, theMenu1:Add, Text, center ym-10 x12 y479 w180 h40 0x200 cBlue gLink3 v_Link3, Swap
;Gui, theMenu1:Font, s10, w700
;Gui, theMenu1:Add, Text, center x12 y529 w180, Use this tool to setup a customer package swap.
Gui, theMenu1:Font, S26, w700
;Gui, theMenu1:Add, Text, center ym-10 x12 y379 w180 h40 0x200 cBlue gLink4 v_Link4, Samples
;Gui, theMenu1:Font, s10, w700
;Gui, theMenu1:Add, Text, center x12 y429 w180, Use this tool to setup a return shipping label or pickup for blank samples.
Gui, theMenu1:Font, underline S10, w700
Gui, theMenu1:Add, Text, center ym-10 x12 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Help/FAQ
Gui, theMenu1:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theMenu1:Show, xcenter ycenter h%height% w%GuiWidth%, Menu - UPS

; WinSet, Region, , Menu - UPS

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

return

; Display the UPS Menu
Menu:

height = 800
GuiWidth = 206
WinGetPos, Xpos, Ypos	

Gui, theMenu:+AlwaysOnTop
Gui, theMenu:Add, Picture, w180 h-1, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theMenu:Color, FFFFFF
Gui, theMenu:Font, S26, w700
Gui, theMenu:Add, Text, center ym-10 x12 y179 w180 h40 0x200 cBlue gLink1 v_Link1, E-Label
Gui, theMenu:Font, s10, w700
Gui, theMenu:Add, Text, center x12 y229 w180, Use this tool to quickly create a return shipping label.
Gui, theMenu:Font, S26, w700
Gui, theMenu:Add, Text, center ym-10 x12 y279 w180 h40 0x200 cBlue gLink2 v_Link2, Pickup
Gui, theMenu:Font, s10, w700
Gui, theMenu:Add, Text, center x12 y329 w180, Use this tool to schedule a UPS pickup.
;Gui, theMenu1:Font, S26, w700
;Gui, theMenu1:Add, Text, center ym-10 x12 y479 w180 h40 0x200 cBlue gLink3 v_Link3, Swap
;Gui, theMenu1:Font, s10, w700
;Gui, theMenu1:Add, Text, center x12 y529 w180, Use this tool to setup a customer package swap.
Gui, theMenu:Font, S26, w700
;Gui, theMenu:Add, Text, center ym-10 x12 y379 w180 h40 0x200 cBlue gLink4 v_Link4, Samples
;Gui, theMenu:Font, s10, w700
;Gui, theMenu:Add, Text, center x12 y429 w180, Use this tool to setup a return shipping label or pickup for blank samples.
Gui, theMenu:Font, underline S10, w700
Gui, theMenu:Add, Text, center ym-10 x12 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Help/FAQ
Gui, theMenu:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theMenu:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Menu - UPS

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu1:destroy
Gui, feedback:destroy
Gui, SingleLabel:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Gui, SinglePickup:destroy
Gui, MultiPickup:destroy
Gui, sample1:destroy
Gui, SingleSampleLabel:destroy
Gui, MultiSampleLabel:destroy
return

; Allows for link to be clicked in the GUI.

; Retrieve scripts PID
  Process, Exist
  pid_this := ErrorLevel
 
  ; Retrieve unique ID number (HWND/handle)
  WinGet, hw_gui, ID, ahk_class AutoHotkeyGUI ahk_pid %pid_this%
 
  ; Call "HandleMessage" when script receives WM_SETCURSOR message
  WM_SETCURSOR = 0x20
  OnMessage(WM_SETCURSOR, "HandleMessage")
 
  ; Call "HandleMessage" when script receives WM_MOUSEMOVE message
  WM_MOUSEMOVE = 0x200
  OnMessage(WM_MOUSEMOVE, "HandleMessage")
Return




; Display the Single Label GUI
Link1:
WinGetPos, Xpos, Ypos	
Gui, SingleLabel:+AlwaysOnTop
height = 800
GuiWidth = 206

Gui, SingleLabel:Color, FFFFFF
Gui, SingleLabel:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, SingleLabel:Add, Edit, x12 y209 w180 h20 Limit35 vName, %Name% ; Enter Customer Name
Gui, SingleLabel:Add, Edit, x12 y259 w180 h20 Limit15 vPhone, %Phone% ; Enter Phone Number
Gui, SingleLabel:Add, Edit, x12 y309 w180 h20 Limit35 vAddressLine1, %AddressLine1% ; Enter Address Line 1
Gui, SingleLabel:Add, Edit, x12 y359 w180 h20 Limit35 vTestVar3, %TestVar3% ; Enter Address Line 2
Gui, SingleLabel:Add, Edit, x12 y409 w180 h20 Limit35 vCityName, %CityName% ; Enter City Name
Gui, SingleLabel:Add, Edit, x12 y459 w80 h20 Limit5 Number vZipCode, %ZipCode% ; Enter Zip Code

; Display the previously selected address type with the following If statement.

if (AddType = "Residential") || (AddType = "")
{
Gui, SingleLabel:Add, DropDownList, x110 y459 w80 h100 vAddType, Residential||Business ; Select Address Type, Residential is default selection. Add double pipes after selection that should be default.
}
else 
{
Gui, SingleLabel:Add, DropDownList, x110 y459 w80 h100 vAddType, Residential|Business|| ; Select Address Type, Residential is default selection. Add double pipes after selection that should be default.
}

; Display the previously selected service type with the following If statement.

if (Service = "UPS Ground Service") || (AddType = "")
{
Gui, SingleLabel:Add, DropDownList, x40 y549 w125 h100 vService, UPS Ground Service||UPS Next Day Air|UPS 3 Day Select ; Select Service, UPS Ground Service is default. Add double pipes after selection that should be default.
}
else if (Service = "UPS Next Day Air")
{
Gui, SingleLabel:Add, DropDownList, x40 y549 w125 h100 vService, UPS Ground Service|UPS Next Day Air||UPS 3 Day Select ; Select Service, UPS Ground Service is default. Add double pipes after selection that should be default.
}
else if (Service = "UPS 3 Day Select")
{
Gui, SingleLabel:Add, DropDownList, x40 y549 w125 h100 vService, UPS Ground Service|UPS Next Day Air|UPS 3 Day Select|| ; Select Service, UPS Ground Service is default. Add double pipes after selection that should be default.
}

Gui, SingleLabel:Add, Edit, x12 y599 w80 h20 Limit3 Number vWeight, %Weight% ; Enter Package Weight
Gui, SingleLabel:Add, Edit, x110 y599 w80 h20 vOrderNumber, %OrderNumber% ; Enter Order Number
Gui, SingleLabel:Add, Edit, x12 y649 w180 h20 Limit35 vMerchDescription, %MerchDescription% ; Enter Merch Description


; Rep name is added by default.
; Zip code will determine the city and state that will be entered on the UPS website.

Gui, SingleLabel:Font, s10, w700
Gui, SingleLabel:Add, Text, center ym-10 x12 y109 w180 h40 0x200 cBlue gAmulti v_MultiPkg, Click here for multi-labels
Gui, SingleLabel:Font, s9, w700
Gui, SingleLabel:Add, Text, center ym-10 x12 y769 w180 h20 0x200, * is a required field
Gui, SingleLabel:Add, Text, center ym-10 x60 y579 w180 h20 0x200, Order Number *
Gui, SingleLabel:Add, Text, center ym-10 x12 y529 w180 h20 0x200, Service Type
Gui, SingleLabel:Add, Text, center ym-10 x12 y629 w180 h20 0x200, Merch Description *
Gui, SingleLabel:Add, Text, ym-10 x17 y579 w80 h20 0x200, Total Weight *
Gui, SingleLabel:Add, Text, center ym-10 x12 y239 w180 h20 0x200, Phone Number
Gui, SingleLabel:Add, Text, center ym-10 x107 y439 w80 h20 0x200, Address Type
Gui, SingleLabel:Add, Text, center ym-10 x12 y439 w80 h20 0x200, Zip Code *
Gui, SingleLabel:Add, Text, center ym-10 x12 y389 w180 h20 0x200, City *
Gui, SingleLabel:Add, Text, center ym-10 x12 y339 w180 h20 0x200, Address Line 2
Gui, SingleLabel:Add, Text, center ym-10 x12 y289 w180 h20 0x200, Address Line 1 *
Gui, SingleLabel:Add, Text, center ym-10 x12 y189 w180 h20 0x200, Customer Name *
Gui, SingleLabel:Add, Button, x12 y739 w180 h20 Default gOutputVar vOutputVar, Get Return Shipping Label
Gui, SingleLabel:Font, underline s14, w700
Gui, SingleLabel:Add, Text, ym-10 x30 y149 w180 h30 0x200, Customer Info
Gui, SingleLabel:Add, Picture, ym-10 x150 y152 h25 w25 gRunAddy, %A_ScriptDir%\images\paste1.jpg
Gui, SingleLabel:Add, Text, center ym-10 x12 y489 w180 h30 0x200, Return Info
Gui, SingleLabel:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, E-Label - UPS

; Function from OutputVar, if noEarly equals 1, we're not going to proceed with processing the info, instead letting the rep know that the zip code does not have early NDA delivery available.

if (noEarly = 1)
{
Msgbox, Next Day Early is not available for Zip Code: %ZipCode%.`nPlease select a different service.
}

Gui, theMenu:destroy
Gui, theMenu1:destroy
Gui, MultiLabel:destroy
return

; Running the OutputVar function from SingleLabel

OutputVar:
GuiControl, disable, OutputVar
Gui, Submit, NoHide

; create a list of your the vars that we're checking.

emptyfields = Name, AddressLine1, CityName, ZipCode, Weight, MerchDescription, OrderNumber,
 
loop, parse, emptyfields, `,, %A_Space% 				; loop through the list
{
	GuiControlGet, OutputVar, Enabled, %A_LoopField%
		If !(%A_LoopField%) && OutputVar ; if the value of the variable whose name is saved in A_LoopField is empty and is enabled
		{
			if A_LoopField = Name
			{
			required = Customer Name
			}
			else if A_LoopField = CityName
			{
			required = City Name
			}
			else if A_LoopField = AddressLine1
			{
			required = Address Line 1
			}
			else if A_LoopField = ZipCode
			{
			required = Zip Code
			}
			else if A_LoopField = Weight
			{
			required = Weight
			}
			else if A_LoopField = MerchDescription
			{
			required = Merch Description
			}
			else if A_LoopField = OrderNumber
			{
			required = Order Number
			}
			MsgBox A required field is empty: %required%	; show error message
			GuiControl, enable, OutputVar
			return						; stop
		}
}
;~ ; if you're here then all vars are not empty

OrderNumber = %OrderNumber%


; Although we have the digits and lengths declared in the GUI, we also need to double check in case this info's been pasted. Time to check the values to make sure the following contain only digits.

if Declared is not digit
{
MsgBox, The declared value field may only contain digits.
GuiControl, enable, OutputVar
Return
}

if ZipCode is not digit
{
MsgBox, The zip code field may only contain digits.
GuiControl, enable, OutputVar
Return
}

if Weight is not digit
{
MsgBox, The weight field may only contain digits.
GuiControl, enable, OutputVar
Return
}

if OrderNumber is not digit
{
MsgBox, The order number field may only contain digits.
GuiControl, enable, OutputVar
Return
}

; Although we have the digits and lengths declared in the GUI, we also need to double check in case this info's been pasted. Time to check the values to make sure that we're within the max parameters for the UPS fields.

if (Declared > 1000)
{
MsgBox, The max declared value is $1000.
GuiControl, enable, OutputVar
Return
}

StringLen, addonelength, AddressLine1
if (addonelength > 35)
{
MsgBox, The max length for address line 1 is 35 characters.
GuiControl, enable, OutputVar
Return
}

StringLen, addtwolength, AddressLine2
if (addtwolength > 35)
{
MsgBox, The max length for address line 2 is 35 characters.
GuiControl, enable, OutputVar
Return
}

StringLen, citylength, CityName
if (citylength > 35)
{
MsgBox, The max length for the City name is 35 characters.
GuiControl, enable, OutputVar
Return
}

StringLen, namelength, Name
if (namelength > 35)
{
MsgBox, The max length for customer name is 35 characters.
GuiControl, enable, OutputVar
Return
}

StringLen, ziplength, ZipCode
if (ziplength > 5)
{
MsgBox, The max length for zip code is 5 digits.
GuiControl, enable, OutputVar
Return
}

StringLen, phonelength, Phone
if (phonelength > 15)
{
MsgBox, The max length for phone number is 15 characters.
GuiControl, enable, OutputVar
Return
}

StringLen, merchlength, MerchDescription
if (merchlength > 35)
{
MsgBox, The max length for merchandise description is 35 characters.
GuiControl, enable, OutputVar
Return
}

StringLen, orderlength, OrderNumber
if (orderlength > 8)
{
MsgBox, The max length for order number is 8 digits.
GuiControl, enable, OutputVar
Return
}

if (Weight > 150)
{
MsgBox, The max weight is 150 lbs.
GuiControl, enable, OutputVar
Return
}

; Setting variables for the service selection.

if (Service = "UPS Ground Service")
{
serviceType = 5
}
else if (Service = "UPS Next Day Air")
{
serviceType = 2
}
else if (Service = "UPS 3 Day Select")
{
serviceType = 4
}

NumberOfPackages = 1

gosub, Go
return 


Go:

numError = 0

myControl := A_GuiControl

#Warn All, Off  

#Include zip_checker.ahk



if (!theState)
{
; if the zip code does not match any of these ranges, we're stopping right here to let the rep know.
WinGetTitle, hideTitle, ahk_class IEFrame
WinHide, %hideTitle%

MsgBox, 36, Zip Code Not Found, The zip code you've copied does not match a range of known zip codes in our records. If you are certain that the zip code is correct, please click Yes and select the state on the next screen. Otherwise, click no to adjust the zip code.`r`n`r`n`r`n`r`n*We need your help to make this tool better! If this zip code needs to be added to our records, please e-mail over the zip code to autohotkeys@customink.com and we'll get it updated.

ifMsgBox Yes
{
gosub, overrideZip
return
}

}

PreLogin:

Gui, SinglePickup:destroy
Gui, SingleLabel:destroy
Gui, MultiLoop:destroy
Gui, MultiPickup:destroy
Gui, SingleSampleLabel:destroy
Gui, MultiSampleLabel:destroy


if (NumberOfPackages > 1)
{
	if ((AttemptNum = 1) || (AttemptNum = 3))
	{
	TrayTip, Scheduling Pickups..., I'm working to setup the UPS Pickups for you now. You can continue to work and I'll have this done in a minute!, 5000
	}
	else
	{
	TrayTip, Creating Labels..., I'm working to setup the UPS Returns for you now. You can continue to work and I'll have this done in a minute!, 5000
	}
}
else
{
	if ((AttemptNum = 1) || (AttemptNum = 3))
	{
	TrayTip, Scheduling Pickup..., I'm working to setup the UPS Pickup for you now. You can continue to work and I'll have this done in a moment!, 5000
	}
	else
	{
	TrayTip, Creating Label..., I'm working to setup the UPS Return for you now. You can continue to work and I'll have this done in a moment!, 5000
	}
}

myCounting = 1

gosub, Login
Return

Login:

Gui, SinglePickup:destroy
Gui, SingleLabel:destroy
Gui, MultiLoop:destroy
Gui, MultiPickup:destroy
Gui, SingleSampleLabel:destroy
Gui, MultiSampleLabel:destroy


try
	wb := ComObjCreate("InternetExplorer.Application")  ; Create an IE object
	
	/*catch
	{
	
	
	
	if (loginname = "SS_West")
	whereHeaded = Reno
	else
	whereHeaded = Charlottesville
	
	msgbox,16,Unable to Launch Browser, There is an issue that is preventing Internet Explorer from launching and this is preventing the UPS Tool from processing your request. Please contact autohotkeys@customink.com for assistance with this error. You will need to continue with processing your return on the CampusShip website. Once you click Ok the UPS Tool will close and the CampusShip website will be launched.`r`n`r`n*Please note: This Return will be going to %whereHeaded%
	
	goURL = https://www.campusship.ups.com/campusship/logout?returnto=https://www.campusship.ups.com
	
	Run, %goURL%
	wb.quit
	wb:=""
	ExitApp
	Return
	}
	*/
	
	

	wb.Visible := false

	
	try
	{
		goURL = https://www.ups.com/one-to-one/logout?returnto=https`%3A`%2F`%2Fwww.campusship.ups.com

	URLToVar(goURL)
	}
	
	/*catch
	{
	msgbox,16,CampusShip website cannot be found, There is a problem accessing the CampusShip website. Please double-check your internet connection and that the CampusShip website is up and running and try again. The UPS Tool will now close.`r`n`r`nIf you are certain that you have an active internet connection and the CampusShip website is up and running, please contact autohotkeys@custoink.com for further assistance.
	wb.quit
	wb:=""
	ExitApp
	Return
	}
	*/
	
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
	
	/*errorResult := 3 * NumberOfPackages
	
	if (numError > errorResult)
	{
	msgbox, There have been multiple errors while trying to process this return and the UPS Tool will now close. Please continue to the CampusShip website to continue processing the return.
	wb.quit
	wb:=""
	ExitApp
	Return
	}
	*/
	
	
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

				if loginname = SS_West
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
					wb.document.getElementById("shipToSaveOption").selectedIndex := 5
					;wb.document.getElementsByName("next").click()
					sleep 15000
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
					wb.document.getElementById("shipToSaveOption").selectedIndex := 5
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

				if loginname = SS_West
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
					
					; updating Return to address fields if we're returning from West Coast.
					
					wb.document.getElementById("shipToNameValue").value := "CustomInk"
					wb.document.getElementById("returnFromContactNameValue").value := "Customer Returns"
					wb.document.getElementById("shipToStreetValue").value := "4855 Longley Ln"
					wb.document.getElementById("shipToCityValue").value := "RENO"
					wb.document.getElementById("shipToPostalValue").value := "895025953"
					wb.document.getElementById("returnFromStateValue").selectedIndex := 29
					;wb.document.getElementById("shipToPhoneValue").value := "8664858160"
					wb.document.getElementById("shipToEmailValue").value := "service@customink.com"
					wb.document.getElementById("shipToSaveOption").selectedIndex := 5
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
					
					wb.document.getElementById("shipToNameValue").value := "CustomInk Returns East"
					wb.document.getElementById("shipToStreetValue").value := "1180 Seminole Trail"
					wb.document.getElementById("shipToAddr2Value").value := "Ste 480"
					wb.document.getElementById("shipToCityValue").value := "CHARLOTTESVILLE"
					wb.document.getElementById("shipToPostalValue").value := "229015713"
					wb.document.getElementById("returnFromStateValue").selectedIndex := 47
					wb.document.getElementById("shipToPhoneValue").value := "8664858160"
					wb.document.getElementById("shipToEmailValue").value := "service@customink.com"
					wb.document.getElementById("shipToSaveOption").selectedIndex := 5
					
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

		if (NumberOfPackages > 1)
		{
		Weight := Weight%myCounting%
		}
		wb.document.getElementById("packageBean.weight").value := Weight
		if (NumberOfPackages > 1)
		{
		Declared := Declared%myCounting%
		}
		wb.document.getElementById("packageBean_insuredAmount").value := Declared
		if (NumberOfPackages > 1)
		{
		refString = %MerchDescription% (%myCounting% of %NumberOfPackages%)
		wb.document.getElementById("packageBean_merchandiseDescription").value := refString
		}
		else
		{
		wb.document.getElementById("packageBean_merchandiseDescription").value := MerchDescription
		}
	wb.document.getElementById("reference_value1").value := OrderNumber
	wb.document.getElementById("reference_value2").value := showName
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
	msgbox,16,E-mail Label Error, The UPS website is having difficulty processing the electronic return label. Specifically, there is an issue with the e-mail address that it is being sent to. Please screenshot this message and contact autohotkeys@customink.com for further assistance. In the meantime, you will need to process your return on the CampusShip website. The UPS Tool will now close.
	wb.quit
	wb:=""
	ExitApp
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
		
			
		if (NumberOfPackages > 1)
		{
			if (NumberOfPackages = myCounting)
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

CopyTrack1:
clipboard := CopyTrack1
TrayTip, Tracking Number Copied, The tracking number has been copied to your clipboard.
SetTimer, RemoveTrayTip, 2000
Return

CopyLink1:
clipboard = %prefix%%CopyTrack1%
TrayTip, Return Label Link Copied, The return label link has been copied to your clipboard.
SetTimer, RemoveTrayTip, 2000
Return

CopyTrack2:
clipboard := CopyTrack2
TrayTip, Tracking Number Copied, The tracking number has been copied to your clipboard.
SetTimer, RemoveTrayTip, 2000
Return

CopyLink2:
clipboard = %prefix%%CopyTrack2%
TrayTip, Return Label Link Copied, The return label link has been copied to your clipboard.
SetTimer, RemoveTrayTip, 2000
Return

CopyTrack3:
clipboard := CopyTrack3
TrayTip, Tracking Number Copied, The tracking number has been copied to your clipboard.
SetTimer, RemoveTrayTip, 2000
Return

CopyLink3:
clipboard = %prefix%%CopyTrack3%
TrayTip, Return Label Link Copied, The return label link has been copied to your clipboard.
SetTimer, RemoveTrayTip, 2000
Return

CopyTrack4:
clipboard := CopyTrack4
TrayTip, Tracking Number Copied, The tracking number has been copied to your clipboard.
SetTimer, RemoveTrayTip, 2000
Return

CopyLink4:
clipboard = %prefix%%CopyTrack4%
TrayTip, Return Label Link Copied, The return label link has been copied to your clipboard.
SetTimer, RemoveTrayTip, 2000
Return

CopyTrack5:
clipboard := CopyTrack5
TrayTip, Tracking Number Copied, The tracking number has been copied to your clipboard.
SetTimer, RemoveTrayTip, 2000
Return

CopyLink5:
clipboard = %prefix%%CopyTrack5%
TrayTip, Return Label Link Copied, The return label link has been copied to your clipboard.
SetTimer, RemoveTrayTip, 2000
Return

RemoveTrayTip:
SetTimer, RemoveTrayTip, Off
TrayTip
Return

Amulti:
WinGetPos, Xpos, Ypos
Gui, MultiLabel:+AlwaysOnTop
height = 800
GuiWidth = 206


Gui, MultiLabel:Color, FFFFFF
Gui, MultiLabel:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, MultiLabel:Add, Edit, x12 y209 w180 h20 vName, %Name% ; Enter Customer Name
Gui, MultiLabel:Add, Edit, x12 y259 w180 h20 vPhone, %Phone% ; Enter Phone Number
Gui, MultiLabel:Add, Edit, x12 y309 w180 h20 vAddressLine1, %AddressLine1% ; Enter Address Line 1
Gui, MultiLabel:Add, Edit, x12 y359 w180 h20 vTestVar3, %TestVar3%  ; Enter Address Line 2
Gui, MultiLabel:Add, Edit, x12 y409 w180 h20 vCityName, %CityName% ; Enter City Name
Gui, MultiLabel:Add, Edit, x12 y459 w80 h20 Limit5 Number vZipCode, %ZipCode% ; Enter Zip Code

if ((AddType = "Residential") || (AddType = ""))
{
Gui, MultiLabel:Add, DropDownList, x110 y459 w80 h100 vAddType, Residential||Business ; Select Address Type, Residential is default selection. Add double pipes after selection that should be default.
}
else 
{
Gui, MultiLabel:Add, DropDownList, x110 y459 w80 h100 vAddType, Residential|Business|| ; Select Address Type, Residential is default selection. Add double pipes after selection that should be default.
}
Gui, MultiLabel:Add, DropDownList, x12 y539 w180 h200 vNumberOfPackages, Select One||2|3|4|5 ; Select # of Packages, Select One is default, will not process unless numerical value selected.


; Rep name is added by default.
; Zip code will determine the city and state that will be entered on the UPS website.

Gui, MultiLabel:Font, s10, w700
Gui, MultiLabel:Add, Text, center ym-10 x12 y109 w180 h40 0x200 cBlue gLink1 v_SingleLabel, Back to Single E-Label
Gui, MultiLabel:Font, s9, w700
Gui, MultiLabel:Add, Text, center ym-10 x12 y519 w180 h20 0x200,  Select Number of Packages *
Gui, MultiLabel:Add, Text, center ym-10 x12 y239 w180 h20 0x200, Phone Number
Gui, MultiLabel:Add, Text, center ym-10 x107 y439 w80 h20 0x200, Address Type
Gui, MultiLabel:Add, Text, center ym-10 x12 y439 w80 h20 0x200, Zip Code *
Gui, MultiLabel:Add, Text, center ym-10 x12 y389 w180 h20 0x200, City *
Gui, MultiLabel:Add, Text, center ym-10 x12 y339 w180 h20 0x200, Address Line 2
Gui, MultiLabel:Add, Text, center ym-10 x12 y289 w180 h20 0x200, Address Line 1 *
Gui, MultiLabel:Add, Text, center ym-10 x12 y189 w180 h20 0x200, Customer Name *
Gui, MultiLabel:Add, Button, x12 y739 w180 h20 Default gOutputVarMultiLabel vOutputVarMultiLabel, Enter Info for Packages
Gui, MultiLabel:Font, underline s14, w700
Gui, MultiLabel:Add, Text, ym-10 x30 y149 w180 h30 0x200, Customer Info
Gui, MultiLabel:Add, Picture, ym-10 x150 y152 h25 w25 gRunAddy, %A_ScriptDir%\images\paste1.jpg
Gui, MultiLabel:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Multi E-Label - UPS

; Need to add the output checker to make sure values are correct. then send to MultiPackageLoop


Gui, theMenu:destroy
Gui, theMenu1:destroy
Gui, help:destroy
Gui, SingleLabel:destroy
Gui, MultiLoop:destroy

return



OutputVarMultiLabel:
GuiControl, disable, OutputVarMultiLabel
Gui, Submit, NoHide

if (Attempts = "1 Pickup Attempt")
AttemptNum = 1
else if (Attempts = "3 Pickup Attempts")
AttemptNum = 3


emptyfields = Name, AddressLine1, CityName, ZipCode 
loop, parse, emptyfields, `,, %A_Space% 				; loop through the list
{
	GuiControlGet, OutputVarMultiLabel, Enabled, %A_LoopField%
		If !(%A_LoopField%) && OutputVarMultiLabel ; if the value of the variable whose name is saved in A_LoopField is empty and is enabled
		{
		if A_LoopField = Name
			{
			required = Customer Name
			}
			else if A_LoopField = AddressLine1
			{
			required = Address Line 1
			}
			else if A_LoopField = CityName
			{
			required = City Name
			}
			else if A_LoopField = ZipCode
			{
			required = Zip Code
			}

			MsgBox A required field is empty: %required%	; show error message
			GuiControl, enable, OutputVarMultiLabel
			return						; stop
		}
}
;~ ; if you're here then all vars are not empty
if (NumberOfPackages = "Select One")
{
MsgBox A required field is empty: Number of Packages	; show error message
GuiControl, enable, OutputVarMultiLabel
			return						; stop
		}
		
		; Time to check the values to make sure the following contain only digits.

if ZipCode is not digit
{
MsgBox, The zip code field may only contain digits.
GuiControl, enable, OutputVarMultiLabel
Return
}

; Time to check the values to make sure that we're within the max parameters for the UPS fields.

StringLen, addonelength, AddressLine1
if (addonelength > 35)
{
MsgBox, The max length for address line 1 is 35 characters.
GuiControl, enable, OutputVarMultiLabel
Return
}

StringLen, addtwolength, AddressLine2
if (addtwolength > 35)
{
	msgbox, The max length for address line 2 is 35 characters.
GuiControl, enable, OutputVarMultiLabel
Return
}

StringLen, namelength, Name
if (namelength > 35)
{
MsgBox, The max length for customer name is 35 characters.
GuiControl, enable, OutputVarMultiLabel
Return
}

StringLen, ziplength, ZipCode
if (ziplength > 5)
{
MsgBox, The max length for zip code is 5 digits.
GuiControl, enable, OutputVarMultiLabel
Return
}

StringLen, phonelength, Phone
if (phonelength > 15)
{
MsgBox, The max length for phone number is 15 characters.
GuiControl, enable, OutputVarMultiLabel
Return
}

multiPkg = 1

gosub, MultiPackageLoop
return 


MultiPackageLoop:
WinGetPos, Xpos, Ypos

Gui, MultiLoop:+AlwaysOnTop
height = 800
GuiWidth = 206

loopy = 299
loopytext = 279
loopytitle = 249

Gui, MultiLoop:Color, FFFFFF
Gui, MultiLoop:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
if (Service = "UPS Ground Service") || (AddType = "")
{
Gui, MultiLoop:Add, DropDownList, x40 y209 w120 h100 vService, UPS Ground Service||UPS Next Day Air|UPS 3 Day Select ; Select Service, UPS Ground Service is default. Add double pipes after selection that should be default.
}
else if (Service = "UPS Next Day Air")
{
Gui, MultiLoop:Add, DropDownList, x40 y209 w180 h100 vService, UPS Ground Service|UPS Next Day Air||UPS 3 Day Select ; Select Service, UPS Ground Service is default. Add double pipes after selection that should be default.
}
else if (Service = "UPS 3 Day Select")
{
Gui, MultiLoop:Add, DropDownList, x40 y209 w180 h100 vService, UPS Ground Service|UPS Next Day Air|UPS 3 Day Select|| ; Select Service, UPS Ground Service is default. Add double pipes after selection that should be default.
}
else
{
Gui, MultiLoop:Add, DropDownList, x12 y209 w180 h100 vService, UPS Ground Service||UPS Next Day Air|UPS 3 Day Select ; Select Service, UPS Ground Service is default. Add double pipes after selection that should be default.
}
Gui, MultiLoop:Add, Edit, x12 y259 w180 h20 number Limit8 vOrderNumber, %OrderNumber% ; Enter Order Number
Gui, MultiLoop:Add, Edit, x12 y309 w180 h20 Limit35 vMerchDescription, %MerchDescription% ; Enter Merch Description

Loop, %NumberOfPackages%
{

loopy := loopy + 80
loopytext := loopytext + 80

Gui, MultiLoop:Font, s9, w700

Gui, MultiLoop:Add, Edit, x60 y%loopy% w80 h20 number Limit3 vWeight%A_index% ; Enter Package Weight
Gui, MultiLoop:Add, Text, center ym-10 x60 y%loopytext% w80 h20 0x200, Weight *

}

Gui, MultiLoop:Font, s10, w700
Gui, MultiLoop:Add, Text, center ym-10 x12 y109 w180 h40 0x200 cBlue gAmulti v_SingleLabel, Back to Customer Info
Gui, MultiLoop:Font, s9, w700
Gui, MultiLoop:Add, Text, center ym-10 x12 y189 w180 h20 0x200, Service Type
Gui, MultiLoop:Add, Text, center ym-10 x12 y239 w180 h20 0x200, Order Number *
Gui, MultiLoop:Add, Text, center ym-10 x12 y289 w180 h20 0x200, Merch Description *

Gui, MultiLoop:Add, Text, center ym-10 x12 y769 w180 h20 0x200, * is a required field
Gui, MultiLoop:Add, Button, x12 y739 w180 h20 Default gOutputVarMultiFinish vOutputVarMultiFinish, Get Return Shipping Labels
Gui, MultiLoop:Font, underline s14, w700
Gui, MultiLoop:Add, Text, center ym-10 x12 y149 w180 h30 0x200, Return Info


Loop, %NumberOfPackages%
{
loopytitle := loopytitle + 80
Gui, MultiLoop:Font, underline s10, w700 
Gui, MultiLoop:Add, Text, center ym-10 x12 y%loopytitle% w180 h30 0x200, Package %A_index% Info
}

Gui, MultiLoop:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%,Package Info - Multi E-Label - UPS

subButton = OutputVarMultiFinish

Gui, MultiLabel:destroy
Gui, theMenu:destroy
Gui, theMenu1:destroy
Gui, SingleLabel:destroy
Gui, MultiPickup:destroy
return

OutputVarMultiFinish:
GuiControl, disable, OutputVarMultiFinish
Gui, Submit, NoHide

if NumberOfPackages = 2
emptyfields = OrderNumber, MerchDescription, Weight1, Weight2,
else if NumberOfPackages = 3
emptyfields = OrderNumber, MerchDescription, Weight1, Weight2, Weight3,
else if NumberOfPackages = 4
emptyfields = OrderNumber, MerchDescription, Weight1, Weight2, Weight3, Weight4,
else if NumberOfPackages = 5
emptyfields = OrderNumber, MerchDescription, Weight1, Weight2, Weight3, Weight4, Weight5,


; Time to check the values to make sure the following contain only digits.


if Weight1 is not digit
{
MsgBox, The weight field for Package 1 may only contain digits.
GuiControl, enable, OutputVarMultiFinish
Return
}

if Weight2 is not digit
{
MsgBox, The weight field for Package 2may only contain digits.
GuiControl, enable, OutputVarMultiFinish
Return
}

if Weight3 is not digit
{
MsgBox, The weight field for Package 3 may only contain digits.
GuiControl, enable, OutputVarMultiFinish
Return
}

if Weight4 is not digit
{
MsgBox, The weight field for Package 4 may only contain digits.
GuiControl, enable, OutputVarMultiFinish
Return
}

if Weight5 is not digit
{
MsgBox, The weight field for Package 5 may only contain digits.
GuiControl, enable, OutputVarMultiFinish
Return
}

StringLen, citylength, CityName
if (citylength > 35)
{
MsgBox, The max length for the City name is 35 characters.
GuiControl, enable, OutputVarMultiFinish
Return
}

if OrderNumber is not digit
{
MsgBox, The order number field may only contain digits.
GuiControl, enable, OutputVarMultiFinish
Return
}

; Time to check the values to make sure that we're within the max parameters for the UPS fields.

StringLen, merchlength, MerchDescription
if (merchlength > 35)
{
MsgBox, The max length for merchandise description is 35 characters.
GuiControl, enable, OutputVarMultiFinish
Return
}

StringLen, orderlength, OrderNumber
if (orderlength > 8)
{
MsgBox, The max length for order number is 8 digits.
GuiControl, enable, OutputVarMultiFinish
Return
}

if (Weight1 > 150)
{
MsgBox, The max weight for Package 1 is 150 lbs.
GuiControl, enable, OutputVarMultiFinish
Return
}

if (Weight2 > 150)
{
MsgBox, The max weight for Package 2 is 150 lbs.
GuiControl, enable, OutputVarMultiFinish
Return
}

if (Weight3 > 150)
{
MsgBox, The max weight for Package 3 is 150 lbs.
GuiControl, enable, OutputVarMultiFinish
Return
}

if (Weight4 > 150)
{
MsgBox, The max weight for Package 4 is 150 lbs.
GuiControl, enable, OutputVarMultiFinish
Return
}

if (Weight5 > 150)
{
MsgBox, The max weight for Package 5 is 150 lbs.
GuiControl, enable, OutputVarMultiFinish
Return
}

if (Service = "UPS Ground Service")
{
serviceType = 5
}
else if (Service = "UPS Next Day Air Early")
{
serviceType = 1
}
else if (Service = "UPS Next Day Air")
{
serviceType = 2
}
else if (Service = "UPS 2nd Day Air")
{
serviceType = 3
}
else if (Service = "UPS 3 Day Select")
{
serviceType = 4
}

if (Attempts = "3 Pickup Attempts")
{
AttemptNum = 3
}
else if (Attempts = "1 Pickup Attempt")
{
AttemptNum = 1
}


;~ ; if you're here then all vars are not empty

gosub, Go
return 

Link2:
WinGetPos, Xpos, Ypos	
Gui, SinglePickup:+AlwaysOnTop
height = 800
GuiWidth = 206

Gui, SinglePickup:Color, FFFFFF
Gui, SinglePickup:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, SinglePickup:Add, Edit, x12 y209 w180 h20 Limit35 vName, %Name% ; Enter Customer Name
Gui, SinglePickup:Add, Edit, x12 y259 w180 h20 Limit15 vPhone, %Phone% ; Enter Phone Number
Gui, SinglePickup:Add, Edit, x12 y309 w180 h20 Limit35 vAddressLine1, %AddressLine1% ; Enter Address Line 1
Gui, SinglePickup:Add, Edit, x12 y359 w180 h20 Limit35 vTestVar3, %TestVar3% ; Enter Address Line 2
Gui, SinglePickup:Add, Edit, x12 y409 w180 h20 Limit35 vCityName, %CityName% ; Enter City Name
Gui, SinglePickup:Add, Edit, x12 y459 w80 h20 Limit5 Number vZipCode, %ZipCode% ; Enter Zip Code

; Display the previously selected address type with the following If statement.

if (AddType = "Residential") || (AddType = "")
{
Gui, SinglePickup:Add, DropDownList, x110 y459 w80 h100 vAddType, Residential||Business ; Select Address Type, Residential is default selection. Add double pipes after selection that should be default.
}
else 
{
Gui, SinglePickup:Add, DropDownList, x110 y459 w80 h100 vAddType, Residential|Business|| ; Select Address Type, Residential is default selection. Add double pipes after selection that should be default.
}

if (Attempts = "1") || (AddType = "")
{
Gui, SinglePickup:Add, DropDownList, x40 y549 w125 h100 vAttempts, 1 Pickup Attempt||3 Pickup Attempts ; Select Attempts. 3 attempts is default. Add double pipes after selection that should be default.

}
else
{
Gui, SinglePickup:Add, DropDownList, x40 y549 w125 h100 vAttempts, 3 Pickup Attempts||1 Pickup Attempt ; Select Attempts. 3 attempts is default. Add double pipes after selection that should be default.
}

; Display the previously selected service type with the following If statement.

if (Service = "UPS Ground Service") || (AddType = "")
{
Gui, SinglePickup:Add, DropDownList, x40 y599 w125 h100 vService, UPS Ground Service||UPS Next Day Air|UPS 3 Day Select ; Select Service, UPS Ground Service is default. Add double pipes after selection that should be default.
}
else if (Service = "UPS Next Day Air")
{
Gui, SinglePickup:Add, DropDownList, x40 y599 w125 h100 vService, UPS Ground Service|UPS Next Day Air||UPS 3 Day Select ; Select Service, UPS Ground Service is default. Add double pipes after selection that should be default.
}
else if (Service = "UPS 3 Day Select")
{
Gui, SinglePickup:Add, DropDownList, x40 y599 w125 h100 vService, UPS Ground Service|UPS Next Day Air|UPS 3 Day Select|| ; Select Service, UPS Ground Service is default. Add double pipes after selection that should be default.
}

Gui, SinglePickup:Add, Edit, x12 y649 w80 h20 Limit3 Number vWeight, %Weight% ; Enter Package Weight
Gui, SinglePickup:Add, Edit, x110 y649 w80 h20 vOrderNumber, %OrderNumber% ; Enter Order Number
Gui, SinglePickup:Add, Edit, x60 y699 w80 h20 Limit35 vMerchDescription, %MerchDescription% ; Enter Merch Description




; Rep name is added by default.
; Zip code will determine the city and state that will be entered on the UPS website.

Gui, SinglePickup:Font, s10, w700
Gui, SinglePickup:Add, Text, center ym-10 x12 y109 w180 h40 0x200 cBlue gmultiPickup v_MultiPickup, Click here for multi-pickups
Gui, SinglePickup:Font, s9, w700
Gui, SinglePickup:Add, Text, center ym-10 x12 y779 w180 h20 0x200, * is a required field
Gui, SinglePickup:Add, Text, center ym-10 x60 y629 w180 h20 0x200, Order Number *
Gui, SinglePickup:Add, Text, center ym-10 x12 y579 w180 h20 0x200, Service Type
Gui, SinglePickup:Add, Text, center ym-10 x12 y529 w180 h20 0x200, Pickup Attempts
Gui, SinglePickup:Add, Text, center ym-10 x110 y629 w80 h20 0x200, Order Number *
Gui, SinglePickup:Font, s10, w700
Gui, SinglePickup:Font, s9, w700
Gui, SinglePickup:Add, Text, center ym-10 x60 y679 w80 h20 0x200, Merch Desc *
Gui, SinglePickup:Add, Text, center ym-10 x12 y+30 w180 h20 0x200 cBlue gTCCalc vTCCalc, Time && Cost Calculator
Gui, SinglePickup:Add, Text, ym-10 x17 y629 w80 h20 0x200, Total Weight *
Gui, SinglePickup:Add, Text, center ym-10 x12 y239 w180 h20 0x200, Phone Number
Gui, SinglePickup:Add, Text, center ym-10 x107 y439 w80 h20 0x200, Address Type
Gui, SinglePickup:Add, Text, center ym-10 x12 y439 w80 h20 0x200, Zip Code *
Gui, SinglePickup:Add, Text, center ym-10 x12 y389 w180 h20 0x200, City *
Gui, SinglePickup:Add, Text, center ym-10 x12 y339 w180 h20 0x200, Address Line 2
Gui, SinglePickup:Add, Text, center ym-10 x12 y289 w180 h20 0x200, Address Line 1 *
Gui, SinglePickup:Add, Text, center ym-10 x12 y189 w180 h20 0x200, Customer Name *
Gui, SinglePickup:Add, Button, x12 y755 w180 h20 Default gSinglePickupOutputVar vSinglePickupOutputVar, Schedule Return Pickup
Gui, SinglePickup:Font, underline s14, w700
Gui, SinglePickup:Add, Text, ym-10 x30 y149 w180 h30 0x200, Customer Info
Gui, SinglePickup:Add, Picture, ym-10 x150 y152 h25 w25 gRunAddy, %A_ScriptDir%\images\paste1.jpg
Gui, SinglePickup:Add, Text, center ym-10 x12 y489 w180 h30 0x200, Return Info
Gui, SinglePickup:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Schedule Pickup - UPS

; Function from OutputVar, if noEarly equals 1, we're not going to proceed with processing the info, instead letting the rep know that the zip code does not have early NDA delivery available.

if (noEarly = 1)
{
Msgbox, Next Day Early is not available for Zip Code: %ZipCode%.`nPlease select a different service.
}

Gui, theMenu:destroy
Gui, theMenu1:destroy
Gui, MultiLabel:destroy
Return

Link3:
WinGetPos, Xpos, Ypos
MsgBox, Coming Soon!
Return

Link4:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

Gui, sample1:+AlwaysOnTop
Gui, sample1:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, sample1:Color, FFFFFF
Gui, sample1:Font, S14, w700
Gui, sample1:Add, Text, center x12 y+20 w180 CRed, Do not set up a blank sample return if:
Gui, sample1:Add, Picture, w206 y+20 h-1 gMenu, %A_ScriptDir%\images\stop.jpg
Gui, sample1:Font, S10, w700
Gui, sample1:Add, Text, center x12 y+20 w180, 1) The total blank cost is less than $15. (We can refund the payment but do not need to schedule a return.) 
Gui, sample1:Add, Text, center x12 y+20 w180, 2) The blank samples are In Progress. You can create the label if the order is In Transit or Delivered. 
Gui, sample1:Add, Text, center x12 y+20 w180, 3) This is a bulk blanks order (6+) with a problem (quality, sizing, etc)
Gui, sample1:Font, S8, w700
Gui, sample1:Add, Text, center x12 y+20 w180 CBlue gWiki, Source - https://goo.gl/vMN7WN
Gui, sample1:Font, S20, w700
Gui, sample1:Add, Text, center x12 y+40 w180 gSampleContinue CGreen, Click Here to Continue
Gui, sample1:Font, S10, w700
Gui, sample1:Add, Text, center ym-10 x12 y769 w180 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, sample1:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Help/FAQ - UPS

Gui, theMenu1:destroy
Return
overrideZip:
Gui, Zip:Color, FFFFFF
Gui, Zip:Font, S12,
Gui, Zip:Add, Text, x0 y20 w300 h30 Center, Zip Code Override
Gui, Zip:Add, DropDownList, x20 y60 w260 h200 vZipState, Select a State||Alaska|Alabama|Arkansas|Arizona|California|Colorado|Connecticut|District of Columbia|Delaware|Florida|Georgia|Hawaii|Iowa|Idaho|Illinois|Indiana|Kansas|Kentucky|Louisiana|Massachusetts|Maryland|Maine|Michigan|Minnesota|Missouri|Mississippi|Montana|North Carolina|North Dakota|Nebraska|New Hampshire|New Jersey|New Mexico|Nevada|New York|Ohio|Oklahoma|Oregon|Pennsylvania|Rhode Island|South Carolina|South Dakota|Tennessee|Texas|Utah|Virginia|Vermont|Rhode Island|Washington|Wisconsin|West Virginia|Wyoming
Gui, Zip:Add, Text, x0 y270 w300 h20 Center altSubmit gzipProceed, Proceed
Gui, Zip:Show, Center AutoSize, Select a State
Return


zipProceed:
Gui, Zip:Submit, Hide

if (ZipState = "Select a State")
msgbox, Please select a state and try again.

if (zipState = "Alaska")
{
loginname = SS_West
theState = 2
}
else if (zipState = "Alabama")
{
loginname = sales_service
theState = 1
}
else if (zipState = "Arkansas")
{
loginname = SS_West
theState = 4
}
else if (zipState = "Arizona")
{
loginname = SS_West
theState = 3
}
else if (zipState = "California")
{
loginname = SS_West
theState = 5
}
else if (zipState = "Colorado")
{
loginname = SS_West
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
loginname = SS_West
theState = 12
}
else if (zipState = "Iowa")
{
loginname = SS_West
theState = 16
}
else if (zipState = "Idaho")
{
loginname = SS_West
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
loginname = SS_West
theState = 17
}
else if (zipState = "Kentucky")
{
loginname = sales_service
theState = 18
}
else if (zipState = "Louisiana")
{
loginname = SS_West
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
loginname = SS_West
theState = 24
}
else if (zipState = "Missouri")
{
loginname = SS_West
theState = 26
}
else if (zipState = "Mississippi")
{
loginname = sales_service
theState = 25
}
else if (zipState = "Montana")
{
loginname = SS_West
theState = 27
}
else if (zipState = "North Carolina")
{
loginname = sales_service
theState = 34
}
else if (zipState = "North Dakota")
{
loginname = SS_West
theState = 35
}
else if (zipState = "Nebraska")
{
loginname = SS_West
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
loginname = SS_West
theState = 32
}
else if (zipState = "Nevada")
{
loginname = SS_West
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
loginname = SS_West
theState = 37
}
else if (zipState = "Oregon")
{
loginname = SS_West
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
loginname = SS_West
theState = 44
}
else if (zipState = "Utah")
{
loginname = SS_West
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
loginname = SS_West
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
loginname = SS_West
theState = 51
}

if (zipState)
{
WinShow, %hideTitle%
Gui, Zip:destroy
}

gosub, preLogin

Return


Wiki:
direction = https://goo.gl/vMN7WN
Run, %direction%

SampleContinue:
WinGetPos, Xpos, Ypos	
Gui, SingleSampleLabel:+AlwaysOnTop
height = 800
GuiWidth = 206

Gui, SingleSampleLabel:Color, FFFFFF
Gui, SingleSampleLabel:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, SingleSampleLabel:Add, Edit, x12 y209 w180 h20 Limit35 vName, %Name% ; Enter Customer Name
Gui, SingleSampleLabel:Add, Edit, x12 y259 w180 h20 Limit15 vPhone, %Phone% ; Enter Phone Number
Gui, SingleSampleLabel:Add, Edit, x12 y309 w180 h20 Limit35 vAddressLine1, %AddressLine1% ; Enter Address Line 1
Gui, SingleSampleLabel:Add, Edit, x12 y359 w180 h20 Limit35 vTestVar3, %TestVar3% ; Enter Address Line 2
Gui, SingleSampleLabel:Add, Edit, x12 y409 w180 h20 Limit35 vCityName, %CityName% ; Enter City Name
Gui, SingleSampleLabel:Add, Edit, x12 y459 w80 h20 Limit5 Number vZipCode, %ZipCode% ; Enter Zip Code

; Display the previously selected address type with the following If statement.

if (AddType = "Residential") || (AddType = "")
{
Gui, SingleSampleLabel:Add, DropDownList, x110 y459 w80 h100 vAddType, Residential||Business ; Select Address Type, Residential is default selection. Add double pipes after selection that should be default.
}
else 
{
Gui, SingleSampleLabel:Add, DropDownList, x110 y459 w80 h100 vAddType, Residential|Business|| ; Select Address Type, Residential is default selection. Add double pipes after selection that should be default.
}

Gui, SingleSampleLabel:Add, Edit, x12 y549 w80 h20 Limit3 Number vWeight, %Weight% ; Enter Package Weight
Gui, SingleSampleLabel:Add, Edit, x110 y549 w80 h20 vOrderNumber, %OrderNumber% ; Enter Order Number
Gui, SingleSampleLabel:Add, Edit, x12 y599 w180 h20 Limit35 vMerchDescription, %MerchDescription% ; Enter Merch Description



; Rep name is added by default.
; Zip code will determine the city and state that will be entered on the UPS website.

Gui, SingleSampleLabel:Font, s10, w700
; -Gui, SingleSampleLabel:Add, Text, center ym-10 x12 y109 w180 h40 0x200 cBlue gtheMultiSampleLabel v_MultiPkg, Click here for multi-labels
Gui, SingleSampleLabel:Font, s9, w700
Gui, SingleSampleLabel:Add, Text, center ym-10 x12 y709 w180 h20 0x200, * is a required field
Gui, SingleSampleLabel:Add, Text, center ym-10 x60 y529 w180 h20 0x200, Order Number *
Gui, SingleSampleLabel:Add, Text, center ym-10 x12 y579 w180 h20 0x200, Merch Description *
Gui, SingleSampleLabel:Add, Text, ym-10 x17 y529 w80 h20 0x200, Total Weight *
Gui, SingleSampleLabel:Add, Text, center ym-10 x12 y239 w180 h20 0x200, Phone Number
Gui, SingleSampleLabel:Add, Text, center ym-10 x107 y439 w80 h20 0x200, Address Type
Gui, SingleSampleLabel:Add, Text, center ym-10 x12 y439 w80 h20 0x200, Zip Code *
Gui, SingleSampleLabel:Add, Text, center ym-10 x12 y389 w180 h20 0x200, City *
Gui, SingleSampleLabel:Add, Text, center ym-10 x12 y339 w180 h20 0x200, Address Line 2
Gui, SingleSampleLabel:Add, Text, center ym-10 x12 y289 w180 h20 0x200, Address Line 1 *
Gui, SingleSampleLabel:Add, Text, center ym-10 x12 y189 w180 h20 0x200, Customer Name *
Gui, SingleSampleLabel:Add, Button, x12 y679 w180 h20 Default gOutputVarSample vOutputVarSample, Get Return Shipping Label
Gui, SingleSampleLabel:Font, S10, w700
Gui, SingleSampleLabel:Add, Text, center ym-10 x12 y769 w180 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, SingleSampleLabel:Font, underline s14, w700
Gui, SingleSampleLabel:Add, Text, center ym-10 x12 y149 w180 h30 0x200, Customer Info
Gui, SingleSampleLabel:Add, Text, center ym-10 x12 y489 w180 h30 0x200, Return Info
Gui, SingleSampleLabel:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Blank Sample E-Label - UPS

Gui, sample1:destroy
Gui, theMenu:destroy
Gui, theMenu1:destroy
Gui, MultiLabel:destroy
Return

OutputVarSample:
GuiControl, disable, OutputVarSample
Gui, Submit, NoHide

; create a list of your the vars that we're checking.

emptyfields = Name, AddressLine1, CityName, ZipCode, Weight, MerchDescription, OrderNumber, 
loop, parse, emptyfields, `,, %A_Space% 				; loop through the list
{
	GuiControlGet, OutputVarSample, Enabled, %A_LoopField%
		If !(%A_LoopField%) && OutputVarSample ; if the value of the variable whose name is saved in A_LoopField is empty and is enabled
		{
			if A_LoopField = Name
			{
			required = Customer Name
			}
			else if A_LoopField = CityName
			{
			required = City Name
			}
			else if A_LoopField = AddressLine1
			{
			required = Address Line 1
			}
			else if A_LoopField = ZipCode
			{
			required = Zip Code
			}
			else if A_LoopField = Weight
			{
			required = Weight
			}
			else if A_LoopField = MerchDescription
			{
			required = Merch Description
			}
			else if A_LoopField = OrderNumber
			{
			required = Order Number
			}
			MsgBox A required field is empty: %required%	; show error message
			GuiControl, enable, OutputVarSample
			return						; stop
		}
}
;~ ; if you're here then all vars are not empty

OrderNumber = %OrderNumber%


; Although we have the digits and lengths declared in the GUI, we also need to double check in case this info's been pasted. Time to check the values to make sure the following contain only digits.

if Declared is not digit
{
MsgBox, The declared value field may only contain digits.
GuiControl, enable, OutputVarSample
Return
}

if ZipCode is not digit
{
MsgBox, The zip code field may only contain digits.
GuiControl, enable, OutputVarSample
Return
}

if Weight is not digit
{
MsgBox, The weight field may only contain digits.
GuiControl, enable, OutputVarSample
Return
}

if OrderNumber is not digit
{
MsgBox, The order number field may only contain digits.
GuiControl, enable, OutputVarSample
Return
}

; Although we have the digits and lengths declared in the GUI, we also need to double check in case this info's been pasted. Time to check the values to make sure that we're within the max parameters for the UPS fields.

if (Declared > 1000)
{
MsgBox, The max declared value is $1000.
GuiControl, enable, OutputVarSample
Return
}

StringLen, addonelength, AddressLine1
if (addonelength > 35)
{
MsgBox, The max length for address line 1 is 35 characters.
GuiControl, enable, OutputVarSample
Return
}

StringLen, addtwolength, AddressLine2
if (addtwolength > 35)
{
MsgBox, The max length for address line 2 is 35 characters.
GuiControl, enable, OutputVarSample
Return
}

StringLen, citylength, CityName
if (citylength > 35)
{
MsgBox, The max length for the City name is 35 characters.
GuiControl, enable, OutputVarSample
Return
}

StringLen, namelength, Name
if (namelength > 35)
{
MsgBox, The max length for customer name is 35 characters.
GuiControl, enable, OutputVarSample
Return
}

StringLen, ziplength, ZipCode
if (ziplength > 5)
{
MsgBox, The max length for zip code is 5 digits.
GuiControl, enable, OutputVarSample
Return
}

StringLen, phonelength, Phone
if (phonelength > 15)
{
MsgBox, The max length for phone number is 15 characters.
GuiControl, enable, OutputVarSample
Return
}

StringLen, merchlength, MerchDescription
if (merchlength > 35)
{
MsgBox, The max length for merchandise description is 35 characters.
GuiControl, enable, OutputVarSample
Return
}

StringLen, orderlength, OrderNumber
if (orderlength > 8)
{
MsgBox, The max length for order number is 8 digits.
GuiControl, enable, OutputVarSample
Return
}

if (Weight > 150)
{
MsgBox, The max weight is 150 lbs.
GuiControl, enable, OutputVarSample
Return
}

NumberOfPackages = 1
sampleReturn = yes
gosub, Go
return 


theMultiSampleLabel:
WinGetPos, Xpos, Ypos
Gui, MultiLabel:+AlwaysOnTop
height = 800
GuiWidth = 206


Gui, MultiSampleLabel:Color, FFFFFF
Gui, MultiSampleLabel:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, MultiSampleLabel:Add, Edit, x12 y209 w180 h20 vName, %Name% ; Enter Customer Name
Gui, MultiSampleLabel:Add, Edit, x12 y259 w180 h20 vPhone, %Phone% ; Enter Phone Number
Gui, MultiSampleLabel:Add, Edit, x12 y309 w180 h20 vAddressLine1, %AddressLine1% ; Enter Address Line 1
Gui, MultiSampleLabel:Add, Edit, x12 y359 w180 h20 vTestVar3, %TestVar3%  ; Enter Address Line 2
Gui, MultiSampleLabel:Add, Edit, x12 y409 w180 h20 vCityName, %CityName% ; Enter City Name
Gui, MultiSampleLabel:Add, Edit, x12 y459 w80 h20 Limit5 Number vZipCode, %ZipCode% ; Enter Zip Code

if ((AddType = "Residential") || (AddType = ""))
{
Gui, MultiSampleLabel:Add, DropDownList, x110 y459 w80 h100 vAddType, Residential||Business ; Select Address Type, Residential is default selection. Add double pipes after selection that should be default.
}
else 
{
Gui, MultiSampleLabel:Add, DropDownList, x110 y459 w80 h100 vAddType, Residential|Business|| ; Select Address Type, Residential is default selection. Add double pipes after selection that should be default.
}
Gui, MultiSampleLabel:Add, DropDownList, x12 y539 w180 h200 vNumberOfPackages, Select One||2|3|4|5 ; Select # of Packages, Select One is default, will not process unless numerical value selected.


; Rep name is added by default.
; Zip code will determine the city and state that will be entered on the UPS website.

Gui, MultiSampleLabel:Font, s10, w700
Gui, MultiSampleLabel:Add, Text, center ym-10 x12 y109 w180 h40 0x200 cBlue gLink1 v_SingleLabel, Back to Single E-Label
Gui, MultiSampleLabel:Font, s9, w700
Gui, MultiSampleLabel:Add, Text, center ym-10 x12 y519 w180 h20 0x200,  Select Number of Packages *
Gui, MultiSampleLabel:Add, Text, center ym-10 x12 y239 w180 h20 0x200, Phone Number
Gui, MultiSampleLabel:Add, Text, center ym-10 x107 y439 w80 h20 0x200, Address Type
Gui, MultiSampleLabel:Add, Text, center ym-10 x12 y439 w80 h20 0x200, Zip Code *
Gui, MultiSampleLabel:Add, Text, center ym-10 x12 y389 w180 h20 0x200, City *
Gui, MultiSampleLabel:Add, Text, center ym-10 x12 y339 w180 h20 0x200, Address Line 2
Gui, MultiSampleLabel:Add, Text, center ym-10 x12 y289 w180 h20 0x200, Address Line 1 *
Gui, MultiSampleLabel:Add, Text, center ym-10 x12 y189 w180 h20 0x200, Customer Name *
Gui, MultiSampleLabel:Add, Button, x12 y739 w180 h20 Default gOutputVarMultiSampleLabel vSampleReturn, Enter Info for Packages
Gui, MultiSampleLabel:Font, underline s14, w700
Gui, MultiSampleLabel:Add, Text, center ym-10 x12 y149 w180 h30 0x200, Customer Info
Gui, MultiSampleLabel:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Multi Blank Sample E-Label - UPS

; Need to add the output checker to make sure values are correct. then send to MultiPackageLoop

Gui, sample1:destroy
Gui, SingleSampleLabel:destroy


return

OutputVarMultiSampleFinish:
GuiControl, disable, OutputVarMultiSampleFinish
Gui, MultiLoop:Submit, NoHide


if NumberOfPackages = 2
{
emptyfields = OrderNumber, MerchDescription, Weight1, Weight2,
}
else if NumberOfPackages = 3
{
emptyfields = OrderNumber, MerchDescription, Weight1, Weight2, Weight3,
}
else if NumberOfPackages = 4
{
emptyfields = OrderNumber, MerchDescription, Weight1, Weight2, Weight3, Weight4,
}
else if NumberOfPackages = 5
{
emptyfields = OrderNumber, MerchDescription, Weight1, Weight2, Weight3, Weight4, Weight5,
}

loop, parse, emptyfields, `,, %A_Space% 				; loop through the list
{
	GuiControlGet, OutputVarMultiSampleFinish, Enabled, %A_LoopField%
		If !(%A_LoopField%) && OutputVarMultiSampleFinish ; if the value of the variable whose name is saved in A_LoopField is empty and is enabled
		{
		if A_LoopField = OrderNumber
			{
			required = Order Number
			}
			else if A_LoopField = MerchDescription
			{
			required = Merch Description
			}
			else if A_LoopField = Weight1
			{
			required = Package Weight 1
			}
			else if A_LoopField = Weight2
			{
			required = Package Weight 2
			}
			else if A_LoopField = Weight3
			{
			required = Package Weight 3
			}
			else if A_LoopField = Weight4
			{
			required = Package Weight 4
			}
			else if A_LoopField = Weight5
			{
			required = Package Weight 5
			}
			MsgBox A required field is empty: %required%	; show error message
			GuiControl, enable, OutputVarMultiSampleFinish
			return						; stop
		}
}

; Time to check the values to make sure the following contain only digits.

if Declared1 is not digit
{
MsgBox, The declared value field for Package 1 may only contain digits.
GuiControl, enable, OutputVarMultiSampleFinish
Return
}

if Declared2 is not digit
{
MsgBox, The declared value field for Package 2 may only contain digits.
GuiControl, enable, OutputVarMultiSampleFinish
Return
}

if Declared3 is not digit
{
MsgBox, The declared value field for Package 3 may only contain digits.
GuiControl, enable, OutputVarMultiSampleFinish
Return
}

if Declared4 is not digit
{
MsgBox, The declared value field for Package 4 may only contain digits.
GuiControl, enable, OutputVarMultiSampleFinish
Return
}

if Declared5 is not digit
{
MsgBox, The declared value field for Package 5 may only contain digits.
GuiControl, enable, OutputVarMultiSampleFinish
Return
}

if Weight1 is not digit
{
MsgBox, The weight field for Package 1 may only contain digits.
GuiControl, enable, OutputVarMultiSampleFinish
Return
}

if Weight2 is not digit
{
MsgBox, The weight field for Package 2may only contain digits.
GuiControl, enable, OutputVarMultiSampleFinish
Return
}

if Weight3 is not digit
{
MsgBox, The weight field for Package 3 may only contain digits.
GuiControl, enable, OutputVarMultiSampleFinish
Return
}

if Weight4 is not digit
{
MsgBox, The weight field for Package 4 may only contain digits.
GuiControl, enable, OutputVarMultiSampleFinish
Return
}

if Weight5 is not digit
{
MsgBox, The weight field for Package 5 may only contain digits.
GuiControl, enable, OutputVarMultiSampleFinish
Return
}

StringLen, citylength, CityName
if (citylength > 35)
{
MsgBox, The max length for the City name is 35 characters.
GuiControl, enable, OutputVar
Return
}

if OrderNumber is not digit
{
MsgBox, The order number field may only contain digits.
GuiControl, enable, OutputVarMultiSampleFinish
Return
}

; Time to check the values to make sure that we're within the max parameters for the UPS fields.

if (Declared1 > 1000)
{
MsgBox, The max declared value for Package 1 is $1000.
GuiControl, enable, OutputVarMultiSampleFinish
Return
}

if (Declared2 > 1000)
{
MsgBox, The max declared value for Package 2 is $1000.
GuiControl, enable, OutputVarMultiSampleFinish
Return
}

if (Declared3 > 1000)
{
MsgBox, The max declared value for Package 3 is $1000.
GuiControl, enable, OutputVarMultiSampleFinish
Return
}

if (Declared4 > 1000)
{
MsgBox, The max declared value for Package 4 is $1000.
GuiControl, enable, OutputVarMultiSampleFinish
Return
}

if (Declared5 > 1000)
{
MsgBox, The max declared value for Package 5 is $1000.
GuiControl, enable, OutputVarMultiSampleFinish
Return
}

StringLen, merchlength, MerchDescription
if (merchlength > 35)
{
MsgBox, The max length for merchandise description is 35 characters.
GuiControl, enable, OutputVarMultiSampleFinish
Return
}

StringLen, orderlength, OrderNumber
if (orderlength > 8)
{
MsgBox, The max length for order number is 8 digits.
GuiControl, enable, OutputVarMultiSampleFinish
Return
}

if (Weight1 > 150)
{
MsgBox, The max weight for Package 1 is 150 lbs.
GuiControl, enable, OutputVarMultiSampleFinish
Return
}

if (Weight2 > 150)
{
MsgBox, The max weight for Package 2 is 150 lbs.
GuiControl, enable, OutputVarMultiSampleFinish
Return
}

if (Weight3 > 150)
{
MsgBox, The max weight for Package 3 is 150 lbs.
GuiControl, enable, OutputVarMultiSampleFinish
Return
}

if (Weight4 > 150)
{
MsgBox, The max weight for Package 4 is 150 lbs.
GuiControl, enable, OutputVarMultiSampleFinish
Return
}

if (Weight5 > 150)
{
MsgBox, The max weight for Package 5 is 150 lbs.
GuiControl, enable, OutputVarMultiSampleFinish
Return
}


;~ ; if you're here then all vars are not empty
sampleReturn = yes
gosub, Go
return 


MultiSampleLoop:
WinGetPos, Xpos, Ypos
Gui, MultiLabel:Submit, NoHide

Gui, MultiLoop:+AlwaysOnTop
height = 800
GuiWidth = 206

loopy = 299
loopytext = 279
loopytitle = 249

Gui, theMultiSampleLoop:Color, FFFFFF
Gui, theMultiSampleLoop:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theMultiSampleLoop:Add, Edit, x12 y259 w180 h20 vOrderNumber, %OrderNumber% ; Enter Order Number
Gui, theMultiSampleLoop:Add, Edit, x12 y309 w180 h20 vMerchDescription, %MerchDescription% ; Enter Merch Description

Loop, %NumberOfPackages%
{

loopy := loopy + 80
loopytext := loopytext + 80

Gui, theMultiSampleLoop:Font, s9, w700

Gui, theMultiSampleLoop:Add, Edit, x12 y%loopy% w80 h20 vWeight%A_index% ; Enter Package Weight
Gui, theMultiSampleLoop:Add, Edit, x110 y%loopy% w80 h20 vDeclared%A_index% ; Enter Declared Value of Package
Gui, theMultiSampleLoop:Add, Text, center ym-10 x110 y%loopytext% w80 h20 0x200, Declared Value
Gui, theMultiSampleLoop:Add, Text, center ym-10 x12 y%loopytext% w80 h20 0x200, Weight *

}

Gui, theMultiSampleLoop:Font, s10, w700
Gui, theMultiSampleLoop:Add, Text, center ym-10 x12 y109 w180 h40 0x200 cBlue gAmulti v_SingleLabel, Back to Customer Info
Gui, theMultiSampleLoop:Font, s9, w700
Gui, theMultiSampleLoop:Add, Text, center ym-10 x12 y189 w180 h20 0x200, Service Type
Gui, theMultiSampleLoop:Add, Text, center ym-10 x12 y239 w180 h20 0x200, Order Number *
Gui, theMultiSampleLoop:Add, Text, center ym-10 x12 y289 w180 h20 0x200, Merch Description *

Gui, theMultiSampleLoop:Add, Text, center ym-10 x12 y769 w180 h20 0x200, * is a required field
Gui, theMultiSampleLoop:Add, Button, x12 y739 w180 h20 Default gOutputVarMultiSampleFinish vOutputVarMultiSampleFinish, Get Return Shipping Labels
Gui, theMultiSampleLoop:Font, underline s14, w700
Gui, theMultiSampleLoop:Add, Text, center ym-10 x12 y149 w180 h30 0x200, Return Info


Loop, %NumberOfPackages%
{
loopytitle := loopytitle + 80
Gui, theMultiSampleLoop:Font, underline s10, w700 
Gui, theMultiSampleLoop:Add, Text, center ym-10 x12 y%loopytitle% w180 h30 0x200, Package %A_index% Info
}

Gui, theMultiSampleLoop:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%,Package Info - Multi E-Label - UPS

Gui, theMultiSampleLoop:Submit, NoHide

Gui, MultiLabel:destroy
Gui, theMenu:destroy
Gui, theMenu1:destroy
Gui, SingleLabel:destroy
Gui, MultiPickup:destroy

return


Link5:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

Gui, help:+AlwaysOnTop
Gui, help:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, help:Color, FFFFFF
Gui, help:Font, S14, w700
Gui, help:Add, Text, center x12 y159 w180, Hey %showNick%, I'm here to help! let's check out some FAQ's below:
Gui, help:Font, S10, w700
Gui, help:Add, Text, center x12 y259 w180 CRed, Q) How do I cancel a return shipping label or pickup?
Gui, help:Add, Text, center x12 y309 w180 CGreen, A) At this time, you would need to manually void out a return shipping label or UPS pickup. You can use the link below to login to the UPS website.
Gui, help:Add, Text, center x12 y419 w180 CBlue gupsLink, Click to visit UPS
Gui, help:Add, Text, center x12 y439 w180, --------------------------------------
Gui, help:Add, Text, center x12 y469 w180 CRed, Q) How do I setup multiple return shipping labels?
Gui, help:Add, Text, center x20 y509 w160 CBlue gaMulti, Click here to setup multiple return shipping labels
Gui, help:Add, Text, center x27 y509 w10 CGreen, A)
Gui, help:Add, Text, center x12 y569 w180, --------------------------------------
Gui, help:Add, Text, center x12 y589 w180 CRed, Q) Why is there no areas to enter the login, city, or state in this tool?
Gui, help:Add, Text, center x12 y659 w180 CGreen, A) This tool automatically selects the correct login, city, and state based on the zip code that you enter.
Gui, help:Add, Text, center x12 y729 w180, --------------------------------------
Gui, help:Font, S10, w700
Gui, help:Add, Text, center ym-10 x12 y749 w180 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, help:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Help/FAQ - UPS

Gui, feedback:destroy
Gui, theMenu:destroy
Gui, theMenu1:destroy
Gui, SinglePickup:destroy
Gui, MultiPickup:destroy
Return

multiPickup:
WinGetPos, Xpos, Ypos
Gui, MultiPickup:+AlwaysOnTop
height = 800
GuiWidth = 206


Gui, MultiPickup:Color, FFFFFF
Gui, MultiPickup:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, MultiPickup:Add, Edit, x12 y209 w180 h20 vName, %Name% ; Enter Customer Name
Gui, MultiPickup:Add, Edit, x12 y259 w180 h20 vPhone, %Phone% ; Enter Phone Number
Gui, MultiPickup:Add, Edit, x12 y309 w180 h20 vAddressLine1, %AddressLine1% ; Enter Address Line 1
Gui, MultiPickup:Add, Edit, x12 y359 w180 h20 vTestVar3, %TestVar3%  ; Enter Address Line 2
Gui, MultiPickup:Add, Edit, x12 y399 w180 h20 vCityName, %CityName% ; Enter city name
Gui, MultiPickup:Add, Edit, x12 y459 w80 h20 Limit5 Number vZipCode, %ZipCode% ; Enter Zip Code

if ((AddType = "Residential") || (AddType = ""))
{
Gui, MultiPickup:Add, DropDownList, x110 y459 w80 h100 vAddType, Residential||Business ; Select Address Type, Residential is default selection. Add double pipes after selection that should be default.
}
else 
{
Gui, MultiPickup:Add, DropDownList, x110 y459 w80 h100 vAddType, Residential|Business|| ; Select Address Type, Residential is default selection. Add double pipes after selection that should be default.
}

if (Attempts = "1") || (AddType = "")
{
Gui, MultiPickup:Add, DropDownList, x40 y529 w125 h100 vAttempts, 1 Pickup Attempt||3 Pickup Attempts ; Select Attempts. 3 attempts is default. Add double pipes after selection that should be default.

}
else
{
Gui, MultiPickup:Add, DropDownList, x40 y529 w125 h100 vAttempts, 3 Pickup Attempts||1 Pickup Attempt ; Select Attempts. 3 attempts is default. Add double pipes after selection that should be default.
}

Gui, MultiPickup:Add, DropDownList, x12 y579 w180 h200 vNumberOfPackages, Select One||2|3|4|5 ; Select # of Packages, Select One is default, will not process unless numerical value selected.


; Rep name is added by default.
; Zip code will determine the city and state that will be entered on the UPS website.

Gui, MultiPickup:Font, s10, w700
Gui, MultiPickup:Add, Text, center ym-10 x12 y109 w180 h40 0x200 cBlue gLink1 v_SinglePickup, Back to Single Pickup
Gui, MultiPickup:Font, s9, w700
Gui, MultiPickup:Add, Text, center ym-10 x12 y769 w180 h20 0x200, * is a required field
Gui, MultiPickup:Add, Text, center ym-10 x12 y509 w180 h20 0x200, Pickup Attempts
Gui, MultiPickup:Add, Text, center ym-10 x12 y559 w180 h20 0x200,  Select Number of Packages *
Gui, MultiPickup:Add, Text, center ym-10 x12 y239 w180 h20 0x200, Phone Number
Gui, MultiPickup:Add, Text, center ym-10 x107 y439 w80 h20 0x200, Address Type
Gui, MultiPickup:Add, Text, center ym-10 x12 y439 w80 h20 0x200, Zip Code *
Gui, MultiPickup:Add, Text, center ym-10 x12 y379 w180 h20 0x200, City *
Gui, MultiPickup:Add, Text, center ym-10 x12 y339 w180 h20 0x200, Address Line 2
Gui, MultiPickup:Add, Text, center ym-10 x12 y289 w180 h20 0x200, Address Line 1 *
Gui, MultiPickup:Add, Text, center ym-10 x12 y189 w180 h20 0x200, Customer Name *
Gui, MultiPickup:Add, Button, x12 y739 w180 h20 Default gOutputVarMultiLabel vOutputVarMultiLabel, Enter Info for Packages
Gui, MultiPickup:Font, underline s14, w700
Gui, MultiPickup:Add, Text, ym-10 x30 y149 w180 h30 0x200, Customer Info
Gui, MultiPickup:Add, Picture, ym-10 x150 y152 h25 w25 gRunAddy, %A_ScriptDir%\images\paste1.jpg
Gui, MultiPickup:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Multi Pickup - UPS

; Need to add the output checker to make sure values are correct. then send to MultiPackageLoop


Gui, theMenu:destroy
Gui, theMenu1:destroy
Gui, help:destroy
Gui, SinglePickup:destroy
Gui, MultiLoop:destroy
Return

SinglePickupOutputVar:
GuiControl, disable, SinglePickupOutputVar
Gui, Submit, NoHide

; create a list of your the vars that we're checking.

emptyfields = Name, AddressLine1, CityName, ZipCode, Weight, MerchDescription, OrderNumber, 
loop, parse, emptyfields, `,, %A_Space% 				; loop through the list
{
	GuiControlGet, SinglePickupOutputVar, Enabled, %A_LoopField%
		If !(%A_LoopField%) && SinglePickupOutputVar ; if the value of the variable whose name is saved in A_LoopField is empty and is enabled
		{
			if A_LoopField = Name
			{
			required = Customer Name
			}
			else if A_LoopField = AddressLine1
			{
			required = Address Line 1
			}
			else if A_LoopField = CityName
			{
			required = Zip Code
			}
			else if A_LoopField = ZipCode
			{
			required = Zip Code
			}
			else if A_LoopField = Weight
			{
			required = Weight
			}
			else if A_LoopField = MerchDescription
			{
			required = Merch Description
			}
			else if A_LoopField = OrderNumber
			{
			required = Order Number
			}
			MsgBox A required field is empty: %required%	; show error message
			GuiControl, enable, SinglePickupOutputVar
			
			return						; stop
		}
}
;~ ; if you're here then all vars are not empty

OrderNumber = %OrderNumber%


; Although we have the digits and lengths declared in the GUI, we also need to double check in case this info's been pasted. Time to check the values to make sure the following contain only digits.

if Declared is not digit
{
MsgBox, The declared value field may only contain digits.
GuiControl, enable, SinglePickupOutputVar
Return
}

if ZipCode is not digit
{
MsgBox, The zip code field may only contain digits.
GuiControl, enable, SinglePickupOutputVar
Return
}

if Weight is not digit
{
MsgBox, The weight field may only contain digits.
GuiControl, enable, SinglePickupOutputVar
Return
}

if OrderNumber is not digit
{
MsgBox, The order number field may only contain digits.
GuiControl, enable, SinglePickupOutputVar
Return
}

; Although we have the digits and lengths declared in the GUI, we also need to double check in case this info's been pasted. Time to check the values to make sure that we're within the max parameters for the UPS fields.

if (Declared > 1000)
{
MsgBox, The max declared value is $1000.
GuiControl, enable, SinglePickupOutputVar
Return
}

StringLen, addonelength, AddressLine1
if (addonelength > 35)
{
MsgBox, The max length for address line 1 is 35 characters.
GuiControl, enable, SinglePickupOutputVar
Return
}

StringLen, citylength, CityName
if (citylength > 35)
{
MsgBox, The max length for the City is 35 characters.
GuiControl, enable, SinglePickupOutputVar
Return
}

StringLen, addtwolength, AddressLine2
if (addtwolength > 35)
{
MsgBox, The max length for address line 2 is 35 characters.
GuiControl, enable, SinglePickupOutputVar
Return
}

StringLen, namelength, Name
if (namelength > 35)
{
MsgBox, The max length for customer name is 35 characters.
GuiControl, enable, SinglePickupOutputVar
Return
}

StringLen, ziplength, ZipCode
if (ziplength > 5)
{
MsgBox, The max length for zip code is 5 digits.
GuiControl, enable, SinglePickupOutputVar
Return
}

StringLen, phonelength, Phone
if (phonelength > 15)
{
MsgBox, The max length for phone number is 15 characters.
GuiControl, enable, SinglePickupOutputVar
Return
}

StringLen, merchlength, MerchDescription
if (merchlength > 35)
{
MsgBox, The max length for merchandise description is 35 characters.
GuiControl, enable, SinglePickupOutputVar
Return
}

StringLen, orderlength, OrderNumber
if (orderlength > 8)
{
MsgBox, The max length for order number is 8 digits.
GuiControl, enable, SinglePickupOutputVar
Return
}

if (Weight > 150)
{
MsgBox, The max weight is 150 lbs.
GuiControl, enable, SinglePickupOutputVar
Return
}

; Setting variables for the service selection.

if (Service = "UPS Ground Service")
{
serviceType = 5
}
else if (Service = "UPS Next Day Air")
{
serviceType = 2
}
else if (Service = "UPS 3 Day Select")
{
serviceType = 4
}

if (Attempts = "3 Pickup Attempts")
{
AttemptNum = 3
}
else
{
AttemptNum = 1
}


NumberOfPackages = 1

gosub, Go
return 

TCCalc:
Run, https://wwwapps.ups.com/ctc
Return

Link6:
direction = http://goo.gl/forms/KJL6994N0q
Run, %direction%
Return

upsLink:
Run https://www.campusship.ups.com/
Return

specHelp:
MsgBox, Coming Soon!
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

;msgbox, Name: %theName%`r`nPhone: %thePhone%`r`nAddress Line 1: %addy1%`r`nAddress Line 2: %addy2%`r`nCity: %city%`r`nZip: %theZip%

;######## End Of GUI glabels ###################################################


;######## Function #############################################################
HandleMessage(p_w, p_l, p_m, p_hw)
  {
    global   WM_SETCURSOR, WM_MOUSEMOVE, 
    static   URL_hover, h_cursor_hand, h_old_cursor, CtrlIsURL, LastCtrl
   
    If (p_m = WM_SETCURSOR)
      {
        If URL_hover
          Return, true
      }
    Else If (p_m = WM_MOUSEMOVE)
      {
        ; Mouse cursor hovers URL text control
        StringLeft, CtrlIsURL, A_GuiControl, 3
        If (CtrlIsURL = "URL")
          {
            If URL_hover=
              {
                Gui, Font, cBlue underline
                GuiControl, Font, %A_GuiControl%
                LastCtrl = %A_GuiControl%
               
                h_cursor_hand := DllCall("LoadCursor", "uint", 0, "uint", 32649)
               
                URL_hover := true
              }                 
              h_old_cursor := DllCall("SetCursor", "uint", h_cursor_hand)
          }
        ; Mouse cursor doesn't hover URL text control
        Else
          {
            If URL_hover
              {
                Gui, Font, norm cBlue 
                GuiControl, Font, %LastCtrl%
               
                DllCall("SetCursor", "uint", h_old_cursor)
               
                URL_hover=
              }
          }
      }
  }
;######## End Of Functions #####################################################

$F10::return ; disabling F10 key while tool is open.

GuiClose:
  ExitApp
  Return
  
  FinishedGuiClose:
  ExitApp
  Return
  
  theMenu1GuiClose:
  ExitApp
  Return

theMenuGuiClose:
  ExitApp
  Return
  
  SingleLabelGuiClose:
  ExitApp
  Return
  
  MultiLabelGuiClose:
  ExitApp
  Return
  
  MultiLoopGuiClose:
  ExitApp
  Return
  
  helpGuiClose:
  ExitApp
  Return
  
  feedbackGuiClose:
  ExitApp
  Return
  
  SinglePickupGuiClose:
  ExitApp
  Return
  
sample1GuiClose:
ExitApp
Return

SingleSampleLabelGuiClose:
ExitApp
Return

MultiSampleLabelGuiClose:
ExitApp
Return

theMultiSampleLoopGuiClose:
ExitApp
Return

Reporting(keyname)
{
INI=%A_scriptdir%\reports\settings.ini
fileINI = %A_ScriptDir%\reports\
IniRead, totalVar, %ini%, %keyname%, Total
IniRead, completeTotal, %ini%, completeTotal, Total
if (completeTotal = "ERROR")
{
completeTotal = 0
}

IfNotExist, %fileINI%
   FileCreateDir, %fileINI%

if (totalVar = "ERROR")
{
iniwrite, 1, %ini%, %keyname%, Total
completeTotal++
iniwrite, %completeTotal%, %ini%, completeTotal, Total
}
else
{
totalVar++
iniwrite, %totalVar%, %ini%, %keyname%, Total
completeTotal++
iniwrite, %completeTotal%, %ini%, completeTotal, Total
}
}


URLToVar(URL) {
WebRequest := ComObjCreate("WinHttp.WinHttpRequest.5.1")
WebRequest.Open("GET", URL, true)
WebRequest.Send()
WebRequest.WaitForResponse()
Return WebRequest.ResponseText
}

  