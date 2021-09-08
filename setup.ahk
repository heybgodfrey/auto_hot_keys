#SingleInstance Force
counter=0
T = %A_Now% 
T -= 1970,s
SetBatchLines, -1

DetectHiddenWindows On
	SetTitleMatchMode RegEx
	
INI=%A_Desktop%\AHK\settings.ini
IniRead, showName, %ini%, clientName, KEY1

if (showName != "ERROR") ; We're updating, not installing.
Update = 1
else
Install = 1
	

if (Install = 1)
{
FileCreateDir, %A_Desktop%\AHK\
FileCreateDir, %A_Desktop%\AHK\images\
FileCreateDir, %A_Desktop%\AHK\images\swap\
FileCreateDir, %A_Desktop%\AHK\old\
FileCreateDir, %A_Desktop%\AHK\reports\
FileCreateDir, %A_Desktop%\AHK\text_files\
}

IfNotExist, %A_Desktop%\AHK\text_files\
FileCreateDir, %A_Desktop%\AHK\text_files\

IfNotExist, %A_Desktop%\AHK\images\swap\
FileCreateDir, %A_Desktop%\AHK\images\swap\

if (Install = 1)
TrayTip, Installing..., Sales/Service AHK script is installing..., 5
else
TrayTip, Updating..., Sales/Service AHK script is updating..., 5


; AHK files filename\git hub permalink

AHKList = browser_check.ahk\https://raw.githubusercontent.com/customink/auto_hot_keys/b57d669db5f4f91a237301bf20a40e5711ed339e/browser_check.ahk,description.ahk\https://raw.githubusercontent.com/customink/auto_hot_keys/b57d669db5f4f91a237301bf20a40e5711ed339e/description.ahk,gen_comp_list.ahk\https://raw.githubusercontent.com/customink/auto_hot_keys/b57d669db5f4f91a237301bf20a40e5711ed339e/gen_comp_list.ahk,manual.ahk\https://raw.githubusercontent.com/customink/auto_hot_keys/b57d669db5f4f91a237301bf20a40e5711ed339e/manual.ahk,master.ahk\https://raw.githubusercontent.com/customink/auto_hot_keys/b57d669db5f4f91a237301bf20a40e5711ed339e/master.ahk,setup.ahk\https://raw.githubusercontent.com/customink/auto_hot_keys/main/setup.ahk,versions.ini\https://raw.githubusercontent.com/customink/auto_hot_keys/b57d669db5f4f91a237301bf20a40e5711ed339e/versions.ini

; images  filename\github permalink

imagesList = 1.png\https://github.com/customink/auto_hot_keys/blob/b57d669db5f4f91a237301bf20a40e5711ed339e/images/1.png?raw=true,2.png\https://github.com/customink/auto_hot_keys/blob/b57d669db5f4f91a237301bf20a40e5711ed339e/images/2.png?raw=true,3.png\https://github.com/customink/auto_hot_keys/blob/b57d669db5f4f91a237301bf20a40e5711ed339e/images/3.png?raw=true,4.png\https://github.com/customink/auto_hot_keys/blob/b57d669db5f4f91a237301bf20a40e5711ed339e/images/4.png?raw=true,5.png\https://github.com/customink/auto_hot_keys/blob/b57d669db5f4f91a237301bf20a40e5711ed339e/images/5.png?raw=true,ahk_manual.jpg\https://github.com/customink/auto_hot_keys/blob/b57d669db5f4f91a237301bf20a40e5711ed339e/images/ahk_manual.jpg?raw=true,bg1.jpg\https://github.com/customink/auto_hot_keys/blob/b57d669db5f4f91a237301bf20a40e5711ed339e/images/bg1.jpg?raw=true,bg3.jpg\https://github.com/customink/auto_hot_keys/blob/b57d669db5f4f91a237301bf20a40e5711ed339e/images/bg3.jpg?raw=true,custom_hotkeys.jpg\https://github.com/customink/auto_hot_keys/blob/b57d669db5f4f91a237301bf20a40e5711ed339e/images/custom_hotkeys.jpg?raw=true,delete.jpg\https://github.com/customink/auto_hot_keys/blob/b57d669db5f4f91a237301bf20a40e5711ed339e/images/delete.jpg?raw=true,delivery.jpg\https://github.com/customink/auto_hot_keys/blob/b57d669db5f4f91a237301bf20a40e5711ed339e/images/delivery.jpg?raw=true,exit.jpg\https://github.com/customink/auto_hot_keys/blob/b57d669db5f4f91a237301bf20a40e5711ed339e/images/exit.jpg?raw=true,go_back.jpg\https://github.com/customink/auto_hot_keys/blob/b57d669db5f4f91a237301bf20a40e5711ed339e/images/go_back.jpg?raw=true,menu.jpg\https://github.com/customink/auto_hot_keys/blob/b57d669db5f4f91a237301bf20a40e5711ed339e/images/menu.jpg?raw=true,new.jpg\https://github.com/customink/auto_hot_keys/blob/b57d669db5f4f91a237301bf20a40e5711ed339e/images/new.jpg?raw=true,next.jpg\https://github.com/customink/auto_hot_keys/blob/b57d669db5f4f91a237301bf20a40e5711ed339e/images/next.jpg?raw=true,off.jpg\https://github.com/customink/auto_hot_keys/blob/b57d669db5f4f91a237301bf20a40e5711ed339e/images/off.jpg?raw=true,on.jpg\https://github.com/customink/auto_hot_keys/blob/b57d669db5f4f91a237301bf20a40e5711ed339e/images/on.jpg?raw=true,onoroff.jpg\https://github.com/customink/auto_hot_keys/blob/b57d669db5f4f91a237301bf20a40e5711ed339e/images/onoroff.jpg?raw=true,other_off.jpg\https://github.com/customink/auto_hot_keys/blob/b57d669db5f4f91a237301bf20a40e5711ed339e/images/other_off.jpg?raw=true,paste.jpg\https://github.com/customink/auto_hot_keys/blob/b57d669db5f4f91a237301bf20a40e5711ed339e/images/paste.jpg?raw=true,paste.png\https://github.com/customink/auto_hot_keys/blob/b57d669db5f4f91a237301bf20a40e5711ed339e/images/paste.png?raw=true,paste1.jpg\https://github.com/customink/auto_hot_keys/blob/b57d669db5f4f91a237301bf20a40e5711ed339e/images/paste1.jpg?raw=true,restore_default.jpg\https://github.com/customink/auto_hot_keys/blob/b57d669db5f4f91a237301bf20a40e5711ed339e/images/restore_default.jpg?raw=true,save.jpg\https://github.com/customink/auto_hot_keys/blob/b57d669db5f4f91a237301bf20a40e5711ed339e/images/save.jpg?raw=true,settings.jpg\https://github.com/customink/auto_hot_keys/blob/b57d669db5f4f91a237301bf20a40e5711ed339e/images/settings.jpg?raw=true,spelling.jpg\https://github.com/customink/auto_hot_keys/blob/b57d669db5f4f91a237301bf20a40e5711ed339e/images/spelling.jpg?raw=true,spinner.gif\https://github.com/customink/auto_hot_keys/blob/b57d669db5f4f91a237301bf20a40e5711ed339e/images/spinner.gif?raw=true,suggest.jpg\https://github.com/customink/auto_hot_keys/blob/b57d669db5f4f91a237301bf20a40e5711ed339e/images/suggest.jpg?raw=true,update.jpg\https://github.com/customink/auto_hot_keys/blob/b57d669db5f4f91a237301bf20a40e5711ed339e/images/update.jpg


; Begin download AHK files.

Loop, parse, AHKList, `,
{
	Loop, parse, A_LoopField, \
	{
	
		if (A_Index = 1)
		AHKfilename := A_LoopField
		else if (A_Index = 2)
		GithubID := A_LoopField
		{
		
		try
		UrlDownloadToFile, %GithubID%, %A_Desktop%\AHK\%AHKfilename% ; Download new file version
		
		
		}
		
	}
}

; Begin download images
; Not necessary to check the file size of these files.

Loop, parse, imagesList, `,
{

	Loop, parse, A_LoopField, \
	{
	
		if (A_Index = 1)
		imageFileName := A_LoopField
		else if (A_Index = 2)
		{
		GithubID := A_LoopField
		
		Try
		URLDownloadToFile, %GithubID%, %A_Desktop%\AHK\images\%imageFileName% ; Download Image
		}
	}
}


 Notify_Destroy()
sleep 1000

if (Install = 1)
 TrayTip, Install Complete, Sales/Service AHK Script install is complete, 5
 else
TrayTip, Update Complete, Sales/Service AHK update is complete, 5
 sleep 3000
 Notify_Destroy()
sleep 2000
 Run, %A_Desktop%\AHK\master.ahk,, UseErrorLevel
 ExitApp
 Return
 
 PleasantNotify(title, message, pnW, pnH, position="b r", time=1) {
    global pn_title, pn_msg, PN_hwnd, w, h
	Notify_Destroy()
	Gui, Notify: +AlwaysOnTop +ToolWindow -SysMenu -Caption +LastFound
	PN_hwnd := WinExist()
	WinSet, ExStyle, +0x20
	WinSet, Transparent, 0
	Gui, Notify: Color, 0xF2F2F0
	Gui, Notify: Font, c0x07D82F s22 wBold, Segoe UI
	Gui, Notify: Add, Text, % " x" 20 " y" 12 " w" pnW-20 " vpn_title", % title
	Gui, Notify: Font, cBlack s15 wRegular
	Gui, Notify: Add, Text, % " x" 20 " y" 56 " w" pnW-20 " h" pnH-56 " vpn_msg", % message
	RealW := pnW + 50
	RealH := pnH + 20
	Gui, Notify: Show, W%RealW% H%RealH% NoActivate
	WinMove(PN_hwnd, position)
	if A_ScreenDPI = 96
		WinSet, Region,0-0 w%pnW% h%pnH% R40-40,%A_ScriptName%
	 ;For Screen text size 125%
	if A_ScreenDPI = 120
		WinSet, Region, 0-0 w600 h75 R40-40, %A_ScriptName%
	
	winfade("ahk_id " PN_hwnd,235,5)
	if (time <> "P")
	{
		Closetick := time*1000
		SetTimer, ByeNotify, % Closetick
	}
}

Notify_Destroy() {
	global PN_hwnd
	ByeNotify:
	SetTimer, ByeNotify, Off
    winfade("ahk_id " PN_hwnd,0,5)
    Gui, Notify: Destroy
	return
}

pn_mod_title(title) {
	global pn_title
	GuiControl, Notify: Text,pn_title, % title
}

pn_mod_msg(message) {
	global pn_msg
	GuiControl, Notify: Text,pn_msg, % message
}

WinMove(hwnd,position) {
   SysGet, Mon, MonitorWorkArea
   WinGetPos,ix,iy,w,h, ahk_id %hwnd%
   x := InStr(position,"l") ? MonLeft : InStr(position,"hc") ?  (MonRight-w)/2 : InStr(position,"r") ? MonRight - w : ix
   y := InStr(position,"t") ? MonTop : InStr(position,"vc") ?  (MonBottom-h)/2 : InStr(position,"b") ? MonBottom - h : iy
   WinMove, ahk_id %hwnd%,,x,y
}

winfade(w:="",t:=15,i:=1,d:=5) {
    w:=(w="")?("ahk_id " WinActive("A")):w
    t:=(t>255)?255:(t<0)?0:t
    WinGet,s,Transparent,%w%
    s:=(s="")?255:s ;prevent trans unset bug
    WinSet,Transparent,%s%,%w%
    i:=(s<t)?abs(i):-1*abs(i)
    while(k:=(i<0)?(s>t):(s<t)&&WinExist(w)) {
        WinGet,s,Transparent,%w%
        s+=i
        WinSet,Transparent,%s%,%w%
        sleep %d%
    }
}
		
