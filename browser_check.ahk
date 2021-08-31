/*

AUTOHOTKEY SCRIPT TO DISPLAY THE DEFAULT BROWSER PATH AND EXECUTABLE:

Tested in Windows 7 x64.

This is a two step process to get the executable for the default browser.  The user's default browser is in key:

HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.html\UserChoice\Progid


Common browser Key Names:

IE: IE.AssocFile.HTM

FireFox: FirefoxHTML

Chrome: ChromeHTML


Replace <KEY NAME> below with one of the values above to find the executable:

HKCR\<KEY NAME>\shell\open\command

*/

Brow := Browser()

Browser()

{

	; Find the Registry key name for the default browser

        RegRead, BrowserKeyName, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.html\UserChoice, Progid

	

	; Find the executable command associated with the above Registry key

	RegRead, BrowserFullCommand, HKEY_CLASSES_ROOT, %BrowserKeyName%\shell\open\command



	; The above RegRead will return the path and executable name of the brower contained within quotes and optional parameters

	; We only want the text contained inside the first set of quotes which is the path and executable

	; Find the ending quote position (we know the beginning quote is in position 0 so start searching at position 1)

	StringGetPos, pos, BrowserFullCommand, ",,1

	

	; Decrement the found position by one to work correctly with the StringMid function

	pos := --pos

	

	; Extract and return the path and executable of the browser

	StringMid, BrowserPathandEXE, BrowserFullCommand, 2, %pos%

	Return BrowserPathandEXE

}

IfNotExist, %A_ScriptDir%\settings.ini
{
run setup.ahk
ExitApp
return
}

TheBrow := Browser()

Needle1 = firefox
Needle2 = chrome

IfInString, TheBrow, %Needle1%
{
BrowPageName = Mozilla Firefox
BrowExe = firefox.exe
BrowGui = Mozilla.Browser
}
else IfInString, TheBrow, %Needle2%
{
BrowPageName = Google Chrome
BrowExe = chrome.exe
BrowGui = Chrome
}