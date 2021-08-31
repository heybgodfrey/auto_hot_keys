#SingleInstance force
#Include %A_ScriptDir%
INI=%A_scriptdir%\settings.ini

DetectHiddenWindows, On
SetTitleMatchMode, 2

IfWinNotExist, usercreated.ahk 
Run, %A_ScriptDir%\userCreated.ahk, ,UseErrorLevel

IfWinNotExist, repTimer.ahk 
Run, %A_ScriptDir%\repTimer.ahk, ,UseErrorLevel

SetKeyDelay, 0

IfWinNotExist, spellaid.ahk 
Run, %A_ScriptDir%\spellaid.ahk, ,UseErrorLevel

IniRead, skill, %ini%, clientSkill, KEY1
IniRead, showName, %ini%, clientName, KEY1
IniRead, showNick, %ini%, clientNick, KEY1
IniRead, showTarget, %ini%, targetSettings, KEY1
IniRead, showSuggest, %ini%, suggestSettings, KEY1

; if (showSuggest = "yes")
;run, %A_ScriptDir%\testfile.ahk,, UseErrorLevel

theFile=%A_scriptdir%\images\1.png
CLogDir=%A_scriptdir%\images\
IfNotExist, %theFile%
{
UrlDownloadToFile, https://drive.google.com/uc?export=download&id=0B13bYaJLlH0MV2dOVHMxX09jalU, %CLogDir%\1.png
}

theFile=%A_scriptdir%\images\2.png
CLogDir=%A_scriptdir%\images\
IfNotExist, %theFile%
{
UrlDownloadToFile, https://drive.google.com/uc?export=download&id=0B13bYaJLlH0McHFQTXpoaGtuYUU, %CLogDir%\2.png
}

theFile=%A_scriptdir%\images\3.png
CLogDir=%A_scriptdir%\images\
IfNotExist, %theFile%
{
UrlDownloadToFile, https://drive.google.com/uc?export=download&id=0B13bYaJLlH0MOW9ENko2V0tTVW8, %CLogDir%\3.png
}

theFile=%A_scriptdir%\images\4.png
CLogDir=%A_scriptdir%\images\
IfNotExist, %theFile%
{
UrlDownloadToFile, https://drive.google.com/uc?export=download&id=0B13bYaJLlH0MMk1rcmxEV0hfTVU, %CLogDir%\4.png
}

theFile=%A_scriptdir%\images\5.png
CLogDir=%A_scriptdir%\images\
IfNotExist, %theFile%
{
UrlDownloadToFile, https://drive.google.com/uc?export=download&id=0B13bYaJLlH0MbXBLbnIyR1FUQ0k, %CLogDir%\5.png
}
 IniRead, lastUpdated, %ini%, lastUpdateTimestamp, KEY1 ; reading settings
 
 theFile=%A_scriptdir%\images\new.jpg
CLogDir=%A_scriptdir%\images\
IfNotExist, %theFile%
{
UrlDownloadToFile, https://drive.google.com/uc?export=download&id=0B13bYaJLlH0MbGRINVQtUWJfUVk, %CLogDir%\new.jpg
}

 if lastUpdated = ERROR
 {
 Run, %A_ScriptDir%\updater.ahk,, UseErrorLevel
 }

 SetTimer, CheckTime, 3600000 ;check time every hour
 
 Return

 CheckTime:
 T = %A_Now% 

 T -= 1970,s

 updateMath := T - lastUpdated
 
 if (updateMath > 3600)
	 {
  closingFile = updater.ahk ; Terminate this script if it's currently running.

	DetectHiddenWindows On
	SetTitleMatchMode RegEx
	IfWinExist, i)%closingFile%.* ahk_class AutoHotkey
		{
		WinClose
		WinWaitClose, i)%closingFile%.* ahk_class AutoHotkey, , 2
		}
	FileMove, updater.ahk, Old\*.*, 1 ; Make a backup of this file that is currently in the Master folder. Send this to folder called Old
		
	try
	{
	UrlDownloadToFile, https://drive.google.com/uc?export=download&id=0B13bYaJLlH0McGdHaXl5MGZybHc, updater.ahk ; Download new file version
	}


 Run, %A_ScriptDir%\updater.ahk,, UseErrorLevel
 }
 else
 {
 T = %A_Now% 

 T -= 1970,s
}
 Return

if (showTarget = "new")
{
target := "-new-window"
}

!^+L::
reload
Return

$F12::
run %A_ScriptDir%\manual.ahk
return

$F11::
if (imageOn = 0)
{
if (skill = 1)
{
SplashImage, %A_ScriptDir%\images\1.png, m
}
else if (skill = 2)
{
SplashImage, %A_ScriptDir%\images\2.png, m
}
else if (skill = 3)
{
SplashImage, %A_ScriptDir%\images\3.png, m
}
else if (skill = 4)
{
SplashImage, %A_ScriptDir%\images\4.png, m
}
else
{
SplashImage, %A_ScriptDir%\images\5.png, m
}
imageOn = 1
}
else
{
SplashImage, Off
imageOn = 0
}
Return

$F10::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
run %A_ScriptDir%\ups.ahk
}
return

$F9::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
run, %A_ScriptDir%\setup.ahk,, UseErrorLevel
}
return


; Design / Branding / 

::#branding::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
We print a small tagless Inky logo with care instructions on the inside collar of the shirt, as well as a removable hang tag. Are you okay with leaving these on the shirts, or would you prefer we remove them?
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("branding")
}
return

; Content / Content /

::#content::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
Once an order is placed, all designs go through our review team to ensure we do not print any protected material without permission. If we have questions regarding your order, our team will be in contact with you to help find the best way to adjust your design.
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("content")
}
return

::#dd::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
On what date were you looking to have your order arrive? We have a couple of options that begin with our free, standard 14-day delivery. This timeframe includes everything that happens once you place the order, including production. We also have rush delivery options available if you need your order sooner. 
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("dd")
}
return

; Content / Bands / Hotkey ID 6

::#bands::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
I noticed your design includes protected content owned by a band or artist. We cannot print your design as it is right now, but, with a few adjustments, I can make sure your design is still something special that won’t compete with official merchandise regulations. 
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
}
Reporting("bands")
return

; Content / Sports / Hotkey ID 7

::#sports::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
I noticed that your design includes protected content owned by a sports franchise. We cannot print your design as it is right now, but, with a few adjustments, I can make sure your design is still something special that won’t compete with official merchandise regulations. Can I send you a few alternate designs that would fix this issue?
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("sports")
}
return

; Content / Greek / Hotkey ID 8

::#greek::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
All Greek orders go through a comprehensive review process to make sure the design follows your organization’s particular set of regulations for use. This process takes place after your order is placed but before we start printing your design. If we have any questions or clarifications, we’ll be in touch soon. 
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("greek")
}
return



; Content / Offensive / Hotkey ID 9

::#offensive::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
While reviewing your design, I noticed that it has content that does not follow the standards we set forth in our User Agreement. We will not print material that can be considered unlawful, harmful, threatening, abusive, harassing, tortuous, defamatory, vulgar, obscene, libelous, invasive of another's privacy, hateful, or racially, ethnically or otherwise objectionable. In order to move forward, we need to ___________________________. 
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("offensive")
}
return

; Content / Celebs / Hotkey ID 10

::#celebs::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
I noticed  that your design includes protected content owned by a celebrity. We cannot print your design as it is right now, but, with a few adjustments, I can make sure your design is still something special that won’t compete with official merchandise regulations. 
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("celebs")
}
return

; Content / Disney / Hotkey ID 11

::#disney::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
Disney protects its park names, characters, and all things Disney, so we need permission from a Disney licensing official to print any of their content. If you are not able to get written permission, we can adjust your design with something from our fantastic artwork collection.  Can I send you a few alternate designs to review?
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("disney")
}
return

; Content / College / Hotkey ID 12

::#collegeyes::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
I noticed that your design uses collegiate content that is protected. Colleges can control the use of any names, mascots, and logos associated with the school.  We have a team of specialists who will review your order to ensure that we can print your specific content in line with  your school’s particular regulations. If we have questions or need clarification, we will reach out to you with more info.
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("collegeyes")
}
return

::#collegeno::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
I noticed that your design uses collegiate content that is protected. Colleges can control the use of any names, mascots, and logos associated with the school. We are always working to become officially licensed with more schools, but, at this time, we cannot print content from your particular institution.  
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("collegeno")
}
return


; Content / Video Games / Hotkey ID 13

::#videogames::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
I noticed that your design uses protected content owned by a gaming company. Video game companies protect their logos, characters, promotional materials, and even screenshots from their games. To move forward, we will need written permission from someone at the company. If you are not able to get written permission, we can help you make adjustments to your design by replacing the content.  Can I send you a few alternate designs that would fix this issue?
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("videogames")
}
return

; Content / Watermark / Hotkey ID 14

::#watermark::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
I noticed that your design uses content protected by a watermark.  Companies and individuals protect the images they own with watermarks to prevent unauthorized use. To fix this, you have two options. You can purchase the artwork from the source and send us both the receipt and the new art file without the watermark, or we can replace the artwork with something similar from our extensive art library of art. 
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("watermark")
}
return

; Design / Design Help / Hotkey ID 15 (email) & ID 86 (chat)

::#designhelp::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
prevClip := Clipboard
clipboard=
(
Do you have your design currently saved in our Design Lab? If so, I can pull it up using your email address.
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("designhelp")
}
else
{
prevClip := Clipboard
clipboard=
(
I’m happy to help you put together a custom design! I really like your design idea and I'm sure that we can create something amazing using our art and text from the Design Lab.
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("designhelp")
}
}
reload
return

; Design / Design Link / Hotkey ID 16

::#designlink::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
incNumber := Clipboard
clipboard=
(
Please click on the link below to check out your design:

%incNumber%

I’m happy to make any changes you’d like to see! 
)
clipwait
send ^v
sleep 333
clipboard=
(
%incNumber%
)
Reporting("designlink")
}
return

; Design / Rotate / Hotkey ID 17 (email) & ID 89 (chat)

::#rotate::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
prevClip := Clipboard
clipboard=
(
If you look directly above the image, you'll notice a red button that says "Rotate.” If you click that button, you can continue to work on the opposite side.
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("rotate")
}
else
{
prevClip := Clipboard
clipboard=
(
I can definitely help you move your design from front to back in the Design Lab. If you look directly above the image, you'll notice a red button that says "Rotate." If you click that button, you can continue to work on the opposite side.
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("rotate")
}
}
return

; Design / Upload Help / Hotkey ID 18 (email) & ID 90 (chat)

::#uploadhelp::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
prevClip := Clipboard
clipboard=
(
If you can respond to the email I'm sending with your artwork attached, I’ll take it from there! Of course, if there are any adjustments or changes you would like me to make to your artwork, feel free to include those details and I’ll take care of those as well.
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("uploadhelp")
}
else
{
prevClip := Clipboard
clipboard=
(
I'm happy to upload your artwork into our Design Lab. If you can respond to this email with your artwork attached, I’ll take it from there!

Of course, if there are any adjustments or changes you would like me to make to your artwork, feel free to include those details and I’ll take care of those as well.
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("uploadhelp")
}
}
return

; Design / Upload White / Hotkey ID 19 (email) & ID 91 (chat)
::#uploadwhite::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
prevClip := Clipboard
clipboard=
(
Sometimes our Design Lab thinks white is actually a background color, so it gets removed from the image. If you reply to the email I sent with your artwork attached, I’d be happy to adjust it for you!  Our art team can make those adjustments for you once your order is placed! 
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("uploadwhite")
}
else
{
prevClip := Clipboard
clipboard=
(
Sometimes our Design Lab registers white as a background color and removes it from the image. I can fix that for you if you attach your art in your response to this email.

Or, if you prefer to continue working on this by yourself, you can change your design color to black and then upload it into the Lab again. It will allow you to upload it and then change the color back to white (or any color you want)!
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("uploadwhite")
}
}
return

::#whitefix::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
prevClip := Clipboard
clipboard=
(
If you’d like to continue working on this by yourself, you can change your design color to black and then upload it into the Lab again. It will allow you to upload it and then change the color back to white, or any color you prefer!
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("whitefix")
}
}
return

; Design / Filetypes / Hotkey ID 20 (email) & ID 92 (chat)

::#filetypes::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
prevClip := Clipboard
clipboard=
(
You can upload many image file types into our Design Lab, including: jpeg, jpg, gif, bmp, pdf, ai, psd. If you're working with a different file type, including: doc, ppt, zip file or any other format, I can send you an e-mail and if you could please respond with that artwork attached, I'll take care of it for you!
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("filetypes")
}
else
{
prevClip := Clipboard
clipboard=
(
You can upload many image file types into our Design Lab, including: jpeg, jpg, gif, bmp, pdf, ai, psd. If you're working with a different file type, including: doc, ppt, zip file or any other format, please respond to this email with that artwork attached and I'll take care of it for you!
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("filetypes")
}
}
return

; Design / DPI / Hotkey ID 21 (email) & ID 93 (chat)

::#dpi::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
prevClip := Clipboard
clipboard=
(
To make sure you get top-quality printed products, we prefer to work with high resolution artwork. If you’d like your artwork to print at a specific size and don’t have a higher resolution image available, we offer free redraw services for orders of 6 or more pieces. After you place your order and complete your payment, our expert design team will redraw your design. We’ll then show you the final design in a free proof email. 
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("dpi")
}
else
{
prevClip := Clipboard
clipboard=
(
To guarantee your image will look great when we print it, we require a minimum resolution determined by the size of the printed design. If your artwork needs to be a specific size but you don't have a higher resolution image available, we offer our free redraw service for orders of 6 or more pieces. After you place your order, and complete your payment, our expert design team will redraw your design at any size you'd like in up to 4 colors. We’ll show you the design in a free proof email. We would then just need your approval of the design before we go to print.
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("dpi")
}
}
return

; Design / Combine Designs / Hotkey ID 22 (email) & ID 94 (chat)

::#combinedesigns::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
prevClip := Clipboard
clipboard=
(
We can only work with one design at a time in our lab, but I can work with multiple designs on my end. If you'd like, we can work through the details of your order and, when you're ready we can take a single payment over the phone. Does that work for you?
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("combinedesigns")
}
else
{
prevClip := Clipboard
clipboard=
(
Our Design Lab can only work with one design at a time, but I can handle multiple designs for you on my end. If you'd like, we can work through the details of your order and, when you're ready I can take a single payment over the phone. Does that work for you?
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("combinedesigns")
}
}
return

; Design / Combine Colors / Hotkey ID 23 (email) & ID 95 (chat)

::#combinecolors::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
prevClip := Clipboard
clipboard=
(
You can definitely mix different colors of the same item in our Design Lab! If you click on "Your Items", you'll see the option to "Add Another Color" of the same item. If you like, I can open up your design and select these colors for you!
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("combinecolors")
}
else
{
prevClip := Clipboard
clipboard=
(
You can definitely mix different colors of the same item in our Design Lab! If you click on "Your Items," you'll see the option to "Add Another Color" of the same item. If you'd like, I’m happy to take care of adding those colors for you! I just need to know what colors you would like to add.
 )
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("combinecolors")
}
}
return

; Design / Combine Styles / Hotkey ID 24 (email) & ID 96 (chat)

::#combinestyles::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
prevClip := Clipboard
clipboard=
(
We can mix and match different styles in the same order! You can select complimentary styles in our Design Lab by clicking “Your Items” tab to see which complementary styles are available. If the style you want to add isn’t displayed, I can add it in for you!
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("combinestyles")
}
else
{
prevClip := Clipboard
clipboard=
(
You can definitely mix and match different styles in the same order! The Design Lab allows you to add select styles that match the original item style you picked. If you're in the Design Lab, click on the "Items" tab and you'll be given the option to add another style to your order. Once you've selected the additional style, you'll see all the style options listed out with your design on each one! 

If the style you're most interested in isn’t listed, just give us a call and we’ll see if we can add it on our end. 
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("combinestyles")
}
}
return


; Design / Ink Changes / Hotkey ID 25 (email) & ID 97 (chat)

::#inkchange::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
prevClip := Clipboard
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
clipboard=
(
We can mix and match different ink colors within your order. We will need to use each ink color on at least 6 items in your order, and there is a $10 charge  for each color change. Would you like me to help you get that order placed? 
)
clipwait
send ^v
sleep 333
clipboard=
(	
%prevClip%
)
Reporting("inkchange")
}
else
{
clipboard=
(
We can definitely use different ink colors within your order! We will need to use each ink color on at least 6 items in your order, and there is a $10 charge for each color change. You get one free ink change for every $200 spent in your order, so most of the time there is one built in for free. If you give us a call at 800-293-4232 when it's time to order, we'll be happy to see that those ink changes are applied.
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("inkchange")
}
}
return

; Design / Redraw / Hotkey ID 26 (email) & ID 98 (chat)

::#redraw::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
prevClip := Clipboard
clipboard=
(
After you place your order, we can have our expert design team redraw your design to ensure a high quality print! We’ll then show you the final design in a free proof email. 
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("redraw")
}
else
{
prevClip := Clipboard
clipboard=
(
After your order is placed, we can have our expert design team redraw your artwork to ensure a high quality print! You'll see any artwork changes in the free proof email that we send you before we go to print. To give you a better idea of how our redraw process works, please click on the link below:

http://www.customink.com/help_center/how-and-why-we-redraw
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("redraw")
}
}
return

; Design / Design Team / Hotkey ID 27 & ID 99 (chat)

::#designteam::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
I can definitely have our design team make adjustments to your artwork! Once you place your order with us, our design team will get started on those changes and we'll send you an email containing a proof of those changes that will require your approval before we print. 
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("designteam")
}
return

; Design / Creative Services (CS) / Hotkey ID 28

::#cs::
if ((skill = 2) || (skill = 5))
{
prevClip := Clipboard

clipboard=
(
Thank you for choosing CustomInk, and welcome to the Creative Services design experience! This is a unique, free service where we connect you to a real artist who will bring your design to life.

Here’s how it works:

It starts by telling our Creative Services team everything that you’d like to see in your design and what products you’re interested in. With this information, we’ll start working on your custom artwork. Please note any designs created by CustomInk will not be distributed, but they will appear on the product you order.

Once the design is ready, you’ll receive an email from the artist including a link to the finalized custom design, thoughtfully placed on the product you want to order.

*Should you require further adjustments, please note you are limited to two rounds of changes.*

Let’s get started! Please answer the following:

1. Tell me about your idea! Who will be wearing these shirts? What is the event? When do you need your order? What is your design goal for these shirts? How do you want everyone to feel when they are wearing them?

2. Please describe in detail how you'd like the design to look. What colors should we use? Do you have any examples you'd like us to use for inspiration?

3. Approximately how large do you want the design to print? Where on the shirt do you want the design to appear?

4. Is there text you’d like to include with the design? If so, is there a specific style of font you’d like us to use?

5. What shirt style and color would you like to order? What is the smallest size shirt you'll be ordering?

6. How many shirts are you interested in ordering, what is your deadline? Also, what is the zip code we'd be shipping the order to, so I can provide you with a quote?

The more information you can provide, the better, so we can create something that is exclusively designed for you! I look forward to hearing back from you so we can get the ball rolling on your custom design!
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("cs")
}
return

; Design / PMS / Hotkey ID 29

::#pms::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
We are definitely able to match your exact color preferences when screenprinting if you have a PMS pantone code that we can use for the ink. For this service, there is a $10 charge for each color match, with one free pantone match for every $200 spent.
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("pms")
}
return

; Design / PMS Digital / Hotkey ID 30

::#pmsdigital::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
With your upcoming order, we need to use a digital method to bring your design to life. With that method we aren't able to guarantee PMS matches. The ink is set to match the colors as closely as possible, but we would not be able to guarantee an exact match.
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("pmsdigital")
}
return

; Design / Sleeve Help / Hotkey ID 31

::#sleevehelp::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
I'm happy to help you with your sleeve print! Our Design Lab is not currently setup to show you what your sleeve print would look like, but I can make a note that you are interested in sleeve printing in your account. After you place your order and complete payment, our design team will send you a free proof email and you'll be able to see how that sleeve design looks. We would require your approval of that finished design before we go to print your custom order.
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("sleevehelp")
}
return

::#spvsdig::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
CustomInk offers two different methods of printing, depending on what best suits your artwork. We offer traditional screenprinting for the majority of our products, as well as digital printing on selected items. Screenprinting involves creating a stencil (printers call this a "screen"), and then using that stencil to apply layers of different color inks. Digital printing is a much newer process by which your artwork is processed by a computer and then printed in ink directly onto the surface of your product. Digital printing is not a heat transfer or applique, as the ink is directly applied to the fabric of your shirt.
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("spvsdig")
}
return

; Design / Embroidery / Hotkey ID 32

::#embroidery::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
We are able to embroider your custom design on up to a 5"x5" area on many of our items. Our embroidery process works best with designs that contain thick lines and simple detail. If needed, we can have our production team help tweak your design to make sure that it will look great when embroidered.
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("embroidery")
}
return

; Design / Subtle Blank / Hotkey ID 33

::#subtleblank::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
While reviewing your design, I noticed that we're using ***color ink*** that can appear subtle on the ***color item*** on which we're printing. If you'd like, I'd be happy to go over some alternatives that would have a better contrast.
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("subtleblank")
}
return

; Design / Subtle Ink / Hotkey ID 34

::#subtleink::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
While reviewing your design, I noticed that the ***ink colors*** may appear subtle when used together. If you'd like, I'd be happy to go over some alternatives that would have a better contrast.
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("subtleink")
}
return

; Design / VSS / Hotkey ID 35 (email) & ID 109 (chat)

::#vss::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
prevClip := Clipboard
clipboard=
(
To print your order, we need to have your design sized the same on all shirts in your order. This means the design may look a bit large on the smaller sizes, and small on the larger sizes. The link below gives you an idea of what I mean:

http://www.customink.com/help_center/designs-on-different-sizes

We do have an option to make an additional setup to print on the smaller sizes in your order for an additional cost. If you’re interested in doing so, I can give you a quote how much that would cost.
) 
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("vss")
}
else
{
prevClip := Clipboard
clipboard=
(
To print your order, we need to have your design sized the same on all shirts in your order. This means the design may look a bit large on the smaller sizes, and small on the larger sizes. The link below gives you an idea of what I mean:

http://www.customink.com/help_center/designs-on-different-sizes

We do have an option to make an additional setup to print on the smaller sizes in your order for an additional cost. If you’re interested in doing so, I can give you a quote how much that would cost.
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("vss")
}
}
return

; Design / PPS / Hotkey ID 36

::#pps::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
After you place an order with us for 250+ items or your order total is $2,500+, we send a printed pre-production sample. You can pick out the size and we'll get you a real printed shirt in about a week. With your approval, we will then complete printing for the rest of your order. If you don’t qualify for a free sample, you can have one made for $75. 
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("pps")
}
return

; Quote / Quote Only - No Perks /

::#quoteonly::
::#onlyquote::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
incNumber := Clipboard

Loop
{
StringReplace, incNumber, incNumber,#1,,UseErrorLevel


        if ErrorLevel = 0  ; No more replacements needed.
            break


    }

needleTwo = "Item 1. "
StringReplace, NewStr, NewStr, `r`n`r`n`r`n`r`n, , All
IfInString, incNumber, Item 2
{
StringReplace, NewStr, incNumber, Copy of ,, All
Loop
    {
        StringReplace, NewStr, NewStr, `r`n`r`n`r`n, `r`n======================`r`n`r`n, UseErrorLevel
        if ErrorLevel = 0  ; No more replacements needed.
            break
    }

NewStr:=RegExReplace(NewStr,"` +","` ")
}
else
{
StringReplace, NewStr, incNumber, Item 1., %A_SPace%, All
Loop
    {
        StringReplace, NewStr, NewStr, `r`n`r`n`r`n, `r`n======================`r`n`r`n, UseErrorLevel
        if ErrorLevel = 0  ; No more replacements needed.
            break
    }
StringReplace, NewStr, NewStr, Copy of ,, All
NewStr:=RegExReplace(NewStr,"` +","` ")
}
; StringReplace, NewStr, NewStr, `r`n`r`n, `r`n, All
dmatter := StrReplace(NewStr, Quote, Quoted, Counting)
RegExReplace(NewStr, "Quote", "", Count)

if (Count > 1)
{
clipboard=
(
======================

%NewStr%

======================
)
FinalString := Clipboard

StringReplace, NewStr, FinalString, ========================================`r`n========================================`r`n,`r`n======================, All
StringReplace, NewStr, NewStr, Quote,Quote, All
StringReplace, NewStr, NewStr, **Plus,**Plus, All
StringReplace, NewStr, NewStr, Total Quantity,`r`nTotal Quantity, All 
StringReplace, NewStr, FinalString, `r`n========================================`r`n,`r`n======================`r`n, All


clipboard=
(
%NewStr%
)
}
else
{
IfInString, NewStr, Order #
{
StringReplace, NewStr, NewStr, Order #,`r`n`r`nOrder #
}
clipboard=
(
======================%NewStr%

======================
)
FinalString := Clipboard

StringReplace, NewStr, FinalString, ========================================`r`n========================================`r`n,`r`n======================, All
StringReplace, NewStr, NewStr, Quote,`r`n`r`nQuote, All
StringReplace, NewStr, NewStr, Total Quantity,`r`nTotal Quantity, All 
clipboard=
(
%NewStr%
)
}
sleep 333  ;or clipwait
send ^v
sleep 333
clipboard=
(
%incNumber%
)
Reporting("quoteonly")
}
return

; Quote / Quote Spec - With Perks /

::#quotespec::
::#specquote::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
incNumber := Clipboard

Loop
{
StringReplace, incNumber, incNumber,#1,,UseErrorLevel


        if ErrorLevel = 0  ; No more replacements needed.
            break


    }

needleTwo = "Item 1. "
StringReplace, NewStr, NewStr, `r`n`r`n`r`n`r`n, , All
IfInString, incNumber, Item 2
{
StringReplace, NewStr, incNumber, Copy of ,, All
Loop
    {
        StringReplace, NewStr, NewStr, `r`n`r`n`r`n, `r`n======================`r`n`r`n, UseErrorLevel
        if ErrorLevel = 0  ; No more replacements needed.
            break
    }

NewStr:=RegExReplace(NewStr,"` +","` ")
}
else
{
StringReplace, NewStr, incNumber, Item 1., %A_SPace%, All
Loop
    {
        StringReplace, NewStr, NewStr, `r`n`r`n`r`n, `r`n======================`r`n`r`n, UseErrorLevel
        if ErrorLevel = 0  ; No more replacements needed.
            break
    }
StringReplace, NewStr, NewStr, Copy of ,, All
NewStr:=RegExReplace(NewStr,"` +","` ")
}
; StringReplace, NewStr, NewStr, `r`n`r`n, `r`n, All
dmatter := StrReplace(NewStr, Quote, Quoted, Counting)
RegExReplace(NewStr, "Quote", "", Count)

if (Count > 1)
{
clipboard=
(
======================

%NewStr%

======================
Of course, every CustomInk order comes with:

*Free artistic adjustments to alignment, art, or text for the best look possible
*Free proof email
*Free shipping with a guaranteed delivery date
*A quality and money-back guarantee
======================
)
FinalString := Clipboard

StringReplace, NewStr, FinalString, ========================================`r`n========================================`r`n,`r`n======================, All
StringReplace, NewStr, NewStr, Quote,Quote, All
StringReplace, NewStr, NewStr, **Plus,**Plus, All
StringReplace, NewStr, NewStr, Total Quantity,`r`nTotal Quantity, All 
StringReplace, NewStr, FinalString, `r`n========================================`r`n,`r`n======================`r`n, All


clipboard=
(
%NewStr%
)
}
else
{
IfInString, NewStr, Order #
{
StringReplace, NewStr, NewStr, Order #,`r`n`r`nOrder #
}
clipboard=
(
======================%NewStr%

======================
**Plus sizes are available in select styles at an additional cost. (Not all products are available in the same size range).

Of course, every CustomInk order comes with:

*Free artistic adjustments to alignment, art, or text for the best look possible
*Free proof email
*Free shipping with a guaranteed delivery date
*A quality and money-back guarantee
======================
)
FinalString := Clipboard

StringReplace, NewStr, FinalString, =========================================`r`n========================================`r`n,`r`n======================, All
StringReplace, NewStr, NewStr, Quote,`r`n`r`nQuote, All
StringReplace, NewStr, NewStr, Total Quantity,`r`nTotal Quantity, All 
clipboard=
(
%NewStr%
)
}
clipwait
send ^v
sleep 333
clipboard=
(
%incNumber%
)
Reporting("quotespec")
}
return

; Quote / Quote Bulk - With Perks / Hotkey ID 37

::#quotebulk::
::#bulkquote::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
incNumber := Clipboard

Loop
{
StringReplace, incNumber, incNumber,#1,,UseErrorLevel


        if ErrorLevel = 0  ; No more replacements needed.
            break


    }

needleTwo = "Item 1. "
StringReplace, NewStr, NewStr, `r`n`r`n`r`n`r`n, , All
IfInString, incNumber, Item 2
{
StringReplace, NewStr, incNumber, Copy of ,, All
Loop
    {
        StringReplace, NewStr, NewStr, `r`n`r`n`r`n, `r`n======================`r`n`r`n, UseErrorLevel
        if ErrorLevel = 0  ; No more replacements needed.
            break
    }

NewStr:=RegExReplace(NewStr,"` +","` ")
}
else
{
StringReplace, NewStr, incNumber, Item 1., %A_SPace%, All
Loop
    {
        StringReplace, NewStr, NewStr, `r`n`r`n`r`n, `r`n=======================`r`n`r`n, UseErrorLevel
        if ErrorLevel = 0  ; No more replacements needed.
            break
    }
StringReplace, NewStr, NewStr, Copy of ,, All
NewStr:=RegExReplace(NewStr,"` +","` ")
}
; StringReplace, NewStr, NewStr, `r`n`r`n, `r`n, All
dmatter := StrReplace(NewStr, Quote, Quoted, Counting)
RegExReplace(NewStr, "Quote", "", Count)

if (Count > 1)
{
clipboard=
(
======================

%NewStr%

======================
**Plus sizes are available in select styles at an additional cost. (Not all products are available in the same size range).

Of course, every CustomInk order comes with:

*Free artistic adjustments to alignment, art, or text for the best look possible
*Free proof email
*Free shipping with a guaranteed delivery date
*A quality and money-back guarantee
======================
)
FinalString := Clipboard

StringReplace, NewStr, FinalString, ========================================`r`n========================================`r`n,`r`n======================, All
StringReplace, NewStr, NewStr, Quote,Quote, All
StringReplace, NewStr, NewStr, **Plus,**Plus, All
StringReplace, NewStr, NewStr, Total Quantity,`r`nTotal Quantity, All 
StringReplace, NewStr, FinalString, `r`n========================================`r`n,`r`n======================`r`n, All


clipboard=
(
%NewStr%
)
}
else
{
IfInString, NewStr, Order #
{
StringReplace, NewStr, NewStr, Order #,`r`n`r`nOrder #
}
clipboard=
(
======================%NewStr%

======================
**Plus sizes are available in select styles at an additional cost. (Not all products are available in the same size range).

Of course, every CustomInk order comes with:

*Free artistic adjustments to alignment, art, or text for the best look possible
*Free proof email
*Free shipping with a guaranteed delivery date
*A quality and money-back guarantee
======================
)
FinalString := Clipboard

StringReplace, NewStr, FinalString, ========================================`r`n========================================`r`n,`r`n======================, All
StringReplace, NewStr, NewStr, Quote,`r`n`r`nQuote, All
StringReplace, NewStr, NewStr, Total Quantity,`r`nTotal Quantity, All 
clipboard=
(
%NewStr%
)
}
clipwait
send ^v
sleep 333
clipboard=
(
%incNumber%
)
Reporting("quotebulk")
}
return

; Quote / Quote Singles - With Perks / Hotkey ID 38

::#quotesingles::
::#singlesquote::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
incNumber := Clipboard

Loop
{
StringReplace, incNumber, incNumber,#1,,UseErrorLevel


        if ErrorLevel = 0  ; No more replacements needed.
            break


    }

needleTwo = "Item 1. "
StringReplace, NewStr, NewStr, `r`n`r`n`r`n`r`n, , All
IfInString, incNumber, Item 2
{
StringReplace, NewStr, incNumber, Copy of ,, All
Loop
    {
        StringReplace, NewStr, NewStr, `r`n`r`n`r`n, `r`n======================`r`n`r`n, UseErrorLevel
        if ErrorLevel = 0  ; No more replacements needed.
            break
    }

NewStr:=RegExReplace(NewStr,"` +","` ")
}
else
{
StringReplace, NewStr, incNumber, Item 1., %A_SPace%, All
Loop
    {
        StringReplace, NewStr, NewStr, `r`n`r`n`r`n, `r`n======================`r`n`r`n, UseErrorLevel
        if ErrorLevel = 0  ; No more replacements needed.
            break
    }
StringReplace, NewStr, NewStr, Copy of ,, All
NewStr:=RegExReplace(NewStr,"` +","` ")
}
; StringReplace, NewStr, NewStr, `r`n`r`n, `r`n, All
dmatter := StrReplace(NewStr, Quote, Quoted, Counting)
RegExReplace(NewStr, "Quote", "", Count)

if (Count > 1)
{
clipboard=
(
======================

%NewStr%

======================
**Plus sizes are available in select styles at an additional cost. (Not all products are available in the same size range).

Of course, every CustomInk order comes with:

*Artistic adjustments to alignment, art, or text for the best look possible
*Free two-week shipping with a guaranteed delivery date
======================
)
FinalString := Clipboard

StringReplace, NewStr, FinalString, ========================================`r`n========================================`r`n,`r`n======================, All
StringReplace, NewStr, NewStr, Quote,Quote, All
StringReplace, NewStr, NewStr, **Plus,**Plus, All
StringReplace, NewStr, NewStr, Total Quantity,`r`nTotal Quantity, All 
StringReplace, NewStr, FinalString, `r`n========================================`r`n,`r`n======================`r`n, All


clipboard=
(
%NewStr%
)
}
else
{
IfInString, NewStr, Order #
{
StringReplace, NewStr, NewStr, Order #,`r`n`r`nOrder #
}
clipboard=
(
======================%NewStr%

======================
**Plus sizes are available in select styles at an additional cost. (Not all products are available in the same size range).

Of course, every CustomInk order comes with:

*Artistic adjustments to alignment, art, or text for the best look possible
*Free two-week shipping with a guaranteed delivery date
======================
)
FinalString := Clipboard

StringReplace, NewStr, FinalString, ========================================`r`n========================================`r`n,`r`n======================, All
StringReplace, NewStr, NewStr, Quote,`r`n`r`nQuote, All
StringReplace, NewStr, NewStr, Total Quantity,`r`nTotal Quantity, All 
clipboard=
(
%NewStr%
)
}
clipwait
send ^v
sleep 333
clipboard=
(
%incNumber%
)
Reporting("quotesingles")
}
return

; General / Bulk Perks / Hotkey ID Not Assigned

::#bulkperks::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
Every CustomInk order comes with:

*Artistic adjustments to alignment, art, or text for the best print possible
*Free proof email to review any adjustments before printing
*Free shipping with a guaranteed delivery date
*CustomInk’s quality and money-back guarantee
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
}
return

; General / Singles Perks / Hotkey ID Not Assigned

::#singlesperks::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
Every CustomInk order comes with:

*Artistic adjustments to alignment, art, or text for the best print
*Free, two-week shipping with a guaranteed delivery date
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("bulkperks")
}
return

; Quote / Price Help / Hotkey ID 39

::#pricehelp::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
I'll be happy to help you find a more budget-friendly option for your design! Is there a specific budget that you have in mind?
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("pricehelp")
}
return

; Quote / Sleeve Price / Hotkey ID 40 (email) & ID 125 (chat)

::#sleeveprice::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
IfInString, sURL, %lp%
{
prevClip := Clipboard
clipboard=
(
I just have to ask a couple of quick questions that’ll help me get this quote. First, how many colors are you planning to use on your sleeve print?
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("sleeveprice")
}
else
{
prevClip := Clipboard
clipboard=
(
I can definitely get you pricing on your sleeve print! The quote listed below has the pricing setup for your custom design with the sleeve print. Which sleeve would you like to have your design on? If we’re including text on the sleeve, would you like it sentenced up, sentenced down, or stacked? Please click on the link below to see those options:

http://www.customink.com/help_center/print-on-the-sleeve

Once I get this information back from you, I can make a note in your design!

)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("sleeveprice")
}
}
return

; Quote / AP / Hotkey ID 41 (email) & ID 126 (chat)

::#ap::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
prevClip := Clipboard
clipboard=
(
Here's how ordering works, you can order the same design and same shirt style at the original per piece price you paid. There is a flat setup fee to cover the cost of printing, but you can order up to five pieces for this special offer! Here is your pricing:
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("ap")
}
else
{
prevClip := Clipboard
clipboard=
(
I can definitely help you out! We have a special type of order just for this situation. Here's how it works, you can order the same design and same shirt style at the original per-piece price you paid (unless you'd like to change it). There is a flat setup fee to cover the cost of printing, but you can order up to five pieces for this special offer.
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("ap")
}
}
return

; General / Call For You / Hotkey ID 42

::#callforyou::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
custEmail := Clipboard
clipboard=
(
Hey there! I've got %custEmail% on the line asking to speak with you. Are you available to take the call?
)
clipwait
send ^v
sleep 333
clipboard=
(
%custEmail%
)
Reporting("callforyou")
}
return

; General / E-mail for you / Hotkey ID 43

::#emailforyou::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
custEmail := Clipboard
clipboard=
(
Hey there! I've just claimed an e-mail from %custEmail% and I saw that you were working with them recently. Would you like me to RA so you can continue to work with them?
)
clipwait
send ^v
sleep 333
clipboard=
(
%custEmail%
)
Reporting("emailforyou")
}
return

; General / Hey Design / Hotkey ID 44

::#heydesign::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
prevClip := Clipboard
IniRead, CustomHeyDesign, %ini%, origHeyDesign, KEY1

if (CustomHeyDesign = "no")
{

FileRead, HeyDesignText, %A_ScriptDir%\text_files\hey_design.txt
clipboard=
(
%HeyDesignText%
)
}
else
{
clipboard=
(
Thank you for choosing CustomInk! I'm happy to help you with your design and you can count on me to help with anything you need while we bring your custom design to life!
)
}
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("heydesign")
}
return

; General / Hey Pricing / Hotkey ID 45

::#heypricing::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
prevClip := Clipboard
IniRead, CustomHeyPricing, %ini%, origHeyPricing, KEY1

if (CustomHeyPricing = "no")
{
FileRead, HeyPricingText, %A_ScriptDir%\text_files\hey_pricing.txt
clipboard=
(
%HeyPricingText%
)
}
else
{
clipboard=
(
Thank you for choosing CustomInk! I'm happy to help put together a quote for your custom design and you can count on me to make sure that your experience with us is outstanding!
)
}
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("heypricing")
}
return

::#me::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
%showName%
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("me")
}
return


::#ooo::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
Thank you so much for emailing back in! {REP} is not in the office at the moment but I am happy to help out the best I can.
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("ooo")
}
return

; Quote/ Budget / Hotkey ID Not Assigned

::#budget::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
Do these prices work within your budget?  If not, please let me know and I can start working on a quote that works better for you. If you have any other questions along the way, feel free to reply to this email or call me directly.  Once I hear back, we'll be able to take the next steps in making your design come to life. I've included all of my contact information below. Thanks again for choosing CustomInk. I look forward to hearing from you!
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("budget")
}
return


; General / Bye Order / Hotkey ID 46

::#byeorder::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
prevClip := Clipboard
IniRead, CustomByeOrder, %ini%, origByeOrder, KEY1

if (CustomByeOrder = "no")
{
FileRead, ByeOrderText, %A_ScriptDir%\text_files\bye_order.txt
clipboard=
(
%ByeOrderText%
)
}
else
{
clipboard=
(
If you have any other questions along the way, feel free to reply to this email or call me directly. Once I hear back, we'll be able to take the next steps in making your design come to life.  I've included all of my contact information below. Thanks again for choosing CustomInk. I look forward to hearing from you!
)
}
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("byeorder")
}
return

; Will pull info from the client AHK file for this.
; General / Close / Hotkey ID 47

::#close::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
prevClip := Clipboard
IniRead, CustomGeneralClosing, %ini%, origGeneralClosing, KEY1
if (CustomGeneralClosing = "no")
{
FileRead, Close, %A_ScriptDir%\text_files\close.txt
clipboard=
(
%Close%
)
}
else
{
clipboard=
(
Please feel free to respond to this email or give me a call if you have any questions and I'll be happy to help! My contact details are listed below. Thank you again for choosing CustomInk and I hope you have a wonderful day!
)
}
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("close")
}
return

; Shipping / All Shipping / Hotkey ID 48 (email) & ID 127 (chat)

::#allshipping::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
prevClip := Clipboard
clipboard=
(
We offer free standard two-week delivery for every order as well as expedited options in case you need it sooner. Do you have a specific delivery date you need these by?
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("allshipping")
}
else
{
prevClip := Clipboard
clipboard=
(
I can definitely help with a breakdown of our delivery options!

 - We offer free, standard two-week delivery for your order, and two rush options if you need it faster!

- Rush delivery guarantees your order arrives within 6 to 8 days, for an additional 10`% of your order total.

- Super Rush delivery guarantees your order arrives in 5 or fewer days, for an additional 25`% of your order total.

)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("allshipping")
}
}
return

; Shipping / Standard / Hotkey ID 49

::#standard::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
With our free, standard delivery, your package is guaranteed to deliver within two weeks from when you pay.
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("standard")
}
return

::#cr::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
Customer reports that
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("cr")
}
return

; Shipping / Rush / Hotkey ID 51

::#rush::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
Choosing Rush delivery guarantees your custom order is delivered within 6-8 days, for an additional cost of 10`% of your order total.
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("rush")
}
return

; Shipping / SR / Hotkey ID 52

::#sr::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
Our fastest delivery option is Super Rush, where we guarantee delivery within 5 days. This service is available for an additional cost of 25`% of your order total.
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("sr")
}
return

; Shipping / International / Hotkey ID 53

::#worldwide::
::#international::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
Currently, we are unable to ship outside of the United States or Canada, unless the address is an Army Post Office (APO), Fleet Post Office (FPO) or Diplomatic Post Office (DPO). If you know anyone at any of these locations, we can easily ship to them, so they can then pass your order onto you! Do you have an address in the US we could ship the order to?
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("worldwide")
}
return

!z::
if ((skill = 1) || (skill = 5))
{
prevClip := Clipboard
IniRead, CustomAltZ, %ini%, origAltZ, KEY1
if (CustomAltZ = "no")
{
FileRead, Close, %A_ScriptDir%\text_files\AltZ.txt
clipboard=
(
%Close%
)
}
else
{
clipboard=
(
Currently, we are unable to ship outside of the United States or Canada, unless the address is an Army Post Office (APO), Fleet Post Office (FPO) or Diplomatic Post Office (DPO). If you know anyone at any of these locations, we can easily ship to them, so they can then pass your order onto you! Do you have an address in the US we could ship the order to?
)
}
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("Alt+Z - Chat")
}
return

; Group / Group Info / Hotkey ID 54 (email) & ID 111 (chat)

::#gof::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
prevClip := Clipboard
clipboard=
(
Our Group Order Form makes it easy to coordinate your group’s order online! You can share your design, collect sizes, and take individual payments. It’s free to use and helps organize orders for groups of any size. Would you like me to help you get started?
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("gof")
}
else
{
prevClip := Clipboard
clipboard=
(
I suggest using our online Group Order Form to coordinate your group's order. You can share the design with your group, have them pick their own sizes, and even take individual payments online. It's free to use and can be very helpful in coordinating an order for any sized group. You can set a deadline for your group members to make their selections and then place one order for everyone. 

For more information, check out: http://www.customink.com/groups

)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("gof")
}
}
return

; Group / Group Price / Hotkey ID 55

::#gofprice::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
When you set up a Group Order Form, you're asked to select the number of shirts you think your group will order. This helps us estimate how much each shirt will cost.

If more people sign up than you originally estimate, the per-item cost will drop and we'll cut you a check for the difference at the end. If fewer people sign up than estimated, the per-shirt cost goes up and you will have to make up that difference when the final group order is placed.
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("gofprice")
}
return

; Group / Group Design / Hotkey ID 56 

::#gofdesign::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
Once your Group Order Form is started, we can’t change the design that it links to. We can always cancel that form and start up a new one for you to share. Anyone who's signed up will be refunded if they've paid online and they'll need to place their order again within the new Group Order Form.
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("gofdesign")
}
return

; Group / Group Cancel / Hotkey ID 57 (email) & ID 114 (chat)

::#gofcancel::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
prevClip := Clipboard
clipboard=
(
I can cancel your Group Order Form for you. Keep in mind, anyone who has already paid online will be refunded and your group will no longer be able to use that link again. 
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("gofcancel")
}
else
{
prevClip := Clipboard
clipboard=
(
I can definitely help you cancel your Group Order Form. Keep in mind, anyone who has already paid online will be refunded and your group will no longer be able to use that link again. If you’re sure you’d like to cancel your entire Group Order Form, confirm that with me and I'll take care of it for you!
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("gofcancel")
}
}
return

; Group / Group Setup / Hotkey ID 58 (email) & ID 115 (chat)

::#gofsetup::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
clipboard=
(
If you click here, you can setup your group order form! You'll be able to estimate the number of shirts you need, add group information, and share the link with everyone in your group. If you have any questions about setting things up, I'll be happy to help!
)
}
else
{
groupLink := Clipboard
clipboard=
(
I can definitely help you get your Group Order Form setup! Please click on the link below to get started:

%groupLink%

You'll be able to estimate the number of shirts you need, add group information, and share the link with everyone in your group. If you have questions about setting things up, I'll be happy to help!
)
}
clipwait
send ^v
sleep 333
clipboard=
(
%groupLink%
)
Reporting("gofsetup")
}
return

; Post-Order / Order Done / Hotkey ID 59 (email) & ID 139 (chat)

::#orderdone::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
incNumber := Clipboard
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
prevClip := Clipboard
clipboard=
(
Your order number is %incNumber% and I've sent you a confirmation email with your order details and a payment link. Once we've received payment we'll begin processing your order!
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
}
else
{
prevClip := Clipboard
clipboard=
(
Ok, we’re all setup here! Your order is currently pending and we’ll start processing it just as soon as we complete payment. Your order number is %incNumber% and I’m sending you a confirmation email with all of your billing and tracking information. Once the payment has been received, the delivery clock for your order will begin.
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("orderdone")
}
}
return

; Post-Order / Order Done Link / 

::#orderdonelink::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
incNumber := Clipboard
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
prevClip := Clipboard
clipboard=
(
Ok, we’re all setup here! Your order is currently pending and we’ll start processing it just as soon as we receive payment. Your order number is %incNumber% and I’m sending you a confirmation email with all of your billing details as well as a link where you can track your order. To complete payment, please click here to pay through our secure on-line system. Once the payment has been received, the delivery clock for your order will begin.
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("orderdonelink")
}
else
{
prevClip := Clipboard
clipboard=
(
Ok, we’re all setup here! Your order is currently pending and we’ll start processing it just as soon as we complete payment. Your order number is %incNumber% and I’m sending you a confirmation email with all of your billing and tracking information. Once the payment has been received, the delivery clock for your order will begin. To complete payment for your order, please use the link listed below:

*Paste Payment Link Here*
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
}
Reporting("orderdonelink")
}
return

::#vouchercode::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
After you finish working in the Design Lab, the first page of the checkout cart is the Summary Page. Beneath your current order total will be red text, which reads, "Do you have a voucher code?" Clicking this text will reveal a box where you can enter your unique code! Please let me know if this works, as I'd be happy to personally enter that code for you as well.
)
sleep 333  ;or clipwait
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("vouchercode")
}
return

::#pers::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
Our basic guidelines are $4.50 per personalized name, and $2.50 per personalized number. Did you already have a list of your names prepared? If so, I can take a look and finalize the pricing for you.
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("pers")
}
return


; Post-Order / Check Info / Hotkey ID 60

::#checkinfo::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
incNumber := Clipboard
clipboard=
(
CustomInk's mailing address for checks/money orders varies depending on the method you use to send it. Make sure to reference your CustomInk order number: (%incNumber%) in the Memo section.

When sending your payment by traditional mail:

CustomInk
PO Box 759439
Baltimore, MD 21275-9439
Attn: Accounts Receivable

When sending your payment via any expedited fashion (Priority, 2nd Day, Overnight, etc.), FedEx or UPS:

CustomInk
Attn: Accounts Receivable
2910 District Ave
Fairfax, VA 22031

Once we receive the check, we will be able to provide you with your guaranteed delivery date and begin processing your order. If you have any questions, please feel free to contact me at 800-293-4232 or respond to this email and I'll be happy to help you!
)
clipwait
send ^v
sleep 333
clipboard=
(
%incNumber%
)
Reporting("checkinfo")
}
return

; Post-Order / PO Info / Hotkey ID 61

::#poinfo::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
incNumber := Clipboard
clipboard=
(
Here are instructions to complete your order with CustomInk:

To complete your pending order, please fax a copy of your PO to 703-935-0080.

Please be sure your faxed PO includes the following information:

* Purchase order number and date
* Your CustomInk order number: (%incNumber%)
* Billing address
* Total $ amount
* Authorized signature

Your approval will be required to complete your order. We will send you an email as soon as your proofs are ready.

Please monitor your email for this to avoid delays in your order.

Your delivery date will be confirmed once we receive your signed PO.
)
clipwait
send ^v
sleep 333
clipboard=
(
%incNumber%
)
Reporting("poinfo")
}
return

::#vsslink::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
incNumber := Clipboard
clipboard=
(
I know sometimes it can be hard to visualize! Here is a link to show how your design will look if we print the same size design on all of the shirts in your order. http://www.customink.com/help_center/designs-on-different-sizes
)
clipwait
send ^v
sleep 333
clipboard=
(
%incNumber%
)
Reporting("vsslink")
}
return

::#halftoneslink::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
incNumber := Clipboard
clipboard=
(
Here is a visual to show how we could use halftones to print your design! http://www.customink.com/help_center/what-is-halftone-printing
)
clipwait
send ^v
sleep 333
clipboard=
(
%incNumber%
)
Reporting("halftoneslink")
}
return

::#printlink::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
incNumber := Clipboard
clipboard=
(
We have different methods of printing depending on your design and the product. Here’s an explanation of our different methods! http://www.customink.com/help_center/screen-vs-digital-printing
)
clipwait
send ^v
sleep 333
clipboard=
(
%incNumber%
)
Reporting("printlink")
}
return

::#contentno::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
incNumber := Clipboard
clipboard=
(
Your design contains material that is protected by __ and we would need permission from them to be able to print this design. Would you be able to reach out to ___ ?
)
clipwait
send ^v
sleep 333
clipboard=
(
%incNumber%
)
Reporting("contentno")
}
return

::#peml?::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
incNumber := Clipboard
clipboard=
(
It looks like everything is on schedule for the order! The picture proof email is one of the last steps before printing. I would expect the artwork to be all finished up in the next couple of days!
)
clipwait
send ^v
sleep 333
clipboard=
(
%incNumber%
)
Reporting("peml")
}
return

::#gof$::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
incNumber := Clipboard
clipboard=
(
CustomInk's volume discount kicks in if you order more shirts than your estimate, which lowers your per-item cost. However, your group members always pay the prices listed at the start of your Group Order From. If you exceed your goal, you as the organizer receive a check for the remainder after the order is delivered. If you come in lower than your goal, you as the organizer are responsible for the difference in the balance. I always recommend underestimating how many shirts will be ordered just to be safe!
)
clipwait
send ^v
sleep 333
clipboard=
(
%incNumber%
)
Reporting("gof$")
}
return

; Post-Order / Tracking / Hotkey ID 62 (email) & ID 142 (chat)

::#tracking::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
upsTracking := Clipboard
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
clipboard=
( 
You can track your order status with us by using the following link:
http://wwwapps.ups.com/WebTracking/track?track=yes&trackNums=%upsTracking%=%upsTracking%
)
clipwait
send ^v
sleep 333
Clipboard = %upsTracking%
Reporting("tracking")
}
else
{
clipboard=
(
You can track your order status with us by using the following link:

http://wwwapps.ups.com/WebTracking/track?track=yes&trackNums=%upsTracking%

)
clipwait
send ^v
sleep 333
Clipboard = %upsTracking%
Reporting("tracking")
}
}
return

; Post Order / Follow Up / Hotkey ID 63

::#followup::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
prevClip := Clipboard
IniRead, CustomFUGeneral, %ini%, origFUGeneral, KEY1

if (CustomFUGeneral = "no")
{
FileRead, FUGeneralText, %A_ScriptDir%\text_files\fu_general.txt
clipboard=
(
%FUGeneralText%
)
}
else
{
clipboard=
(
Thank you for choosing CustomInk! It was a pleasure (***speaking, chatting, emailing, etc.***) with you earlier and I'm happy to be able to help you!

Whether you need some help in creating a design from scratch, touching up some artwork, or selecting the perfect product, please feel free to reach out to me with anything you need. My contact details are listed below. Thanks again for choosing CustomInk and I hope you have a wonderful day!
)
}
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("followup")
}
return

::#preship::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
Hi xxxx,

Thank you so much for your email! I’m more than happy to answer any questions you have about the order process.

It's fairly common for us to ship your order out just days (or even one day) before it's set to deliver. Rest assured that your order is still on track for your guaranteed delivery date of xxxxxxxx. Once your order ships, you’ll receive an email with tracking information.

Please let me know if there is anything additional I can help you with. You can reply to this email, or call me at 1 (866) 485-8160.

Thanks again,
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("preship")
}
return

; Post Order / Follow Fix /

::#followfix::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
prevClip := Clipboard
IniRead, CustomFUFix, %ini%, origFUFix, KEY1

if (CustomFUFix = "no")
{
FileRead, FUFixText, %A_ScriptDir%\text_files\fu_fix.txt
clipboard=
(
%FUFixText%
)
}
else
{
clipboard=
(
Thank you so much for hanging in there! I saw that your replacements delivered recently, and wanted to see how you liked them. I hope they look exactly as you were hoping this time around. What do you think?
)
}
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("followfix")
}
return

; Post Order / Follow Up / Hotkey ID 63

::#followdesign::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
prevClip := Clipboard
IniRead, CustomFUDesign, %ini%, origFUDesign, KEY1

if (CustomFUDesign = "no")
{
FileRead, FUDesignText, %A_ScriptDir%\text_files\fu_design.txt
clipboard=
(
%FUDesignText%
)
}
else
{
clipboard=
(
Thank you so much for your call today! I loved talking about ____________________. I wanted to make sure I sent over the design that we created together today.

***Paste Design Link Here***
)
}
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("followdesign")
}
return

::#followquote::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
prevClip := Clipboard
IniRead, CustomFUQuote, %ini%, origFUQuote, KEY1

if (CustomFUQuote = "no")
{
FileRead, FUQuoteText, %A_ScriptDir%\text_files\fu_quote.txt
clipboard=
(
%FUQuoteText%
)
}
else
{
clipboard=
(
Thank you so much for your call today! I loved talking about _________________. I wanted to make sure that I sent over the quote that we had discussed.

***Paste Quote Here***
)
}
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("followquote")
}

return

::#followorder::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
prevClip := Clipboard
IniRead, CustomFUOrder, %ini%, origFUOrder, KEY1

if (CustomFUOrder = "no")
{
FileRead, FUOrderText, %A_ScriptDir%\text_files\fu_order.txt
clipboard=
(
%FUOrderText%
)
}
else
{
clipboard=
(
I just wanted to send you a personal thank you for ordering with us. I think that these shirts are going to be perfect for your _________________________. Please know that my service does not end here and, if there is anything else that I can do to help, let me know. I’ve included all of my contact information below just for you.

Thanks again, and I hope that you have a great rest of your day!
)
}
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("followorder")
}
return

; Post-Order / Delivered / Hotkey ID 64

::#delivered::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
Thank you for choosing CustomInk! I've been keeping track of your order since it was placed to make sure that everything has went smoothly and I saw it was recently delivered to you. I'm reaching out to you to make sure that you're 100`% satisfied with your custom items and to let you know that I'm here for you if you need anything at all!

If you have any questions, please feel free to give me a call or respond to this e-mail and I'll be happy to help you! My personal contact details are listed below. Thanks again for choosing CustomInk and I hope you have a wonderful day!
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("delivered")
}
return

; Products / Canada Blanks - What's available for our Canadian customers / Hotkey ID 65 (email) & ID 166 (chat)

::#canadablanks::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
We are located in the United States, but have a specific selection of products available for our Canadian customers. If you use the link below, you'll be able to check out the products that we can use with your custom design. 

http://www.customink.com/categories/canada-products/64
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("canadablanks")
}
return 

; Products / Koozies / Hotkey ID 66

::#koozies::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
Currently, the minimum to order koozies ranges between 50 and 100, depending on the style of koozie. I'm happy to help you with some pricing if you'd like to order koozies!
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("koozies")
}
return

; Products / Glasses / Hotkey ID 67

::#glasses::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
Currently, the minimum to order glasses is 72. Printing and shipping glassware is very labor intensive, and having a higher minimum allows us to give your order the attention it deserves. I'm happy to show you some pricing if you’re interested in glassware!
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("glasses")
}
return

; Products / Magnets / Hotkey ID 68

::#magnets::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
Currently, the minimum to order magnets is 100. Printing on magnets is very labor intensive, and having a higher minimum allows us to give your order the attention it deserves. I'm happy to show you some pricing if you'd like to order at least 100!
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("magnets")
}
return

; Products / Stickers / Hotkey ID 69

::#stickers::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
Currently, the minimum to order stickers is 250. The reasoning behind it is, the set up process is pretty extensive, and having a higher minimum allows us to give your order the attention it deserves. I'd be happy to show you some pricing if you'd like to order at least 250!
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("stickers")
}
return

; Products / Cups / Hotkey ID 70

::#cups::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
Currently, the minimum to order cups ranges between 72 and 100, depending on the type. Printing on cups is very labor intensive, and having a higher minimum allows us to give your order the attention it deserves. I'm happy to show you some pricing if you'd like to order cups within those quantities!
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("cups")
}
return

; Products / MousePads / Hotkey ID 71

::#mousepads::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
Currently, the minimum to order mouse pads is 50. Printing on mouse pads is very labor intensive, and having a higher minimum allows us to give your order the attention it deserves.  I'm happy to show you some pricing if you'd like to order at least 50!
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("mousepads")
}
return

; Products / Color Max - Performance Max Colors / Hotkey ID 72

::#colormax::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
Our performance shirts are able to receive a maximum of two colors during the printing process. I can help pick the two best colors to keep in your design and have my design team make those adjustments to your artwork. After the order is placed, we’ll send you an email proof of any changes before we print. This is at no cost to you because, we want to make sure you're 100`% satisfied with your custom artwork.
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("colormax")
}
return

; Products / Mugs / Hotkey ID 73

::#mugs::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
Currently, the minimum to order mugs is 72. Printing and shipping mugs is very labor intensive, and having a higher minimum allows us to give your order the attention it deserves. I'm happy to show you some pricing if you'd like to order mugs!
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("mugs")
}
return

; Products / Paper / Hotkey ID 74

::#paper::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
Currently, the minimum to order paper products is 500. Printing on paper is very labor intensive, and having a higher minimum allows us to give your order the attention it deserves.  I'm happy to show you some pricing if you'd like to order at least 500!
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("paper")
}
return

; Products / Pens / Hotkey ID 75

::#pens::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
Currently, the minimum to order pens ranges between 50 and 300, depending on the type. Printing on pens is very intricate, and having a higher minimum allows us to give your order the attention it deserves. I'm happy to show you some pricing if you'd like to order within those quantities!
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("pens")
}
return

; Products / Bottles / Hotkey ID 76

::#bottles::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
Currently, the minimum to order water bottles ranges between 50 and 100, depending on the particular product. Printing on bottles is very labor intensive, and having a higher minimum allows us to give your order the attention it deserves.  I'd be happy to show you some pricing if you'd like to order water bottles within those quantities.
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("bottles")
}
return

; Problem / Problem Photo / Hotkey ID 77 (email) & ID 178 (chat)

::#probphoto::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
prevClip := Clipboard
clipboard=
(
Would it be possible for you to send some photos of the issue so I can assess the problem? I’m going to send you an email. Please respond to the email with the photos attached. Then, I’ll review them and figure out the best solution!
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("probphoto")
}
else
{
prevClip := Clipboard
clipboard=
(
I'm sorry to hear that there was a problem with your order and I’m happy to help find a resolution for you!

Would it be possible to take photos so I can see exactly what happened? If you can respond to this email with those photos attached, I can review them with the print team and figure out the best solution!
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("probphoto")
}
}
return

; Problem / Return / Hotkey ID 78

::#probreturn::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
I would like to get your order returned to us for inspection. Our team will go over every aspect of the items and your reported concerns to see what happened with your order. If it is correctly printed as it was supposed to be done, we can arrange to have this sent back to you in a timely manner so we do not miss your event. If they are not, we will contact you to see how you would like to proceed.
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("probreturn")
}
return

; Discount / Discount / Hotkey ID 79 (email) & ID 162 (chat)

::#discount::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
prevClip := Clipboard
clipboard=
(
We often get requests for discounts for specific groups, but because we can’t always accommodate such requests, we’ve chosen to offer an great alternative for all our customers! Pear – our dedicated sponsorship website – can help groups raise sponsorship dollars from local and national brands by gathering support from your friends and family. It’s completely free and very easy to sign up, do you think this would work for your group?
)
}
else
{
prevClip := Clipboard
clipboard=
(
While we do not have specific discounts available, we can connect you with sponsors who can help you raise sponsorship dollars for your order. Pear is an easy service that can help your group to raise money from local and national brands by gathering support from friends and family. For more information, please click on the link below to visit the PearUp.com website:

https://www.pearup.com/find-a-sponsor
)
}
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("discount")
}
return

; Discount / Charity / Hotkey ID 80 (email) & ID 163 (chat)

::#charity::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
prevClip := Clipboard
clipboard=
(
I definitely applaud the charitable work that your group is doing for the community! While we don't have any specific discounts that we are able to make, we do have a sponsorship website called Pear where your group can raise sponsorship dollars from local and national brands by gathering support from friends and family. It's free and very easy to sign up. For more information, please click on the link below to visit the PearUp.com website:

https://www.pearup.com/find-a-sponsor
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("charity")
}
else
{
prevClip := Clipboard
clipboard=
(
I definitely applaud the charitable work that your group is doing for the community! While we don't have any specific discounts that we are able to make, we do have a sponsorship website called Pear where your group can raise sponsorship dollars from local and national brands by gathering support from friends and family. It's free and very easy to sign up. For more information, please click on the link below to visit the PearUp.com website:

https://www.pearup.com/find-a-sponsor
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("charity")
}
}
return

; Discount / Pear / Hotkey ID 81 (email) & ID 164 (chat)

::#pear::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
prevClip := Clipboard
clipboard=
(
We offer a sponsorship opportunity through Pear. Your group can earn fund to use towards your order by gathering support from friends and family. It's very easy to sign up. Here's a link to get started https://www.pearup.com/
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("pear")
}
else
{
prevClip := Clipboard
clipboard=
(
We have a sponsorship website called Pear where your group can raise sponsorship dollars from local and national brands by gathering support from friends and family. It's free and very easy to sign up. For more information, please click on the link below to visit the PearUp.com website:

https://www.pearup.com/find-a-sponsor
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("pear")
}
}
return

::#pearlink::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
https://www.pearup.com/
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("pearlink")
}
return

; Discount / Booster / Hotkey ID 82 (email) & ID 165 (chat)

::#booster::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
prevClip := Clipboard
clipboard=
(
So many of our customers were doing amazing work for fundraisers and charities that we created Booster, a site devoted to helping group organizers use custom t-shirts as a fundraising tool. It's a unique way to fundraise, while building awareness of your cause within your community. You get to create an awesome design, set the price, and then use your personalized website to sell the shirts online. The difference between the print cost and price you've selected then goes to the non-profit or individual of your choice! For more information about Booster, please click on the link below:

http://booster.com

If you'd like, I’m happy to take down your information and have a campaign advisor get in touch with you by phone or email to help you get started.

)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("booster")
}
else
{
prevClip := Clipboard
clipboard=
(
So many of our customers were doing amazing work for fundraisers and charities that we created Booster, a site devoted to helping group organizers use custom t-shirts as a fundraising tool. It's a unique way to not only fundraise, but build awareness of your cause within your community. You get to create an awesome design, set the price, and then use your personalized website to sell the shirts online. The difference between the print cost and price you've selected then goes to the non-profit or individual of your choice!

If you'd like, I’m happy to take down your information and have a campaign advisor get in touch with you by phone or email to help you get started.
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("booster")
}
}
return

; Singles / Minimum - Link to no minimum section / Hotkey ID 83 (email) & ID 146 (chat)

::#minimum::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
prevClip := Clipboard
clipboard=
(
We have a selection of shirts available without a minimum, so you can print your custom design on as few as just one! Click here to check out those shirts and can choose any color shirt under the "Color choices for any size order" category. 
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("minimum")
}
else
{
prevClip := Clipboard
clipboard=
(
We have a selection of shirts that are available without a minimum, so you can print your custom design on as few as just one! If you click on the link below, you'll be able to check out those shirts and can choose any color shirt under "Color choices for any size order" category.

http://www.customink.com/categories/no-minimum/96/styles
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("minimum")
}
}
return

; Singles / Canada Singles / Hotkey ID 85 (email) & ID 148 (chat)

::#canadasingles::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
prevClip := Clipboard
clipboard=
(
I'm sorry , we are not able to deliver an order of fewer than six pieces to Canada. We can print your custom design on different styles of like items, so it equals six total. Would that work for you?
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("canadasingles")
}
else
{
prevClip := Clipboard
clipboard=
(
I'm really sorry, currently we aren't able to deliver fewer than six items to our customers in Canada. We can print your custom design on different styles, so it equals six total, if that would work better for you! I can even help you get that set up and go over the different options that are available! Click on the link below to check out the options that are available for our Canadian customers:

http://www.customink.com/categories/canada-products/64
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("canadasingles")
}
}
return

; Design / Design Saved / Hotkey ID 88

::#designsaved::
if ((skill = 1) || (skill = 5))
{
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
prevClip := Clipboard
clipboard=
(
I've saved your design and left notes under your account so we'll be able to pick up where we left off last time if you start a new chat. Feel free to ask for $!{operator.nickname} when you chat back in and I'll be happy to help!
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("designsaved")
}
}
return


; Design / Retrieve / Hotkey ID 103

::#retrieve::
if ((skill = 1) || (skill = 5))
{
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
prevClip := Clipboard
clipboard=
(
I can pull your design up here with your email address. May I have the name of your design?
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("retrieve")
}
}
return


::#rotateclipart::
if ((skill = 1) || (skill = 5))
{
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
prevClip := Clipboard
clipboard=
(
Our lab currently doesn’t have a feature to rotate clipart, but I would be happy to adjust it for you. What’s the email address that you have the design saved under? 
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("rotateclipart")
}
}
return

; Quote / PQ1 - Happy to help, pull up design, how many colors and locations / Hotkey ID 116

::#pq1::
if ((skill = 1) || (skill = 5))
{
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
prevClip := Clipboard
clipboard=
(
Have you already saved your design in our Design Lab? If not, I just need to know what areas of the product we're printing on and the number of colors on each of those areas.
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("pq1")
}
}
return

; Quote / PQ2 - Style of shirt, shirt color / Hotkey ID 117

::#pq2::
if ((skill = 1) || (skill = 5))
{
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
prevClip := Clipboard
clipboard=
(
Thanks for going over your design with me! Did you have a product style, brand, or color in mind? We have a wide variety of t-shirts and other great products on our website. I’d be happy to help you find something!
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("pq2")
}
}
return

; Quote / PQ3 - Shirt sizes, total number of shirts / Hotkey ID 118

::#pq3::
if ((skill = 1) || (skill = 5))
{
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
prevClip := Clipboard
clipboard=
(
What do you think are the smallest and largest size shirts you'll need to order? Do you know how many shirts you would need overall?
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("pq3")
}
}
return

; Quote / PQ4 - Shipping / Hotkey ID 119

::#pq4::
if ((skill = 1) || (skill = 5))
{
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
prevClip := Clipboard
clipboard=
(
I'm almost done with your all-inclusive quote. We do offer guaranteed free, two-week delivery. Would that work for you or would you like to see pricing with our faster delivery options?
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("pq4")
}
}
return


::#quoteperks::
if ((skill = 1) || (skill = 5))
{
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
prevClip := Clipboard

clipboard=
(
I’ll have a quote for you in just a couple of minutes. In the meantime, here are our all-inclusive perks!  

*Free artistic adjustments to alignment, art, or text for the best look possible
*Free proof email
*Free shipping with a guaranteed delivery date
*A quality and money-back guarantee
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("quoteperks")
}
}
return

::#singlesperks::
if ((skill = 1) || (skill = 5))
{
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
prevClip := Clipboard

clipboard=
(
I’ll have a quote for you in just a couple of minutes. In the meantime, here are our all-inclusive perks!  

*Free artistic adjustments to alignment, art, or text for the best look possible
*Free shipping with a guaranteed delivery date
*A quality and money-back guarantee
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("singlesperks")
}
}
return

; Quote / High Price / Hotkey ID 123

::#highprice::
if ((skill = 1) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
I'm sorry that you felt that our pricing was a little expensive! There are many features that can change the cost of your order. If you’re interested, let me know and we can review your order together to give you a better idea of where your price came from. 
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("highprice")
}
return


; Shipping / Logistics / Hotkey ID 133

::#logistics::
if ((skill = 1) || (skill = 5))
{
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
prevClip := Clipboard
clipboard=
(
Give me a few minutes while I double check that!
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("logistics")
}
}
return

::#hold::
if ((skill = 1) || (skill = 5))
{
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
prevClip := Clipboard
clipboard=
(
This should only take a few minutes.! 
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("hold")
}
}
return

; Pre-Order / PreContact - Contact Info - How they heard about us / Hotkey ID 134

::#precontact::
if ((skill = 1) || (skill = 5))
{
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
prevClip := Clipboard
clipboard=
(
May I have your full name and a good number where we can reach you if we have questions about the order? Also, may I ask how you heard about us?
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("precontact")
}
}
return

; Pre-Order / PreAddress - Address Information / Hotkey ID 135

::#preaddress::
if ((skill = 1) || (skill = 5))
{
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
prevClip := Clipboard
clipboard=
(
Thanks! What address would you like us to use for delivery? Is this a business or residence?
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("preaddress")
}
}
return

; Pre-Order / PreShipping - Guaranteed Delivery Date / Hotkey ID 136

::#preshipping::
if ((skill = 1) || (skill = 5))
{
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
prevClip := Clipboard
clipboard=
(
Great, I've got that noted. I can guarantee your order to be delivered on or before ___________. Does that date work for you?
) 
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("preshipping")
}
}
return




; Pre-Order / PreConfirm - Confirm all order info / Hotkey ID 137

::#preconfirm::
if ((skill = 1) || (skill = 5))
{
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
address := Clipboard
clipboard=
(
It looks like everything here is setup! To confirm, we're guaranteed to deliver ____ total items to your %address% address on or before _________. The all-inclusive total for your order is _______. If everything looks good to you, I can place the order now and send you the link to complete payment on our website.
)
clipwait
send ^v
sleep 333
Clipboard = %address%
Reporting("preconfirm")
}
}
return

; Pre-Order / PreSingles - Redirect Singles Order / Hotkey ID 138

::#presingles::
if ((skill = 1) || (skill = 5))
{
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
prevClip := Clipboard
clipboard=
(
I would love to help, however, we don't currently have a way to take payment through chat. If you'd like to place your order over the phone with us, please give us a call at 800-293-4232 and we'll be happy to get everything setup for you!
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("presingles")
}
}
return

; Post Order / Cancel Order / Hotkey ID 145

::#cancelorder::
if ((skill = 1) || (skill = 5))
{
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
prevClip := Clipboard
clipboard=
(
I'm sorry to hear that you're canceling your order with us. However, I'm happy to help you with anything you need. It’ll just be one moment while I pull up your order and I'll get everything taken care of.
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("cancelorder")
}
}
return

; General / Help / Hotkey ID 149

::#help::
if ((skill = 1) || (skill = 5))
{
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
prevClip := Clipboard
clipboard=
(
Is there anything else I can help you with today?
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("help")
}
}
return

; General / Chat for you / Hotkey ID 150

::#chatforyou::
if ((skill = 1) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
Hey there! I've got %custEmail% in chat asking to speak with you. Are you available to take the chat?
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("chatforyou")
}
return

; General / Cust - Customer Name / Hotkey ID 151

::#cust::
if ((skill = 1) || (skill = 5))
{
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
prevClip := Clipboard
clipboard=
(
$!{vars.get("identifier")}
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("cust")
}
}
return

; Chat Path / Offer To Quote / Hotkey ID 152

::#quote?::
if ((skill = 1) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
If you'd like, I can show you some pricing for your custom design. I'd be happy to email it to you, as well!
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("quote?")
}
return

; Problem / Problem Review / Hotkey ID 180

::#probreview::
if ((skill = 1) || (skill = 5))
{
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
prevClip := Clipboard
clipboard=
(
I'm going to take a moment to review your order, but I'll still be here if you need anything!
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("probreview")
}
}
return

::#probsizing::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
I definitely understand that sizing can be a hard one to determine when you are ordering online. We try to keep this as intuitive as possible. Did you get a chance to look at our sizing line up for these items?

[SIZING LINE UP]

How do you feel your shirts are fitting in comparison to this sizing chart?

Each person’s body is unique, which may cause items to fit differently. However, sometimes there are manufacturing errors where the item is mislabeled or incorrectly made. Because of these possibilities, we may have you send these items back for a print specialist to inspect.

If these items are incorrect, we will replace them. If they are what we state on our sizing line up, we can work out some special pricing on a new order for items that are needed. Does that work for you?
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("probsizing")
}
return

::#swappackage::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
Today's Date:Order Numbers Involved: 
(a) 
(b)

Which Order Reported and How:

How Was The Corresponding Order Contacted:

Location Of Orders:
(a):
(b):

Event Dates:
(a):
(b):

Investigation Steps:

Pick-up/Return Tracking Numbers, or Fix Order Numbers:
(a):
(b):

Resolution Options:
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("swappackage")
}
return


::#probtones::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
You mentioned that your design looks different than you imagined it would. We used halftones in your design to create the shading in your artwork. This is a series of dots that are printed on your shirt to create a gradient effect from a light to dark color. This are a finely executed print process to make it appear as close to your original artwork as possible. Would you mind sending me a photo so I can see if your halftones were done correctly?
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("probtones")
}
return

; Problem / Problem Help / Hotkey ID 181

::#probhelp::
if ((skill = 1) || (skill = 5))
{
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
prevClip := Clipboard
clipboard=
(
I'm sorry to hear that there was a problem with your order. I'm here to help you find the right solution.
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("probhelp")
}
}
return

; Tools / Design Lab / Hotkey ID 182

#z::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
run %target% http://www.customink.com/lab
Reporting("WinZ - Design Lab")
Return
}

; Tools / Open Super Quoter / Hotkey ID 183

#s::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
run %target% https://www.customink.com/admin/quotes
Reporting("WinS - Superquoter")
}
Return

; Tools / Wiki search highlighted text / Hotkey ID 184

#w::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
    searching := Clipboard
    Sleep 50
    Run, %target% https://inkernet.customink.com/dosearchsite.action?queryString=%searching%&startIndex=0&where=ss
	Reporting("WinW - Wiki")
}
Return

; Tools / LA Chat / Hotkey ID 185

!l:: 
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
run %target% http://order-chat.in.customink.com
Reporting("AltL - LA Chat")
}
return


; Tools / Content "No" List / Hotkey ID 186

#n:: 
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
run %target% https://inkernet.customink.com/display/ss/Content+NO+List
Reporting("WinN - No List")
}
return


; Tools / Open HCP Tool / Hotkey ID 187

#h:: 
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
run %target% https://inkernet.customink.com/display/SA/HCP+Tool
Reporting("WinH - HCP Tool")
}
return

; Tools / Open Booster Referral Doc / Hotkey ID 188

#b:: 
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
run %target% http://goo.gl/WJvtcI
Reporting("WinB - Booster Ref")
}
Return


; Tools / Open Sales/Service Schedule / Hotkey ID 189

#e:: 
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
run %target% https://goo.gl/AG2CnG
Reporting("WinE - SS Schedule")
}
Return


; Quick Links / Templates - Search Templates with copied info from clipboard / Hotkey ID 190

!+t::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
savedClip := Clipboard
StringReplace, savedClip, savedClip, %A_SPACE%, -, All
Run %target% http://www.customink.com/design_ideas/search/%savedClip%
sleep 333
clipboard=
(
%savedClip%
)
Reporting("AltShiftT - Design Templates")
}
return

; General / Clipart - Search Clipart / Hotkey ID 191

!+c::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
Run %target% http://clipart.customink.com/clipart/admin/cliparts/search
Reporting("AltShiftC - Clipart")
}
return

; General / Offsite - Open Offsite Wiki Page / Hotkey ID 192

!+o::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
Run %target% https://inkernet.customink.com/display/ss/Off+Site+Products
Reporting("AltShiftO - Offsite")
}
return

::#offsitecomm::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
Offsite Pricing
1. 
- Color:
- Style:
- Supplier:
- BC:
- Stock:
- Substitute:
- Margin:
- Confirmed by LA:
- Link:
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("offsitecomm")
}
Return

; General / Products - Open Products Page / Hotkey ID 193

!+p::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
Run %target% http://customink.com/categories/
Reporting("AltShiftP - Catalog")
}
return

; General / Singles - Open No Minimum Items / Hotkey ID 194

!+s::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
url = http://www.customink.com/categories/no-minimum/96
Run, %target% %url% 
Reporting("AltShiftS - Minimum Catalog")
}
return


; Tools / Open Account (Win+Q) / Hotkey ID 195

#q::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
incNumber := Clipboard
Run, %target% http://www.customink.com/admin/sales/
IfWinNotActive, Embassy - %BrowPageName%, , WinActivate, Embassy - %BrowPageName%, 
WinWaitActive,  Embassy - %BrowPageName%, 
sleep 1500
ControlFocus, search_query, Embassy - %BrowPageName%
sleep 1500
send ^v
sleep 1500
Send, {ENTER}
clipboard=
(
%incNumber%
)
Reporting("WinQ - Accounts")
}
return

; Tools / Open College Approval List / Hotkey ID 196

#u:: 
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
run %target% https://goo.gl/DSbJKw
Reporting("WinU - University")
}
Return

; Tools / Open Specialty Pricing / Hotkey ID 197

#p:: 
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
run %target% https://docs.google.com/spreadsheets/d/1TqH8WVOdy_mIqWcErRqCj1PWGMzE9fsMR7jp953KMw4/edit?pli=1#gid=537290571
Reporting("WinP - Specialty Pricing")
}
Return

; Tools / Open The Mod

!m:: 
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
run %target% http://circuit.in.customink.com/
Reporting("AltM - Circuit")
}
Return

; Tools / Open Workday

!w:: 
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
run %target% http://workday.customink.com
Reporting("AltW - Workday")
}
Return

; Tools / Open Constraints

^!c::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
run %target% http://home.customink.com/backend/constraints/
Reporting("CtrlAltC - Constraints")
}
Return

; Design / PEML / Hotkey ID 199

::#peml::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 5))
{
prevClip := Clipboard

clipboard=
(
Hi xxxx,

Thank you for approving your proof! I’ve forwarded your order to our printing team.

Your schedule is still guaranteed for your original delivery date of xxxxxxxx. Once your order ships, you’ll receive an email with tracking information.

Please let me know if there is anything additional I can help you with. You can reply to this email, or call me at 1 (866) 485-8160.

Thanks again,
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("peml")
}
return

; Service / Voucher / Hotkey ID 200

::#voucher::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 5))
{
voucherNum := Clipboard
clipboard=
(
I hope you're having a great week! I wanted to touch base with you because I see your replacement order was delivered. How does it look? I have created a voucher for the inconvenience. You can apply it at checkout:

%voucherNum%

This code for $XX will be on file in our system, so don't worry if you lose this email, just give us a call and we can take care of the rest.

Please let me know if you have any questions or concerns, and thanks for your patience in working through this issue!

)
clipwait
send ^v
sleep 333
clipboard=
(
%voucherNum%
)
Reporting("voucher")
}
return

; Service / Problem Full Template / Hotkey ID 202

::#probfull::
if ((skill = 1) || (skill = 3) || (skill = 5))
{
prevClip := Clipboard

clipboard=
(
Hello there,

Thanks so much for reaching out to us about the problems you discovered with your order. I am so sorry to hear that the final product was inconsistent with the quality you were expecting. I want to be sure you're totally satisfied, and I can definitely work with you to get this resolved.

Is it possible for you to send me some photos of the problem spots? They can be a big help in documenting the mistakes up front and give us insight into the cause of the problem. It's possible we may need to have you return your items to fully understand the issue and ensure we provide you with the best resolution possible.

I want to make sure I'm working within your timeline; is there an upcoming event you need these for?  If it turns out that we don't have time for a full investigation, I'm happy to discuss other options with you.

Please let me know if you have any questions or concerns about all of this, and I again apologize for the problem with your order.

Thanks, and I look forward to hearing from you,
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("probfull")
}
return

; Design / Blank Sample / Hotkey ID 203

::#sample::
::#samples::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
If you would like, I’m happy to get you set up with a blank sample of the items that you're considering! This allows you to check out the fit and feel before you place your printed order with us! We offer these blank samples at a low cost and can have them delivered to you within a week with our free shipping. Would that work for you?
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("sample")
}
return


::#confirmfix::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
Before we start your replacement order, I wanted to check in with you and see if there are any changes you would like to make to your artwork or sizes before we start? If not, we can proceed right away. Please see the breakdown for the items and sizes we are sending you in this shipment:

{Quote Only}
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("confirmfix")
}
return

::#crookedphoto::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
I am so sorry to hear that your items came in crooked. Sometimes the print teams slightly tilt the artwork so that it appears straight when you wear it. Would you mind trying on your shirts and seeing if this is the issue?
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("crookedphoto")
}
return

::#crookedreport::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
Thank you so much for emailing! I am so sorry to hear that something went wrong in your order. The first step that helps us either solve or lessen this issue is trying the garments on. A lot of the time, designs can look off-center or crooked when flat, but the effect goes away when those items are on a body. Will you let me know if this happens?
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("crookedreport")
}
return

::#ghosting::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
What you are describing sounds like an issue we occasionally run into that happens when there is a unique combination of temperature and humidity during the shipping process. If I am correct, the great news is that a quick run through the wash will completely remedy this situation. Please take a picture showing the shirts and reply back to this email so I can be sure. Then, I’ll likely have you toss at least one in the wash to see if that fixes things. If not, I can work on getting the shirts back for our team to inspect
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("ghosting")
}
return

::#partial::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
Thank you so much for getting back to me! I am so sorry about the issues you’ve experienced with your order. I can offer a partial refund back on your order of {AMOUNT HERE} for the inconvenience this has all caused. Would that work out for you?
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("partial")
}
return


; General / Simple Intro Name (LP) / Hotkey ID 205

::#hidesign::
if ((skill = 1) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
Hey $!{vars.get("identifier")}! I would love to help you with your design. What's the name of the design that you have saved?
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("hidesign")
}
return

::#createdesign::
::o{Right}4::
if ((skill = 1) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
Hey $!{vars.get("identifier")}! I would love to help you create your design. What product are you looking to design on?
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("createdesign")
}
return

::#hihelp::
::o{Right}5::
if ((skill = 1) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
Hey $!{vars.get("identifier")}!! I would be happy to help you with
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("hihelp")
}
return

::#hiquote::
::o{Right}1::
if ((skill = 1) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
Hey $!{vars.get("identifier")}! I would love to help you work up some pricing. What's the name of the design that you have saved?
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("hiquote")
}
return

!n::
::n{Right}0::
if ((skill = 1) || (skill = 5))
{
prevClip := Clipboard
IniRead, CustomAltN, %ini%, origAltN, KEY1
if (CustomAltN = "no")
{
FileRead, Close, %A_ScriptDir%\text_files\AltN.txt
clipboard=
(
%Close%
)
}
else
{
clipboard=
(
Hi $!{vars.get("identifier")}! Thanks for chatting with CustomInk. I'm more than happy to personally help you with anything you may need!
)
}
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("AltN - Simple Intro No Name")
}
return

; General / No Comm Basic / Hotkey ID 206

!c::
if ((skill = 1) || (skill = 5))
{
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
prevClip := Clipboard
IniRead, CustomAltC, %ini%, origAltC, KEY1
if (CustomAltC = "no")
{
FileRead, Close, %A_ScriptDir%\text_files\AltC.txt
clipboard=
(
%Close%
)
}
else
{
clipboard=
(
It looks like we weren't able to chat with you this time around. If you got your question answered - that's great! If not, chat us again, shoot me an e-mail at service@customink.com, or give us a ring at 1-800-293-4232, and any of our t-shirt ambassadors would be happy to help!
)
}
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("AltC - No Communication")
}
}
return

; Discount / LP: Discounts / Hotkey ID 208

!d::
if ((skill = 1) || (skill = 5))
{
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
prevClip := Clipboard
IniRead, CustomAltD, %ini%, origAltD, KEY1
if (CustomAltD = "no")
{
FileRead, Close, %A_ScriptDir%\text_files\AltD.txt
clipboard=
(
%Close%
)
}
else
{
clipboard=
(
We often get requests for discounts for specific groups and since we are unable to accommodate all requests, we have chosen to offer an alternative for our customers. Here, or dedicated sponsorship website, can help groups raise sponsorship dollars from local and National Brands by gathering support from your friends and family. It's completely free and very easy to sign up and do you think this would work for your group?
)
}
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("AltD - Discounts")
}
}
return

; Discounts / Military / Hotkey ID 209

!a::
if ((skill = 1) || (skill = 5))
{
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
prevClip := Clipboard
clipboard=
(
Our discounts are offered to all customers in the way of bulk pricing. For our military customers, we are happy to offer free Creative Art Services. This service will allow you to create artwork from scratch or have us touch up your images before placing your order.
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("AltA - Military Discounts")
}
}
return



; General / Greeting With Name / Hotkey ID 210

!h::
if ((skill = 1) || (skill = 5))
{
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
prevClip := Clipboard
IniRead, CustomAltH, %ini%, origAltH, KEY1
if (CustomAltH = "no")
{
FileRead, Close, %A_ScriptDir%\text_files\AltH.txt
clipboard=
(
%Close%
)
}
else
{
clipboard=
(
Hi $!{vars.get("identifier")}! Thank you for chatting with CustomInk! I'll quickly review the form you filled out to see what I can personally help you with today.
)
}
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("AltH - Survey Greeting Name")
}
}
return

; General / Greeting No Name / Hotkey ID 211

!s::
if ((skill = 1) || (skill = 5))
{
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
prevClip := Clipboard
IniRead, CustomAltS, %ini%, origAltS, KEY1
if (CustomAltS = "no")
{
FileRead, Close, %A_ScriptDir%\text_files\AltS.txt
clipboard=
(
%Close%
)
}
else
{
clipboard=
(
Hey there, thank you for chatting with CustomInk! I'm quickly reviewing the survey you filled out to see what I can personally help you with today.
)
}
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("AltS - Survey Greeting No Name")
}
}
return

::#hidelivery::
if ((skill = 1) || (skill = 5))
{
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
prevClip := Clipboard
clipboard=
(
Hey $!{vars.get("identifier")}! I would love to help you review the delivery schedule for your potential order. Do you have a design saved with us?
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("hidelivery")
}
}
return

; General / Intro W/O Name / Hotkey ID 212

!i::
if ((skill = 1) || (skill = 5))
{
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
prevClip := Clipboard
IniRead, CustomAltI, %ini%, origAltI, KEY1
if (CustomAltI = "no")
{
FileRead, Close, %A_ScriptDir%\text_files\AltI.txt
clipboard=
(
%Close%
)
}
else
{
clipboard=
(
Hey there, thanks for chatting with CustomInk! I'm more than happy to personally help with anything you may need!
)
}
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("AltI - Simple Intro No Name")
}
}
return

; General / Lost You No Name / Hotkey ID 214

!b::
if ((skill = 1) || (skill = 5))
{
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
prevClip := Clipboard
IniRead, CustomAltB, %ini%, origAltB, KEY1
if (CustomAltB = "no")
{
FileRead, Close, %A_ScriptDir%\text_files\AltB.txt
clipboard=
(
%Close%
)
}
else
{
clipboard=
(
I'm so sorry, it looks like I've lost you at the moment! I definitely want to continue personally assisting you, so I've saved everything we've spoken about to your account and we can pick up right where we left off when you can reach us again. Please feel free to give me another chat, shoot me an email at service@customink.com, or give us a ring at 1-800-293-4232, and any of our t-shirt ambassadors would be happy to help.
)
}
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("AltB - Unresponsive")
}
}
return



!g::
if ((skill = 1) || (skill = 5))
{
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
prevClip := Clipboard
IniRead, CustomAltG, %ini%, origAltG, KEY1
if (CustomAltG = "no")
{
FileRead, Close, %A_ScriptDir%\text_files\AltG.txt
clipboard=
(
%Close%
)
}
else
{
clipboard=
(
The way our group order form works is really awesome! After you create and Save Your Design, you put in an estimate for how many shirts you think your group might need then you are provided with pricing based off of your design/estimated quantity.

You will then be offered a personalized link to send out your group to send out to your group that they can use to order and even pay for their shirts. Once the form is closed and all the payments are collected the order is ready to be placed. As soon as its place and we will deliver it to you, the organizer, within 2 weeks. Does that sound like it might work for you?
)
}
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("AltG - Group Order")
}
}
return

; General / Lost You W/ Name / Hotkey ID 215

!v::
if ((skill = 1) || (skill = 5))
{
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
prevClip := Clipboard
clipboard=
(
I'm so sorry $!{vars.get("identifier")}, it looks like I've lost you at the moment! I definitely want to continue personally assisting you, so I've saved everything we've spoken about to your account and we can pick up right where we left off when you can reach us again. Please feel free to give me another chat, shoot me an e-mail at service@customink.com, or give us a ring at 1-800-293-4232, and any of our t-shirt ambassadors will be happy to help!
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("AltV - Lost You Name")
}
}
return

; General / Bye Survey / Hotkey ID 216

!x::
::#bye::
if ((skill = 1) || (skill = 5))
{
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
IniRead, CustomAltX, %ini%, origAltX, KEY1
if (CustomAltX = "no")
{
FileRead, Close, %A_ScriptDir%\text_files\AltX.txt
clipboard=
(
%Close%
)
}
else
{
prevClip := Clipboard
clipboard=
(
Thank you again for chatting with CustomInk, where T-shirts Unite! If you have future questions, my name was $!{operator.nickname} and you can always request my assistance.
)
}
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("AltX - Goodbye Survey")
}
}
return

; General / Designing / Hotkey ID 217

::#designing::
if ((skill = 1) || (skill = 5))
{
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
prevClip := Clipboard
clipboard=
(
This design work will just take a few minutes! I’ll be right back with a link to your design. 
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("designing")
}
}
return

; General / Checking / Hotkey ID 218

::#checking::
if ((skill = 1) || (skill = 5))
{
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
prevClip := Clipboard
clipboard=
(
I'm going to take a couple of minutes and check into this for you, would you mind waiting with me, or would you prefer that I email that information to you instead?
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("checking")
}
}
return

; General / E-mail / Hotkey ID 219

::#email::
if ((skill = 1) || (skill = 5))
{
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
prevClip := Clipboard
clipboard=
(
May I have your email address so I can pull up your account?
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("email")
}
}
return

::#transcript::
if ((skill = 1) || (skill = 5))
{
lp = live
WinGetActiveTitle, Title
ifInString, Title, %lp%
{
prevClip := Clipboard
clipboard=
(
You can actually have our entire conversation emailed to you as soon as you end the chat by clicking the "X" at the top right hand corner! Will that work?
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("transcript")
}
}
return

; General / DPI Bulk / Hotkey ID Not Assigned

::#dpibulk::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
We can absolutely work with your photograph and transform it into a design on one of our products. The final printed design may depend on the quality of your image, the type of product you're interested in, and the style of design you're looking for. To guarantee your image will look great when we print it, we require a minimum resolution determined by the size of the printed design.

Currently, your image is not at a high enough resolution to print at your desired size. Do you happen to have a higher-resolution image we can use instead? If not, we can create something for you in our Design Lab using our awesome artwork!
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("dpibulk")
}
return

; General / DPI Singles / Hotkey ID Not Assigned

::#dpisingles::
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 4) || (skill = 5))
{
prevClip := Clipboard
clipboard=
(
To guarantee your image will look great when we print it, we require a minimum resolution determined by the size of the printed design. 

Your image is not at a high enough resolution to print at your current size. Do you happen to have a higher-resolution image we can use instead? If not, we can create something for you in our Design Lab using our huge selection of artwork!
)
clipwait
send ^v
sleep 333
clipboard=
(
%prevClip%
)
Reporting("dpisingles")
}

#Include %A_scriptdir%\description.ahk

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

