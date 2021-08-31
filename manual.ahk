; Hotkey Reference Manual
; Last Updated 02/01/2016
; Author: Bryan Godfrey
; Autohotkey Version v1.1.22.07
; Download Autohotkey: http://ahkscript.org/
; This script is functional. Please report any errors to autohotkeys@customink.com
; 
; This tool is launched through the master.ahk file and setup.ahk file so the rep can review the available hotkeys.
; ============================================================================================================== ;


#Include %A_ScriptDir%
INI=%A_scriptdir%\settings.ini

IniRead, skill, %ini%, clientSkill, KEY1

; If the GUI is already open, we're going to send a traytip reminder and not launch another one.
;IfWinExist, ahk_class AutoHotkeyGUI
;{
;TrayTip, Manual Already Launched, Check to see if the manual is minimized..., , 3000
;sleep 3000
;return
;}

Intro:
; Setup the menu to show options based on the skill level of the rep.
height = 800
GuiWidth = 206
Xpos := A_ScreenWidth - GuiWidth - 58
WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,
Ypos := A_Screenheight-height-TrayHeight-232


Gui, theIntro:+AlwaysOnTop
Gui, theIntro:Add, Picture, w180 h-1, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theIntro:Color, FFFFFF
Gui, theIntro:Font, S24, w700
Gui, theIntro:Add, Text, center ym-10 x12 y159 w180 h40 0x200 cBlue gQuickLinks v_QuickLinks, Quick Links
Gui, theIntro:Font, S24, w700
Gui, theIntro:Add, Text, center ym-10 x12 y+20 w180 h40 0x200 cBlue gEmail v_Email, Email

; Chat will only show for Flex reps.
if ((skill = 1) || (skill = 5))
{
Gui, theIntro:Font, S24, w700
Gui, theIntro:Add, Text, center ym-10 x12 y+20 w180 h40 0x200 cBlue gChat v_Chat, Chat
}
Gui, theIntro:Add, text, center ym-10 x12 y+20 w180 h40 0x200 cBlue gPidgin v_Pidgin, Pidgin
Gui, theIntro:Font, underline S10, w700
Gui, theIntro:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theIntro:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theIntro:Show, xCenter yCenter h%height% w%GuiWidth%, Menu - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.


Gui, theQL:destroy
Gui, theQL1:destroy
Gui, theAcct:destroy
Gui, theBooster:destroy
Gui, theClipart:destroy
Gui, theCollege:destroy
Gui, theContent:destroy
Gui, theDesignLab:destroy
Gui, theHotkeyList:destroy
Gui, theHCPTool:destroy
Gui, theLAChat:destroy
Gui, theOffsite:destroy
Gui, theProductCatalog:destroy
Gui, theProductDescription:destroy
Gui, theSchedule:destroy
Gui, theSetup:destroy
Gui, theSinglesCatalog:destroy
Gui, theSpecialty:destroy
Gui, theSuperQuoter:destroy
Gui, theDesignTemplates:destroy
Gui, theUPSTool:destroy
Gui, theWiki:destroy
Gui, theWorkday:destroy
Gui, theEmailContentBands:destroy
Gui, theEmailContent:destroy
Gui, theEmail:destroy
Gui, theEmailContentCelebs:destroy
Gui, theEmailContentCollegeNo:destroy
Gui, theEmailContentCollegeYes:destroy
Gui, theEmailContentContent:destroy
Gui, theEmailContentDisney:destroy
Gui, theEmailContentGreek:destroy
Gui, theEmailContentOffensive:destroy
Gui, theEmailContentSports:destroy
Gui, theEmailContentVideoGames:destroy
Gui, theEmailContentWatermark:destroy
Gui, theEmailDesign:destroy
Gui, theEmailDesign2:destroy
Gui, theEmailDesignBranding:destroy
Gui, theEmailDesignColorMax:destroy 
Gui, theEmailDesignCombineColors:destroy
Gui, theEmailDesignCombineStyles:destroy
Gui, theEmailDesignCreativeServices:destroy
Gui, theEmailDesignCreativeServices1:destroy
Gui, theEmailDesignCreativeServices2:destroy
Gui, theEmailDesignDesignHelp:destroy
Gui, theEmailDesignDesigning:destroy
Gui, theEmailDesignDesignLink:destroy
Gui, theEmailDesignDesignSaved:destroy
Gui, theEmailDesignCombineDesigns:destroy
Gui, theEmailDesignDesignTeam:destroy
Gui, theEmailDesignDPI:destroy
Gui, theEmailDesignDPIBulk:destroy
Gui, theEmailDesignDPIBulk1:destroy
Gui, theEmailDesignDPISingles:destroy
Gui, theEmailDesignEmbroidery:destroy
Gui, theEmailDesignFiletypes:destroy
Gui, theEmailDesignInkChange:destroy
Gui, theEmailDesignPers:destroy
Gui, theEmailDesignPMS:destroy
Gui, theEmailDesignPMSDigital:destroy
Gui, theEmailDesignPPS:destroy
Gui, theEmailDesignRedraw:destroy
Gui, theEmailDesignRetrieve:destroy
Gui, theEmailDesignRotate:destroy
Gui, theEmailDesignSample:destroy
Gui, theEmailDesignSleeveHelp:destroy
Gui, theEmailDesignSpVsDig:destroy
Gui, theEmailDesignSubtleBlank:destroy
Gui, theEmailDesignSubtleInk:destroy
Gui, theEmailDesignUploadHelp:destroy
Gui, theEmailDesignUploadWhite:destroy
Gui, theEmailDesignVSS:destroy
Gui, theEmailDiscount:destroy
Gui, theEmailDiscountBooster:destroy
Gui, theEmailDiscountCharity:destroy
Gui, theEmailDiscountDiscount:destroy
Gui, theEmailDiscountPear:destroy
Gui, theEmailGeneral:destroy
Gui, theEmailGeneralByeOrder:destroy
Gui, theEmailGeneralClose:destroy
Gui, theEmailGeneralFollowUp:destroy
Gui, theEmailGeneralFollowUpOrder:destroy
Gui, theEmailGeneralFollowUpDesign:destroy
Gui, theEmailGeneralHeyDesign:destroy
Gui, theEmailGeneralHeyPricing:destroy
Gui, theEmailGeneralPerksBulk:destroy
Gui, theEmailGeneralPerksSingles:destroy
Gui, theEmailGeneralCR:destroy
Gui, theEmailFollowUpFix:destroy
Gui, theEmailGeneralMe:destroy
Gui, theEmailGeneralOOO:destroy
Gui, theEmailGroupGOF:destroy
Gui, theEmailGroupGOFCancel:destroy
Gui, theEmailGroupGOFDesign:destroy
Gui, theEmailGroupGOFPrice:destroy
Gui, theEmailGroupGOFSetup:destroy
Gui, theEmailPostOrderCheckInfo:destroy
Gui, theEmailPostOrderDelivered:destroy
Gui, theEmailPostOrderOrderDone:destroy
Gui, theEmailPostOrderOrderDoneLink:destroy
Gui, theEmailPostOrderPEML:destroy
Gui, theEmailPostOrderPreship:destroy
Gui, theEmailPostOrderPOInfo:destroy
Gui, theEmailPostOrderTracking:destroy
Gui, theEmailPreOrder:destroy
Gui, theEmailPreOrderVoucherCode:destroy
Gui, theEmailProblem:destroy
Gui, theEmailProblemProblemFull:destroy
Gui, theEmailProblemProblemPhoto:destroy
Gui, theEmailProblemProblemReturn:destroy
Gui, theEmailProblemProblemVoucher:destroy
Gui, theEmailProblemConfirmFix:destroy
Gui, theEmailProblemCrookedPhoto:destroy
Gui, theEmailProblemCrookedReport:destroy
Gui, theEmailProblemGhosting:destroy
Gui, theEmailProblemPartial:destroy
Gui, theEmailProblemProblemSizing:destroy
Gui, theEmailProblemProblemTones:destroy
Gui, theEmailProblemSwapPackage:destroy
Gui, theEmailProduct:destroy
Gui, theEmailProductBottles:destroy
Gui, theEmailProductCups:destroy
Gui, theEmailProductGlasses:destroy
Gui, theEmailProductKoozies:destroy
Gui, theEmailProductMagnets:destroy
Gui, theEmailProductMousepads:destroy
Gui, theEmailProductMugs:destroy
Gui, theEmailProductPaper:destroy
Gui, theEmailProductPens:destroy
Gui, theEmailProductsSamples:destroy
Gui, theEmailProductStickers:destroy
Gui, theEmailQuote:destroy
Gui, theEmailQuoteAP:destroy
Gui, theEmailQuotePriceHelp:destroy
Gui, theEmailQuoteQuoteBulk:destroy
Gui, theEmailQuoteQuoteSingles:destroy
Gui, theEmailQuoteSleevePrice:destroy
Gui, theEmailQuoteBudget:destroy
Gui, theEmailQuoteQuoteOnly:destroy
Gui, theEmailQuoteQuoteSpec:destroy
Gui, theEmailShipping:destroy
Gui, theEmailShippingAllShipping:destroy
Gui, theEmailShippingDD:destroy
Gui, theEmailShippingInternational:destroy
Gui, theEmailShippingQuickTurn:destroy
Gui, theEmailShippingRush:destroy
Gui, theEmailShippingStandard:destroy
Gui, theEmailShippingSuperRush:destroy
Gui, theEmailSinglesCanadaSingles:destroy
Gui, theEmailSinglesNoMinimum:destroy
Gui, theEmailSinglesNoMinimum:
Gui, theChatContent:destroy
Gui, theChat:destroy
Gui, theChatContentBands:destroy
Gui, theChatContentCelebs:destroy
Gui, theChatContentCollege:destroy
Gui, theChatContentDisney:destroy
Gui, theChatContentGreek:destroy
Gui, theChatContentOffensive:destroy
Gui, theChatContentSports:destroy
Gui, theChatContentVideoGames:destroy
Gui, theChatContentWatermark:destroy
Gui, theChatContentContent:destroy
Gui, theChatContentCollegeYes:destroy
Gui, theChatContentCollegeNo:destroy
Gui, theChatDesign:destroy
Gui, theChatDesign2:destroy
Gui, theChatDesignCombineColors:destroy
Gui, theChatDesignCombineStyles:destroy
Gui, theChatDesignDesignHelp:destroy
Gui, theChatDesignDesignLink:destroy
Gui, theChatDesignDesignSaved:destroy
Gui, theChatDesignDesignTeam:destroy
Gui, theChatDesignRetrieve:destroy
Gui, theChatDesignDPI:destroy
Gui, theChatDesignDPI1:destroy
Gui, theChatDesignDPIBulk:destroy
Gui, theChatDesignDPIBulk1:destroy
Gui, theChatDesignDPISingles:destroy
Gui, theChatDesignUploadEmbroidery:destroy
Gui, theChatDesignFiletypes:destroy
Gui, theChatDesignInkChange:destroy
Gui, theChatDesignPMS:destroy
Gui, theChatDesignPMSDigital:destroy
Gui, theChatDesignPPS:destroy
Gui, theChatDesignRedraw:destroy
Gui, theChatDesignRotate:destroy
Gui, theChatDesignSample:destroy
Gui, theChatDesignSleeveHelp:destroy
Gui, theChatDesignSubtleBlank:destroy
Gui, theChatDesignSubtleInk:destroy
Gui, theChatDesignUploadWhite:destroy
Gui, theChatDesignVSS:destroy
Gui, theChatDesignBranding:destroy
Gui, theChatDesignColorMax:destroy
Gui, theChatDesignDesigning:destroy
Gui, theChatDesignPers:destroy
Gui, theChatDesignSpVsDig:destroy
Gui, theChatDiscountBooster:destroy
Gui, theChatDiscountCharity:destroy
Gui, theChatDiscountDiscount:destroy
Gui, theChatDiscountPear:destroy
Gui, theChatDiscountPriceHelp:destroy
Gui, theChatGeneral:destroy
Gui, theChatGeneral1:destroy
Gui, theChatGeneralByeOrder:destroy
Gui, theChatGeneralChecking:destroy
Gui, theChatGeneralClose:destroy
Gui, theChatGeneralCust:destroy
Gui, theChatGeneralDesigning:destroy
Gui, theChatGeneralFollowUp:destroy
Gui, theChatGeneralFollowUpOrder:destroy
Gui, theChatGeneralFollowUpDesign:destroy
Gui, theChatGeneralHelp:destroy
Gui, theChatGeneralHeyDesign:destroy
Gui, theChatGeneralHeyPricing:destroy
Gui, theChatGeneralPerksBulk:destroy
Gui, theChatGeneralPerksSingles:destroy
Gui, theChatGeneralQuote:destroy
Gui, theChatGeneralCR:destroy
Gui, theChatFollowUpFix:destroy
Gui, theChatGeneralMe:destroy
Gui, theChatGeneralOOO:destroy
Gui, theChatGeneralEmail:destroy
Gui, theChatGroup:destroy
Gui, theChatGroupGOF:destroy
Gui, theChatGroupGOFCancel:destroy
Gui, theChatGroupGOFDesign:destroy
Gui, theChatGroupGOFPrice:destroy
Gui, theChatGroupGOFSetup:destroy
Gui, theChatLiveEngage:destroy
Gui, theChatLiveEngageByeSurvey:destroy
Gui, theChatLiveEngageDiscounts:destroy
Gui, theChatLiveEngageEmail:destroy
Gui, theChatLiveEngageGreetingWName:destroy
Gui, theChatLiveEngageGreetingWOName:destroy
Gui, theChatLiveEngageInternational:destroy
Gui, theChatLiveEngageLostYouWName:destroy
Gui, theChatLiveEngageLostYouWOName:destroy
Gui, theChatLiveEngageMilitary:destroy
Gui, theChatLiveEngageNoCommWName:destroy
Gui, theChatLiveEngageNoCommWOName:destroy
Gui, theChatLiveEngageSimpleIntroName:destroy
Gui, theChatPostOrderCancelOrder:destroy
Gui, theChatPostOrderCheckInfo:destroy
Gui, theChatPostOrderDelivered:destroy
Gui, theChatPostOrderOrderDone:destroy
Gui, theChatPostOrderOrderDoneLink:destroy
Gui, theChatPostOrderPEML:destroy
Gui, theChatPostOrderPOInfo:destroy
Gui, theChatPostOrderTracking:destroy
Gui, theChatPreOrder:destroy
Gui, theChatPreOrderPreAddress:destroy
Gui, theChatPreOrderPreConfirm:destroy
Gui, theChatPreOrderPreContact:destroy
Gui, theChatPreOrderPreShipping:destroy
Gui, theChatPreOrderPreSingles:destroy
Gui, theChatPreOrderVoucherCode:destroy
Gui, theChatProblem:destroy
Gui, theChatProblemConfirmFix:destroy
Gui, theChatProblemCrookedPhoto:destroy
Gui, theChatProblemCrookedReport:destroy
Gui, theChatProblemGhosting:destroy
Gui, theChatProblemPartial:destroy
Gui, theChatProblemProblemFull:destroy
Gui, theChatProblemProblemHelp:destroy
Gui, theChatProblemProblemPhoto:destroy
Gui, theChatProblemProblemReturn:destroy
Gui, theChatProblemProblemReview:destroy
Gui, theChatProblemProblemSizing:destroy
Gui, theChatProblemProblemTones:destroy
Gui, theChatProblemSwapPackage:destroy
Gui, theChatProblemProblemVoucher:destroy
Gui, theChatProduct:destroy
Gui, theChatProductBottles:destroy
Gui, theChatProductCups:destroy
Gui, theChatProductGlasses:destroy
Gui, theChatProductKoozies:destroy
Gui, theChatProductMagnets:destroy
Gui, theChatProductMousepads:destroy
Gui, theChatProductMugs:destroy
Gui, theChatProductPaper:destroy
Gui, theChatProductPens:destroy
Gui, theChatProductSample:destroy
Gui, theChatProductStickers:destroy
Gui, theChatQuoteAP:destroy
Gui, theChatQuoteHighPrice:destroy
Gui, theChatQuotePriceHelp:destroy
Gui, theChatQuotePriceQuote1:destroy
Gui, theChatQuotePriceQuote2:destroy
Gui, theChatQuotePriceQuote3:destroy
Gui, theChatQuotePriceQuote4:destroy
Gui, theChatQuotePriceQuote5:destroy
Gui, theChatQuoteQuoteBulk:destroy
Gui, theChatQuoteQuoteSingles:destroy
Gui, theChatQuoteSleevePrice:destroy
Gui, theChatQuoteBudget:destroy
Gui, theChatQuoteQuoteOnly:destroy
Gui, theChatQuoteQuoteSpec:destroy
Gui, theChatQuoteQuote:destroy
Gui, theChatShippingAllShipping:destroy
Gui, theChatShippingDD:destroy
Gui, theChatShippingLogistics:destroy
Gui, theChatShippingInternational:destroy
Gui, theChatShippingQuickTurn:destroy
Gui, theChatShippingRush:destroy
Gui, theChatShippingStandard:destroy
Gui, theChatShippingSuperRush:destroy
Gui, theChatSinglesCanadaSingles:destroy
Gui, theChatSinglesNoMinimum:destroy
Gui, thePidgin:destroy
Gui, thePidginCallForYou:destroy
Gui, thePidginChatForYou:destroy
Gui, thePidginEmailForYou:destroy

Gui, theChatDesignVSS:destroy
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

Menu:
; Setup the menu to show options based on the skill level of the rep.
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,

Gui, theMenu:+AlwaysOnTop
Gui, theMenu:Add, Picture, w180 h-1, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theMenu:Color, FFFFFF
Gui, theMenu:Font, S24, w700
Gui, theMenu:Add, Text, center ym-10 x12 y159 w180 h40 0x200 cBlue gQuickLinks v_QuickLinks, Quick Links
Gui, theMenu:Font, S24, w700
Gui, theMenu:Add, Text, center ym-10 x12 y+20 w180 h40 0x200 cBlue gEmail v_Email, Email

; Chat will only show for Flex reps.
if ((skill = 1) || (skill = 5))
{
Gui, theMenu:Font, S24, w700
Gui, theMenu:Add, Text, center ym-10 x12 y+20 w180 h40 0x200 cBlue gChat v_Chat, Chat
}
Gui, theMenu:Add, text, center ym-10 x12 y+20 w180 h40 0x200 cBlue gPidgin v_Pidgin, Pidgin
Gui, theMenu:Font, underline S10, w700
Gui, theMenu:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theMenu:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theMenu:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Menu - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theQL:destroy
Gui, theQL1:destroy
Gui, theAcct:destroy
Gui, theBooster:destroy
Gui, theClipart:destroy
Gui, theCollege:destroy
Gui, theContent:destroy
Gui, theDesignLab:destroy
Gui, theHotkeyList:destroy
Gui, theHCPTool:destroy
Gui, theLAChat:destroy
Gui, theOffsite:destroy
Gui, theProductCatalog:destroy
Gui, theProductDescription:destroy
Gui, theSchedule:destroy
Gui, theSetup:destroy
Gui, theSinglesCatalog:destroy
Gui, theSpecialty:destroy
Gui, theSuperQuoter:destroy
Gui, theDesignTemplates:destroy
Gui, theUPSTool:destroy
Gui, theWiki:destroy
Gui, theWorkday:destroy
Gui, theEmailContentBands:destroy
Gui, theEmailContent:destroy
Gui, theEmail:destroy
Gui, theEmailContentCelebs:destroy
Gui, theEmailContentCollegeNo:destroy
Gui, theEmailContentCollegeYes:destroy
Gui, theEmailContentContent:destroy
Gui, theEmailContentDisney:destroy
Gui, theEmailContentGreek:destroy
Gui, theEmailContentOffensive:destroy
Gui, theEmailContentSports:destroy
Gui, theEmailContentVideoGames:destroy
Gui, theEmailContentWatermark:destroy
Gui, theEmailDesign:destroy
Gui, theEmailDesign2:destroy
Gui, theEmailDesignBranding:destroy
Gui, theEmailDesignColorMax:destroy 
Gui, theEmailDesignCombineColors:destroy
Gui, theEmailDesignCombineStyles:destroy
Gui, theEmailDesignCreativeServices:destroy
Gui, theEmailDesignCreativeServices1:destroy
Gui, theEmailDesignCreativeServices2:destroy
Gui, theEmailDesignDesignHelp:destroy
Gui, theEmailDesignDesigning:destroy
Gui, theEmailDesignDesignLink:destroy
Gui, theEmailDesignDesignSaved:destroy
Gui, theEmailDesignCombineDesigns:destroy
Gui, theEmailDesignDesignTeam:destroy
Gui, theEmailDesignDPI:destroy
Gui, theEmailDesignDPIBulk:destroy
Gui, theEmailDesignDPIBulk1:destroy
Gui, theEmailDesignDPISingles:destroy
Gui, theEmailDesignEmbroidery:destroy
Gui, theEmailDesignFiletypes:destroy
Gui, theEmailDesignInkChange:destroy
Gui, theEmailDesignPers:destroy
Gui, theEmailDesignPMS:destroy
Gui, theEmailDesignPMSDigital:destroy
Gui, theEmailDesignPPS:destroy
Gui, theEmailDesignRedraw:destroy
Gui, theEmailDesignRetrieve:destroy
Gui, theEmailDesignRotate:destroy
Gui, theEmailDesignSample:destroy
Gui, theEmailDesignSleeveHelp:destroy
Gui, theEmailDesignSpVsDig:destroy
Gui, theEmailDesignSubtleBlank:destroy
Gui, theEmailDesignSubtleInk:destroy
Gui, theEmailDesignUploadHelp:destroy
Gui, theEmailDesignUploadWhite:destroy
Gui, theEmailDesignVSS:destroy
Gui, theEmailDiscount:destroy
Gui, theEmailDiscountBooster:destroy
Gui, theEmailDiscountCharity:destroy
Gui, theEmailDiscountDiscount:destroy
Gui, theEmailDiscountPear:destroy
Gui, theEmailGeneral:destroy
Gui, theEmailGeneralByeOrder:destroy
Gui, theEmailGeneralClose:destroy
Gui, theEmailGeneralFollowUp:destroy
Gui, theEmailGeneralFollowUpOrder:destroy
Gui, theEmailGeneralFollowUpDesign:destroy
Gui, theEmailGeneralHeyDesign:destroy
Gui, theEmailGeneralHeyPricing:destroy
Gui, theEmailGeneralPerksBulk:destroy
Gui, theEmailGeneralPerksSingles:destroy
Gui, theEmailGeneralCR:destroy
Gui, theEmailFollowUpFix:destroy
Gui, theEmailGeneralMe:destroy
Gui, theEmailGeneralOOO:destroy
Gui, theEmailGroupGOF:destroy
Gui, theEmailGroupGOFCancel:destroy
Gui, theEmailGroupGOFDesign:destroy
Gui, theEmailGroupGOFPrice:destroy
Gui, theEmailGroupGOFSetup:destroy
Gui, theEmailPostOrderCheckInfo:destroy
Gui, theEmailPostOrderDelivered:destroy
Gui, theEmailPostOrderOrderDone:destroy
Gui, theEmailPostOrderOrderDoneLink:destroy
Gui, theEmailPostOrderPEML:destroy
Gui, theEmailPostOrderPreship:destroy
Gui, theEmailPostOrderPOInfo:destroy
Gui, theEmailPostOrderTracking:destroy
Gui, theEmailPreOrder:destroy
Gui, theEmailPreOrderVoucherCode:destroy
Gui, theEmailProblem:destroy
Gui, theEmailProblemProblemFull:destroy
Gui, theEmailProblemProblemPhoto:destroy
Gui, theEmailProblemProblemReturn:destroy
Gui, theEmailProblemProblemVoucher:destroy
Gui, theEmailProblemConfirmFix:destroy
Gui, theEmailProblemCrookedPhoto:destroy
Gui, theEmailProblemCrookedReport:destroy
Gui, theEmailProblemGhosting:destroy
Gui, theEmailProblemPartial:destroy
Gui, theEmailProblemProblemSizing:destroy
Gui, theEmailProblemProblemTones:destroy
Gui, theEmailProblemSwapPackage:destroy
Gui, theEmailProduct:destroy
Gui, theEmailProductBottles:destroy
Gui, theEmailProductCups:destroy
Gui, theEmailProductGlasses:destroy
Gui, theEmailProductKoozies:destroy
Gui, theEmailProductMagnets:destroy
Gui, theEmailProductMousepads:destroy
Gui, theEmailProductMugs:destroy
Gui, theEmailProductPaper:destroy
Gui, theEmailProductPens:destroy
Gui, theEmailProductsSamples:destroy
Gui, theEmailProductStickers:destroy
Gui, theEmailQuote:destroy
Gui, theEmailQuoteAP:destroy
Gui, theEmailQuotePriceHelp:destroy
Gui, theEmailQuoteQuoteBulk:destroy
Gui, theEmailQuoteQuoteSingles:destroy
Gui, theEmailQuoteSleevePrice:destroy
Gui, theEmailQuoteBudget:destroy
Gui, theEmailQuoteQuoteOnly:destroy
Gui, theEmailQuoteQuoteSpec:destroy
Gui, theEmailShipping:destroy
Gui, theEmailShippingAllShipping:destroy
Gui, theEmailShippingDD:destroy
Gui, theEmailShippingInternational:destroy
Gui, theEmailShippingQuickTurn:destroy
Gui, theEmailShippingRush:destroy
Gui, theEmailShippingStandard:destroy
Gui, theEmailShippingSuperRush:destroy
Gui, theEmailSinglesCanadaSingles:destroy
Gui, theEmailSinglesNoMinimum:destroy
Gui, theEmailSinglesNoMinimum:
Gui, theChatContent:destroy
Gui, theChat:destroy
Gui, theChatContentBands:destroy
Gui, theChatContentCelebs:destroy
Gui, theChatContentCollege:destroy
Gui, theChatContentDisney:destroy
Gui, theChatContentGreek:destroy
Gui, theChatContentOffensive:destroy
Gui, theChatContentSports:destroy
Gui, theChatContentVideoGames:destroy
Gui, theChatContentWatermark:destroy
Gui, theChatContentContent:destroy
Gui, theChatContentCollegeYes:destroy
Gui, theChatContentCollegeNo:destroy
Gui, theChatDesign:destroy
Gui, theChatDesign2:destroy
Gui, theChatDesignCombineColors:destroy
Gui, theChatDesignCombineStyles:destroy
Gui, theChatDesignDesignHelp:destroy
Gui, theChatDesignDesignLink:destroy
Gui, theChatDesignDesignSaved:destroy
Gui, theChatDesignDesignTeam:destroy
Gui, theChatDesignRetrieve:destroy
Gui, theChatDesignDPI:destroy
Gui, theChatDesignDPI1:destroy
Gui, theChatDesignDPIBulk:destroy
Gui, theChatDesignDPIBulk1:destroy
Gui, theChatDesignDPISingles:destroy
Gui, theChatDesignUploadEmbroidery:destroy
Gui, theChatDesignFiletypes:destroy
Gui, theChatDesignInkChange:destroy
Gui, theChatDesignPMS:destroy
Gui, theChatDesignPMSDigital:destroy
Gui, theChatDesignPPS:destroy
Gui, theChatDesignRedraw:destroy
Gui, theChatDesignRotate:destroy
Gui, theChatDesignSample:destroy
Gui, theChatDesignSleeveHelp:destroy
Gui, theChatDesignSubtleBlank:destroy
Gui, theChatDesignSubtleInk:destroy
Gui, theChatDesignUploadWhite:destroy
Gui, theChatDesignVSS:destroy
Gui, theChatDesignBranding:destroy
Gui, theChatDesignColorMax:destroy
Gui, theChatDesignDesigning:destroy
Gui, theChatDesignPers:destroy
Gui, theChatDesignSpVsDig:destroy
Gui, theChatDiscountBooster:destroy
Gui, theChatDiscountCharity:destroy
Gui, theChatDiscountDiscount:destroy
Gui, theChatDiscountPear:destroy
Gui, theChatDiscountPriceHelp:destroy
Gui, theChatGeneral:destroy
Gui, theChatGeneral1:destroy
Gui, theChatGeneralByeOrder:destroy
Gui, theChatGeneralChecking:destroy
Gui, theChatGeneralClose:destroy
Gui, theChatGeneralCust:destroy
Gui, theChatGeneralDesigning:destroy
Gui, theChatGeneralFollowUp:destroy
Gui, theChatGeneralFollowUpOrder:destroy
Gui, theChatGeneralFollowUpDesign:destroy
Gui, theChatGeneralHelp:destroy
Gui, theChatGeneralHeyDesign:destroy
Gui, theChatGeneralHeyPricing:destroy
Gui, theChatGeneralPerksBulk:destroy
Gui, theChatGeneralPerksSingles:destroy
Gui, theChatGeneralQuote:destroy
Gui, theChatGeneralCR:destroy
Gui, theChatFollowUpFix:destroy
Gui, theChatGeneralMe:destroy
Gui, theChatGeneralEmail:destroy
Gui, theChatGeneralOOO:destroy
Gui, theChatGroup:destroy
Gui, theChatGroupGOF:destroy
Gui, theChatGroupGOFCancel:destroy
Gui, theChatGroupGOFDesign:destroy
Gui, theChatGroupGOFPrice:destroy
Gui, theChatGroupGOFSetup:destroy
Gui, theChatLiveEngage:destroy
Gui, theChatLiveEngageByeSurvey:destroy
Gui, theChatLiveEngageDiscounts:destroy
Gui, theChatLiveEngageEmail:destroy
Gui, theChatLiveEngageGreetingWName:destroy
Gui, theChatLiveEngageGreetingWOName:destroy
Gui, theChatLiveEngageInternational:destroy
Gui, theChatLiveEngageLostYouWName:destroy
Gui, theChatLiveEngageLostYouWOName:destroy
Gui, theChatLiveEngageMilitary:destroy
Gui, theChatLiveEngageNoCommWName:destroy
Gui, theChatLiveEngageNoCommWOName:destroy
Gui, theChatLiveEngageSimpleIntroName:destroy
Gui, theChatPostOrderCancelOrder:destroy
Gui, theChatPostOrderCheckInfo:destroy
Gui, theChatPostOrderDelivered:destroy
Gui, theChatPostOrderOrderDone:destroy
Gui, theChatPostOrderOrderDoneLink:destroy
Gui, theChatPostOrderPEML:destroy
Gui, theChatPostOrderPOInfo:destroy
Gui, theChatPostOrderTracking:destroy
Gui, theChatPreOrder:destroy
Gui, theChatPreOrderPreAddress:destroy
Gui, theChatPreOrderPreConfirm:destroy
Gui, theChatPreOrderPreContact:destroy
Gui, theChatPreOrderPreShipping:destroy
Gui, theChatPreOrderPreSingles:destroy
Gui, theChatPreOrderVoucherCode:destroy
Gui, theChatProblem:destroy
Gui, theChatProblemConfirmFix:destroy
Gui, theChatProblemCrookedPhoto:destroy
Gui, theChatProblemCrookedReport:destroy
Gui, theChatProblemGhosting:destroy
Gui, theChatProblemPartial:destroy
Gui, theChatProblemProblemFull:destroy
Gui, theChatProblemProblemHelp:destroy
Gui, theChatProblemProblemPhoto:destroy
Gui, theChatProblemProblemReturn:destroy
Gui, theChatProblemProblemReview:destroy
Gui, theChatProblemProblemSizing:destroy
Gui, theChatProblemProblemTones:destroy
Gui, theChatProblemSwapPackage:destroy
Gui, theChatProblemProblemVoucher:destroy
Gui, theChatProduct:destroy
Gui, theChatProductBottles:destroy
Gui, theChatProductCups:destroy
Gui, theChatProductGlasses:destroy
Gui, theChatProductKoozies:destroy
Gui, theChatProductMagnets:destroy
Gui, theChatProductMousepads:destroy
Gui, theChatProductMugs:destroy
Gui, theChatProductPaper:destroy
Gui, theChatProductPens:destroy
Gui, theChatProductSample:destroy
Gui, theChatProductStickers:destroy
Gui, theChatQuoteAP:destroy
Gui, theChatQuoteHighPrice:destroy
Gui, theChatQuotePriceHelp:destroy
Gui, theChatQuotePriceQuote1:destroy
Gui, theChatQuotePriceQuote2:destroy
Gui, theChatQuotePriceQuote3:destroy
Gui, theChatQuotePriceQuote4:destroy
Gui, theChatQuotePriceQuote5:destroy
Gui, theChatQuoteQuoteBulk:destroy
Gui, theChatQuoteQuoteSingles:destroy
Gui, theChatQuoteSleevePrice:destroy
Gui, theChatQuoteBudget:destroy
Gui, theChatQuoteQuoteOnly:destroy
Gui, theChatQuoteQuoteSpec:destroy
Gui, theChatQuoteQuote:destroy
Gui, theChatShippingAllShipping:destroy
Gui, theChatShippingDD:destroy
Gui, theChatShippingLogistics:destroy
Gui, theChatShippingInternational:destroy
Gui, theChatShippingQuickTurn:destroy
Gui, theChatShippingRush:destroy
Gui, theChatShippingStandard:destroy
Gui, theChatShippingSuperRush:destroy
Gui, theChatSinglesCanadaSingles:destroy
Gui, theChatSinglesNoMinimum:destroy
Gui, thePidgin:destroy
Gui, thePidginCallForYou:destroy
Gui, thePidginChatForYou:destroy
Gui, thePidginEmailForYou:destroy

Gui, theChatDesignVSS:destroy
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


QuickLinks:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206
WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,

Gui, theQL:+AlwaysOnTop
Gui, theQL:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theQL:Color, FFFFFF
Gui, theQL:Font, underline S14, w700
Gui, theQL:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gMenu, Back to Menu
Gui, theQL:Add, Text, center ym-10 x12 y+7 w180 h30 0x200 cBlue gBooster v_Booster, Booster
Gui, theQL:Add, Text, center ym-10 x12 y+7 w180 h30 0x200 cBlue gClipart v_Clipart, Clipart
Gui, theQL:Add, Text, center ym-10 x12 y+7 w180 h30 0x200 cBlue gCollege v_College, College
Gui, theQL:Add, Text, center ym-10 x12 y+7 w180 h30 0x200 cBlue gContent v_Content, Content
Gui, theQL:Add, Text, center ym-10 x12 y+7 w180 h30 0x200 cBlue gDesignLab v_DesignLab, Design Lab
Gui, theQL:Add, Text, center ym-10 x12 y+7 w180 h30 0x200 cBlue gHotkeyList v_HotkeyList, Hotkey List
Gui, theQL:Add, Text, center ym-10 x12 y+7 w180 h30 0x200 cBlue gHCPTool v_HCPTool, HCP Tool
Gui, theQL:Add, Text, center ym-10 x12 y+7 w180 h30 0x200 cBlue gLAChat v_LAChat, LA Chat
Gui, theQL:Add, Text, center ym-10 x12 y+7 w180 h30 0x200 cBlue gOffsite v_Offsite, Offsite
Gui, theQL:Add, Text, center ym-10 x12 y+7 w180 h30 0x200 cBlue gCatalog v_Catalog, Product Catalog
Gui, theQL:Add, Text, center ym-10 x12 y+7 w180 h30 0x200 cBlue gProductDescription v_ProductDescription, Product Description
Gui, theQL:Add, Text, center ym-10 x12 y+7 w180 h50 0x200 cBlue gQuickLinks1, Next

Gui, theQL:Font, underline S10, w700
Gui, theQL:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theQL:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theQL:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Quick Links - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theIntro:destroy
Gui, theMenu:destroy
Gui, theQL1:destroy
Gui, theAcct:destroy
Gui, theBooster:destroy
Gui, theClipart:destroy
Gui, theCollege:destroy
Gui, theContent:destroy
Gui, theDesignLab:destroy
Gui, theHotkeyList:destroy
Gui, theHCPTool:destroy
Gui, theLAChat:destroy
Gui, theOffsite:destroy
Gui, theProductCatalog:destroy
Gui, theProductDescription:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
return

QuickLinks1:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theQL1:+AlwaysOnTop
Gui, theQL1:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theQL1:Color, FFFFFF
Gui, theQL1:Font, underline S14, w700
Gui, theQL1:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gMenu, Back to Menu
Gui, theQL1:Add, Text, center ym-10 x12 y+7 w180 h30 0x200 cBlue gSchedule v_Schedule, S/S Schedule
Gui, theQL1:Add, Text, center ym-10 x12 y+7 w180 h30 0x200 cBlue gSetup v_Setup, Setup
Gui, theQL1:Add, Text, center ym-10 x12 y+7 w180 h30 0x200 cBlue gSCatalog v_SCatalog, Singles Catalog
Gui, theQL1:Add, Text, center ym-10 x12 y+7 w180 h30 0x200 cBlue gSpecialty v_Specialty, Specialty
Gui, theQL1:Add, Text, center ym-10 x12 y+7 w180 h30 0x200 cBlue gSuperQuoter v_SuperQuoter, Super Quoter
Gui, theQL1:Add, Text, center ym-10 x12 y+7 w180 h30 0x200 cBlue gUPSTool v_UPSTool, UPS Tool
Gui, theQL1:Add, Text, center ym-10 x12 y+7 w180 h30 0x200 cBlue gWiki v_Wiki, Wiki
Gui, theQL1:Add, Text, center ym-10 x12 y+7 w180 h30 0x200 cBlue gWorkday v_Workday, Workday
Gui, theQL1:Add, Text, center ym-10 x12 y+7 w180 h50 0x200 cBlue gQuickLinks, Prev
Gui, theQL1:Font, underline S10, w700
Gui, theQL1:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theQL1:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theQL1:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Quick Links - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theQL:destroy
Gui, theSchedule:destroy
Gui, theSetup:destroy
Gui, theSinglesCatalog:destroy
Gui, theSpecialty:destroy
Gui, theSuperQuoter:destroy
Gui, theDesignTemplates:destroy
Gui, theUPSTool:destroy
Gui, theWiki:destroy
Gui, theWorkday:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
return

Gui, theQL:Add, Text, center ym-10 x12 y+7 w180 h30 0x200 cBlue gTemplates v_Templates, Templates
Gui, theQL:Add, Text, center ym-10 x12 y+7 w180 h30 0x200 cBlue gWiki v_Wiki, Wiki

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


Booster:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,

Gui, theBooster:+AlwaysOnTop
Gui, theBooster:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theBooster:Color, FFFFFF
Gui, theBooster:Font, S12, w700
Gui, theBooster:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gQuickLinks, Back to QuickLinks
Gui, theBooster:Font, S20, w700
Gui, theBooster:Add, Text, center ym-10 x12 y159 w180 h50 0x200 cRed, Booster
Gui, theBooster:Font, S10, w700
Gui, theBooster:Add, Text, center x12 y209 w180, Using this hotkey will automatically launch the Booster referral page.
Gui, theBooster:Font, S16, w700
Gui, theBooster:Add, Text, center ym-10 x12 y269 w180 h30 0x200 cRed, How to Use:
Gui, theBooster:Font, S14, w700
Gui, theBooster:Add, Text, center ym-10 x12 y299 w180 h50 0x200, Win + B
Gui, theBooster:Font, underline S10, w700
Gui, theBooster:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theBooster:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theBooster:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Booster - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

Clipart:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theClipart:+AlwaysOnTop
Gui, theClipart:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theClipart:Color, FFFFFF
Gui, theClipart:Font, S12, w700
Gui, theClipart:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gQuickLinks, Back to QuickLinks
Gui, theClipart:Font, S20, w700
Gui, theClipart:Add, Text, center ym-10 x12 y159 w180 h50 0x200 cRed, Clipart
Gui, theClipart:Font, S10, w700
Gui, theClipart:Add, Text, center x12 y209 w180, Using this hotkey will automatically launch the clipart search tool.
Gui, theClipart:Font, S16, w700
Gui, theClipart:Add, Text, center ym-10 x12 y269 w180 h30 0x200 cRed, How to Use:
Gui, theClipart:Font, S14, w700
Gui, theClipart:Add, Text, center ym-10 x12 y299 w180 h50 0x200,Alt + Shift + C
Gui, theClipart:Font, underline S10, w700
Gui, theClipart:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theClipart:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theClipart:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Clipart - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

College:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theCollege:+AlwaysOnTop
Gui, theCollege:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theCollege:Color, FFFFFF
Gui, theCollege:Font, S12, w700
Gui, theCollege:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gQuickLinks, Back to QuickLinks
Gui, theCollege:Font, S20, w700
Gui, theCollege:Add, Text, center ym-10 x12 y159 w180 h50 0x200 cRed, College
Gui, theCollege:Font, S10, w700
Gui, theCollege:Add, Text, center x12 y209 w180, Using this hotkey will automatically launch the college reference page in the Wiki.
Gui, theCollege:Font, S16, w700
Gui, theCollege:Add, Text, center ym-10 x12 y289 w180 h30 0x200 cRed, How to Use:
Gui, theCollege:Font, S14, w700
Gui, theCollege:Add, Text, center ym-10 x12 y319 w180 h50 0x200,Win + U
Gui, theCollege:Font, underline S10, w700
Gui, theCollege:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theCollege:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theCollege:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, College - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

Content:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theContent:+AlwaysOnTop
Gui, theContent:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theContent:Color, FFFFFF
Gui, theContent:Font, S12, w700
Gui, theContent:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gQuickLinks, Back to QuickLinks
Gui, theContent:Font, S20, w700
Gui, theContent:Add, Text, center ym-10 x12 y159 w180 h50 0x200 cRed, Content
Gui, theContent:Font, S10, w700
Gui, theContent:Add, Text, center x12 y209 w180, Using this hotkey will automatically launch the Content page in the Wiki.
Gui, theContent:Font, S16, w700
Gui, theContent:Add, Text, center ym-10 x12 y269 w180 h30 0x200 cRed, How to Use:
Gui, theContent:Font, S14, w700
Gui, theContent:Add, Text, center ym-10 x12 y299 w180 h50 0x200, Win + N
Gui, theContent:Font, underline S10, w700
Gui, theContent:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theContent:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theContent:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Content - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

DesignLab:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theDesignLab:+AlwaysOnTop
Gui, theDesignLab:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theDesignLab:Color, FFFFFF
Gui, theDesignLab:Font, S12, w700
Gui, theDesignLab:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gQuickLinks, Back to QuickLinks
Gui, theDesignLab:Font, S20, w700
Gui, theDesignLab:Add, Text, center ym-10 x12 y159 w180 h50 0x200 cRed, Design Lab
Gui, theDesignLab:Font, S10, w700
Gui, theDesignLab:Add, Text, center x12 y209 w180, Using this hotkey will automatically launch the design lab.
Gui, theDesignLab:Font, S16, w700
Gui, theDesignLab:Add, Text, center ym-10 x12 y269 w180 h30 0x200 cRed, How to Use:
Gui, theDesignLab:Font, S14, w700
Gui, theDesignLab:Add, Text, center ym-10 x12 y299 w180 h50 0x200, Win + Z
Gui, theDesignLab:Font, underline S10, w700
Gui, theDesignLab:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theDesignLab:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theDesignLab:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Design Lab - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

HotkeyList:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theHotkeyList:+AlwaysOnTop
Gui, theHotkeyList:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theHotkeyList:Color, FFFFFF
Gui, theHotkeyList:Font, S12, w700
Gui, theHotkeyList:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gQuickLinks, Back to QuickLinks
Gui, theHotkeyList:Font, S20, w700
Gui, theHotkeyList:Add, Text, center ym-10 x12 y159 w180 h50 0x200 cRed, Hotkey List
Gui, theHotkeyList:Font, S10, w700
Gui, theHotkeyList:Add, Text, center x12 y209 w180, Using this hotkey will automatically launch a digital copy of the complete hotkey list.
Gui, theHotkeyList:Font, S16, w700
Gui, theHotkeyList:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theHotkeyList:Font, S14, w700
Gui, theHotkeyList:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,F11
Gui, theHotkeyList:Font, underline S10, w700
Gui, theHotkeyList:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theHotkeyList:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theHotkeyList:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Hotkey List - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

HCPTool:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theHCPTool:+AlwaysOnTop
Gui, theHCPTool:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theHCPTool:Color, FFFFFF
Gui, theHCPTool:Font, S12, w700
Gui, theHCPTool:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gQuickLinks, Back to QuickLinks
Gui, theHCPTool:Font, S20, w700
Gui, theHCPTool:Add, Text, center ym-10 x12 y159 w180 h50 0x200 cRed, HCP Tool
Gui, theHCPTool:Font, S10, w700
Gui, theHCPTool:Add, Text, center x12 y209 w180, Using this hotkey will automatically launch the HCP Tool in Excel.
Gui, theHCPTool:Font, S16, w700
Gui, theHCPTool:Add, Text, center ym-10 x12 y269 w180 h30 0x200 cRed, How to Use:
Gui, theHCPTool:Font, S14, w700
Gui, theHCPTool:Add, Text, center ym-10 x12 y299 w180 h50 0x200,Win + H
Gui, theHCPTool:Font, underline S10, w700
Gui, theHCPTool:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theHCPTool:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theHCPTool:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, HCP Tool - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

LAChat:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theLAChat:+AlwaysOnTop
Gui, theLAChat:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theLAChat:Color, FFFFFF
Gui, theLAChat:Font, S12, w700
Gui, theLAChat:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gQuickLinks, Back to QuickLinks
Gui, theLAChat:Font, S20, w700
Gui, theLAChat:Add, Text, center ym-10 x12 y159 w180 h50 0x200 cRed, LA Chat
Gui, theLAChat:Font, S10, w700
Gui, theLAChat:Add, Text, center x12 y209 w180, Using this hotkey will automatically launch LA Chat.
Gui, theLAChat:Font, S16, w700
Gui, theLAChat:Add, Text, center ym-10 x12 y269 w180 h30 0x200 cRed, How to Use:
Gui, theLAChat:Font, S14, w700
Gui, theLAChat:Add, Text, center ym-10 x12 y299 w180 h50 0x200,Alt + L
Gui, theLAChat:Font, underline S10, w700
Gui, theLAChat:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theLAChat:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theLAChat:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, LA Chat - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

Offsite:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theOffsite:+AlwaysOnTop
Gui, theOffsite:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theOffsite:Color, FFFFFF
Gui, theOffsite:Font, S12, w700
Gui, theOffsite:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gQuickLinks, Back to QuickLinks
Gui, theOffsite:Font, S20, w700
Gui, theOffsite:Add, Text, center ym-10 x12 y159 w180 h50 0x200 cRed, Offsite
Gui, theOffsite:Font, S10, w700
Gui, theOffsite:Add, Text, center x12 y209 w180, Using this hotkey will automatically launch the Offsite reference page in the Wiki.
Gui, theOffsite:Font, S16, w700
Gui, theOffsite:Add, Text, center ym-10 x12 y289 w180 h30 0x200 cRed, How to Use:
Gui, theOffsite:Font, S14, w700
Gui, theOffsite:Add, Text, center ym-10 x12 y319 w180 h50 0x200,Alt + Shift + O
Gui, theOffsite:Font, underline S10, w700
Gui, theOffsite:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theOffsite:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theOffsite:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Offsite - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

Catalog:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theProductCatalog:+AlwaysOnTop
Gui, theProductCatalog:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theProductCatalog:Color, FFFFFF
Gui, theProductCatalog:Font, S12, w700
Gui, theProductCatalog:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gQuickLinks, Back to QuickLinks
Gui, theProductCatalog:Font, S18, w700
Gui, theProductCatalog:Add, Text, center ym-10 x12 y159 w180 h50 0x200 cRed, Product Catalog
Gui, theProductCatalog:Font, S10, w700
Gui, theProductCatalog:Add, Text, center x12 y209 w180, Using this hotkey will automatically launch the Product Catalog on the CustomInk website.
Gui, theProductCatalog:Font, S16, w700
Gui, theProductCatalog:Add, Text, center ym-10 x12 y279 w180 h50 0x200 cRed, How to Use:
Gui, theProductCatalog:Font, S14, w700
Gui, theProductCatalog:Add, Text, center ym-10 x12 y319 w180 h50 0x200,Alt + Shift + P
Gui, theProductCatalog:Font, underline S10, w700
Gui, theProductCatalog:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theProductCatalog:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theProductCatalog:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Product Catalog - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ProductDescription:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theProductDescription:+AlwaysOnTop
Gui, theProductDescription:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theProductDescription:Color, FFFFFF
Gui, theProductDescription:Font, S12, w700
Gui, theProductDescription:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gQuickLinks, Back to QuickLinks
Gui, theProductDescription:Font, S15, w700
Gui, theProductDescription:Add, Text, center ym-10 x12 y159 w180 h50 0x200 cRed, Product Description
Gui, theProductDescription:Font, S10, w700
Gui, theProductDescription:Add, Text, center x12 y209 w180, Copy the link location or sizing lineup of a product. Then use this hotkey to receive the text of that product's description.
Gui, theProductDescription:Font, S16, w700
Gui, theProductDescription:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, How to Use:
Gui, theProductDescription:Font, S14, w700
Gui, theProductDescription:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,Ctrl + L
Gui, theProductDescription:Font, underline S10, w700
Gui, theProductDescription:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theProductDescription:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theProductDescription:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Product Catalog - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

Schedule:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theSchedule:+AlwaysOnTop
Gui, theSchedule:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theSchedule:Color, FFFFFF
Gui, theSchedule:Font, S12, w700
Gui, theSchedule:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gQuickLinks1, Back to QuickLinks
Gui, theSchedule:Font, S20, w700
Gui, theSchedule:Add, Text, center ym-10 x12 y159 w180 h50 0x200 cRed, S/S Schedule
Gui, theSchedule:Font, S10, w700
Gui, theSchedule:Add, Text, center x12 y209 w180, Using this hotkey will automatically launch the current S/S Schedule Viewer.
Gui, theSchedule:Font, S16, w700
Gui, theSchedule:Add, Text, center ym-10 x12 y269 w180 h30 0x200 cRed, How to Use:
Gui, theSchedule:Font, S14, w700
Gui, theSchedule:Add, Text, center ym-10 x12 y299 w180 h50 0x200,Win + E
Gui, theSchedule:Font, underline S10, w700
Gui, theSchedule:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theSchedule:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theSchedule:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, S/S Schedule - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theQL1:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

SCatalog:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theSinglesCatalog:+AlwaysOnTop
Gui, theSinglesCatalog:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theSinglesCatalog:Color, FFFFFF
Gui, theSinglesCatalog:Font, S12, w700
Gui, theSinglesCatalog:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gQuickLinks1, Back to QuickLinks
Gui, theSinglesCatalog:Font, S18, w700
Gui, theSinglesCatalog:Add, Text, center ym-10 x12 y159 w180 h50 0x200 cRed, Singles Catalog
Gui, theSinglesCatalog:Font, S10, w700
Gui, theSinglesCatalog:Add, Text, center x12 y209 w180, Using this hotkey will automatically launch the No Minimum catalog on the CustomInk website.
Gui, theSinglesCatalog:Font, S16, w700
Gui, theSinglesCatalog:Add, Text, center ym-10 x12 y289 w180 h30 0x200 cRed, How to Use:
Gui, theSinglesCatalog:Font, S14, w700
Gui, theSinglesCatalog:Add, Text, center ym-10 x12 y319 w180 h50 0x200,Alt + Shift + S
Gui, theSinglesCatalog:Font, underline S10, w700
Gui, theSinglesCatalog:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theSinglesCatalog:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theSinglesCatalog:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Singles Catalog - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theQL1:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

Setup:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theSetup:+AlwaysOnTop
Gui, theSetup:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theSetup:Color, FFFFFF
Gui, theSetup:Font, S12, w700
Gui, theSetup:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gQuickLinks1, Back to QuickLinks
Gui, theSetup:Font, S20, w700
Gui, theSetup:Add, Text, center ym-10 x12 y159 w180 h50 0x200 cRed, Setup
Gui, theSetup:Font, S10, w700
Gui, theSetup:Add, Text, center x12 y209 w180, Using this hotkey will automatically launch the setup menu for Auto Hotkeys.
Gui, theSetup:Font, S16, w700
Gui, theSetup:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theSetup:Font, S14, w700
Gui, theSetup:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,F9
Gui, theSetup:Font, underline S10, w700
Gui, theSetup:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theSetup:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theSetup:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, S/S Schedule - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theQL1:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

Specialty:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theSpecialty:+AlwaysOnTop
Gui, theSpecialty:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theSpecialty:Color, FFFFFF
Gui, theSpecialty:Font, S12, w700
Gui, theSpecialty:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gQuickLinks1, Back to QuickLinks
Gui, theSpecialty:Font, S20, w700
Gui, theSpecialty:Add, Text, center ym-10 x12 y159 w180 h50 0x200 cRed, Specialty
Gui, theSpecialty:Font, S10, w700
Gui, theSpecialty:Add, Text, center x12 y209 w180, Using this hotkey will automatically launch the Specialty reference page in the Wiki.
Gui, theSpecialty:Font, S16, w700
Gui, theSpecialty:Add, Text, center ym-10 x12 y289 w180 h30 0x200 cRed, How to Use:
Gui, theSpecialty:Font, S14, w700
Gui, theSpecialty:Add, Text, center ym-10 x12 y319 w180 h50 0x200,Win + P
Gui, theSpecialty:Font, underline S10, w700
Gui, theSpecialty:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theSpecialty:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theSpecialty:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Specialty - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theQL1:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

SuperQuoter:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theSuperQuoter:+AlwaysOnTop
Gui, theSuperQuoter:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theSuperQuoter:Color, FFFFFF
Gui, theSuperQuoter:Font, S12, w700
Gui, theSuperQuoter:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gQuickLinks1, Back to QuickLinks
Gui, theSuperQuoter:Font, S20, w700
Gui, theSuperQuoter:Add, Text, center ym-10 x12 y159 w180 h50 0x200 cRed, Super Quoter
Gui, theSuperQuoter:Font, S10, w700
Gui, theSuperQuoter:Add, Text, center x12 y209 w180, Using this hotkey will automatically launch the Super Quoter in Embassy.
Gui, theSuperQuoter:Font, S16, w700
Gui, theSuperQuoter:Add, Text, center ym-10 x12 y269 w180 h30 0x200 cRed, How to Use:
Gui, theSuperQuoter:Font, S14, w700
Gui, theSuperQuoter:Add, Text, center ym-10 x12 y299 w180 h50 0x200,Win + S
Gui, theSuperQuoter:Font, underline S10, w700
Gui, theSuperQuoter:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theSuperQuoter:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theSuperQuoter:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Super Quoter - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theQL1:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

Templates:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theDesignTemplates:+AlwaysOnTop
Gui, theDesignTemplates:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theDesignTemplates:Color, FFFFFF
Gui, theDesignTemplates:Font, S12, w700
Gui, theDesignTemplates:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gQuickLinks1, Back to QuickLinks
Gui, theDesignTemplates:Font, S20, w700
Gui, theDesignTemplates:Add, Text, center ym-10 x12 y159 w180 h50 0x200 cRed, Templates
Gui, theDesignTemplates:Font, S10, w700
Gui, theDesignTemplates:Add, Text, center x12 y209 w180, Copy the term you would like to search and then use the hotkey to search for it in the CustomInk templates.
Gui, theDesignTemplates:Font, S16, w700
Gui, theDesignTemplates:Add, Text, center ym-10 x12 y299 w180 h30 0x200 cRed, How to Use:
Gui, theDesignTemplates:Font, S14, w700
Gui, theDesignTemplates:Add, Text, center ym-10 x12 y329 w180 h50 0x200,Alt + Shift + T
Gui, theDesignTemplates:Font, underline S10, w700
Gui, theDesignTemplates:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theDesignTemplates:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theDesignTemplates:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Templates - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theQL1:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

UPSTool:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theUPSTool:+AlwaysOnTop
Gui, theUPSTool:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theUPSTool:Color, FFFFFF
Gui, theUPSTool:Font, S12, w700
Gui, theUPSTool:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gQuickLinks1, Back to QuickLinks
Gui, theUPSTool:Font, S20, w700
Gui, theUPSTool:Add, Text, center ym-10 x12 y159 w180 h50 0x200 cRed, UPS Tool
Gui, theUPSTool:Font, S10, w700
Gui, theUPSTool:Add, Text, center x12 y209 w180, Using this hotkey will launch the UPS Tool.
Gui, theUPSTool:Font, S16, w700
Gui, theUPSTool:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theUPSTool:Font, S14, w700
Gui, theUPSTool:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,F10
Gui, theUPSTool:Font, underline S10, w700
Gui, theUPSTool:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theUPSTool:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theUPSTool:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Templates - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theQL1:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

Wiki:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theWiki:+AlwaysOnTop
Gui, theWiki:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theWiki:Color, FFFFFF
Gui, theWiki:Font, S12, w700
Gui, theWiki:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gQuickLinks1, Back to QuickLinks
Gui, theWiki:Font, S20, w700
Gui, theWiki:Add, Text, center ym-10 x12 y159 w180 h50 0x200 cRed, Wiki
Gui, theWiki:Font, S10, w700
Gui, theWiki:Add, Text, center x12 y209 w180, Copy the term you would like to search and then use this hotkey to search for it in the Wiki, in the Sales/Service space.
Gui, theWiki:Font, S16, w700
Gui, theWiki:Add, Text, center ym-10 x12 y299 w180 h30 0x200 cRed, How to Use:
Gui, theWiki:Font, S14, w700
Gui, theWiki:Add, Text, center ym-10 x12 y329 w180 h50 0x200,Win + W
Gui, theWiki:Font, underline S10, w700
Gui, theWiki:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theWiki:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theWiki:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Wiki - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theQL1:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

Workday:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theWorkday:+AlwaysOnTop
Gui, theWorkday:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theWorkday:Color, FFFFFF
Gui, theWorkday:Font, S12, w700
Gui, theWorkday:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gQuickLinks1, Back to QuickLinks
Gui, theWorkday:Font, S20, w700
Gui, theWorkday:Add, Text, center ym-10 x12 y159 w180 h50 0x200 cRed, Workday
Gui, theWorkday:Font, S10, w700
Gui, theWorkday:Add, Text, center x12 y209 w180, Using this hotkey will automatically launch Workday.
Gui, theWorkday:Font, S16, w700
Gui, theWorkday:Add, Text, center ym-10 x12 y299 w180 h30 0x200 cRed, How to Use:
Gui, theWorkday:Font, S14, w700
Gui, theWorkday:Add, Text, center ym-10 x12 y329 w180 h50 0x200,Alt + W
Gui, theWorkday:Font, underline S10, w700
Gui, theWorkday:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theWorkday:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theWorkday:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Wiki - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theQL1:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

Email:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmail:+AlwaysOnTop
Gui, theEmail:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmail:Color, FFFFFF
Gui, theEmail:Font, underline S14, w700
Gui, theEmail:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gMenu, Back to Menu
Gui, theEmail:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailContent v_Content, Content
Gui, theEmail:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailDesign v_Design, Design
Gui, theEmail:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailDiscount v_Discount, Discount
Gui, theEmail:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailGeneral v_General, General
Gui, theEmail:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailGroup v_Group, Group
Gui, theEmail:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailPostOrder v_PostOrder, Post-Order
Gui, theEmail:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailPreOrder v_PreOrder, Pre-Order
Gui, theEmail:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailProblem v_Problem, Problem
Gui, theEmail:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailProduct v_Product, Product
Gui, theEmail:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailQuote v_Quote, Quote
Gui, theEmail:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailShipping v_Shipping, Shipping
Gui, theEmail:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailSingles v_Singles, Singles
Gui, theEmail:Font, underline S10, w700
Gui, theEmail:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmail:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmail:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, E-Mail - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theIntro:destroy
Gui, theMenu:destroy
Gui, theEmailContent:destroy
Gui, theEmailDesign:destroy
Gui, theEmailDesign2:destroy
Gui, theEmailDiscount:destroy
Gui, theEmailGeneral:destroy
Gui, theEmailGroup:destroy
Gui, theEmailPreOrder:destroy
Gui, theEmailPostOrder:destroy
Gui, theEmailProblem:destroy
Gui, theEmailProduct:destroy
Gui, theEmailQuote:destroy
Gui, theEmailShipping:destroy
Gui, theEmailSingles:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
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

Return
Return	

EmailContent:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailContent:+AlwaysOnTop
Gui, theEmailContent:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailContent:Color, FFFFFF
Gui, theEmailContent:Font, S12, w700
Gui, theEmailContent:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmail, Back to Email
Gui, theEmailContent:Font, underline S14, w700
Gui, theEmailContent:Add, Text, center ym-10 x12 y179 w180 h30 0x200 cBlue gEmailContentBands v_Bands, Bands
Gui, theEmailContent:Add, Text, center ym-10 x12 y+7 w180 h30 0x200 cBlue gEmailContentCelebs v_Celebs, Celebs
Gui, theEmailContent:Add, Text, center ym-10 x12 y+7 w180 h30 0x200 cBlue gEmailContentCollegeNo v_CollegeNo, College/No
Gui, theEmailContent:Add, Text, center ym-10 x12 y+7 w180 h30 0x200 cBlue gEmailContentCollegeYes v_CollegeYes, College/Yes
Gui, theEmailContent:Add, Text, center ym-10 x12 y+7 w180 h30 0x200 cBlue gEmailContentContent v_Content, Content
Gui, theEmailContent:Add, Text, center ym-10 x12 y+7 w180 h30 0x200 cBlue gEmailContentDisney v_Disney, Disney
Gui, theEmailContent:Add, Text, center ym-10 x12 y+7 w180 h30 0x200 cBlue gEmailContentGreek v_Greek, Greek
Gui, theEmailContent:Add, Text, center ym-10 x12 y+7 w180 h30 0x200 cBlue gEmailContentOffensive v_Offensive, Offensive
Gui, theEmailContent:Add, Text, center ym-10 x12 y+7 w180 h30 0x200 cBlue gEmailContentSports v_Sports, Sports
Gui, theEmailContent:Add, Text, center ym-10 x12 y+7 w180 h30 0x200 cBlue gEmailContentVideoGames v_VideoGames, Video Games
Gui, theEmailContent:Add, Text, center ym-10 x12 y+7 w180 h30 0x200 cBlue gEmailContentWatermark v_Watermark, Watermark
Gui, theEmailContent:Font, underline S10, w700
Gui, theEmailContent:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailContent:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailContent:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Content - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailContentBands:destroy
Gui, theEmailContentCelebs:destroy
Gui, theEmailContentCollegeNo:destroy
Gui, theEmailContentCollegeYes:destroy
Gui, theEmailContentContent:destroy
Gui, theEmailContentDisney:destroy
Gui, theEmailContentGreek:destroy
Gui, theEmailContentOffensive:destroy
Gui, theEmailContentSports:destroy
Gui, theEmailContentVideoGames:destroy
Gui, theEmailContentWatermark:destroy
Gui, theEmail:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
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

Return
Return	

EmailContentBands:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailContentBands:+AlwaysOnTop
Gui, theEmailContentBands:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailContentBands:Color, FFFFFF
Gui, theEmailContentBands:Font, S12, w700
Gui, theEmailContentBands:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailContent, Back to Content
Gui, theEmailContentBands:Font, S20, w700
Gui, theEmailContentBands:Add, Text, center ym-10 x12 y159 w180 h50 0x200 cRed, Bands
Gui, theEmailContentBands:Font, S10, w700
Gui, theEmailContentBands:Add, Text, center x12 y209 w180, We have a selection of shirts available without a minimum, so you can print your custom design on as few as just one! Click here to check out those shirts and can choose any color shirt under the "Color choices for any size order" category.
Gui, theEmailContentBands:Font, S16, w700
Gui, theEmailContentBands:Add, Text, center ym-10 x12 y379 w180 h30 0x200 cRed, How to Use:
Gui, theEmailContentBands:Font, S14, w700
Gui, theEmailContentBands:Add, Text, center ym-10 x12 y409 w180 h50 0x200, #bands
Gui, theEmailContentBands:Font, underline S10, w700
Gui, theEmailContentBands:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailContentBands:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailContentBands:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Bands - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailContent:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailContentCelebs:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailContentCelebs:+AlwaysOnTop
Gui, theEmailContentCelebs:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailContentCelebs:Color, FFFFFF
Gui, theEmailContentCelebs:Font, S12, w700
Gui, theEmailContentCelebs:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailContent, Back to Content
Gui, theEmailContentCelebs:Font, S20, w700
Gui, theEmailContentCelebs:Add, Text, center ym-10 x12 y159 w180 h50 0x200 cRed, Celebs
Gui, theEmailContentCelebs:Font, S10, w700
Gui, theEmailContentCelebs:Add, Text, center x12 y209 w180, I noticed that your design includes copyrighted content owned by a celebrity. We cannot print your design as it is right now but, with a few adjustments, I can make sure your design is still something special that won’t compete with official merchandise regulations.
Gui, theEmailContentCelebs:Font, S16, w700
Gui, theEmailContentCelebs:Add, Text, center ym-10 x12 y409 w180 h30 0x200 cRed, How to Use:
Gui, theEmailContentCelebs:Font, S14, w700
Gui, theEmailContentCelebs:Add, Text, center ym-10 x12 y439 w180 h50 0x200, #celebs
Gui, theEmailContentCelebs:Font, underline S10, w700
Gui, theEmailContentCelebs:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailContentCelebs:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailContentCelebs:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Celebs - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailContent:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailContentCollegeNo:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailContentCollegeNo:+AlwaysOnTop
Gui, theEmailContentCollegeNo:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailContentCollegeNo:Color, FFFFFF
Gui, theEmailContentCollegeNo:Font, S12, w700
Gui, theEmailContentCollegeNo:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailContent, Back to Content
Gui, theEmailContentCollegeNo:Font, S20, w700
Gui, theEmailContentCollegeNo:Add, Text, center ym-10 x12 y159 w180 h50 0x200 cRed, College/No
Gui, theEmailContentCollegeNo:Font, S8, w700
Gui, theEmailContentCollegeNo:Add, Text, center x12 y209 w180, I noticed that your design uses collegiate content that is protected by copyright. Colleges can control the use of any names, mascots, and logos associated with the school. We are always working to become officially licensed with more schools but, at this time, we cannot print content from your particular institution. 
Gui, theEmailContentCollegeNo:Font, S16, w700
Gui, theEmailContentCollegeNo:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailContentCollegeNo:Font, S14, w700
Gui, theEmailContentCollegeNo:Add, Text, center ym-10 x12 y+10 w180 h50 0x200, #collegeno
Gui, theEmailContentCollegeNo:Font, underline S10, w700
Gui, theEmailContentCollegeNo:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailContentCollegeNo:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailContentCollegeNo:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, College/No - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailContent:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailContentCollegeYes:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailContentCollegeYes:+AlwaysOnTop
Gui, theEmailContentCollegeYes:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailContentCollegeYes:Color, FFFFFF
Gui, theEmailContentCollegeYes:Font, S12, w700
Gui, theEmailContentCollegeYes:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailContent, Back to Content
Gui, theEmailContentCollegeYes:Font, S20, w700
Gui, theEmailContentCollegeYes:Add, Text, center ym-10 x12 y159 w180 h50 0x200 cRed, College/Yes
Gui, theEmailContentCollegeYes:Font, S8, w700
Gui, theEmailContentCollegeYes:Add, Text, center x12 y209 w180, I noticed that your design uses collegiate content that is protected through copyright. Colleges can control the use of any names, mascots, and logos associated with the school. We have a team of specialists who will review your order to ensure that we can print your specific content in line with your school’s particular regulations. If we have questions or need clarification, we will reach out to you with more info.
Gui, theEmailContentCollegeYes:Font, S16, w700
Gui, theEmailContentCollegeYes:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailContentCollegeYes:Font, S14, w700
Gui, theEmailContentCollegeYes:Add, Text, center ym-10 x12 y+10 w180 h50 0x200, #collegeyes
Gui, theEmailContentCollegeYes:Font, underline S10, w700
Gui, theEmailContentCollegeYes:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailContentCollegeYes:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailContentCollegeYes:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, College/Yes - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailContent:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailContentContent:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailContentContent:+AlwaysOnTop
Gui, theEmailContentContent:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailContentContent:Color, FFFFFF
Gui, theEmailContentContent:Font, S12, w700
Gui, theEmailContentContent:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailContent, Back to Content
Gui, theEmailContentContent:Font, S20, w700
Gui, theEmailContentContent:Add, Text, center ym-10 x12 y159 w180 h50 0x200 cRed, Content
Gui, theEmailContentContent:Font, S8, w700
Gui, theEmailContentContent:Add, Text, center x12 y209 w180, Once an order is placed, all designs go through our review team to ensure we do not print any protected material without permission. If we have questions regarding your order, our team will be in contact with you to help find the best way to adjust your design.
Gui, theEmailContentContent:Font, S16, w700
Gui, theEmailContentContent:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailContentContent:Font, S14, w700
Gui, theEmailContentContent:Add, Text, center ym-10 x12 y+10 w180 h50 0x200, #content
Gui, theEmailContentContent:Font, underline S10, w700
Gui, theEmailContentContent:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailContentContent:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailContentContent:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Content - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailContent:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailContentDisney:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailContentDisney:+AlwaysOnTop
Gui, theEmailContentDisney:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailContentDisney:Color, FFFFFF
Gui, theEmailContentDisney:Font, S12, w700
Gui, theEmailContentDisney:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailContent, Back to Content
Gui, theEmailContentDisney:Font, S20, w700
Gui, theEmailContentDisney:Add, Text, center ym-10 x12 y159 w180 h50 0x200 cRed, Disney
Gui, theEmailContentDisney:Font, S8, w700
Gui, theEmailContentDisney:Add, Text, center x12 y209 w180, Disney protects its park names, characters, and all things Disney, so we need permission from a Disney licensing official to print any of their content. If you are not able to get written permission, we can adjust your design with something from our fantastic artwork collection. Can I send you a few alternate designs to review?
Gui, theEmailContentDisney:Font, S16, w700
Gui, theEmailContentDisney:Add, Text, center ym-10 x12 y499 w180 h30 0x200 cRed, How to Use:
Gui, theEmailContentDisney:Font, S14, w700
Gui, theEmailContentDisney:Add, Text, center ym-10 x12 y529 w180 h50 0x200, #disney
Gui, theEmailContentDisney:Font, underline S10, w700
Gui, theEmailContentDisney:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailContentDisney:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailContentDisney:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Disney - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailContent:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailContentGreek:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailContentGreek:+AlwaysOnTop
Gui, theEmailContentGreek:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailContentGreek:Color, FFFFFF
Gui, theEmailContentGreek:Font, S12, w700
Gui, theEmailContentGreek:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailContent, Back to Content
Gui, theEmailContentGreek:Font, S20, w700
Gui, theEmailContentGreek:Add, Text, center ym-10 x12 y159 w180 h50 0x200 cRed, Greek
Gui, theEmailContentGreek:Font, S8, w700
Gui, theEmailContentGreek:Add, Text, center x12 y209 w180, All Greek orders go through a comprehensive review process to make sure the design follows your organization’s particular set of regulations for use. This process takes place after your order is placed but before we start printing your design. If we have any questions or clarifications, we’ll be in touch soon.
Gui, theEmailContentGreek:Font, S16, w700
Gui, theEmailContentGreek:Add, Text, center ym-10 x12 y379 w180 h30 0x200 cRed, How to Use:
Gui, theEmailContentGreek:Font, S14, w700
Gui, theEmailContentGreek:Add, Text, center ym-10 x12 y409 w180 h50 0x200, #greek
Gui, theEmailContentGreek:Font, underline S10, w700
Gui, theEmailContentGreek:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailContentGreek:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailContentGreek:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Greek - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailContent:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailContentOffensive:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailContentOffensive:+AlwaysOnTop
Gui, theEmailContentOffensive:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailContentOffensive:Color, FFFFFF
Gui, theEmailContentOffensive:Font, S12, w700
Gui, theEmailContentOffensive:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailContent, Back to Content
Gui, theEmailContentOffensive:Font, S20, w700
Gui, theEmailContentOffensive:Add, Text, center ym-10 x12 y159 w180 h50 0x200 cRed, Offensive
Gui, theEmailContentOffensive:Font, S8, w700
Gui, theEmailContentOffensive:Add, Text, center x12 y209 w180, While reviewing your design, I noticed that it has content that does not follow the standards we set forth in our User Agreement. We will not print material that can be considered unlawful, harmful, threatening, abusive, harassing, tortuous, defamatory, vulgar, obscene, libelous, invasive of another's privacy, hateful, or racially, ethnically or otherwise objectionable. In order to move forward, we need to ___________________________.
Gui, theEmailContentOffensive:Font, S16, w700
Gui, theEmailContentOffensive:Add, Text, center ym-10 x12 y399 w180 h30 0x200 cRed, How to Use:
Gui, theEmailContentOffensive:Font, S14, w700
Gui, theEmailContentOffensive:Add, Text, center ym-10 x12 y439 w180 h50 0x200, #offensive
Gui, theEmailContentOffensive:Font, underline S10, w700
Gui, theEmailContentOffensive:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailContentOffensive:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailContentOffensive:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Offensive - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailContent:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailContentSports:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailContentSports:+AlwaysOnTop
Gui, theEmailContentSports:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailContentSports:Color, FFFFFF
Gui, theEmailContentSports:Font, S12, w700
Gui, theEmailContentSports:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailContent, Back to Content
Gui, theEmailContentSports:Font, S20, w700
Gui, theEmailContentSports:Add, Text, center ym-10 x12 y159 w180 h50 0x200 cRed, Sports
Gui, theEmailContentSports:Font, S8, w700
Gui, theEmailContentSports:Add, Text, center x12 y209 w180, I noticed that your design includes copyrighted content owned by a sports franchise. We cannot print your design as it is right now but, with a few adjustments, I can make sure your design is still something special that won’t compete with official merchandise regulations. Can I send you a few alternate designs that would fix this issue?
Gui, theEmailContentSports:Font, S16, w700
Gui, theEmailContentSports:Add, Text, center ym-10 x12 y319 w180 h30 0x200 cRed, How to Use:
Gui, theEmailContentSports:Font, S14, w700
Gui, theEmailContentSports:Add, Text, center ym-10 x12 y349 w180 h50 0x200, #sports
Gui, theEmailContentSports:Font, underline S10, w700
Gui, theEmailContentSports:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailContentSports:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailContentSports:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Sports - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailContent:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailContentVideoGames:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailContentVideoGames:+AlwaysOnTop
Gui, theEmailContentVideoGames:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailContentVideoGames:Color, FFFFFF
Gui, theEmailContentVideoGames:Font, S12, w700
Gui, theEmailContentVideoGames:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailContent, Back to Content
Gui, theEmailContentVideoGames:Font, S20, w700
Gui, theEmailContentVideoGames:Add, Text, center ym-10 x12 y159 w180 h50 0x200 cRed, Video Games
Gui, theEmailContentVideoGames:Font, S8, w700
Gui, theEmailContentVideoGames:Add, Text, center x12 y209 w180, I noticed that your design uses copyrighted content owned by a gaming company. Video game companies protect their logos, characters, promotional materials, and even screenshots from their games. To move forward, we will need written permission from someone at the company. If you are not able to get written permission, we can help you make adjustments to your design by replacing the content. Can I send you a few alternate designs that would fix this issue?
Gui, theEmailContentVideoGames:Font, S16, w700
Gui, theEmailContentVideoGames:Add, Text, center ym-10 x12 y419 w180 h30 0x200 cRed, How to Use:
Gui, theEmailContentVideoGames:Font, S14, w700
Gui, theEmailContentVideoGames:Add, Text, center ym-10 x12 y449 w180 h50 0x200, #videogames
Gui, theEmailContentVideoGames:Font, underline S10, w700
Gui, theEmailContentVideoGames:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailContentVideoGames:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailContentVideoGames:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Video Games - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailContent:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailContentWatermark:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailContentWatermark:+AlwaysOnTop
Gui, theEmailContentWatermark:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailContentWatermark:Color, FFFFFF
Gui, theEmailContentWatermark:Font, S12, w700
Gui, theEmailContentWatermark:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailContent, Back to Content
Gui, theEmailContentWatermark:Font, S20, w700
Gui, theEmailContentWatermark:Add, Text, center ym-10 x12 y159 w180 h50 0x200 cRed, Watermark
Gui, theEmailContentWatermark:Font, S8, w700
Gui, theEmailContentWatermark:Add, Text, center x12 y209 w180, I noticed that your design uses content protected by a watermark. Companies and individuals protect the images they own with watermarks to prevent unauthorized use. To fix this, you have two options. You can purchase the artwork from the source and send us both the receipt and the new art file without the watermark or we can replace the artwork with something similar from our extensive art library. 
Gui, theEmailContentWatermark:Font, S16, w700
Gui, theEmailContentWatermark:Add, Text, center ym-10 x12 y409 w180 h30 0x200 cRed, How to Use:
Gui, theEmailContentWatermark:Font, S14, w700
Gui, theEmailContentWatermark:Add, Text, center ym-10 x12 y439 w180 h50 0x200, #watermark
Gui, theEmailContentWatermark:Font, underline S10, w700
Gui, theEmailContentWatermark:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailContentWatermark:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailContentWatermark:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Watermark - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailContent:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailDesign:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailDesign:+AlwaysOnTop
Gui, theEmailDesign:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailDesign:Color, FFFFFF
Gui, theEmailDesign:Font, S12, w700
Gui, theEmailDesign:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmail, Back to Email
Gui, theEmailDesign:Font, underline S14, w700
Gui, theEmailDesign:Add, Text, center ym-10 x12 y+8 w180 h25 0x200 cBlue gEmailDesignBranding v_Branding, Branding
Gui, theEmailDesign:Add, Text, center ym-10 x12 y+8 w180 h30 0x200 cBlue gEmailDesignColorMax v_ColorMax, Color Max
Gui, theEmailDesign:Add, Text, center ym-10 x12 y+8 w180 h25 0x200 cBlue gEmailDesignCombineColors v_CombineColors, Combine Colors
Gui, theEmailDesign:Add, Text, center ym-10 x12 y+8 w180 h25 0x200 cBlue gEmailDesignCombineDesigns v_CombineDesigns, Combine Designs
Gui, theEmailDesign:Add, Text, center ym-10 x12 y+8 w180 h25 0x200 cBlue gEmailDesignCombineStyles v_CombineStyles, Combine Styles
if ((skill = 2) || (skill = 5))
{
Gui, theEmailDesign:Add, Text, center ym-10 x12 y+8 w180 h25 0x200 cBlue gEmailDesignCreativeServices v_CreativeServices, Creative Services
}
Gui, theEmailDesign:Add, Text, center ym-10 x12 y+8 w180 h25 0x200 cBlue gEmailDesignDesignHelp v_DesignHelp, Design Help
Gui, theEmailDesign:Add, Text, center ym-10 x12 y+8 w180 h25 0x200 cBlue gEmailDesignDesignLink v_DesignLink, Design Link
Gui, theEmailDesign:Add, Text, center ym-10 x12 y+8 w180 h25 0x200 cBlue gEmailDesignDesignTeam v_DesignTeam, Design Team
Gui, theEmailDesign:Add, Text, center ym-10 x12 y+8 w180 h25 0x200 cBlue gEmailDesignDPI v_DPI, DPI
Gui, theEmailDesign:Add, Text, center ym-10 x12 y+8 w180 h25 0x200 cBlue gEmailDesignDPIBulk v_DPIBulk, DPI Bulk
Gui, theEmailDesign:Add, Text, center ym-10 x12 y+8 w180 h25 0x200 cBlue gEmailDesignDPISingles v_DPISingles, DPI Singles
Gui, theEmailDesign:Add, Text, center ym-10 x12 y+8 w180 h25 0x200 cBlue gEmailDesignEmbroidery v_Embroidery, Embroidery
Gui, theEmailDesign:Add, Text, center ym-10 x12 y+8 w180 h25 0x200 cBlue gEmailDesignFiletypes v_Filetypes, Filetypes
Gui, theEmailDesign:Font, underline S12, w700
Gui, theEmailDesign:Add, Text, center ym-10 x12 y+15 w180 h30 0x200 cBlue gEmailDesign2 v_EmailDesign2, Next
Gui, theEmailDesign:Font, underline S10, w700
Gui, theEmailDesign:Add, Text, center ym-10 x20 y759 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailDesign:Add, Text, center ym-10 x110 y759 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailDesign:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Design - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmail:destroy
Gui, theEmailDesign2:destroy
Gui, theEmailDesignBranding:destroy
Gui, theEmailDesignColorMax:destroy 
Gui, theEmailDesignCombineColors:destroy
Gui, theEmailDesignCombineStyles:destroy
Gui, theEmailDesignCombineDesigns:destroy
Gui, theEmailDesignCreativeServices:destroy
Gui, theEmailDesignCreativeServices1:destroy
Gui, theEmailDesignCreativeServices2:destroy
Gui, theEmailDesignDesignHelp:destroy
Gui, theEmailDesignDesigning:destroy
Gui, theEmailDesignDesignLink:destroy
Gui, theEmailDesignDesignSaved:destroy
Gui, theEmailDesignDesignTeam:destroy
Gui, theEmailDesignDPI:destroy
Gui, theEmailDesignDPIBulk:destroy
Gui, theEmailDesignDPIBulk1:destroy
Gui, theEmailDesignDPISingles:destroy
Gui, theEmailDesignEmbroidery:destroy
Gui, theEmailDesignFiletypes:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
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

Return
Return

EmailDesign2:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,

Gui, theEmailDesign2:+AlwaysOnTop
Gui, theEmailDesign2:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailDesign2:Color, FFFFFF
Gui, theEmailDesign2:Font, S12, w700
Gui, theEmailDesign2:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmail, Back to Email
Gui, theEmailDesign2:Font, underline S14, w700
Gui, theEmailDesign2:Add, Text, center ym-10 x12 y+8 w180 h25 0x200 cBlue gEmailDesignInkChange v_InkChange, Ink Change
Gui, theEmailDesign2:Add, Text, center ym-10 x12 y+8 w180 h25 0x200 cBlue gEmailDesignPers v_Pers, PERS
Gui, theEmailDesign2:Add, Text, center ym-10 x12 y+8 w180 h25 0x200 cBlue gEmailDesignPMS v_PMS, PMS
Gui, theEmailDesign2:Add, Text, center ym-10 x12 y+8 w180 h25 0x200 cBlue gEmailDesignPMSDigital v_PMSDigital, PMS Digital
Gui, theEmailDesign2:Add, Text, center ym-10 x12 y+8 w180 h25 0x200 cBlue gEmailDesignPPS v_PPS, PPS
Gui, theEmailDesign2:Add, Text, center ym-10 x12 y+8 w180 h25 0x200 cBlue gEmailDesignRedraw v_Redraw, Redraw
Gui, theEmailDesign2:Add, Text, center ym-10 x12 y+8 w180 h25 0x200 cBlue gEmailDesignRotate v_Rotate, Rotate
Gui, theEmailDesign2:Add, Text, center ym-10 x12 y+8 w180 h25 0x200 cBlue gEmailDesignSleeveHelp v_SleeveHelp, Sleeve Help
Gui, theEmailDesign2:Add, Text, center ym-10 x12 y+8 w180 h25 0x200 cBlue gEmailDesignSpVsDig v_SpVsDig, SP vs Digital
Gui, theEmailDesign2:Add, Text, center ym-10 x12 y+8 w180 h25 0x200 cBlue gEmailDesignSubtleBlank v_SubtleBlank, Subtle Blank
Gui, theEmailDesign2:Add, Text, center ym-10 x12 y+8 w180 h25 0x200 cBlue gEmailDesignSubtleInk v_SubtleInk, Subtle Ink
Gui, theEmailDesign2:Add, Text, center ym-10 x12 y+8 w180 h25 0x200 cBlue gEmailDesignUploadHelp v_UploadHelp, Upload Help
Gui, theEmailDesign2:Add, Text, center ym-10 x12 y+8 w180 h25 0x200 cBlue gEmailDesignUploadWhite v_UploadWhite, Upload White
Gui, theEmailDesign2:Add, Text, center ym-10 x12 y+8 w180 h25 0x200 cBlue gEmailDesignVSS v_VSS, VSS
Gui, theEmailDesign2:Font, underline S12, w700
Gui, theEmailDesign2:Add, Text, center ym-10 x12 y+8 w180 h25 0x200 cBlue gEmailDesign v_EmailDesign, Previous
Gui, theEmailDesign2:Font, underline S10, w700
Gui, theEmailDesign2:Add, Text, center ym-10 x20 y759 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailDesign2:Add, Text, center ym-10 x110 y759 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailDesign2:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Design - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmail:destroy
Gui, theEmailDesign:destroy
Gui, theEmailDesignInkChange:destroy
Gui, theEmailDesignPers:destroy
Gui, theEmailDesignPMS:destroy
Gui, theEmailDesignPMSDigital:destroy
Gui, theEmailDesignPPS:destroy
Gui, theEmailDesignRedraw:destroy
Gui, theEmailDesignRetrieve:destroy
Gui, theEmailDesignRotate:destroy
Gui, theEmailDesignSample:destroy
Gui, theEmailDesignSleeveHelp:destroy
Gui, theEmailDesignSpVsDig:destroy
Gui, theEmailDesignSubtleBlank:destroy
Gui, theEmailDesignSubtleInk:destroy
Gui, theEmailDesignUploadHelp:destroy
Gui, theEmailDesignUploadWhite:destroy
Gui, theEmailDesignVSS:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
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

Return
Return

EmailDesignBranding:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailDesignBranding:+AlwaysOnTop
Gui, theEmailDesignBranding:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailDesignBranding:Color, FFFFFF
Gui, theEmailDesignBranding:Font, S12, w700
Gui, theEmailDesignBranding:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailDesign, Back to Design
Gui, theEmailDesignBranding:Font, S18, w700
Gui, theEmailDesignBranding:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Branding
Gui, theEmailDesignBranding:Font, S8, w700
Gui, theEmailDesignBranding:Add, Text, center x12 y+10 w170, We print a small tagless Inky logo with care instructions on the inside collar of the shirt, as well as a removable hang tag. Are you okay with leaving these on the shirts, or would you prefer we remove them?
Gui, theEmailDesignBranding:Font, S16, w700
Gui, theEmailDesignBranding:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailDesignBranding:Font, S14, w700
Gui, theEmailDesignBranding:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#branding
Gui, theEmailDesignBranding:Font, underline S10, w700
Gui, theEmailDesignBranding:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailDesignBranding:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailDesignBranding:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Branding - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailDesign:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailDesignColorMax:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailDesignColorMax:+AlwaysOnTop
Gui, theEmailDesignColorMax:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailDesignColorMax:Color, FFFFFF
Gui, theEmailDesignColorMax:Font, S12, w700
Gui, theEmailDesignColorMax:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailDesign, Back to Design
Gui, theEmailDesignColorMax:Font, S18, w700
Gui, theEmailDesignColorMax:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Color Max
Gui, theEmailDesignColorMax:Font, S8, w700
Gui, theEmailDesignColorMax:Add, Text, center x12 y+10 w170, Our performance shirts are able to receive a maximum of two colors during the printing process. I can help pick the two best colors to keep in your design and have my design team make those adjustments to your artwork. After the order is placed, we’ll send you an email proof of any changes before we print. This is at no cost to you because, we want to make sure you're 100`% satisfied with your custom artwork.
Gui, theEmailDesignColorMax:Font, S16, w700
Gui, theEmailDesignColorMax:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailDesignColorMax:Font, S14, w700
Gui, theEmailDesignColorMax:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#colormax
Gui, theEmailDesignColorMax:Font, underline S10, w700
Gui, theEmailDesignColorMax:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailDesignColorMax:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailDesignColorMax:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Color Max - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailDesign:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return



EmailDesignCombineColors:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailDesignCombineColors:+AlwaysOnTop
Gui, theEmailDesignCombineColors:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailDesignCombineColors:Color, FFFFFF
Gui, theEmailDesignCombineColors:Font, S12, w700
Gui, theEmailDesignCombineColors:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailDesign, Back to Design
Gui, theEmailDesignCombineColors:Font, S18, w700
Gui, theEmailDesignCombineColors:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Combine Colors
Gui, theEmailDesignCombineColors:Font, S8, w700
Gui, theEmailDesignCombineColors:Add, Text, center x12 y+10 w170, You can definitely mix different colors of the same item in our Design Lab! If you click on "Your Items," you'll see the option to "Add Another Color" of the same item. If you'd like, I’m happy to take care of adding those colors for you! I just need to know what colors you would like to add.
Gui, theEmailDesignCombineColors:Font, S16, w700
Gui, theEmailDesignCombineColors:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailDesignCombineColors:Font, S14, w700
Gui, theEmailDesignCombineColors:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#combinecolors
Gui, theEmailDesignCombineColors:Font, underline S10, w700
Gui, theEmailDesignCombineColors:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailDesignCombineColors:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailDesignCombineColors:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Combine Colors - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailDesign:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailDesignCombineDesigns:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailDesignCombineDesigns:+AlwaysOnTop
Gui, theEmailDesignCombineDesigns:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailDesignCombineDesigns:Color, FFFFFF
Gui, theEmailDesignCombineDesigns:Font, S12, w700
Gui, theEmailDesignCombineDesigns:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailDesign, Back to Design
Gui, theEmailDesignCombineDesigns:Font, S17, w700
Gui, theEmailDesignCombineDesigns:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Combine Designs
Gui, theEmailDesignCombineDesigns:Font, S8, w700
Gui, theEmailDesignCombineDesigns:Add, Text, center x12 y+10 w170, Our Design Lab can only work with one design at a time, but I can handle multiple designs for you on my end. If you'd like, we can work through the details of your order and, when you're ready I can take a single payment over the phone. Does that work for you?
Gui, theEmailDesignCombineDesigns:Font, S16, w700
Gui, theEmailDesignCombineDesigns:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailDesignCombineDesigns:Font, S14, w700
Gui, theEmailDesignCombineDesigns:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#combinedesigns
Gui, theEmailDesignCombineDesigns:Font, underline S10, w700
Gui, theEmailDesignCombineDesigns:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailDesignCombineDesigns:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailDesignCombineDesigns:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Combine Designs - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailDesign:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailDesignCombineStyles:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailDesignCombineStyles:+AlwaysOnTop
Gui, theEmailDesignCombineStyles:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailDesignCombineStyles:Color, FFFFFF
Gui, theEmailDesignCombineStyles:Font, S12, w700
Gui, theEmailDesignCombineStyles:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailDesign, Back to Design
Gui, theEmailDesignCombineStyles:Font, S18, w700
Gui, theEmailDesignCombineStyles:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Combine Styles
Gui, theEmailDesignCombineStyles:Font, S8, w700
Gui, theEmailDesignCombineStyles:Add, Text, center x12 y+10 w170, You can definitely mix and match different styles in the same order! The Design Lab allows you to add select styles that match the original item style you picked. If you're in the Design Lab, click on the "Items" tab and you'll be given the option to add another style to your order. Once you've selected the additional style, you'll see all the style options listed out with your created design on each one!  If the style you're interested in isn't listed, just give us a call and we'll see if we can add it on our end. 
Gui, theEmailDesignCombineStyles:Font, S16, w700
Gui, theEmailDesignCombineStyles:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailDesignCombineStyles:Font, S14, w700
Gui, theEmailDesignCombineStyles:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#combinestyles
Gui, theEmailDesignCombineStyles:Font, underline S10, w700
Gui, theEmailDesignCombineStyles:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailDesignCombineStyles:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailDesignCombineStyles:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Combine Styles - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailDesign:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailDesignCreativeServices:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailDesignCreativeServices:+AlwaysOnTop
Gui, theEmailDesignCreativeServices:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailDesignCreativeServices:Color, FFFFFF
Gui, theEmailDesignCreativeServices:Font, S12, w700
Gui, theEmailDesignCreativeServices:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailDesign, Back to Design
Gui, theEmailDesignCreativeServices:Font, S17, w700
Gui, theEmailDesignCreativeServices:Add, Text, center ym-10 x12 y+5 w180 h50 0x200 cRed, Creative Services
Gui, theEmailDesignCreativeServices:Font, S8, w700
Gui, theEmailDesignCreativeServices:Add, Text, center x12 y+5 w170, Thank you for choosing CustomInk, and welcome to the Creative Services design experience! This is a unique, free service where we connect you to a real artist who will bring your design to life. Here’s how it works: It starts by telling our Creative Services team everything that you’d like to see in your design and what products you’re interested in. With this information, we’ll start working on your custom artwork. Please note any designs created by CustomInk will not be distributed, but they will appear on the product you order. Once the design is ready, you’ll receive an email from the artist including a link to the finalized custom design, thoughtfully placed on the product you want to order. *Should you require further adjustments, please note you are limited to two rounds of changes.* Let’s get started! Please answer the following:
Gui, theEmailDesignCreativeServices:Font, S11, w700
Gui, theEmailDesignCreativeServices:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cBlue gEmailDesignCreativeServices1, Next: Questions
Gui, theEmailDesignCreativeServices:Font, S16, w700
Gui, theEmailDesignCreativeServices:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailDesignCreativeServices:Font, S14, w700
Gui, theEmailDesignCreativeServices:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#cs
Gui, theEmailDesignCreativeServices:Font, underline S10, w700
Gui, theEmailDesignCreativeServices:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailDesignCreativeServices:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailDesignCreativeServices:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Creative Services - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailDesign:destroy
Gui, theEmailDesignCreativeServices1:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailDesignCreativeServices1:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailDesignCreativeServices1:+AlwaysOnTop
Gui, theEmailDesignCreativeServices1:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailDesignCreativeServices1:Color, FFFFFF
Gui, theEmailDesignCreativeServices1:Font, S12, w700
Gui, theEmailDesignCreativeServices1:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailDesign, Back to Design
Gui, theEmailDesignCreativeServices1:Font, S17, w700
Gui, theEmailDesignCreativeServices1:Add, Text, center ym-10 x12 y+5 w180 h50 0x200 cRed, Creative Services
Gui, theEmailDesignCreativeServices1:Font, S8, w700
Gui, theEmailDesignCreativeServices1:Add, Text, center x12 y+5 w170, 1. Tell me about your idea! Who will be wearing these shirts? What is the event? When do you need your order? What is your design goal for these shirts? How do you want everyone to feel when they are wearing them? 2. Please describe in detail how you'd like the design to look. What colors should we use? Do you have any examples you'd like us to use for inspiration? 3. Approximately how large do you want the design to print? Where on the shirt do you want the design to appear?
Gui, theEmailDesignCreativeServices1:Font, S11, w700
Gui, theEmailDesignCreativeServices1:Add, Text, ym-10 x45 y430 w90 h20 0x200 cBlue gEmailDesignCreativeServices, Prev
Gui, theEmailDesignCreativeServices1:Add, Text, ym-10 x130 y430 w90 h20 0x200 cBlue gEmailDesignCreativeServices2, Next
Gui, theEmailDesignCreativeServices1:Font, S16, w700
Gui, theEmailDesignCreativeServices1:Add, Text, center ym-10 x12 y+20 w180 h30 0x200 cRed, How to Use:
Gui, theEmailDesignCreativeServices1:Font, S14, w700
Gui, theEmailDesignCreativeServices1:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#cs
Gui, theEmailDesignCreativeServices1:Font, underline S10, w700
Gui, theEmailDesignCreativeServices1:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailDesignCreativeServices1:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailDesignCreativeServices1:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Creative Services - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailDesign:destroy
Gui, theEmailDesignCreativeServices:destroy
Gui, theEmailDesignCreativeServices2:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailDesignCreativeServices2:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailDesignCreativeServices2:+AlwaysOnTop
Gui, theEmailDesignCreativeServices2:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailDesignCreativeServices2:Color, FFFFFF
Gui, theEmailDesignCreativeServices2:Font, S12, w700
Gui, theEmailDesignCreativeServices2:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailDesign, Back to Design
Gui, theEmailDesignCreativeServices2:Font, S17, w700
Gui, theEmailDesignCreativeServices2:Add, Text, center ym-10 x12 y+5 w180 h50 0x200 cRed, Creative Services
Gui, theEmailDesignCreativeServices2:Font, S8, w700
Gui, theEmailDesignCreativeServices2:Add, Text, center x12 y+5 w170,4. Is there text you’d like to include with the design? If so, is there a specific style of font you’d like us to use? 5. What shirt style and color would you like to order? What is the smallest size shirt you'll be ordering? 6. How many shirts are you interested in ordering, what is your deadline? Also, what is the zip code we'd be shipping the order to, so I can provide you with a quote? The more information you can provide, the better, so we can create something that is exclusively designed for you! I look forward to hearing back from you so we can get the ball rolling on your custom design!
Gui, theEmailDesignCreativeServices2:Font, S11, w700
Gui, theEmailDesignCreativeServices2:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cBlue gEmailDesignCreativeServices1, Prev: Questions
Gui, theEmailDesignCreativeServices2:Font, S16, w700
Gui, theEmailDesignCreativeServices2:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailDesignCreativeServices2:Font, S14, w700
Gui, theEmailDesignCreativeServices2:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#cs
Gui, theEmailDesignCreativeServices2:Font, underline S10, w700
Gui, theEmailDesignCreativeServices2:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailDesignCreativeServices2:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailDesignCreativeServices2:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Creative Services - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailDesign:destroy
Gui, theEmailDesignCreativeServices1:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return



EmailDesignDesignHelp:
WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailDesignDesignHelp:+AlwaysOnTop
Gui, theEmailDesignDesignHelp:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailDesignDesignHelp:Color, FFFFFF
Gui, theEmailDesignDesignHelp:Font, S12, w700
Gui, theEmailDesignDesignHelp:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailDesign, Back to Design
Gui, theEmailDesignDesignHelp:Font, S18, w700
Gui, theEmailDesignDesignHelp:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Design Help
Gui, theEmailDesignDesignHelp:Font, S8, w700
Gui, theEmailDesignDesignHelp:Add, Text, center x12 y+10 w170, I’m happy to help you put together a custom design! I really like your design idea and I'm sure that we can create something amazing using our art and text from the Design Lab.
Gui, theEmailDesignDesignHelp:Font, S16, w700
Gui, theEmailDesignDesignHelp:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailDesignDesignHelp:Font, S14, w700
Gui, theEmailDesignDesignHelp:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#designhelp
Gui, theEmailDesignDesignHelp:Font, underline S10, w700
Gui, theEmailDesignDesignHelp:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailDesignDesignHelp:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailDesignDesignHelp:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Design Help - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailDesign:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailDesignDesigning:
WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailDesignDesigning:+AlwaysOnTop
Gui, theEmailDesignDesigning:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailDesignDesigning:Color, FFFFFF
Gui, theEmailDesignDesigning:Font, S12, w700
Gui, theEmailDesignDesigning:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailDesign, Back to Design
Gui, theEmailDesignDesigning:Font, S18, w700
Gui, theEmailDesignDesigning:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Designing
Gui, theEmailDesignDesigning:Font, S8, w700
Gui, theEmailDesignDesigning:Add, Text, center x12 y+10 w170, This design work will just take a few minutes, would you mind waiting with me or would you prefer that email you the link to the design instead?
Gui, theEmailDesignDesigning:Font, S16, w700
Gui, theEmailDesignDesigning:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailDesignDesigning:Font, S14, w700
Gui, theEmailDesignDesigning:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#designing
Gui, theEmailDesignDesigning:Font, underline S10, w700
Gui, theEmailDesignDesigning:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailDesignDesigning:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailDesignDesigning:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Designing - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailDesign:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailDesignDesignLink:
WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailDesignDesignLink:+AlwaysOnTop
Gui, theEmailDesignDesignLink:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailDesignDesignLink:Color, FFFFFF
Gui, theEmailDesignDesignLink:Font, S12, w700
Gui, theEmailDesignDesignLink:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailDesign, Back to Design
Gui, theEmailDesignDesignLink:Font, S18, w700
Gui, theEmailDesignDesignLink:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Design Link
Gui, theEmailDesignDesignLink:Font, S8, w700
Gui, theEmailDesignDesignLink:Add, Text, center x12 y+10 w170, Please click on the link below to check out your design: *Copied design link* I'm happy to make any changes you'd like to see! 
Gui, theEmailDesignDesignLink:Font, S16, w700
Gui, theEmailDesignDesignLink:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailDesignDesignLink:Font, S14, w700
Gui, theEmailDesignDesignLink:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#designlink
Gui, theEmailDesignDesignLink:Font, underline S10, w700
Gui, theEmailDesignDesignLink:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailDesignDesignLink:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailDesignDesignLink:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Design Link - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailDesign:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy

Return

EmailDesignDesignSaved:
WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailDesignDesignSaved:+AlwaysOnTop
Gui, theEmailDesignDesignSaved:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailDesignDesignSaved:Color, FFFFFF
Gui, theEmailDesignDesignSaved:Font, S12, w700
Gui, theEmailDesignDesignSaved:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailDesign, Back to Design
Gui, theEmailDesignDesignSaved:Font, S18, w700
Gui, theEmailDesignDesignSaved:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Design Saved
Gui, theEmailDesignDesignSaved:Font, S8, w700
Gui, theEmailDesignDesignSaved:Add, Text, center x12 y+10 w170, I've saved your design and left notes under your account so we'll be able to pick up where we left off last time if you start a new chat. Feel free to ask for $!{operator.nickname} when you chat back in and I'll be happy to help!
Gui, theEmailDesignDesignSaved:Font, S16, w700
Gui, theEmailDesignDesignSaved:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailDesignDesignSaved:Font, S14, w700
Gui, theEmailDesignDesignSaved:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#designsaved
Gui, theEmailDesignDesignSaved:Font, underline S10, w700
Gui, theEmailDesignDesignSaved:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailDesignDesignSaved:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailDesignDesignSaved:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Design Link - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailDesign:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy

Return

EmailDesignDesignTeam:
WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailDesignDesignTeam:+AlwaysOnTop
Gui, theEmailDesignDesignTeam:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailDesignDesignTeam:Color, FFFFFF
Gui, theEmailDesignDesignTeam:Font, S12, w700
Gui, theEmailDesignDesignTeam:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailDesign, Back to Design
Gui, theEmailDesignDesignTeam:Font, S18, w700
Gui, theEmailDesignDesignTeam:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Design Team
Gui, theEmailDesignDesignTeam:Font, S8, w700
Gui, theEmailDesignDesignTeam:Add, Text, center x12 y+10 w170, I can definitely have our design team make adjustments to your artwork! Once you place your order with us, our design team will get started on those changes and we'll send you an proof email containing a proof of those changes that will require your approval before we print.
Gui, theEmailDesignDesignTeam:Font, S16, w700
Gui, theEmailDesignDesignTeam:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailDesignDesignTeam:Font, S14, w700
Gui, theEmailDesignDesignTeam:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#designteam
Gui, theEmailDesignDesignTeam:Font, underline S10, w700
Gui, theEmailDesignDesignTeam:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailDesignDesignTeam:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailDesignDesignTeam:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Design Team - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailDesign:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy

Return

EmailDesignDPI:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailDesignDPI:+AlwaysOnTop
Gui, theEmailDesignDPI:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailDesignDPI:Color, FFFFFF
Gui, theEmailDesignDPI:Font, S12, w700
Gui, theEmailDesignDPI:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailDesign, Back to Design
Gui, theEmailDesignDPI:Font, S18, w700
Gui, theEmailDesignDPI:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, DPI
Gui, theEmailDesignDPI:Font, S8, w700
Gui, theEmailDesignDPI:Add, Text, center x12 y+10 w170, To guarantee your image will look great when we print it, we require a minimum resolution determined by the size of the printed design. If your artwork needs to be a specific size, but you don't have a higher resolution image available,  we offer our free redraw service for orders of 6 or more pieces. After you place your order, and complete your payment, our expert design team will redraw your design at any size you'd like in up to 4 colors. We’ll show you the design in a free proof email. We would then just need your approval of the design before we go to print.
Gui, theEmailDesignDPI:Font, S16, w700
Gui, theEmailDesignDPI:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailDesignDPI:Font, S14, w700
Gui, theEmailDesignDPI:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#dpi
Gui, theEmailDesignDPI:Font, underline S10, w700
Gui, theEmailDesignDPI:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailDesignDPI:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailDesignDPI:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, DPI - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailDesign:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy

Return

EmailDesignDPIBulk:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailDesignDPIBulk:+AlwaysOnTop
Gui, theEmailDesignDPIBulk:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailDesignDPIBulk:Color, FFFFFF
Gui, theEmailDesignDPIBulk:Font, S12, w700
Gui, theEmailDesignDPIBulk:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailDesign, Back to Design
Gui, theEmailDesignDPIBulk:Font, S18, w700
Gui, theEmailDesignDPIBulk:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, DPI Bulk
Gui, theEmailDesignDPIBulk:Font, S8, w700
Gui, theEmailDesignDPIBulk:Add, Text, center x12 y+10 w170, We can absolutely work with your photograph and transform it into a design on one of our products. The final printed design may depend on the quality of your image, the type of product you're interested in, and the style of design you're looking for. To guarantee your image will look great when we print it, we require a minimum resolution determined by the size of the printed design. Currently, your image is not at a high enough resolution to print at your desired size. Do you happen to have a higher-resolution image we can use instead? If not, we can create something for you in our Design Lab using our awesome artwork!
Gui, theEmailDesignDPIBulk:Font, S16, w700
Gui, theEmailDesignDPIBulk:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailDesignDPIBulk:Font, S14, w700
Gui, theEmailDesignDPIBulk:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#dpibulk
Gui, theEmailDesignDPIBulk:Font, underline S10, w700
Gui, theEmailDesignDPIBulk:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailDesignDPIBulk:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailDesignDPIBulk:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, DPI Bulk - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailDesign:destroy
Gui, theEmailDesignDPIBulk1:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy

Return

EmailDesignDPIBulk1:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailDesignDPIBulk1:+AlwaysOnTop
Gui, theEmailDesignDPIBulk1:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailDesignDPIBulk1:Color, FFFFFF
Gui, theEmailDesignDPIBulk1:Font, S12, w700
Gui, theEmailDesignDPIBulk1:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailDesign, Back to Design
Gui, theEmailDesignDPIBulk1:Font, S18, w700
Gui, theEmailDesignDPIBulk1:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, DPI Bulk
Gui, theEmailDesignDPIBulk1:Font, S8, w700
Gui, theEmailDesignDPIBulk1:Add, Text, center x12 y+10 w170, We can absolutely work with your photograph and transform it into a design on one of our products. The final print we are able to execute may depend on the quality of your image, the type of product you're interested in, and the style of design you're looking for. We're able to print your photo at a high quality by requiring a minimum resolution to print at the size you want it in your design. This guarantees your image will look great when we print. Currently, your image is not at a high enough resolution to print at your current size. Do you happen to have a higher-resolution image we can use instead? If not, we can create something for you in our Design Lab using our awesome artwork!
Gui, theEmailDesignDPIBulk1:Font, S11, w700
Gui, theEmailDesignDPIBulk1:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cBlue gEmailDesignDPIBulk, Prev
Gui, theEmailDesignDPIBulk1:Font, S16, w700
Gui, theEmailDesignDPIBulk1:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailDesignDPIBulk1:Font, S14, w700
Gui, theEmailDesignDPIBulk1:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#dpibulk
Gui, theEmailDesignDPIBulk1:Font, underline S10, w700
Gui, theEmailDesignDPIBulk1:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailDesignDPIBulk1:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailDesignDPIBulk1:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, DPI Bulk - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailDesign:destroy
Gui, theEmailDesignDPIBulk:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy

Return

EmailDesignDPISingles:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailDesignDPISingles:+AlwaysOnTop
Gui, theEmailDesignDPISingles:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailDesignDPISingles:Color, FFFFFF
Gui, theEmailDesignDPISingles:Font, S12, w700
Gui, theEmailDesignDPISingles:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailDesign, Back to Design
Gui, theEmailDesignDPISingles:Font, S18, w700
Gui, theEmailDesignDPISingles:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, DPI Singles
Gui, theEmailDesignDPISingles:Font, S8, w700
Gui, theEmailDesignDPISingles:Add, Text, center x12 y+10 w170, To guarantee your image will look great when we print it, we require a minimum resolution determined by the size of the printed design. Your image is not at a high enough resolution to print at your current size. Do you happen to have a higher-resolution image we can use instead? If not, we can create something for you in our Design Lab using our huge selection of artwork!
Gui, theEmailDesignDPISingles:Font, S16, w700
Gui, theEmailDesignDPISingles:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailDesignDPISingles:Font, S14, w700
Gui, theEmailDesignDPISingles:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#dpisingles
Gui, theEmailDesignDPISingles:Font, underline S10, w700
Gui, theEmailDesignDPISingles:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailDesignDPISingles:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailDesignDPISingles:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, DPI Singles - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailDesign:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy

Return

EmailDesignEmbroidery:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailDesignEmbroidery:+AlwaysOnTop
Gui, theEmailDesignEmbroidery:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailDesignEmbroidery:Color, FFFFFF
Gui, theEmailDesignEmbroidery:Font, S12, w700
Gui, theEmailDesignEmbroidery:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailDesign, Back to Design
Gui, theEmailDesignEmbroidery:Font, S18, w700
Gui, theEmailDesignEmbroidery:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Embroidery
Gui, theEmailDesignEmbroidery:Font, S8, w700
Gui, theEmailDesignEmbroidery:Add, Text, center x12 y+10 w170, We are able to embroider your custom design on up to a 5"x5" area on many of our items. Our embroidery process works best with designs that contain thick lines and simple detail. If needed, we can have our production team help tweak your design to make sure that it will look great when embroidered.
Gui, theEmailDesignEmbroidery:Font, S16, w700
Gui, theEmailDesignEmbroidery:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailDesignEmbroidery:Font, S14, w700
Gui, theEmailDesignEmbroidery:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#embroidery
Gui, theEmailDesignEmbroidery:Font, underline S10, w700
Gui, theEmailDesignEmbroidery:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailDesignEmbroidery:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailDesignEmbroidery:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Embroidery - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailDesign:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailDesignFiletypes:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailDesignFiletypes:+AlwaysOnTop
Gui, theEmailDesignFiletypes:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailDesignFiletypes:Color, FFFFFF
Gui, theEmailDesignFiletypes:Font, S12, w700
Gui, theEmailDesignFiletypes:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailDesign, Back to Design
Gui, theEmailDesignFiletypes:Font, S18, w700
Gui, theEmailDesignFiletypes:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Filetypes
Gui, theEmailDesignFiletypes:Font, S8, w700
Gui, theEmailDesignFiletypes:Add, Text, center x12 y+10 w170, You can upload many image file types into our Design Lab, including: jpeg, jpg, gif, bmp, pdf, ai, psd. If you're working with a different file type, including: doc, ppt, zip file or any other format, please respond to this email with that artwork attached and I'll take care of it for you!
Gui, theEmailDesignFiletypes:Font, S16, w700
Gui, theEmailDesignFiletypes:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailDesignFiletypes:Font, S14, w700
Gui, theEmailDesignFiletypes:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#filetypes
Gui, theEmailDesignFiletypes:Font, underline S10, w700
Gui, theEmailDesignFiletypes:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailDesignFiletypes:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailDesignFiletypes:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Filetypes - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailDesign:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailDesignInkChange:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailDesignInkChange:+AlwaysOnTop
Gui, theEmailDesignInkChange:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailDesignInkChange:Color, FFFFFF
Gui, theEmailDesignInkChange:Font, S12, w700
Gui, theEmailDesignInkChange:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailDesign2, Back to Design
Gui, theEmailDesignInkChange:Font, S18, w700
Gui, theEmailDesignInkChange:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Ink Change
Gui, theEmailDesignInkChange:Font, S8, w700
Gui, theEmailDesignInkChange:Add, Text, center x12 y+10 w170, We can definitely use different ink colors within your order! We will need to use each ink color on at least 6 items in your order, and there is a $10 charge for each color change. You get one free ink change for every $200 spent in your order, so most of the time there is one built in for free.   If you give us a call at 800-293-4232 when it's time to order, we'll be happy to see that those ink changes are applied.
Gui, theEmailDesignInkChange:Font, S16, w700
Gui, theEmailDesignInkChange:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailDesignInkChange:Font, S14, w700
Gui, theEmailDesignInkChange:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#inkchange
Gui, theEmailDesignInkChange:Font, underline S10, w700
Gui, theEmailDesignInkChange:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailDesignInkChange:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailDesignInkChange:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Ink Change - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailDesign2:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailDesignPers:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailDesignPers:+AlwaysOnTop
Gui, theEmailDesignPers:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailDesignPers:Color, FFFFFF
Gui, theEmailDesignPers:Font, S12, w700
Gui, theEmailDesignPers:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailDesign2, Back to Design
Gui, theEmailDesignPers:Font, S18, w700
Gui, theEmailDesignPers:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, PERS
Gui, theEmailDesignPers:Font, S8, w700
Gui, theEmailDesignPers:Add, Text, center x12 y+10 w170, Our basic guidelines are $4.50 per personalized name, and $2.50 per personalized number. Did you already have a list of your names prepared? If so, I can take a look and finalize the pricing for you.
Gui, theEmailDesignPers:Font, S16, w700
Gui, theEmailDesignPers:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailDesignPers:Font, S14, w700
Gui, theEmailDesignPers:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#pers
Gui, theEmailDesignPers:Font, underline S10, w700
Gui, theEmailDesignPers:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailDesignPers:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailDesignPers:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, PERS - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailDesign2:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailDesignPMS:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailDesignPMS:+AlwaysOnTop
Gui, theEmailDesignPMS:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailDesignPMS:Color, FFFFFF
Gui, theEmailDesignPMS:Font, S12, w700
Gui, theEmailDesignPMS:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailDesign2, Back to Design
Gui, theEmailDesignPMS:Font, S18, w700
Gui, theEmailDesignPMS:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, PMS
Gui, theEmailDesignPMS:Font, S8, w700
Gui, theEmailDesignPMS:Add, Text, center x12 y+10 w170, We are definitely able to match your exact color preferences when screenprinting if you have a PMS pantone code that we can use for the ink. For this service, there is a $10 charge for each color match, with one free pantone match for every $200 spent.
Gui, theEmailDesignPMS:Font, S16, w700
Gui, theEmailDesignPMS:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailDesignPMS:Font, S14, w700
Gui, theEmailDesignPMS:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#pms
Gui, theEmailDesignPMS:Font, underline S10, w700
Gui, theEmailDesignPMS:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailDesignPMS:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailDesignPMS:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, PMS - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailDesign2:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailDesignPMSDigital:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailDesignPMSDigital:+AlwaysOnTop
Gui, theEmailDesignPMSDigital:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailDesignPMSDigital:Color, FFFFFF
Gui, theEmailDesignPMSDigital:Font, S12, w700
Gui, theEmailDesignPMSDigital:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailDesign2, Back to Design
Gui, theEmailDesignPMSDigital:Font, S18, w700
Gui, theEmailDesignPMSDigital:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, PMS Digital
Gui, theEmailDesignPMSDigital:Font, S8, w700
Gui, theEmailDesignPMSDigital:Add, Text, center x12 y+10 w170, With your upcoming order, we need to use a digital method to bring your design to life. With that method we aren't able to guarantee PMS matches. The ink is set to match the colors as closely as possible, but we would not be able to guarantee an exact match.
Gui, theEmailDesignPMSDigital:Font, S16, w700
Gui, theEmailDesignPMSDigital:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailDesignPMSDigital:Font, S14, w700
Gui, theEmailDesignPMSDigital:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#pmsdigital
Gui, theEmailDesignPMSDigital:Font, underline S10, w700
Gui, theEmailDesignPMSDigital:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailDesignPMSDigital:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailDesignPMSDigital:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, PMS Digital - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailDesign2:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailDesignPPS:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailDesignPPS:+AlwaysOnTop
Gui, theEmailDesignPPS:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailDesignPPS:Color, FFFFFF
Gui, theEmailDesignPPS:Font, S12, w700
Gui, theEmailDesignPPS:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailDesign2, Back to Design
Gui, theEmailDesignPPS:Font, S18, w700
Gui, theEmailDesignPPS:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, PPS
Gui, theEmailDesignPPS:Font, S8, w700
Gui, theEmailDesignPPS:Add, Text, center x12 y+10 w170, After you place an order with us for 250+ items or your order total is $2,500+, we send a printed pre-production sample. You can pick out the size and we'll get you a real printed shirt in about a week. With your approval, we will then complete printing for the rest of your order. If you don’t qualify for a free sample, you can  have one made for $75.
Gui, theEmailDesignPPS:Font, S16, w700
Gui, theEmailDesignPPS:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailDesignPPS:Font, S14, w700
Gui, theEmailDesignPPS:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#pps
Gui, theEmailDesignPPS:Font, underline S10, w700
Gui, theEmailDesignPPS:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailDesignPPS:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailDesignPPS:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, PPS - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailDesign2:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailDesignRedraw:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailDesignRedraw:+AlwaysOnTop
Gui, theEmailDesignRedraw:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailDesignRedraw:Color, FFFFFF
Gui, theEmailDesignRedraw:Font, S12, w700
Gui, theEmailDesignRedraw:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailDesign2, Back to Design
Gui, theEmailDesignRedraw:Font, S18, w700
Gui, theEmailDesignRedraw:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Redraw
Gui, theEmailDesignRedraw:Font, S8, w700
Gui, theEmailDesignRedraw:Add, Text, center x12 y+10 w170, After your order is placed, we can have our expert design team redraw your artwork to ensure a high quality print! You'll see any artwork changes in the free proof email that we send you before we go to print. To give you a better idea of how our redraw process works, please click on the link below: http:// www.customink.com /help_center/ how-and-why-we-redraw
Gui, theEmailDesignRedraw:Font, S16, w700
Gui, theEmailDesignRedraw:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailDesignRedraw:Font, S14, w700
Gui, theEmailDesignRedraw:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#redraw
Gui, theEmailDesignRedraw:Font, underline S10, w700
Gui, theEmailDesignRedraw:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailDesignRedraw:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailDesignRedraw:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Redraw - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailDesign2:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailDesignRetrieve:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailDesignRetrieve:+AlwaysOnTop
Gui, theEmailDesignRetrieve:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailDesignRetrieve:Color, FFFFFF
Gui, theEmailDesignRetrieve:Font, S12, w700
Gui, theEmailDesignRetrieve:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailDesign2, Back to Design
Gui, theEmailDesignRetrieve:Font, S18, w700
Gui, theEmailDesignRetrieve:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Retrieve
Gui, theEmailDesignRetrieve:Font, S8, w700
Gui, theEmailDesignRetrieve:Add, Text, center x12 y+10 w170, After your order is placed, we can have our expert design team redraw your artwork to ensure a high quality print! You'll see any artwork changes in the free proof email that we send you before we go to print.To give you a better idea of how this redraw process works, please click on the link below: http:// www.customink.com /help_center/ how-and-why-we-redraw
Gui, theEmailDesignRetrieve:Font, S16, w700
Gui, theEmailDesignRetrieve:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailDesignRetrieve:Font, S14, w700
Gui, theEmailDesignRetrieve:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#retrieve
Gui, theEmailDesignRetrieve:Font, underline S10, w700
Gui, theEmailDesignRetrieve:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailDesignRetrieve:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailDesignRetrieve:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Retrieve - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailDesign2:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailDesignRotate:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailDesignRotate:+AlwaysOnTop
Gui, theEmailDesignRotate:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailDesignRotate:Color, FFFFFF
Gui, theEmailDesignRotate:Font, S12, w700
Gui, theEmailDesignRotate:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailDesign2, Back to Design
Gui, theEmailDesignRotate:Font, S18, w700
Gui, theEmailDesignRotate:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Rotate
Gui, theEmailDesignRotate:Font, S8, w700
Gui, theEmailDesignRotate:Add, Text, center x12 y+10 w170, I can definitely help you move your design from front to back in the Design Lab. If you look directly above the image, you'll notice a red button that says "Rotate." If you click that button, you can continue to work on the opposite side.
Gui, theEmailDesignRotate:Font, S16, w700
Gui, theEmailDesignRotate:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailDesignRotate:Font, S14, w700
Gui, theEmailDesignRotate:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#rotate
Gui, theEmailDesignRotate:Font, underline S10, w700
Gui, theEmailDesignRotate:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailDesignRotate:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailDesignRotate:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Rotate - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailDesign2:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailDesignSample:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailDesignSample:+AlwaysOnTop
Gui, theEmailDesignSample:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailDesignSample:Color, FFFFFF
Gui, theEmailDesignSample:Font, S12, w700
Gui, theEmailDesignSample:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailDesign2, Back to Design
Gui, theEmailDesignSample:Font, S18, w700
Gui, theEmailDesignSample:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Sample
Gui, theEmailDesignSample:Font, S8, w700
Gui, theEmailDesignSample:Add, Text, center x12 y+10 w170, If you would like, I would be happy to get you set up with a blank sample of the items that you're considering! This would allow you to check out the fit and feel before you place your printed order with us! We offer these blank samples at a low cost and can have them delivered to you within a week with our free shipping, would that work for you?
Gui, theEmailDesignSample:Font, S16, w700
Gui, theEmailDesignSample:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailDesignSample:Font, S14, w700
Gui, theEmailDesignSample:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#sample
Gui, theEmailDesignSample:Font, underline S10, w700
Gui, theEmailDesignSample:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailDesignSample:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailDesignSample:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Sample - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailDesign2:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailDesignSleeveHelp:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailDesignSleeveHelp:+AlwaysOnTop
Gui, theEmailDesignSleeveHelp:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailDesignSleeveHelp:Color, FFFFFF
Gui, theEmailDesignSleeveHelp:Font, S12, w700
Gui, theEmailDesignSleeveHelp:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailDesign2, Back to Design
Gui, theEmailDesignSleeveHelp:Font, S18, w700
Gui, theEmailDesignSleeveHelp:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Sleeve Help
Gui, theEmailDesignSleeveHelp:Font, S8, w700
Gui, theEmailDesignSleeveHelp:Add, Text, center x12 y+10 w170, I'm happy to help you with your sleeve print! Our Design Lab is not currently setup to show you what your sleeve print would look like, but I can make a note that you are interested in sleeve printing in your account. After you place your order and complete payment, our design team will send you a free proof email and you'll be able to see how that sleeve design looks.
Gui, theEmailDesignSleeveHelp:Font, S16, w700
Gui, theEmailDesignSleeveHelp:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailDesignSleeveHelp:Font, S14, w700
Gui, theEmailDesignSleeveHelp:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#sleevehelp
Gui, theEmailDesignSleeveHelp:Font, underline S10, w700
Gui, theEmailDesignSleeveHelp:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailDesignSleeveHelp:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailDesignSleeveHelp:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Sleeve Help - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailDesign2:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailDesignSpVsDig:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailDesignSpVsDig:+AlwaysOnTop
Gui, theEmailDesignSpVsDig:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailDesignSpVsDig:Color, FFFFFF
Gui, theEmailDesignSpVsDig:Font, S12, w700
Gui, theEmailDesignSpVsDig:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailDesign2, Back to Design
Gui, theEmailDesignSpVsDig:Font, S18, w700
Gui, theEmailDesignSpVsDig:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, SP vs Dig
Gui, theEmailDesignSpVsDig:Font, S8, w700
Gui, theEmailDesignSpVsDig:Add, Text, center x12 y+10 w170, CustomInk offers two different methods of printing, depending on what best suits your artwork. We offer traditional screen printing for the majority of our products, as well as digital printing on selected items. Screen printing involves creating a stencil (printers call this a "screen"), and then using that stencil to apply layers of different color inks. Digital printing is a much newer process by which your artwork is processed by a computer, and then printed in ink directly onto the surface of your product. Digital printing is not a heat transfer or applique, as the ink is directly applied to the fabric of your shirt.
Gui, theEmailDesignSpVsDig:Font, S16, w700
Gui, theEmailDesignSpVsDig:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailDesignSpVsDig:Font, S14, w700
Gui, theEmailDesignSpVsDig:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#spvsdig
Gui, theEmailDesignSpVsDig:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailDesignSpVsDig:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailDesignSpVsDig:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Sleeve Help - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailDesign2:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailDesignSubtleBlank:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailDesignSubtleBlank:+AlwaysOnTop
Gui, theEmailDesignSubtleBlank:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailDesignSubtleBlank:Color, FFFFFF
Gui, theEmailDesignSubtleBlank:Font, S12, w700
Gui, theEmailDesignSubtleBlank:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailDesign2, Back to Design
Gui, theEmailDesignSubtleBlank:Font, S18, w700
Gui, theEmailDesignSubtleBlank:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Subtle Blank
Gui, theEmailDesignSubtleBlank:Font, S8, w700
Gui, theEmailDesignSubtleBlank:Add, Text, center x12 y+10 w170, While reviewing your design, I noticed that we're using ***color ink*** that can appear subtle on the ***color item*** on which we're printing. If you'd like, I'd be happy to go over some alternatives that would have a better contrast.
Gui, theEmailDesignSubtleBlank:Font, S16, w700
Gui, theEmailDesignSubtleBlank:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailDesignSubtleBlank:Font, S14, w700
Gui, theEmailDesignSubtleBlank:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#subtleblank
Gui, theEmailDesignSubtleBlank:Font, underline S10, w700
Gui, theEmailDesignSubtleBlank:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailDesignSubtleBlank:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailDesignSubtleBlank:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Subtle Blank - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailDesign2:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailDesignSubtleInk:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailDesignSubtleInk:+AlwaysOnTop
Gui, theEmailDesignSubtleInk:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailDesignSubtleInk:Color, FFFFFF
Gui, theEmailDesignSubtleInk:Font, S12, w700
Gui, theEmailDesignSubtleInk:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailDesign2, Back to Design
Gui, theEmailDesignSubtleInk:Font, S18, w700
Gui, theEmailDesignSubtleInk:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Subtle Ink
Gui, theEmailDesignSubtleInk:Font, S8, w700
Gui, theEmailDesignSubtleInk:Add, Text, center x12 y+10 w170, While reviewing your design, I noticed that the ***ink colors*** may appear subtle when used together. If you'd like, I'd be happy to go over some alternatives that would have a better contrast.
Gui, theEmailDesignSubtleInk:Font, S16, w700
Gui, theEmailDesignSubtleInk:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailDesignSubtleInk:Font, S14, w700
Gui, theEmailDesignSubtleInk:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#subtleink
Gui, theEmailDesignSubtleInk:Font, underline S10, w700
Gui, theEmailDesignSubtleInk:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailDesignSubtleInk:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailDesignSubtleInk:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Subtle Ink - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailDesign2:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailDesignUploadHelp:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailDesignUploadHelp:+AlwaysOnTop
Gui, theEmailDesignUploadHelp:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailDesignUploadHelp:Color, FFFFFF
Gui, theEmailDesignUploadHelp:Font, S12, w700
Gui, theEmailDesignUploadHelp:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailDesign2, Back to Design
Gui, theEmailDesignUploadHelp:Font, S18, w700
Gui, theEmailDesignUploadHelp:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Upload Help
Gui, theEmailDesignUploadHelp:Font, S8, w700
Gui, theEmailDesignUploadHelp:Add, Text, center x12 y+10 w170, I'm happy to upload your artwork into our Design Lab. If you can respond to this email with your artwork attached, I'll take it from there! Of course, if there are any adjustments or changes you would like me to make to your artwork, feel free to include those details and I'll take care of those as well.
Gui, theEmailDesignUploadHelp:Font, S16, w700
Gui, theEmailDesignUploadHelp:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailDesignUploadHelp:Font, S14, w700
Gui, theEmailDesignUploadHelp:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#uploadhelp
Gui, theEmailDesignUploadHelp:Font, underline S10, w700
Gui, theEmailDesignUploadHelp:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailDesignUploadHelp:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailDesignUploadHelp:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Upload Help - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailDesign2:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailDesignUploadWhite:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailDesignUploadWhite:+AlwaysOnTop
Gui, theEmailDesignUploadWhite:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailDesignUploadWhite:Color, FFFFFF
Gui, theEmailDesignUploadWhite:Font, S12, w700
Gui, theEmailDesignUploadWhite:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailDesign2, Back to Design
Gui, theEmailDesignUploadWhite:Font, S18, w700
Gui, theEmailDesignUploadWhite:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Upload White
Gui, theEmailDesignUploadWhite:Font, S8, w700
Gui, theEmailDesignUploadWhite:Add, Text, center x12 y+10 w170, Sometimes our Design Lab registers white as a background color and removes it from the image. I can fix that for you if you attach your art in your response to this email. If you would like to continue working on this by yourself, you can change your design color to black and then upload it into the Lab again. It will allow you to upload it and then change the color back to white (or any color you want)!
Gui, theEmailDesignUploadWhite:Font, S16, w700
Gui, theEmailDesignUploadWhite:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailDesignUploadWhite:Font, S14, w700
Gui, theEmailDesignUploadWhite:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#uploadwhite
Gui, theEmailDesignUploadWhite:Font, underline S10, w700
Gui, theEmailDesignUploadWhite:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailDesignUploadWhite:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailDesignUploadWhite:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Upload White - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailDesign2:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailDesignVSS:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailDesignVSS:+AlwaysOnTop
Gui, theEmailDesignVSS:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailDesignVSS:Color, FFFFFF
Gui, theEmailDesignVSS:Font, S12, w700
Gui, theEmailDesignVSS:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailDesign2, Back to Design
Gui, theEmailDesignVSS:Font, S18, w700
Gui, theEmailDesignVSS:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, VSS
Gui, theEmailDesignVSS:Font, S8, w700
Gui, theEmailDesignVSS:Add, Text, center x12 y+10 w170, To print your order, we need to have your design sized the same on all shirts in your order. This means the design may look a bit large on the smaller sizes, and small on the larger sizes. The link below gives you an idea of what I mean: http://www.customink.com/help_center/designs-on-different-sizes We do have an option to make an additional setup to print on the smaller sizes in your order for an additional cost. If you’re interested in doing so, I can give you a quote how much that would cost.
Gui, theEmailDesignVSS:Font, S16, w700
Gui, theEmailDesignVSS:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailDesignVSS:Font, S14, w700
Gui, theEmailDesignVSS:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#vss
Gui, theEmailDesignVSS:Font, underline S10, w700
Gui, theEmailDesignVSS:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailDesignVSS:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailDesignVSS:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, VSS - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailDesign2:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailDiscount:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,

Gui, theEmailDiscount:+AlwaysOnTop
Gui, theEmailDiscount:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailDiscount:Color, FFFFFF
Gui, theEmailDiscount:Font, S12, w700
Gui, theEmailDiscount:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmail, Back to Email
Gui, theEmailDiscount:Font, underline S14, w700
Gui, theEmailDiscount:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailDiscountBooster v_Booster, Booster
Gui, theEmailDiscount:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailDiscountCharity v_Charity, Charity
Gui, theEmailDiscount:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailDiscountDiscount v_Discount, Discount
Gui, theEmailDiscount:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailDiscountPear v_Pear, Pear
Gui, theEmailDiscount:Font, underline S10, w700
Gui, theEmailDiscount:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailDiscount:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailDiscount:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Discount - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmail:destroy
Gui, theEmailDiscountBooster:destroy
Gui, theEmailDiscountCharity:destroy
Gui, theEmailDiscountDiscount:destroy
Gui, theEmailDiscountPear:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailDiscountBooster:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailDiscountBooster:+AlwaysOnTop
Gui, theEmailDiscountBooster:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailDiscountBooster:Color, FFFFFF
Gui, theEmailDiscountBooster:Font, S12, w700
Gui, theEmailDiscountBooster:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailDiscount, Back to Discount
Gui, theEmailDiscountBooster:Font, S18, w700
Gui, theEmailDiscountBooster:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Booster
Gui, theEmailDiscountBooster:Font, S8, w700
Gui, theEmailDiscountBooster:Add, Text, center x12 y+10 w170, So many of our customers were doing amazing work for fundraisers and charities that we created Booster, a site devoted to helping group organizers use custom t-shirts as a fundraising tool. It's a unique way to fundraise, while building awareness of your cause within your community. You get to create an awesome design, set the price, and then use your personalized website to sell the shirts online. The difference between the print cost and price you've selected then goes to the non-profit or individual of your choice! For more information about Booster, please click on the link below: http://booster.com If you'd like, I’m happy to take down your information and have a campaign advisor get in touch with you by phone or email to help you get started.
Gui, theEmailDiscountBooster:Font, S16, w700
Gui, theEmailDiscountBooster:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailDiscountBooster:Font, S14, w700
Gui, theEmailDiscountBooster:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#booster
Gui, theEmailDiscountBooster:Font, underline S10, w700
Gui, theEmailDiscountBooster:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailDiscountBooster:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailDiscountBooster:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Booster - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailDiscount:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailDiscountCharity:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailDiscountCharity:+AlwaysOnTop
Gui, theEmailDiscountCharity:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailDiscountCharity:Color, FFFFFF
Gui, theEmailDiscountCharity:Font, S12, w700
Gui, theEmailDiscountCharity:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailDiscount, Back to Discount
Gui, theEmailDiscountCharity:Font, S18, w700
Gui, theEmailDiscountCharity:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Charity
Gui, theEmailDiscountCharity:Font, S8, w700
Gui, theEmailDiscountCharity:Add, Text, center x12 y+10 w170, I definitely applaud the charitable work that your group is doing for the community! While we don't have any specific discounts that we are able to make, we do have a sponsorship website called Pear where your group can raise sponsorship dollars from local and national brands by gathering support from friends and family. It's free and very easy to sign up. For more information, please click on the link below to visit the PearUp.com website: https://www.pearup.com/find-a-sponsor
Gui, theEmailDiscountCharity:Font, S16, w700
Gui, theEmailDiscountCharity:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailDiscountCharity:Font, S14, w700
Gui, theEmailDiscountCharity:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#charity
Gui, theEmailDiscountCharity:Font, underline S10, w700
Gui, theEmailDiscountCharity:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailDiscountCharity:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailDiscountCharity:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Charity - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailDiscount:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailDiscountDiscount:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailDiscountDiscount:+AlwaysOnTop
Gui, theEmailDiscountDiscount:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailDiscountDiscount:Color, FFFFFF
Gui, theEmailDiscountDiscount:Font, S12, w700
Gui, theEmailDiscountDiscount:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailDiscount, Back to Discount
Gui, theEmailDiscountDiscount:Font, S18, w700
Gui, theEmailDiscountDiscount:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Discount
Gui, theEmailDiscountDiscount:Font, S8, w700
Gui, theEmailDiscountDiscount:Add, Text, center x12 y+10 w170, While we do not have specific discounts available, we can connect you with sponsors who can help you raise sponsorship dollars for your order. Pear is an easy service that can help your group to raise money from local and national brands by gathering support from friends and family. For more information, please click on the link below to visit the PearUp.com website: https://www.pearup.com/find-a-sponsor
Gui, theEmailDiscountDiscount:Font, S16, w700
Gui, theEmailDiscountDiscount:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailDiscountDiscount:Font, S14, w700
Gui, theEmailDiscountDiscount:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#discount
Gui, theEmailDiscountDiscount:Font, underline S10, w700
Gui, theEmailDiscountDiscount:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailDiscountDiscount:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailDiscountDiscount:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Discount - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailDiscount:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailDiscountPear:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailDiscountPear:+AlwaysOnTop
Gui, theEmailDiscountPear:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailDiscountPear:Color, FFFFFF
Gui, theEmailDiscountPear:Font, S12, w700
Gui, theEmailDiscountPear:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailDiscount, Back to Discount
Gui, theEmailDiscountPear:Font, S18, w700
Gui, theEmailDiscountPear:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Pear
Gui, theEmailDiscountPear:Font, S8, w700
Gui, theEmailDiscountPear:Add, Text, center x12 y+10 w170, We have a sponsorship website called Pear where your group can raise sponsorship dollars from local and national brands by gathering support from friends and family. It's free and very easy to sign up. For more information, please click on the link below to visit the PearUp.com website: https://www.pearup.com/find-a-sponsor
Gui, theEmailDiscountPear:Font, S16, w700
Gui, theEmailDiscountPear:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailDiscountPear:Font, S14, w700
Gui, theEmailDiscountPear:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#pear
Gui, theEmailDiscountPear:Font, underline S10, w700
Gui, theEmailDiscountPear:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailDiscountPear:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailDiscountPear:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Pear - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailDiscount:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailDiscountPriceHelp:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailDiscountPriceHelp:+AlwaysOnTop
Gui, theEmailDiscountPriceHelp:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailDiscountPriceHelp:Color, FFFFFF
Gui, theEmailDiscountPriceHelp:Font, S12, w700
Gui, theEmailDiscountPriceHelp:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailDiscount, Back to Discount
Gui, theEmailDiscountPriceHelp:Font, S18, w700
Gui, theEmailDiscountPriceHelp:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Price Help
Gui, theEmailDiscountPriceHelp:Font, S8, w700
Gui, theEmailDiscountPriceHelp:Add, Text, center x12 y+10 w170, I'll be happy to help you find a more budget-friendly option for your design! Is there a specific budget that you have in mind?
Gui, theEmailDiscountPriceHelp:Font, S16, w700
Gui, theEmailDiscountPriceHelp:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailDiscountPriceHelp:Font, S14, w700
Gui, theEmailDiscountPriceHelp:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#pricehelp
Gui, theEmailDiscountPriceHelp:Font, underline S10, w700
Gui, theEmailDiscountPriceHelp:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailDiscountPriceHelp:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailDiscountPriceHelp:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Price Help - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailDiscount:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailGeneral:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailGeneral:+AlwaysOnTop
Gui, theEmailGeneral:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailGeneral:Color, FFFFFF
Gui, theEmailGeneral:Font, S12, w700
Gui, theEmailGeneral:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmail, Back to Email
Gui, theEmailGeneral:Font, underline S14, w700
Gui, theEmailGeneral:Add, Text, center ym-10 x12 y+8 w180 h30 0x200 cBlue gEmailGeneralByeOrder v_ByeOrder, Bye/Order
Gui, theEmailGeneral:Add, Text, center ym-10 x12 y+8 w180 h30 0x200 cBlue gEmailGeneralClose v_Close, Close
Gui, theEmailGeneral:Add, Text, center ym-10 x12 y+8 w180 h30 0x200 cBlue gEmailGeneralCR v_CR, Customer Reports
Gui, theEmailGeneral:Add, Text, center ym-10 x12 y+8 w180 h30 0x200 cBlue gEmailFollowUpDesign v_FollowUpDesign, Follow Up/Design
Gui, theEmailGeneral:Add, Text, center ym-10 x12 y+8 w180 h30 0x200 cBlue gEmailFollowUpFix v_FollowUpFix, Follow Up/Fix
Gui, theEmailGeneral:Add, Text, center ym-10 x12 y+8 w180 h30 0x200 cBlue gEmailFollowUp v_FollowUp, Follow Up/General
Gui, theEmailGeneral:Add, Text, center ym-10 x12 y+8 w180 h30 0x200 cBlue gEmailFollowUpOrder v_FollowUpOrder, Follow Up/Order
Gui, theEmailGeneral:Add, Text, center ym-10 x12 y+8 w180 h30 0x200 cBlue gEmailFollowUpQuote v_FollowUpQuote, Follow Up/Quote
Gui, theEmailGeneral:Add, Text, center ym-10 x12 y+8 w180 h30 0x200 cBlue gEmailGeneralHeyDesign v_HeyDesign, Hey/Design
Gui, theEmailGeneral:Add, Text, center ym-10 x12 y+8 w180 h30 0x200 cBlue gEmailGeneralHeyPricing v_HeyPricing, Hey/Pricing
Gui, theEmailGeneral:Add, Text, center ym-10 x12 y+8 w180 h30 0x200 cBlue gEmailGeneralMe v_Me, Me
Gui, theEmailGeneral:Add, Text, center ym-10 x12 y+8 w180 h30 0x200 cBlue gEmailGeneralPerksBulk v_PerksBulk, Perks - Bulk
Gui, theEmailGeneral:Add, Text, center ym-10 x12 y+8 w180 h30 0x200 cBlue gEmailGeneralPerksSingles v_PerksSingles, Perks - Singles
Gui, theEmailGeneral:Add, Text, center ym-10 x12 y+8 w180 h30 0x200 cBlue gEmailGeneralOOO v_OOO, Out of Office
Gui, theEmailGeneral:Font, underline S10, w700
Gui, theEmailGeneral:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailGeneral:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailGeneral:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, General - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmail:destroy
Gui, theEmailGeneralByeOrder:destroy
Gui, theEmailGeneralClose:destroy
Gui, theEmailGeneralFollowUp:destroy
Gui, theEmailGeneralFollowUpOrder:destroy
Gui, theEmailGeneralFollowUpDesign:destroy
Gui, theEmailGeneralFollowUpQuote:destroy
Gui, theEmailGeneralHeyDesign:destroy
Gui, theEmailGeneralHeyPricing:destroy
Gui, theEmailGeneralPerksBulk:destroy
Gui, theEmailGeneralPerksSingles:destroy
Gui, theEmailGeneralCR:destroy
Gui, theEmailFollowUpFix:destroy
Gui, theEmailGeneralMe:destroy
Gui, theEmailGeneralOOO:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailGeneralByeOrder:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailGeneralByeOrder:+AlwaysOnTop
Gui, theEmailGeneralByeOrder:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailGeneralByeOrder:Color, FFFFFF
Gui, theEmailGeneralByeOrder:Font, S12, w700
Gui, theEmailGeneralByeOrder:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailGeneral, Back to General
Gui, theEmailGeneralByeOrder:Font, S18, w700
Gui, theEmailGeneralByeOrder:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Bye/Order
Gui, theEmailGeneralByeOrder:Font, S8, w700
Gui, theEmailGeneralByeOrder:Add, Text, center x12 y+10 w170, If you have any other questions along the way, feel free to reply to this email or call me directly.  Once I hear back, we'll be able to take the next steps in making your design come to life.  I've included all of my contact information below. Thanks again for choosing CustomInk. I look forward to hearing from you!
Gui, theEmailGeneralByeOrder:Font, S16, w700
Gui, theEmailGeneralByeOrder:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailGeneralByeOrder:Font, S14, w700
Gui, theEmailGeneralByeOrder:Add, Text, center ym-10 x12 y+10 w180 h50 0x200, #byeorder
Gui, theEmailGeneralByeOrder:Font, underline S10, w700
Gui, theEmailGeneralByeOrder:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailGeneralByeOrder:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailGeneralByeOrder:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Bye/Order - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailGeneral:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailGeneralClose:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailGeneralClose:+AlwaysOnTop
Gui, theEmailGeneralClose:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailGeneralClose:Color, FFFFFF
Gui, theEmailGeneralClose:Font, S12, w700
Gui, theEmailGeneralClose:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailGeneral, Back to General
Gui, theEmailGeneralClose:Font, S18, w700
Gui, theEmailGeneralClose:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Close
Gui, theEmailGeneralClose:Font, S8, w700
Gui, theEmailGeneralClose:Add, Text, center x12 y+10 w170, Please feel free to respond to this email or give me a call if you have any questions and I'll be happy to help! My contact details are listed below. Thank you again for choosing CustomInk and I hope you have a wonderful day!
Gui, theEmailGeneralClose:Font, S16, w700
Gui, theEmailGeneralClose:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailGeneralClose:Font, S14, w700
Gui, theEmailGeneralClose:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#close
Gui, theEmailGeneralClose:Font, underline S10, w700
Gui, theEmailGeneralClose:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailGeneralClose:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailGeneralClose:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Close - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailGeneral:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailGeneralCR:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailGeneralCR:+AlwaysOnTop
Gui, theEmailGeneralCR:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailGeneralCR:Color, FFFFFF
Gui, theEmailGeneralCR:Font, S12, w700
Gui, theEmailGeneralCR:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailGeneral, Back to General
Gui, theEmailGeneralCR:Font, S16, w700
Gui, theEmailGeneralCR:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Customer Reports
Gui, theEmailGeneralCR:Font, S8, w700
Gui, theEmailGeneralCR:Add, Text, center x12 y+10 w170, Using this hotkey will automatically print "Customer reports that".
Gui, theEmailGeneralCR:Font, S16, w700
Gui, theEmailGeneralCR:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailGeneralCR:Font, S14, w700
Gui, theEmailGeneralCR:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#cr
Gui, theEmailGeneralCR:Font, underline S10, w700
Gui, theEmailGeneralCR:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailGeneralCR:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailGeneralCR:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Customer Reports - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailGeneral:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailFollowUp:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailGeneralFollowUp:+AlwaysOnTop
Gui, theEmailGeneralFollowUp:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailGeneralFollowUp:Color, FFFFFF
Gui, theEmailGeneralFollowUp:Font, S12, w700
Gui, theEmailGeneralFollowUp:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailGeneral, Back to General
Gui, theEmailGeneralFollowUp:Font, S16, w700
Gui, theEmailGeneralFollowUp:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Follow Up/General
Gui, theEmailGeneralFollowUp:Font, S8, w700
Gui, theEmailGeneralFollowUp:Add, Text, center x12 y+10 w170, Thank you for choosing CustomInk! It was a pleasure (***speaking, chatting, emailing, etc.***) with you earlier and I'm happy to be able to help you! Whether you need some help in creating a design from scratch, touching up some artwork, or selecting the perfect product, please feel free to reach out to me with anything you need. My contact details are listed below. Thanks again for choosing CustomInk and I hope you have a wonderful day!
Gui, theEmailGeneralFollowUp:Font, S16, w700
Gui, theEmailGeneralFollowUp:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailGeneralFollowUp:Font, S14, w700
Gui, theEmailGeneralFollowUp:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#followup
Gui, theEmailGeneralFollowUp:Font, underline S10, w700
Gui, theEmailGeneralFollowUp:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailGeneralFollowUp:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailGeneralFollowUp:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Follow Up/General - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailGeneral:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailFollowUpDesign:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailGeneralFollowUpDesign:+AlwaysOnTop
Gui, theEmailGeneralFollowUpDesign:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailGeneralFollowUpDesign:Color, FFFFFF
Gui, theEmailGeneralFollowUpDesign:Font, S12, w700
Gui, theEmailGeneralFollowUpDesign:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailGeneral, Back to General
Gui, theEmailGeneralFollowUpDesign:Font, S16, w700
Gui, theEmailGeneralFollowUpDesign:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Follow Up/Design
Gui, theEmailGeneralFollowUpDesign:Font, S8, w700
Gui, theEmailGeneralFollowUpDesign:Add, Text, center x12 y+10 w170, Thank you so much for your call today! I loved talking about ____________________. I wanted to make sure I sent over the design that we created together today. ***Paste Design Link Here***
Gui, theEmailGeneralFollowUpDesign:Font, S16, w700
Gui, theEmailGeneralFollowUpDesign:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailGeneralFollowUpDesign:Font, S14, w700
Gui, theEmailGeneralFollowUpDesign:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#followdesign
Gui, theEmailGeneralFollowUpDesign:Font, underline S10, w700
Gui, theEmailGeneralFollowUpDesign:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailGeneralFollowUpDesign:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailGeneralFollowUpDesign:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Follow Up/Design - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailGeneral:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailFollowUpFix:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailFollowUpFix:+AlwaysOnTop
Gui, theEmailFollowUpFix:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailFollowUpFix:Color, FFFFFF
Gui, theEmailFollowUpFix:Font, S12, w700
Gui, theEmailFollowUpFix:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailGeneral, Back to General
Gui, theEmailFollowUpFix:Font, S16, w700
Gui, theEmailFollowUpFix:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Follow Up/Fix
Gui, theEmailFollowUpFix:Font, S8, w700
Gui, theEmailFollowUpFix:Add, Text, center x12 y+10 w170, Thank you so much for hanging in there! I saw that your replacements delivered recently, and wanted to see how you liked them. I hope they look exactly as you were hoping this time around. What do you think?
Gui, theEmailFollowUpFix:Font, S16, w700
Gui, theEmailFollowUpFix:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailFollowUpFix:Font, S14, w700
Gui, theEmailFollowUpFix:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#followfix
Gui, theEmailFollowUpFix:Font, underline S10, w700
Gui, theEmailFollowUpFix:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailFollowUpFix:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailFollowUpFix:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Follow Up/Fix - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailGeneral:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailFollowUpOrder:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailGeneralFollowUpOrder:+AlwaysOnTop
Gui, theEmailGeneralFollowUpOrder:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailGeneralFollowUpOrder:Color, FFFFFF
Gui, theEmailGeneralFollowUpOrder:Font, S12, w700
Gui, theEmailGeneralFollowUpOrder:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailGeneral, Back to General
Gui, theEmailGeneralFollowUpOrder:Font, S16, w700
Gui, theEmailGeneralFollowUpOrder:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Follow Up/Order
Gui, theEmailGeneralFollowUpOrder:Font, S8, w700
Gui, theEmailGeneralFollowUpOrder:Add, Text, center x12 y+10 w170, I just wanted to send you a personal thank you for ordering with us. I think that these shirts are going to be perfect for your _________________________. Please know that my service does not end here and, if there is anything else that I can do to help, let me know. I’ve included all of my contact information below just for you. Thanks again, and I hope that you have a great rest of your day!
Gui, theEmailGeneralFollowUpOrder:Font, S16, w700
Gui, theEmailGeneralFollowUpOrder:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailGeneralFollowUpOrder:Font, S14, w700
Gui, theEmailGeneralFollowUpOrder:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#followorder
Gui, theEmailGeneralFollowUpOrder:Font, underline S10, w700
Gui, theEmailGeneralFollowUpOrder:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailGeneralFollowUpOrder:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailGeneralFollowUpOrder:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Follow Up/Order - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailGeneral:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailFollowUpQuote:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailGeneralFollowUpQuote:+AlwaysOnTop
Gui, theEmailGeneralFollowUpQuote:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailGeneralFollowUpQuote:Color, FFFFFF
Gui, theEmailGeneralFollowUpQuote:Font, S12, w700
Gui, theEmailGeneralFollowUpQuote:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailGeneral, Back to General
Gui, theEmailGeneralFollowUpQuote:Font, S16, w700
Gui, theEmailGeneralFollowUpQuote:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Follow Up/Quote
Gui, theEmailGeneralFollowUpQuote:Font, S8, w700
Gui, theEmailGeneralFollowUpQuote:Add, Text, center x12 y+10 w170, Thank you so much for your call today! I loved talking about _________________. I wanted to make sure that I sent over the quote that we had discussed. ***Paste Quote Here***
Gui, theEmailGeneralFollowUpQuote:Font, S16, w700
Gui, theEmailGeneralFollowUpQuote:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailGeneralFollowUpQuote:Font, S14, w700
Gui, theEmailGeneralFollowUpQuote:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#followquote
Gui, theEmailGeneralFollowUpQuote:Font, underline S10, w700
Gui, theEmailGeneralFollowUpQuote:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailGeneralFollowUpQuote:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailGeneralFollowUpQuote:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Follow Up/Quote - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailGeneral:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailGeneralHeyDesign:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailGeneralHeyDesign:+AlwaysOnTop
Gui, theEmailGeneralHeyDesign:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailGeneralHeyDesign:Color, FFFFFF
Gui, theEmailGeneralHeyDesign:Font, S12, w700
Gui, theEmailGeneralHeyDesign:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailGeneral, Back to General
Gui, theEmailGeneralHeyDesign:Font, S18, w700
Gui, theEmailGeneralHeyDesign:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Hey/Design
Gui, theEmailGeneralHeyDesign:Font, S8, w700
Gui, theEmailGeneralHeyDesign:Add, Text, center x12 y+10 w170, Thank you for choosing CustomInk! I'm happy to help you with your design and you can count on me to help with anything you need while we bring your custom design to life!
Gui, theEmailGeneralHeyDesign:Font, S16, w700
Gui, theEmailGeneralHeyDesign:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailGeneralHeyDesign:Font, S14, w700
Gui, theEmailGeneralHeyDesign:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#heydesign
Gui, theEmailGeneralHeyDesign:Font, underline S10, w700
Gui, theEmailGeneralHeyDesign:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailGeneralHeyDesign:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailGeneralHeyDesign:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Hey/Design - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailGeneral:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailGeneralHeyPricing:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailGeneralHeyPricing:+AlwaysOnTop
Gui, theEmailGeneralHeyPricing:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailGeneralHeyPricing:Color, FFFFFF
Gui, theEmailGeneralHeyPricing:Font, S12, w700
Gui, theEmailGeneralHeyPricing:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailGeneral, Back to General
Gui, theEmailGeneralHeyPricing:Font, S18, w700
Gui, theEmailGeneralHeyPricing:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Hey/Pricing
Gui, theEmailGeneralHeyPricing:Font, S8, w700
Gui, theEmailGeneralHeyPricing:Add, Text, center x12 y+10 w170, Thank you for choosing CustomInk! I'm happy to help put together a quote for your custom design and you can count on me to make sure that your experience with us is outstanding!
Gui, theEmailGeneralHeyPricing:Font, S16, w700
Gui, theEmailGeneralHeyPricing:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailGeneralHeyPricing:Font, S14, w700
Gui, theEmailGeneralHeyPricing:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#heypricing
Gui, theEmailGeneralHeyPricing:Font, underline S10, w700
Gui, theEmailGeneralHeyPricing:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailGeneralHeyPricing:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailGeneralHeyPricing:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Hey/Pricing - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailGeneral:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailGeneralMe:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailGeneralMe:+AlwaysOnTop
Gui, theEmailGeneralMe:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailGeneralMe:Color, FFFFFF
Gui, theEmailGeneralMe:Font, S12, w700
Gui, theEmailGeneralMe:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailGeneral, Back to General
Gui, theEmailGeneralMe:Font, S18, w700
Gui, theEmailGeneralMe:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Me
Gui, theEmailGeneralMe:Font, S8, w700
Gui, theEmailGeneralMe:Add, Text, center x12 y+10 w170, Using this hotkey will print your first and last name.
Gui, theEmailGeneralMe:Font, S16, w700
Gui, theEmailGeneralMe:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailGeneralMe:Font, S14, w700
Gui, theEmailGeneralMe:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#me
Gui, theEmailGeneralMe:Font, underline S10, w700
Gui, theEmailGeneralMe:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailGeneralMe:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailGeneralMe:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Me - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailGeneral:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailGeneralPerksBulk:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailGeneralPerksBulk:+AlwaysOnTop
Gui, theEmailGeneralPerksBulk:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailGeneralPerksBulk:Color, FFFFFF
Gui, theEmailGeneralPerksBulk:Font, S12, w700
Gui, theEmailGeneralPerksBulk:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailGeneral, Back to General
Gui, theEmailGeneralPerksBulk:Font, S18, w700
Gui, theEmailGeneralPerksBulk:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Perks - Bulk
Gui, theEmailGeneralPerksBulk:Font, S8, w700
Gui, theEmailGeneralPerksBulk:Add, Text, center x12 y+10 w170, Every CustomInk order comes with: *Artistic adjustments to alignment, art, or text for the best print possible *Free proof email to review any adjustments before printing *Free shipping with a guaranteed delivery date *CustomInk’s quality and money-back guarantee
Gui, theEmailGeneralPerksBulk:Font, S16, w700
Gui, theEmailGeneralPerksBulk:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailGeneralPerksBulk:Font, S14, w700
Gui, theEmailGeneralPerksBulk:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#bulkperks
Gui, theEmailGeneralPerksBulk:Font, underline S10, w700
Gui, theEmailGeneralPerksBulk:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailGeneralPerksBulk:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailGeneralPerksBulk:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Perks - Bulk - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailGeneral:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailGeneralPerksSingles:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailGeneralPerksSingles:+AlwaysOnTop
Gui, theEmailGeneralPerksSingles:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailGeneralPerksSingles:Color, FFFFFF
Gui, theEmailGeneralPerksSingles:Font, S12, w700
Gui, theEmailGeneralPerksSingles:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailGeneral, Back to General
Gui, theEmailGeneralPerksSingles:Font, S18, w700
Gui, theEmailGeneralPerksSingles:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Perks - Singles
Gui, theEmailGeneralPerksSingles:Font, S8, w700
Gui, theEmailGeneralPerksSingles:Add, Text, center x12 y+10 w170, Every CustomInk order comes with: *Artistic adjustments to alignment, art, or text for the best print *Free, two-week shipping with a guaranteed delivery date
Gui, theEmailGeneralPerksSingles:Font, S16, w700
Gui, theEmailGeneralPerksSingles:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailGeneralPerksSingles:Font, S14, w700
Gui, theEmailGeneralPerksSingles:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#singlesperks
Gui, theEmailGeneralPerksSingles:Font, underline S10, w700
Gui, theEmailGeneralPerksSingles:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailGeneralPerksSingles:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailGeneralPerksSingles:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Perks - Singles - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailGeneral:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailGeneralOOO:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailGeneralOOO:+AlwaysOnTop
Gui, theEmailGeneralOOO:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailGeneralOOO:Color, FFFFFF
Gui, theEmailGeneralOOO:Font, S12, w700
Gui, theEmailGeneralOOO:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailGeneral, Back to General
Gui, theEmailGeneralOOO:Font, S18, w700
Gui, theEmailGeneralOOO:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Out of Office
Gui, theEmailGeneralOOO:Font, S8, w700
Gui, theEmailGeneralOOO:Add, Text, center x12 y+10 w170, Thank you so much for emailing back in! {REP} is not in the office at the moment but I am happy to help out the best I can.
Gui, theEmailGeneralOOO:Font, S16, w700
Gui, theEmailGeneralOOO:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailGeneralOOO:Font, S14, w700
Gui, theEmailGeneralOOO:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#ooo
Gui, theEmailGeneralOOO:Font, underline S10, w700
Gui, theEmailGeneralOOO:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailGeneralOOO:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailGeneralOOO:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Out of Office - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailGeneral:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailGroup:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailGroup:+AlwaysOnTop
Gui, theEmailGroup:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailGroup:Color, FFFFFF
Gui, theEmailGroup:Font, S12, w700
Gui, theEmailGroup:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmail, Back to Email
Gui, theEmailGroup:Font, underline S14, w700
Gui, theEmailGroup:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailGroupGOF v_GOF, GOF
Gui, theEmailGroup:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailGroupGOFCancel v_GOFCancel, GOF Cancel
Gui, theEmailGroup:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailGroupGOFDesign v_GOFDesign, GOF Design
Gui, theEmailGroup:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailGroupGOFPrice v_GOFPrice, GOF Price
Gui, theEmailGroup:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailGroupGOFSetup v_GOFSetup, GOF Setup
Gui, theEmailGroup:Font, underline S10, w700
Gui, theEmailGroup:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailGroup:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailGroup:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Group - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmail:destroy
Gui, theEmailGroupGOF:destroy
Gui, theEmailGroupGOFCancel:destroy
Gui, theEmailGroupGOFDesign:destroy
Gui, theEmailGroupGOFPrice:destroy
Gui, theEmailGroupGOFSetup:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailGroupGOF:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailGroupGOF:+AlwaysOnTop
Gui, theEmailGroupGOF:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailGroupGOF:Color, FFFFFF
Gui, theEmailGroupGOF:Font, S12, w700
Gui, theEmailGroupGOF:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailGroup, Back to Group
Gui, theEmailGroupGOF:Font, S18, w700
Gui, theEmailGroupGOF:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, GOF
Gui, theEmailGroupGOF:Font, S8, w700
Gui, theEmailGroupGOF:Add, Text, center x12 y+10 w170, I suggest using our online Group Order Form to coordinate your group's order. You can share the design with your group, have them pick their own sizes, and even take individual payments online. It's free to use and can be very helpful in coordinating an order for any sized group. You can set a deadline for your group members to make their selections and then place one order for everyone. For more information, check out: http://www.customink.com/groups
Gui, theEmailGroupGOF:Font, S16, w700
Gui, theEmailGroupGOF:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailGroupGOF:Font, S14, w700
Gui, theEmailGroupGOF:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#gof
Gui, theEmailGroupGOF:Font, underline S10, w700
Gui, theEmailGroupGOF:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailGroupGOF:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailGroupGOF:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, GOF - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailGroup:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailGroupGOFCancel:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailGroupGOFCancel:+AlwaysOnTop
Gui, theEmailGroupGOFCancel:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailGroupGOFCancel:Color, FFFFFF
Gui, theEmailGroupGOFCancel:Font, S12, w700
Gui, theEmailGroupGOFCancel:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailGroup, Back to Group
Gui, theEmailGroupGOFCancel:Font, S18, w700
Gui, theEmailGroupGOFCancel:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, GOF Cancel
Gui, theEmailGroupGOFCancel:Font, S8, w700
Gui, theEmailGroupGOFCancel:Add, Text, center x12 y+10 w170, I can definitely help you cancel your Group Order Form. Keep in mind, anyone who has already paid online will be refunded and your group will no longer be able to use that link again. If you’re sure you’d like to cancel your entire Group Order Form, confirm that with me and I'll take care of it for you!
Gui, theEmailGroupGOFCancel:Font, S16, w700
Gui, theEmailGroupGOFCancel:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailGroupGOFCancel:Font, S14, w700
Gui, theEmailGroupGOFCancel:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#gofcancel
Gui, theEmailGroupGOFCancel:Font, underline S10, w700
Gui, theEmailGroupGOFCancel:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailGroupGOFCancel:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailGroupGOFCancel:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, GOF Cancel - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailGroup:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailGroupGOFDesign:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailGroupGOFDesign:+AlwaysOnTop
Gui, theEmailGroupGOFDesign:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailGroupGOFDesign:Color, FFFFFF
Gui, theEmailGroupGOFDesign:Font, S12, w700
Gui, theEmailGroupGOFDesign:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailGroup, Back to Group
Gui, theEmailGroupGOFDesign:Font, S18, w700
Gui, theEmailGroupGOFDesign:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, GOF Design
Gui, theEmailGroupGOFDesign:Font, S8, w700
Gui, theEmailGroupGOFDesign:Add, Text, center x12 y+10 w170, Once your Group Order Form is started, we can’t change the design that it links to. We can always cancel that form and start up a new one for you to share. Anyone who's signed up will be refunded if they've paid online and they'll need to place their order again within the new Group Order Form.
Gui, theEmailGroupGOFDesign:Font, S16, w700
Gui, theEmailGroupGOFDesign:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailGroupGOFDesign:Font, S14, w700
Gui, theEmailGroupGOFDesign:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#gofdesign
Gui, theEmailGroupGOFDesign:Font, underline S10, w700
Gui, theEmailGroupGOFDesign:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailGroupGOFDesign:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailGroupGOFDesign:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, GOF Design - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailGroup:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailGroupGOFPrice:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailGroupGOFPrice:+AlwaysOnTop
Gui, theEmailGroupGOFPrice:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailGroupGOFPrice:Color, FFFFFF
Gui, theEmailGroupGOFPrice:Font, S12, w700
Gui, theEmailGroupGOFPrice:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailGroup, Back to Group
Gui, theEmailGroupGOFPrice:Font, S18, w700
Gui, theEmailGroupGOFPrice:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, GOF Price
Gui, theEmailGroupGOFPrice:Font, S8, w700
Gui, theEmailGroupGOFPrice:Add, Text, center x12 y+10 w170, When you set up a Group Order Form, you're asked to select the number of shirts you think your group will order. This helps us estimate how much each shirt will cost. If more people sign up than you originally estimate, the per-item cost will drop and we'll cut you a check for the difference at the end. If fewer people sign up than estimated, the per-shirt cost goes up and you will have to make up that difference when the final group order is placed.
Gui, theEmailGroupGOFPrice:Font, S16, w700
Gui, theEmailGroupGOFPrice:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailGroupGOFPrice:Font, S14, w700
Gui, theEmailGroupGOFPrice:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#gofprice
Gui, theEmailGroupGOFPrice:Font, underline S10, w700
Gui, theEmailGroupGOFPrice:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailGroupGOFPrice:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailGroupGOFPrice:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, GOF Price - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailGroup:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailGroupGOFSetup:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailGroupGOFSetup:+AlwaysOnTop
Gui, theEmailGroupGOFSetup:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailGroupGOFSetup:Color, FFFFFF
Gui, theEmailGroupGOFSetup:Font, S12, w700
Gui, theEmailGroupGOFSetup:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailGroup, Back to Group
Gui, theEmailGroupGOFSetup:Font, S18, w700
Gui, theEmailGroupGOFSetup:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, GOF Setup
Gui, theEmailGroupGOFSetup:Font, S8, w700
Gui, theEmailGroupGOFSetup:Add, Text, center x12 y+10 w170, I can definitely help you get your Group Order Form setup! Please click on the link below to get started: *copied GOF link* You'll be able to estimate the number of shirts you need, add group information, and share the link with everyone in your group. If you have questions about setting things up, I'll be happy to help!
Gui, theEmailGroupGOFSetup:Font, S16, w700
Gui, theEmailGroupGOFSetup:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailGroupGOFSetup:Font, S14, w700
Gui, theEmailGroupGOFSetup:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#gofsetup
Gui, theEmailGroupGOFSetup:Font, underline S10, w700
Gui, theEmailGroupGOFSetup:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailGroupGOFSetup:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailGroupGOFSetup:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, GOF Setup - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailGroup:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailPostOrder:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailPostOrder:+AlwaysOnTop
Gui, theEmailPostOrder:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailPostOrder:Color, FFFFFF
Gui, theEmailPostOrder:Font, S12, w700
Gui, theEmailPostOrder:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmail, Back to Email
Gui, theEmailPostOrder:Font, underline S14, w700
Gui, theEmailPostOrder:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailPostOrderCheckInfo v_CheckInfo, Check Info
Gui, theEmailPostOrder:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailPostOrderDelivered v_Delivered, Delivered
Gui, theEmailPostOrder:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailPostOrderOrderDone v_OrderDone, Order Done
Gui, theEmailPostOrder:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailPostOrderOrderDoneLink v_OrderDoneLink, Order Done Link
Gui, theEmailPostOrder:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailPostOrderPEML v_PEML, PEML Approval
Gui, theEmailPostOrder:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailPostOrderPreShip v_Preship, Pre-Ship
Gui, theEmailPostOrder:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailPostOrderPOInfo v_POInfo, PO Info
Gui, theEmailPostOrder:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailPostOrderTracking v_Tracking, Tracking
Gui, theEmailPostOrder:Font, underline S10, w700
Gui, theEmailPostOrder:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailPostOrder:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailPostOrder:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Group - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmail:destroy
Gui, theEmailPostOrderCheckInfo:destroy
Gui, theEmailPostOrderDelivered:destroy
Gui, theEmailPostOrderOrderDone:destroy
Gui, theEmailPostOrderOrderDoneLink:destroy
Gui, theEmailPostOrderPEML:destroy
Gui, theEmailPostOrderPreship:destroy
Gui, theEmailPostOrderPOInfo:destroy
Gui, theEmailPostOrderTracking:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailPostOrderCheckInfo:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailPostOrderCheckInfo:+AlwaysOnTop
Gui, theEmailPostOrderCheckInfo:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailPostOrderCheckInfo:Color, FFFFFF
Gui, theEmailPostOrderCheckInfo:Font, S12, w700
Gui, theEmailPostOrderCheckInfo:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailPostOrder, Back to Post-Order
Gui, theEmailPostOrderCheckInfo:Font, S18, w700
Gui, theEmailPostOrderCheckInfo:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Check Info
Gui, theEmailPostOrderCheckInfo:Font, S8, w700
Gui, theEmailPostOrderCheckInfo:Add, Text, center x12 y+10 w170, CustomInk's mailing address for checks/money orders varies depending on the method you use to send it. Make sure to reference your CustomInk order number: (*copied order number*) in the Memo section. When sending your payment by traditional mail: CustomInk PO Box 759439 Baltimore, MD 21275-9439 Attn: Accounts Receivable When sending your payment via any expedited fashion (Priority, 2nd Day, Overnight, etc.), FedEx or UPS: CustomInk Attn: Accounts Receivable 2910 District Ave Fairfax, VA 22031 Once we receive the check, we will be able to provide you with your guaranteed delivery date and begin processing your order. If you have any questions, please feel free to contact me at 800-293-4232 or respond to this email and I'll be happy to help you!
Gui, theEmailPostOrderCheckInfo:Font, S16, w700
Gui, theEmailPostOrderCheckInfo:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailPostOrderCheckInfo:Font, S14, w700
Gui, theEmailPostOrderCheckInfo:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#checkinfo
Gui, theEmailPostOrderCheckInfo:Font, underline S10, w700
Gui, theEmailPostOrderCheckInfo:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailPostOrderCheckInfo:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailPostOrderCheckInfo:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Check Info - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailPostOrder:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailPostOrderDelivered:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailPostOrderDelivered:+AlwaysOnTop
Gui, theEmailPostOrderDelivered:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailPostOrderDelivered:Color, FFFFFF
Gui, theEmailPostOrderDelivered:Font, S12, w700
Gui, theEmailPostOrderDelivered:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailPostOrder, Back to Post-Order
Gui, theEmailPostOrderDelivered:Font, S18, w700
Gui, theEmailPostOrderDelivered:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Delivered
Gui, theEmailPostOrderDelivered:Font, S8, w700
Gui, theEmailPostOrderDelivered:Add, Text, center x12 y+10 w170, Thank you for choosing CustomInk! I've been keeping track of your order since it was placed to make sure that everything has went smoothly and I saw it was recently delivered to you. I'm reaching out to you to make sure that you're 100`% satisfied with your custom items and to let you know that I'm here for you if you need anything at all! If you have any questions, please feel free to give me a call or respond to this e-mail and I'll be happy to help you! My personal contact details are listed below. Thanks again for choosing CustomInk and I hope you have a wonderful day!
Gui, theEmailPostOrderDelivered:Font, S16, w700
Gui, theEmailPostOrderDelivered:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailPostOrderDelivered:Font, S14, w700
Gui, theEmailPostOrderDelivered:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#delivered
Gui, theEmailPostOrderDelivered:Font, underline S10, w700
Gui, theEmailPostOrderDelivered:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailPostOrderDelivered:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailPostOrderDelivered:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Delivered - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailPostOrder:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailPostOrderOrderDone:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailPostOrderOrderDone:+AlwaysOnTop
Gui, theEmailPostOrderOrderDone:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailPostOrderOrderDone:Color, FFFFFF
Gui, theEmailPostOrderOrderDone:Font, S12, w700
Gui, theEmailPostOrderOrderDone:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailPostOrder, Back to Post-Order
Gui, theEmailPostOrderOrderDone:Font, S18, w700
Gui, theEmailPostOrderOrderDone:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Order Done
Gui, theEmailPostOrderOrderDone:Font, S8, w700
Gui, theEmailPostOrderOrderDone:Add, Text, center x12 y+10 w170, Ok, we’re all setup here! Your order is currently pending and we’ll start processing it just as soon as we complete payment. Your order number is *copied order number* and I’m sending you a confirmation email with all of your billing and tracking information. Once the payment has been received, the delivery clock for your order will begin.
Gui, theEmailPostOrderOrderDone:Font, S16, w700
Gui, theEmailPostOrderOrderDone:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailPostOrderOrderDone:Font, S14, w700
Gui, theEmailPostOrderOrderDone:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#orderdone
Gui, theEmailPostOrderOrderDone:Font, underline S10, w700
Gui, theEmailPostOrderOrderDone:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailPostOrderOrderDone:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailPostOrderOrderDone:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Order Done - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailPostOrder:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailPostOrderOrderDoneLink:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailPostOrderOrderDoneLink:+AlwaysOnTop
Gui, theEmailPostOrderOrderDoneLink:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailPostOrderOrderDoneLink:Color, FFFFFF
Gui, theEmailPostOrderOrderDoneLink:Font, S12, w700
Gui, theEmailPostOrderOrderDoneLink:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailPostOrder, Back to Post-Order
Gui, theEmailPostOrderOrderDoneLink:Font, S18, w700
Gui, theEmailPostOrderOrderDoneLink:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Order Done Link
Gui, theEmailPostOrderOrderDoneLink:Font, S8, w700
Gui, theEmailPostOrderOrderDoneLink:Add, Text, center x12 y+10 w170, Ok, we’re all setup here! Your order is currently pending and we’ll start processing it just as soon as we complete payment. Your order number is *copied order number* and I’m sending you a confirmation email with all of your billing and tracking information. Once the payment has been received, the delivery clock for your order will begin. To complete payment for your order, please use the link listed below: *Paste Payment Link Here*
Gui, theEmailPostOrderOrderDoneLink:Font, S16, w700
Gui, theEmailPostOrderOrderDoneLink:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailPostOrderOrderDoneLink:Font, S14, w700
Gui, theEmailPostOrderOrderDoneLink:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#orderdonelink
Gui, theEmailPostOrderOrderDoneLink:Font, underline S10, w700
Gui, theEmailPostOrderOrderDoneLink:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailPostOrderOrderDoneLink:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailPostOrderOrderDoneLink:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Order Done Link - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailPostOrder:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailPostOrderPEML:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailPostOrderPEML:+AlwaysOnTop
Gui, theEmailPostOrderPEML:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailPostOrderPEML:Color, FFFFFF
Gui, theEmailPostOrderPEML:Font, S12, w700
Gui, theEmailPostOrderPEML:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailPostOrder, Back to Post-Order
Gui, theEmailPostOrderPEML:Font, S18, w700
Gui, theEmailPostOrderPEML:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, PEML Approval
Gui, theEmailPostOrderPEML:Font, S8, w700
Gui, theEmailPostOrderPEML:Add, Text, center x12 y+10 w170, Hi xxxx, Thank you for approving your proof! I’ve forwarded your order to our printing team. Your schedule is still guaranteed for your original delivery date of xxxxxxxx. Once your order ships, you’ll receive an email with tracking information. Please let me know if there is anything additional I can help you with. You can reply to this email, or call me at 1 (866) 485-8160. Thanks again,
Gui, theEmailPostOrderPEML:Font, S16, w700
Gui, theEmailPostOrderPEML:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailPostOrderPEML:Font, S14, w700
Gui, theEmailPostOrderPEML:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#peml
Gui, theEmailPostOrderPEML:Font, underline S10, w700
Gui, theEmailPostOrderPEML:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailPostOrderPEML:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailPostOrderPEML:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, PEML Approval - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailPostOrder:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailPostOrderPreship:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailPostOrderPreship:+AlwaysOnTop
Gui, theEmailPostOrderPreship:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailPostOrderPreship:Color, FFFFFF
Gui, theEmailPostOrderPreship:Font, S12, w700
Gui, theEmailPostOrderPreship:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailPostOrder, Back to Post-Order
Gui, theEmailPostOrderPreship:Font, S18, w700
Gui, theEmailPostOrderPreship:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Pre-Ship
Gui, theEmailPostOrderPreship:Font, S8, w700
Gui, theEmailPostOrderPreship:Add, Text, center x12 y+10 w170, Hi xxxx, Thank you so much for your email! I’m more than happy to answer any questions you have about the order process. It's fairly common for us to ship your order out just days (or even one day) before it's set to deliver. Rest assured that your order is still on track for your guaranteed delivery date of xxxxxxxx. Once your order ships, you’ll receive an email with tracking information. Please let me know if there is anything additional I can help you with. You can reply to this email, or call me at 1 (866) 485-8160. Thanks again,
Gui, theEmailPostOrderPreship:Font, S16, w700
Gui, theEmailPostOrderPreship:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailPostOrderPreship:Font, S14, w700
Gui, theEmailPostOrderPreship:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#preship
Gui, theEmailPostOrderPreship:Font, underline S10, w700
Gui, theEmailPostOrderPreship:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailPostOrderPreship:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailPostOrderPreship:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Pre-Ship - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailPostOrder:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailPostOrderPOInfo:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailPostOrderPOInfo:+AlwaysOnTop
Gui, theEmailPostOrderPOInfo:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailPostOrderPOInfo:Color, FFFFFF
Gui, theEmailPostOrderPOInfo:Font, S12, w700
Gui, theEmailPostOrderPOInfo:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailPostOrder, Back to Post-Order
Gui, theEmailPostOrderPOInfo:Font, S18, w700
Gui, theEmailPostOrderPOInfo:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, PO Info
Gui, theEmailPostOrderPOInfo:Font, S8, w700
Gui, theEmailPostOrderPOInfo:Add, Text, center x12 y+10 w170, Here are instructions to complete your order with CustomInk: To complete your pending order, please fax a copy of your PO to 703-935-0080. Please be sure your faxed PO includes the following information: * Purchase order number and date * Your CustomInk order number: (*copied order number*) * Billing address * Total $ amount * Authorized signature Your approval will be required to complete your order. We will send you an email as soon as your proofs are ready. Please monitor your email for this to avoid delays in your order. Your delivery date will be confirmed once we receive your signed PO.
Gui, theEmailPostOrderPOInfo:Font, S16, w700
Gui, theEmailPostOrderPOInfo:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailPostOrderPOInfo:Font, S14, w700
Gui, theEmailPostOrderPOInfo:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#poinfo
Gui, theEmailPostOrderPOInfo:Font, underline S10, w700
Gui, theEmailPostOrderPOInfo:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailPostOrderPOInfo:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailPostOrderPOInfo:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, PO Info - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailPostOrder:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailPostOrderTracking:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailPostOrderTracking:+AlwaysOnTop
Gui, theEmailPostOrderTracking:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailPostOrderTracking:Color, FFFFFF
Gui, theEmailPostOrderTracking:Font, S12, w700
Gui, theEmailPostOrderTracking:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailPostOrder, Back to Post-Order
Gui, theEmailPostOrderTracking:Font, S18, w700
Gui, theEmailPostOrderTracking:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Tracking
Gui, theEmailPostOrderTracking:Font, S8, w700
Gui, theEmailPostOrderTracking:Add, Text, center x12 y+10 w170, You can track your order status with us by using the following link: http://wwwapps.ups.com/WebTracking/track?track=yes&trackNums=*copied tracking number*
Gui, theEmailPostOrderTracking:Font, S16, w700
Gui, theEmailPostOrderTracking:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailPostOrderTracking:Font, S14, w700
Gui, theEmailPostOrderTracking:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#tracking
Gui, theEmailPostOrderTracking:Font, underline S10, w700
Gui, theEmailPostOrderTracking:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailPostOrderTracking:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailPostOrderTracking:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Tracking - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailPostOrder:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailPreOrder:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailPreOrder:+AlwaysOnTop
Gui, theEmailPreOrder:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailPreOrder:Color, FFFFFF
Gui, theEmailPreOrder:Font, S12, w700
Gui, theEmailPreOrder:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmail, Back to Email
Gui, theEmailPreOrder:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailPreOrderVoucherCode v_VoucherCode, Voucher Code
Gui, theEmailPreOrder:Font, underline S10, w700
Gui, theEmailPreOrder:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailPreOrder:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailPreOrder:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Pre-Order - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmail:destroy
Gui, theEmailPreOrderVoucherCode:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailPreOrderVoucherCode:

WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailPreOrderVoucherCode:+AlwaysOnTop
Gui, theEmailPreOrderVoucherCode:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailPreOrderVoucherCode:Color, FFFFFF
Gui, theEmailPreOrderVoucherCode:Font, S12, w700
Gui, theEmailPreOrderVoucherCode:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailPreOrder, Back to Pre-Order
Gui, theEmailPreOrderVoucherCode:Font, S18, w700
Gui, theEmailPreOrderVoucherCode:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Voucher Code
Gui, theEmailPreOrderVoucherCode:Font, S8, w700
Gui, theEmailPreOrderVoucherCode:Add, Text, center x12 y+10 w170, After you finish working in the Design Lab, the first page of the checkout cart is the Summary Page. Beneath your current order total will be red text, which reads, "Do you have a voucher code?". Clicking this text will reveal a box where you can enter your unique code! Please let me know if this works, as I'd be happy to personally enter that code for you as well.
Gui, theEmailPreOrderVoucherCode:Font, S16, w700
Gui, theEmailPreOrderVoucherCode:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailPreOrderVoucherCode:Font, S14, w700
Gui, theEmailPreOrderVoucherCode:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#vouchercode
Gui, theEmailPreOrderVoucherCode:Font, underline S10, w700
Gui, theEmailPreOrderVoucherCode:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailPreOrderVoucherCode:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailPreOrderVoucherCode:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Voucher Code - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailPreOrder:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailProblem:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,



Gui, theEmailProblem:+AlwaysOnTop
Gui, theEmailProblem:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailProblem:Color, FFFFFF
Gui, theEmailProblem:Font, S12, w700
Gui, theEmailProblem:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmail, Back to Email
Gui, theEmailProblem:Font, underline S14, w700
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 5))
{
Gui, theEmailProblem:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailProblemConfirmFix v_ConfirmFix, Confirm Fix
Gui, theEmailProblem:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailProblemCrookedPhoto v_CrookedPhoto, Crooked Photo
Gui, theEmailProblem:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailProblemCrookedReport v_CrookedReport, Crooked Report
Gui, theEmailProblem:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailProblemGhosting v_Ghosting, Ghosting
Gui, theEmailProblem:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailProblemPartial v_Partial, Partial
Gui, theEmailProblem:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailProblemProblemFull v_ProblemFull, Problem Full
}
Gui, theEmailProblem:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailProblemProblemPhoto v_ProblemPhoto, Problem Photo
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 5))
{
Gui, theEmailProblem:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailProblemProblemReturn v_ProblemReturn, Problem Return
Gui, theEmailProblem:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailProblemProblemSizing v_ProblemSizing, Problem Sizing
Gui, theEmailProblem:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailProblemProblemTones v_ProblemTones, Problem Tones
Gui, theEmailProblem:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailProblemSwapPackage v_SwapPackage, Swap Package
Gui, theEmailProblem:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailProblemVoucher v_Voucher, Voucher
}

Gui, theEmailProblem:Font, underline S10, w700
Gui, theEmailProblem:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailProblem:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailProblem:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Problem - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmail:destroy
Gui, theEmailProblemProblemFull:destroy
Gui, theEmailProblemProblemPhoto:destroy
Gui, theEmailProblemProblemReturn:destroy
Gui, theEmailProblemProblemVoucher:destroy
Gui, theEmailProblemConfirmFix:destroy
Gui, theEmailProblemCrookedPhoto:destroy
Gui, theEmailProblemCrookedReport:destroy
Gui, theEmailProblemGhosting:destroy
Gui, theEmailProblemPartial:destroy
Gui, theEmailProblemProblemSizing:destroy
Gui, theEmailProblemProblemTones:destroy
Gui, theEmailProblemSwapPackage:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailProblemConfirmFix:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailProblemConfirmFix:+AlwaysOnTop
Gui, theEmailProblemConfirmFix:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailProblemConfirmFix:Color, FFFFFF
Gui, theEmailProblemConfirmFix:Font, S12, w700
Gui, theEmailProblemConfirmFix:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailProblem, Back to Problem
Gui, theEmailProblemConfirmFix:Font, S18, w700
Gui, theEmailProblemConfirmFix:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Confirm Fix
Gui, theEmailProblemConfirmFix:Font, S8, w700
Gui, theEmailProblemConfirmFix:Add, Text, center x12 y+10 w170, Before we start your replacement order, I wanted to check in with you and see if there are any changes you would like to make to your artwork or sizes before we start?  If not, we can proceed right away. Please see the breakdown for the items and sizes we are sending you in this shipment: {Quote Only}
Gui, theEmailProblemConfirmFix:Font, S16, w700
Gui, theEmailProblemConfirmFix:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailProblemConfirmFix:Font, S14, w700
Gui, theEmailProblemConfirmFix:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#confirmfix
Gui, theEmailProblemConfirmFix:Font, underline S10, w700
Gui, theEmailProblemConfirmFix:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailProblemConfirmFix:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailProblemConfirmFix:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Confirm Fix - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailProblem:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailProblemCrookedPhoto:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailProblemCrookedPhoto:+AlwaysOnTop
Gui, theEmailProblemCrookedPhoto:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailProblemCrookedPhoto:Color, FFFFFF
Gui, theEmailProblemCrookedPhoto:Font, S12, w700
Gui, theEmailProblemCrookedPhoto:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailProblem, Back to Problem
Gui, theEmailProblemCrookedPhoto:Font, S18, w700
Gui, theEmailProblemCrookedPhoto:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Crooked Photo
Gui, theEmailProblemCrookedPhoto:Font, S8, w700
Gui, theEmailProblemCrookedPhoto:Add, Text, center x12 y+10 w170, I am so sorry to hear that your items came in crooked. Sometimes the print team slightly tilt the artwork so that it appears straight when you wear it. Would you mind trying on your shirts and seeing if this is the issue?
Gui, theEmailProblemCrookedPhoto:Font, S16, w700
Gui, theEmailProblemCrookedPhoto:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailProblemCrookedPhoto:Font, S14, w700
Gui, theEmailProblemCrookedPhoto:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#crookedphoto
Gui, theEmailProblemCrookedPhoto:Font, underline S10, w700
Gui, theEmailProblemCrookedPhoto:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailProblemCrookedPhoto:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailProblemCrookedPhoto:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Crooked Photo - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailProblem:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return


EmailProblemCrookedReport:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailProblemCrookedReport:+AlwaysOnTop
Gui, theEmailProblemCrookedReport:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailProblemCrookedReport:Color, FFFFFF
Gui, theEmailProblemCrookedReport:Font, S12, w700
Gui, theEmailProblemCrookedReport:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailProblem, Back to Problem
Gui, theEmailProblemCrookedReport:Font, S18, w700
Gui, theEmailProblemCrookedReport:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Crooked Report
Gui, theEmailProblemCrookedReport:Font, S8, w700
Gui, theEmailProblemCrookedReport:Add, Text, center x12 y+10 w170, Thank you so much for emailing! I am so sorry to hear that something went wrong in your order. The first step that helps us either solve or lessen this issue is trying the garments on. A lot of the time, designs can look off-center or crooked when flat, but the effect goes away when those items are on a body. Will you let me know if this happens?
Gui, theEmailProblemCrookedReport:Font, S16, w700
Gui, theEmailProblemCrookedReport:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailProblemCrookedReport:Font, S14, w700
Gui, theEmailProblemCrookedReport:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#crookedreport
Gui, theEmailProblemCrookedReport:Font, underline S10, w700
Gui, theEmailProblemCrookedReport:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailProblemCrookedReport:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailProblemCrookedReport:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Crooked Report - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailProblem:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailProblemGhosting:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailProblemGhosting:+AlwaysOnTop
Gui, theEmailProblemGhosting:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailProblemGhosting:Color, FFFFFF
Gui, theEmailProblemGhosting:Font, S12, w700
Gui, theEmailProblemGhosting:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailProblem, Back to Problem
Gui, theEmailProblemGhosting:Font, S18, w700
Gui, theEmailProblemGhosting:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Ghosting
Gui, theEmailProblemGhosting:Font, S8, w700
Gui, theEmailProblemGhosting:Add, Text, center x12 y+10 w170, What you are describing sounds like an issue we occasionally run into that happens when there is a unique combination of temperature and humidity during the shipping process. If I am correct, the great news is that a quick run through the wash will completely remedy this situation. Please take a picture showing the the shirts and reply back to this email so I can be sure. Then, I’ll likely have you toss at least one in the wash to see if that fixes things. If not, I can work on getting the shirts back for our team to inspect.
Gui, theEmailProblemGhosting:Font, S16, w700
Gui, theEmailProblemGhosting:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailProblemGhosting:Font, S14, w700
Gui, theEmailProblemGhosting:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#ghosting
Gui, theEmailProblemGhosting:Font, underline S10, w700
Gui, theEmailProblemGhosting:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailProblemGhosting:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailProblemGhosting:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Ghosting - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailProblem:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailProblemPartial:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailProblemPartial:+AlwaysOnTop
Gui, theEmailProblemPartial:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailProblemPartial:Color, FFFFFF
Gui, theEmailProblemPartial:Font, S12, w700
Gui, theEmailProblemPartial:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailProblem, Back to Problem
Gui, theEmailProblemPartial:Font, S18, w700
Gui, theEmailProblemPartial:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Partial
Gui, theEmailProblemPartial:Font, S8, w700
Gui, theEmailProblemPartial:Add, Text, center x12 y+10 w170, Thank you so much for getting back to me! I am so sorry about the issues you’ve experienced with your order. I can offer a partial refund back on your order of {AMOUNT HERE} for the inconvenience this has all caused. Would that work out for you?
Gui, theEmailProblemPartial:Font, S16, w700
Gui, theEmailProblemPartial:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailProblemPartial:Font, S14, w700
Gui, theEmailProblemPartial:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#partial
Gui, theEmailProblemPartial:Font, underline S10, w700
Gui, theEmailProblemPartial:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailProblemPartial:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailProblemPartial:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Partial - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailProblem:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return


EmailProblemProblemFull:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailProblemProblemFull:+AlwaysOnTop
Gui, theEmailProblemProblemFull:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailProblemProblemFull:Color, FFFFFF
Gui, theEmailProblemProblemFull:Font, S12, w700
Gui, theEmailProblemProblemFull:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailProblem, Back to Problem
Gui, theEmailProblemProblemFull:Font, S18, w700
Gui, theEmailProblemProblemFull:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Problem Full
Gui, theEmailProblemProblemFull:Font, S8, w700
Gui, theEmailProblemProblemFull:Add, Text, center x12 y+10 w170, Hello there, Thanks so much for reaching out to us about the problems you discovered with your order. I am so sorry to hear that the final product was inconsistent with the quality you were expecting. I want to be sure you're totally satisfied, and I can definitely work with you to get this resolved. Is it possible for you to send me some photos of the problem spots? They can be a big help in documenting the mistakes up front and give us insight into the cause of the problem. It's possible we may need to have you return your items to fully understand the issue and ensure we provide you with the best resolution possible. I want to make sure I'm working within your timeline;, is there an upcoming event you need these for?  If it turns out that we don't have time for a full investigation , I'm happy to discuss other options with you. Please let me know if you have any questions or concerns about all of this, and I again apologize for the problem with your order. Thanks, and I look forward to hearing from you,
Gui, theEmailProblemProblemFull:Font, S16, w700
Gui, theEmailProblemProblemFull:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailProblemProblemFull:Font, S14, w700
Gui, theEmailProblemProblemFull:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#probfull
Gui, theEmailProblemProblemFull:Font, underline S10, w700
Gui, theEmailProblemProblemFull:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailProblemProblemFull:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailProblemProblemFull:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Problem Full - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailProblem:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailProblemProblemPhoto:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailProblemProblemPhoto:+AlwaysOnTop
Gui, theEmailProblemProblemPhoto:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailProblemProblemPhoto:Color, FFFFFF
Gui, theEmailProblemProblemPhoto:Font, S12, w700
Gui, theEmailProblemProblemPhoto:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailProblem, Back to Problem
Gui, theEmailProblemProblemPhoto:Font, S18, w700
Gui, theEmailProblemProblemPhoto:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Problem Photo
Gui, theEmailProblemProblemPhoto:Font, S8, w700
Gui, theEmailProblemProblemPhoto:Add, Text, center x12 y+10 w170, I'm sorry to hear that there was a problem with your order and I’m happy to help find a resolution for you! Would it be possible to take photos so I can see exactly what happened? If you can respond to this email with those photos attached, I can review them with the print team and figure out the best solution!
Gui, theEmailProblemProblemPhoto:Font, S16, w700
Gui, theEmailProblemProblemPhoto:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailProblemProblemPhoto:Font, S14, w700
Gui, theEmailProblemProblemPhoto:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#probphoto
Gui, theEmailProblemProblemPhoto:Font, underline S10, w700
Gui, theEmailProblemProblemPhoto:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailProblemProblemPhoto:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailProblemProblemPhoto:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Problem Photo - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailProblem:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailProblemProblemReturn:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailProblemProblemReturn:+AlwaysOnTop
Gui, theEmailProblemProblemReturn:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailProblemProblemReturn:Color, FFFFFF
Gui, theEmailProblemProblemReturn:Font, S12, w700
Gui, theEmailProblemProblemReturn:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailProblem, Back to Problem
Gui, theEmailProblemProblemReturn:Font, S18, w700
Gui, theEmailProblemProblemReturn:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Problem Return
Gui, theEmailProblemProblemReturn:Font, S8, w700
Gui, theEmailProblemProblemReturn:Add, Text, center x12 y+10 w170, I would like to get your order returned to us for inspection. Our team will go over every aspect of the items and your reported concerns to see what happened with your order. If it is correctly printed as it was supposed to be done, we can arrange to have this sent back to you in a timely manner so we do not miss your event. If they are not, we will contact you to see how you would like to proceed.
Gui, theEmailProblemProblemReturn:Font, S16, w700
Gui, theEmailProblemProblemReturn:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailProblemProblemReturn:Font, S14, w700
Gui, theEmailProblemProblemReturn:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#probreturn
Gui, theEmailProblemProblemReturn:Font, underline S10, w700
Gui, theEmailProblemProblemReturn:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailProblemProblemReturn:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailProblemProblemReturn:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Problem Return - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailProblem:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailProblemProblemSizing:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailProblemProblemSizing:+AlwaysOnTop
Gui, theEmailProblemProblemSizing:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailProblemProblemSizing:Color, FFFFFF
Gui, theEmailProblemProblemSizing:Font, S12, w700
Gui, theEmailProblemProblemSizing:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailProblem, Back to Problem
Gui, theEmailProblemProblemSizing:Font, S18, w700
Gui, theEmailProblemProblemSizing:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Problem Sizing
Gui, theEmailProblemProblemSizing:Font, S8, w700
Gui, theEmailProblemProblemSizing:Add, Text, center x12 y+10 w170, I definitely understand that sizing can be a hard one to determine when you are ordering online. We try to keep this as intuitive as possible. Did you get a chance to look at our sizing line up for these items? [SIZING LINE UP] How do you feel your shirts are fitting in comparison to this sizing chart? Each person’s body is unique, which may cause items to fit differently. However, sometimes there are manufacturing errors where the item is mislabeled or incorrectly made. Because of these possibilities, we may have you send these items back for a print specialist to inspect. If these items are incorrect, we will replace them. If they are what we state on our sizing line up, we can work out some special pricing on a new order for items that are needed. Does that work for you?
Gui, theEmailProblemProblemSizing:Font, S16, w700
Gui, theEmailProblemProblemSizing:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailProblemProblemSizing:Font, S14, w700
Gui, theEmailProblemProblemSizing:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#probsizing
Gui, theEmailProblemProblemSizing:Font, underline S10, w700
Gui, theEmailProblemProblemSizing:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailProblemProblemSizing:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailProblemProblemSizing:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Problem Sizing - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailProblem:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailProblemProblemTones:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailProblemProblemTones:+AlwaysOnTop
Gui, theEmailProblemProblemTones:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailProblemProblemTones:Color, FFFFFF
Gui, theEmailProblemProblemTones:Font, S12, w700
Gui, theEmailProblemProblemTones:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailProblem, Back to Problem
Gui, theEmailProblemProblemTones:Font, S18, w700
Gui, theEmailProblemProblemTones:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Problem Tones
Gui, theEmailProblemProblemTones:Font, S8, w700
Gui, theEmailProblemProblemTones:Add, Text, center x12 y+10 w170, You mentioned that your design looks different than you imagined it would. We used halftones in your design to create the shading in your artwork. This is a series of dots that are printed on your shirt to create a gradient effect from a light to dark color. This are a finely executed print process to make it appear as close to your original artwork as possible. Would you mind sending me a photo so I can see if your halftones were done correctly?
Gui, theEmailProblemProblemTones:Font, S16, w700
Gui, theEmailProblemProblemTones:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailProblemProblemTones:Font, S14, w700
Gui, theEmailProblemProblemTones:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#probtones
Gui, theEmailProblemProblemTones:Font, underline S10, w700
Gui, theEmailProblemProblemTones:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailProblemProblemTones:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailProblemProblemTones:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Problem Tones - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailProblem:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return


EmailProblemSwapPackage:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailProblemSwapPackage:+AlwaysOnTop
Gui, theEmailProblemSwapPackage:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailProblemSwapPackage:Color, FFFFFF
Gui, theEmailProblemSwapPackage:Font, S12, w700
Gui, theEmailProblemSwapPackage:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailProblem, Back to Problem
Gui, theEmailProblemSwapPackage:Font, S18, w700
Gui, theEmailProblemSwapPackage:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Swap Package
Gui, theEmailProblemSwapPackage:Font, S8, w700
Gui, theEmailProblemSwapPackage:Add, Text, center x12 y+10 w170, Today's Date:Order Numbers Involved: (a) (b)Which Order Reported and How:How Was The Corresponding Order Contacted:Location Of Orders:(a):(b):Event Dates:(a):(b):Investigation Steps:Pick-up/Return Tracking Numbers, or Fix Order Numbers:(a):(b):Resolution Options:
Gui, theEmailProblemSwapPackage:Font, S16, w700
Gui, theEmailProblemSwapPackage:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailProblemSwapPackage:Font, S14, w700
Gui, theEmailProblemSwapPackage:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#swappackage
Gui, theEmailProblemSwapPackage:Font, underline S10, w700
Gui, theEmailProblemSwapPackage:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailProblemSwapPackage:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailProblemSwapPackage:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Swap Package - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailProblem:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return


EmailProblemVoucher:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailProblemProblemVoucher:+AlwaysOnTop
Gui, theEmailProblemProblemVoucher:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailProblemProblemVoucher:Color, FFFFFF
Gui, theEmailProblemProblemVoucher:Font, S12, w700
Gui, theEmailProblemProblemVoucher:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailProblem, Back to Problem
Gui, theEmailProblemProblemVoucher:Font, S18, w700
Gui, theEmailProblemProblemVoucher:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Voucher
Gui, theEmailProblemProblemVoucher:Font, S8, w700
Gui, theEmailProblemProblemVoucher:Add, Text, center x12 y+10 w170, I hope you're having a great week! I wanted to touch base with you because I see your replacement order was delivered. How does it look? I have created a voucher for the inconvenience. You can apply it at checkout: *copied voucher number* This code for $XX will be on file in our system, so don't worry if you lose this email, just give us a call and we can take care of the rest. Please let me know if you have any questions or concerns, and thanks for your patience in working through this issue!
Gui, theEmailProblemProblemVoucher:Font, S16, w700
Gui, theEmailProblemProblemVoucher:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailProblemProblemVoucher:Font, S14, w700
Gui, theEmailProblemProblemVoucher:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#voucher
Gui, theEmailProblemProblemVoucher:Font, underline S10, w700
Gui, theEmailProblemProblemVoucher:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailProblemProblemVoucher:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailProblemProblemVoucher:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Voucher - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailProblem:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailProduct:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailProduct:+AlwaysOnTop
Gui, theEmailProduct:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailProduct:Color, FFFFFF
Gui, theEmailProduct:Font, S12, w700
Gui, theEmailProduct:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmail, Back to Email
Gui, theEmailProduct:Font, underline S14, w700
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 5))
{
Gui, theEmailProduct:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailProductsBottles v_Bottles, Bottles
}
Gui, theEmailProduct:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailProductsCanadaBlanks v_CanadaBlanks, Canada Blanks
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 5))
{
Gui, theEmailProduct:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailProductsCups v_Cups, Cups
Gui, theEmailProduct:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailProductsGlasses v_Glasses, Glasses
Gui, theEmailProduct:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailProductsKoozies v_Koozies, Koozies
Gui, theEmailProduct:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailProductsMagnets v_Magnets, Magnets
Gui, theEmailProduct:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailProductsMousepads v_Mousepads, Mousepads
Gui, theEmailProduct:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailProductsMugs v_Mugs, Mugs
Gui, theEmailProduct:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailProductsPaper v_Paper, Paper
Gui, theEmailProduct:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailProductsPens v_Pens, Pens
}
Gui, theEmailProduct:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailProductsSamples v_Samples, Samples
if ((skill = 1) || (skill = 2) || (skill = 3) || (skill = 5))
{
Gui, theEmailProduct:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailProductsStickers v_Stickers, Stickers
}
Gui, theEmailProduct:Font, underline S10, w700
Gui, theEmailProduct:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailProduct:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailProduct:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Problem - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmail:destroy
Gui, theEmailProductBottles:destroy
Gui, theEmailProductCanadaBlanks:destroy
Gui, theEmailProductCups:destroy
Gui, theEmailProductGlasses:destroy
Gui, theEmailProductKoozies:destroy
Gui, theEmailProductMagnets:destroy
Gui, theEmailProductMousepads:destroy
Gui, theEmailProductMugs:destroy
Gui, theEmailProductPaper:destroy
Gui, theEmailProductPens:destroy
Gui, theEmailProductsSamples:destroy
Gui, theEmailProductStickers:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailProductsBottles:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailProductBottles:+AlwaysOnTop
Gui, theEmailProductBottles:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailProductBottles:Color, FFFFFF
Gui, theEmailProductBottles:Font, S12, w700
Gui, theEmailProductBottles:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailProduct, Back to Product
Gui, theEmailProductBottles:Font, S18, w700
Gui, theEmailProductBottles:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Bottles
Gui, theEmailProductBottles:Font, S8, w700
Gui, theEmailProductBottles:Add, Text, center x12 y+10 w170, Currently, the minimum to order water bottles ranges between 50 and 100, depending on the particular product. Printing on bottles is very labor intensive, and having a higher minimum allows us to give your order the attention it deserves.  I'd be happy to show you some pricing if you'd like to order water bottles within those quantities
Gui, theEmailProductBottles:Font, S16, w700
Gui, theEmailProductBottles:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailProductBottles:Font, S14, w700
Gui, theEmailProductBottles:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#bottles
Gui, theEmailProductBottles:Font, underline S10, w700
Gui, theEmailProductBottles:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailProductBottles:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailProductBottles:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Bottles - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailProduct:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailProductsCanadaBlanks:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailProductCanadaBlanks:+AlwaysOnTop
Gui, theEmailProductCanadaBlanks:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailProductCanadaBlanks:Color, FFFFFF
Gui, theEmailProductCanadaBlanks:Font, S12, w700
Gui, theEmailProductCanadaBlanks:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailProduct, Back to Product
Gui, theEmailProductCanadaBlanks:Font, S18, w700
Gui, theEmailProductCanadaBlanks:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Canada Blanks
Gui, theEmailProductCanadaBlanks:Font, S8, w700
Gui, theEmailProductCanadaBlanks:Add, Text, center x12 y+10 w170, We are located in the United States, but have a specific selection of products available for our Canadian customers. If you use the link below, you'll be able to check out the products that we can use with your custom design.  http://www.customink.com/categories/canada-products/64
Gui, theEmailProductCanadaBlanks:Font, S16, w700
Gui, theEmailProductCanadaBlanks:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailProductCanadaBlanks:Font, S14, w700
Gui, theEmailProductCanadaBlanks:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#canadablanks
Gui, theEmailProductCanadaBlanks:Font, underline S10, w700
Gui, theEmailProductCanadaBlanks:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailProductCanadaBlanks:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailProductCanadaBlanks:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Canada Blanks - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailProduct:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailProductsCups:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailProductCups:+AlwaysOnTop
Gui, theEmailProductCups:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailProductCups:Color, FFFFFF
Gui, theEmailProductCups:Font, S12, w700
Gui, theEmailProductCups:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailProduct, Back to Product
Gui, theEmailProductCups:Font, S18, w700
Gui, theEmailProductCups:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Cups
Gui, theEmailProductCups:Font, S8, w700
Gui, theEmailProductCups:Add, Text, center x12 y+10 w170, Currently, the minimum to order cups ranges between 72 and 100, depending on the type. Printing on cups is very labor intensive, and having a higher minimum allows us to give your order the attention it deserves. I'm happy to show you some pricing if you'd like to order cups within those quantities!
Gui, theEmailProductCups:Font, S16, w700
Gui, theEmailProductCups:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailProductCups:Font, S14, w700
Gui, theEmailProductCups:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#cups
Gui, theEmailProductCups:Font, underline S10, w700
Gui, theEmailProductCups:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailProductCups:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailProductCups:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Cups - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailProduct:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailProductsGlasses:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailProductGlasses:+AlwaysOnTop
Gui, theEmailProductGlasses:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailProductGlasses:Color, FFFFFF
Gui, theEmailProductGlasses:Font, S12, w700
Gui, theEmailProductGlasses:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailProduct, Back to Product
Gui, theEmailProductGlasses:Font, S18, w700
Gui, theEmailProductGlasses:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Glasses
Gui, theEmailProductGlasses:Font, S8, w700
Gui, theEmailProductGlasses:Add, Text, center x12 y+10 w170, Currently, the minimum to order glasses is 72. Printing and shipping glassware is very labor intensive, and having a higher minimum allows us to give your order the attention it deserves. I'm happy to show you some pricing if you’re interested in glassware!
Gui, theEmailProductGlasses:Font, S16, w700
Gui, theEmailProductGlasses:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailProductGlasses:Font, S14, w700
Gui, theEmailProductGlasses:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#glasses
Gui, theEmailProductGlasses:Font, underline S10, w700
Gui, theEmailProductGlasses:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailProductGlasses:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailProductGlasses:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Glasses - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailProduct:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailProductsKoozies:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailProductKoozies:+AlwaysOnTop
Gui, theEmailProductKoozies:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailProductKoozies:Color, FFFFFF
Gui, theEmailProductKoozies:Font, S12, w700
Gui, theEmailProductKoozies:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailProduct, Back to Product
Gui, theEmailProductKoozies:Font, S18, w700
Gui, theEmailProductKoozies:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Koozies
Gui, theEmailProductKoozies:Font, S8, w700
Gui, theEmailProductKoozies:Add, Text, center x12 y+10 w170, Currently, the minimum to order koozies ranges between 50 and 100, depending on the style of koozie. I'm happy to help you with some pricing if you'd like to order koozies!
Gui, theEmailProductKoozies:Font, S16, w700
Gui, theEmailProductKoozies:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailProductKoozies:Font, S14, w700
Gui, theEmailProductKoozies:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#koozies
Gui, theEmailProductKoozies:Font, underline S10, w700
Gui, theEmailProductKoozies:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailProductKoozies:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailProductKoozies:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Koozies - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailProduct:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailProductsMagnets:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailProductMagnets:+AlwaysOnTop
Gui, theEmailProductMagnets:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailProductMagnets:Color, FFFFFF
Gui, theEmailProductMagnets:Font, S12, w700
Gui, theEmailProductMagnets:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailProduct, Back to Product
Gui, theEmailProductMagnets:Font, S18, w700
Gui, theEmailProductMagnets:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Magnets
Gui, theEmailProductMagnets:Font, S8, w700
Gui, theEmailProductMagnets:Add, Text, center x12 y+10 w170, Currently, the minimum to order magnets is 100. Printing on magnets is very labor intensive, and having a higher minimum allows us to give your order the attention it deserves.  I'm happy to show you some pricing if you'd like to order at least 100!
Gui, theEmailProductMagnets:Font, S16, w700
Gui, theEmailProductMagnets:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailProductMagnets:Font, S14, w700
Gui, theEmailProductMagnets:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#magnets
Gui, theEmailProductMagnets:Font, underline S10, w700
Gui, theEmailProductMagnets:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailProductMagnets:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailProductMagnets:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Magnets - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailProduct:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailProductsMousepads:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailProductMousepads:+AlwaysOnTop
Gui, theEmailProductMousepads:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailProductMousepads:Color, FFFFFF
Gui, theEmailProductMousepads:Font, S12, w700
Gui, theEmailProductMousepads:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailProduct, Back to Product
Gui, theEmailProductMousepads:Font, S18, w700
Gui, theEmailProductMousepads:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Mousepads
Gui, theEmailProductMousepads:Font, S8, w700
Gui, theEmailProductMousepads:Add, Text, center x12 y+10 w170, Currently, the minimum to order mouse pads is 50. Printing on mouse pads is very labor intensive, and having a higher minimum allows us to give your order the attention it deserves.  I'm happy to show you some pricing if you'd like to order at least 50!
Gui, theEmailProductMousepads:Font, S16, w700
Gui, theEmailProductMousepads:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailProductMousepads:Font, S14, w700
Gui, theEmailProductMousepads:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#mousepads
Gui, theEmailProductMousepads:Font, underline S10, w700
Gui, theEmailProductMousepads:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailProductMousepads:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailProductMousepads:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Mousepads - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailProduct:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailProductsMugs:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailProductMugs:+AlwaysOnTop
Gui, theEmailProductMugs:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailProductMugs:Color, FFFFFF
Gui, theEmailProductMugs:Font, S12, w700
Gui, theEmailProductMugs:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailProduct, Back to Product
Gui, theEmailProductMugs:Font, S18, w700
Gui, theEmailProductMugs:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Mugs
Gui, theEmailProductMugs:Font, S8, w700
Gui, theEmailProductMugs:Add, Text, center x12 y+10 w170, Currently, the minimum to order mugs is 72. Printing and shipping mugs is very labor intensive, and having a higher minimum allows us to give your order the attention it deserves. I'm happy to show you some pricing if you'd like to order mugs!
Gui, theEmailProductMugs:Font, S16, w700
Gui, theEmailProductMugs:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailProductMugs:Font, S14, w700
Gui, theEmailProductMugs:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#mugs
Gui, theEmailProductMugs:Font, underline S10, w700
Gui, theEmailProductMugs:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailProductMugs:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailProductMugs:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Mugs - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailProduct:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailProductsPaper:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailProductPaper:+AlwaysOnTop
Gui, theEmailProductPaper:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailProductPaper:Color, FFFFFF
Gui, theEmailProductPaper:Font, S12, w700
Gui, theEmailProductPaper:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailProduct, Back to Product
Gui, theEmailProductPaper:Font, S18, w700
Gui, theEmailProductPaper:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Paper
Gui, theEmailProductPaper:Font, S8, w700
Gui, theEmailProductPaper:Add, Text, center x12 y+10 w170, Currently, the minimum to order paper products is 500. Printing on paper is very labor intensive, and having a higher minimum allows us to give your order the attention it deserves.  I'm happy to show you some pricing if you'd like to order at least 500!
Gui, theEmailProductPaper:Font, S16, w700
Gui, theEmailProductPaper:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailProductPaper:Font, S14, w700
Gui, theEmailProductPaper:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#paper
Gui, theEmailProductPaper:Font, underline S10, w700
Gui, theEmailProductPaper:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailProductPaper:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailProductPaper:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Paper - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailProduct:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailProductsPens:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailProductPens:+AlwaysOnTop
Gui, theEmailProductPens:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailProductPens:Color, FFFFFF
Gui, theEmailProductPens:Font, S12, w700
Gui, theEmailProductPens:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailProduct, Back to Product
Gui, theEmailProductPens:Font, S18, w700
Gui, theEmailProductPens:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Pens
Gui, theEmailProductPens:Font, S8, w700
Gui, theEmailProductPens:Add, Text, center x12 y+10 w170, Currently, the minimum to order pens ranges between 50 and 300, depending on the type. Printing on pens is very intricate, and having a higher minimum allows us to give your order the attention it deserves. I'm happy to show you some pricing if you'd like to order within those quantities!
Gui, theEmailProductPens:Font, S16, w700
Gui, theEmailProductPens:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailProductPens:Font, S14, w700
Gui, theEmailProductPens:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#pens
Gui, theEmailProductPens:Font, underline S10, w700
Gui, theEmailProductPens:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailProductPens:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailProductPens:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Pens - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailProduct:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailProductsPerformanceColor:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailProductPerformanceColor:+AlwaysOnTop
Gui, theEmailProductPerformanceColor:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailProductPerformanceColor:Color, FFFFFF
Gui, theEmailProductPerformanceColor:Font, S12, w700
Gui, theEmailProductPerformanceColor:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailProduct, Back to Product
Gui, theEmailProductPerformanceColor:Font, S16, w700
Gui, theEmailProductPerformanceColor:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Performance Color
Gui, theEmailProductPerformanceColor:Font, S8, w700
Gui, theEmailProductPerformanceColor:Add, Text, center x12 y+10 w170, Our performance shirts are able to receive a maximum of two colors during the printing process. I can help pick the two best colors to keep in your design and have my design team make those adjustments to your artwork. After the order is placed, we'll send you an email proof of any changes before we print. This won't cost you a penny extra, we just want to make sure you're 100`% satisfied with your custom artwork.
Gui, theEmailProductPerformanceColor:Font, S16, w700
Gui, theEmailProductPerformanceColor:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailProductPerformanceColor:Font, S14, w700
Gui, theEmailProductPerformanceColor:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#colormax
Gui, theEmailProductPerformanceColor:Font, underline S10, w700
Gui, theEmailProductPerformanceColor:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailProductPerformanceColor:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailProductPerformanceColor:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Performance Color - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailProduct:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailProductsSamples:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailProductsSamples:+AlwaysOnTop
Gui, theEmailProductsSamples:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailProductsSamples:Color, FFFFFF
Gui, theEmailProductsSamples:Font, S12, w700
Gui, theEmailProductsSamples:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailProduct, Back to Product
Gui, theEmailProductsSamples:Font, S18, w700
Gui, theEmailProductsSamples:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Samples
Gui, theEmailProductsSamples:Font, S8, w700
Gui, theEmailProductsSamples:Add, Text, center x12 y+10 w170, If you would like, I’m happy to get you set up with a blank sample of the items that you're considering! This allows you to check out the fit and feel before you place your printed order with us! We offer these blank samples at a low cost and can have them delivered to you within a week with our free shipping. Would that work for you?
Gui, theEmailProductsSamples:Font, S16, w700
Gui, theEmailProductsSamples:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailProductsSamples:Font, S14, w700
Gui, theEmailProductsSamples:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#sample
Gui, theEmailProductsSamples:Font, underline S10, w700
Gui, theEmailProductsSamples:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailProductsSamples:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailProductsSamples:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Samples - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailProduct:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailProductsStickers:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailProductStickers:+AlwaysOnTop
Gui, theEmailProductStickers:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailProductStickers:Color, FFFFFF
Gui, theEmailProductStickers:Font, S12, w700
Gui, theEmailProductStickers:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailProduct, Back to Product
Gui, theEmailProductStickers:Font, S18, w700
Gui, theEmailProductStickers:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Stickers
Gui, theEmailProductStickers:Font, S8, w700
Gui, theEmailProductStickers:Add, Text, center x12 y+10 w170, Currently, the minimum to order stickers is 250. The reasoning behind it is, the set up process is pretty extensive and there's not much wiggle room to adjust those quantities. I'd be happy to show you some pricing if you'd like to order at least 250!
Gui, theEmailProductStickers:Font, S16, w700
Gui, theEmailProductStickers:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailProductStickers:Font, S14, w700
Gui, theEmailProductStickers:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#stickers
Gui, theEmailProductStickers:Font, underline S10, w700
Gui, theEmailProductStickers:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailProductStickers:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailProductStickers:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Stickers - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailProduct:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailQuote:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailQuote:+AlwaysOnTop
Gui, theEmailQuote:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailQuote:Color, FFFFFF
Gui, theEmailQuote:Font, S12, w700
Gui, theEmailQuote:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmail, Back to Email
Gui, theEmailQuote:Font, underline S14, w700
Gui, theEmailQuote:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailQuoteAP v_AP, Additional Piece
Gui, theEmailQuote:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailQuoteBudget v_Budget, Budget
Gui, theEmailQuote:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailQuotePriceHelp v_PriceHelp, Price Help
Gui, theEmailQuote:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailQuoteQuoteBulk v_QuoteBulk, Quote Bulk
Gui, theEmailQuote:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailQuoteQuoteOnly v_QuoteOnly, Quote Only
Gui, theEmailQuote:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailQuoteQuoteSingles v_QuoteSingles, Quote Singles
Gui, theEmailQuote:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailQuoteQuoteSpec v_QuoteSpec, Quote Spec
Gui, theEmailQuote:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailQuoteSleevePrice v_SleevePrice, Sleeve Price
Gui, theEmailQuote:Font, underline S10, w700
Gui, theEmailQuote:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailQuote:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailQuote:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Quote - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmail:destroy
Gui, theEmailQuoteAP:destroy
Gui, theEmailQuotePriceHelp:destroy
Gui, theEmailQuoteQuoteBulk:destroy
Gui, theEmailQuoteQuoteSingles:destroy
Gui, theEmailQuoteSleevePrice:destroy
Gui, theEmailQuoteBudget:destroy
Gui, theEmailQuoteQuoteOnly:destroy
Gui, theEmailQuoteQuoteSpec:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailQuoteAP:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailQuoteAP:+AlwaysOnTop
Gui, theEmailQuoteAP:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailQuoteAP:Color, FFFFFF
Gui, theEmailQuoteAP:Font, S12, w700
Gui, theEmailQuoteAP:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailQuote, Back to Quote
Gui, theEmailQuoteAP:Font, S18, w700
Gui, theEmailQuoteAP:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Additional Piece
Gui, theEmailQuoteAP:Font, S8, w700
Gui, theEmailQuoteAP:Add, Text, center x12 y+10 w170,  I can definitely help you out! We have a special type of order just for this situation. Here's how it works, you can order the same design and same shirt style at the original per- piece price you paid (unless you'd like to change it). There is a flat setup fee to cover the cost of printing, but you can order up to five pieces for this special offer.
Gui, theEmailQuoteAP:Font, S16, w700
Gui, theEmailQuoteAP:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailQuoteAP:Font, S14, w700
Gui, theEmailQuoteAP:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#ap
Gui, theEmailQuoteAP:Font, underline S10, w700
Gui, theEmailQuoteAP:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailQuoteAP:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailQuoteAP:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Additional Piece - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailQuote:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailQuoteBudget:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailQuoteBudget:+AlwaysOnTop
Gui, theEmailQuoteBudget:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailQuoteBudget:Color, FFFFFF
Gui, theEmailQuoteBudget:Font, S12, w700
Gui, theEmailQuoteBudget:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailQuote, Back to Quote
Gui, theEmailQuoteBudget:Font, S18, w700
Gui, theEmailQuoteBudget:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Budget
Gui, theEmailQuoteBudget:Font, S8, w700
Gui, theEmailQuoteBudget:Add, Text, center x12 y+10 w170, Do these prices work within your budget?  If not, please let me know and I can start working on a quote that works better for you. If you have any other questions along the way, feel free to reply to this email or call me directly.  Once I hear back, we'll be able to take the next steps in making your design come to life.  I've included all of my contact information below. Thanks again for choosing CustomInk. I look forward to hearing from you!
Gui, theEmailQuoteBudget:Font, S16, w700
Gui, theEmailQuoteBudget:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailQuoteBudget:Font, S14, w700
Gui, theEmailQuoteBudget:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#budget
Gui, theEmailQuoteBudget:Font, underline S10, w700
Gui, theEmailQuoteBudget:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailQuoteBudget:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailQuoteBudget:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Budget - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailQuote:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailQuotePriceHelp:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailQuotePriceHelp:+AlwaysOnTop
Gui, theEmailQuotePriceHelp:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailQuotePriceHelp:Color, FFFFFF
Gui, theEmailQuotePriceHelp:Font, S12, w700
Gui, theEmailQuotePriceHelp:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailQuote, Back to Quote
Gui, theEmailQuotePriceHelp:Font, S18, w700
Gui, theEmailQuotePriceHelp:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Price Help
Gui, theEmailQuotePriceHelp:Font, S8, w700
Gui, theEmailQuotePriceHelp:Add, Text, center x12 y+10 w170, I'll be happy to help go over some of our more budget-friendly options with you! Is there a specific budget that you would like to stay within?
Gui, theEmailQuotePriceHelp:Font, S16, w700
Gui, theEmailQuotePriceHelp:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailQuotePriceHelp:Font, S14, w700
Gui, theEmailQuotePriceHelp:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#pricehelp
Gui, theEmailQuotePriceHelp:Font, underline S10, w700
Gui, theEmailQuotePriceHelp:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailQuotePriceHelp:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailQuotePriceHelp:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Price Help - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailQuote:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailQuoteQuoteBulk:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailQuoteQuoteBulk:+AlwaysOnTop
Gui, theEmailQuoteQuoteBulk:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailQuoteQuoteBulk:Color, FFFFFF
Gui, theEmailQuoteQuoteBulk:Font, S12, w700
Gui, theEmailQuoteQuoteBulk:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailQuote, Back to Quote
Gui, theEmailQuoteQuoteBulk:Font, S18, w700
Gui, theEmailQuoteQuoteBulk:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Quote Bulk
Gui, theEmailQuoteQuoteBulk:Font, S8, w700
Gui, theEmailQuoteQuoteBulk:Add, Text, center x12 y+10 w170, After copying the quote, using this hotkey will properly format the qutoe (excluding sizes ex: S-XL must still be applied, if necessary) and add bulk value adds.
Gui, theEmailQuoteQuoteBulk:Font, S16, w700
Gui, theEmailQuoteQuoteBulk:Add, Text, center ym-10 x12 y+15 w180 h30 0x200 cRed, How to Use:
Gui, theEmailQuoteQuoteBulk:Font, S14, w700
Gui, theEmailQuoteQuoteBulk:Add, Text, center ym-10 x12 y+15 w180 0x200,#quotebulk
Gui, theEmailQuoteQuoteBulk:Add, Text, center ym-10 x12 y+5 w180 0x200,or
Gui, theEmailQuoteQuoteBulk:Add, Text, center ym-10 x12 y+5 w180 0x200,#bulkquote
Gui, theEmailQuoteQuoteBulk:Font, underline S10, w700
Gui, theEmailQuoteQuoteBulk:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailQuoteQuoteBulk:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailQuoteQuoteBulk:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Quote Bulk - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailQuote:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailQuoteQuoteOnly:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailQuoteQuoteOnly:+AlwaysOnTop
Gui, theEmailQuoteQuoteOnly:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailQuoteQuoteOnly:Color, FFFFFF
Gui, theEmailQuoteQuoteOnly:Font, S12, w700
Gui, theEmailQuoteQuoteOnly:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailQuote, Back to Quote
Gui, theEmailQuoteQuoteOnly:Font, S18, w700
Gui, theEmailQuoteQuoteOnly:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Quote Only
Gui, theEmailQuoteQuoteOnly:Font, S8, w700
Gui, theEmailQuoteQuoteOnly:Add, Text, center x12 y+10 w170, After copying the quote, using this hotkey will properly format the quote (excluding sizes ex: S-XL must still be applied, if necessary) without adding any value adds.
Gui, theEmailQuoteQuoteOnly:Font, S16, w700
Gui, theEmailQuoteQuoteOnly:Add, Text, center ym-10 x12 y+15 w180 h30 0x200 cRed, How to Use:
Gui, theEmailQuoteQuoteOnly:Font, S14, w700
Gui, theEmailQuoteQuoteOnly:Add, Text, center ym-10 x12 y+15 w180 0x200,#quoteonly
Gui, theEmailQuoteQuoteOnly:Add, Text, center ym-10 x12 y+5 w180 0x200,or
Gui, theEmailQuoteQuoteOnly:Add, Text, center ym-10 x12 y+5 w180 0x200,#onlyquote
Gui, theEmailQuoteQuoteOnly:Font, underline S10, w700
Gui, theEmailQuoteQuoteOnly:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailQuoteQuoteOnly:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailQuoteQuoteOnly:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Quote Only - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailQuote:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailQuoteQuoteSingles:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailQuoteQuoteSingles:+AlwaysOnTop
Gui, theEmailQuoteQuoteSingles:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailQuoteQuoteSingles:Color, FFFFFF
Gui, theEmailQuoteQuoteSingles:Font, S12, w700
Gui, theEmailQuoteQuoteSingles:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailQuote, Back to Quote
Gui, theEmailQuoteQuoteSingles:Font, S18, w700
Gui, theEmailQuoteQuoteSingles:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Quote Singles
Gui, theEmailQuoteQuoteSingles:Font, S8, w700
Gui, theEmailQuoteQuoteSingles:Add, Text, center x12 y+10 w170, After copying this quote, using this hotkey will properly format the quote (excluding sizes ex: S-XL must still be applied, if necessary) and add singles value adds.
Gui, theEmailQuoteQuoteSingles:Font, S16, w700
Gui, theEmailQuoteQuoteSingles:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailQuoteQuoteSingles:Font, S12, w700
Gui, theEmailQuoteQuoteSingles:Add, Text, center ym-10 x12 y+15 w180 0x200,#quotesingles
Gui, theEmailQuoteQuoteSingles:Add, Text, center ym-10 x12 y+5 w180 0x200,or
Gui, theEmailQuoteQuoteSingles:Add, Text, center ym-10 x12 y+5 w180 0x200,#singlesquote
Gui, theEmailQuoteQuoteSingles:Font, underline S10, w700
Gui, theEmailQuoteQuoteSingles:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailQuoteQuoteSingles:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailQuoteQuoteSingles:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Quote Singles - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailQuote:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailQuoteQuoteSpec:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailQuoteQuoteSpec:+AlwaysOnTop
Gui, theEmailQuoteQuoteSpec:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailQuoteQuoteSpec:Color, FFFFFF
Gui, theEmailQuoteQuoteSpec:Font, S12, w700
Gui, theEmailQuoteQuoteSpec:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailQuote, Back to Quote
Gui, theEmailQuoteQuoteSpec:Font, S18, w700
Gui, theEmailQuoteQuoteSpec:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Quote Spec
Gui, theEmailQuoteQuoteSpec:Font, S8, w700
Gui, theEmailQuoteQuoteSpec:Add, Text, center x12 y+10 w170, After copying this quote, using this hotkey will properly format the quote (excluding sizes ex: S-XL must still be applied, if necessary) and add specialty value adds.
Gui, theEmailQuoteQuoteSpec:Font, S16, w700
Gui, theEmailQuoteQuoteSpec:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailQuoteQuoteSpec:Font, S12, w700
Gui, theEmailQuoteQuoteSpec:Add, Text, center ym-10 x12 y+15 w180 0x200,#quotespec
Gui, theEmailQuoteQuoteSpec:Add, Text, center ym-10 x12 y+5 w180 0x200,or
Gui, theEmailQuoteQuoteSpec:Add, Text, center ym-10 x12 y+5 w180 0x200,#specquote
Gui, theEmailQuoteQuoteSpec:Font, underline S10, w700
Gui, theEmailQuoteQuoteSpec:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailQuoteQuoteSpec:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailQuoteQuoteSpec:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Quote Spec - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailQuote:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailQuoteSleevePrice:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailQuoteSleevePrice:+AlwaysOnTop
Gui, theEmailQuoteSleevePrice:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailQuoteSleevePrice:Color, FFFFFF
Gui, theEmailQuoteSleevePrice:Font, S12, w700
Gui, theEmailQuoteSleevePrice:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailQuote, Back to Quote
Gui, theEmailQuoteSleevePrice:Font, S18, w700
Gui, theEmailQuoteSleevePrice:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Sleeve Price
Gui, theEmailQuoteSleevePrice:Font, S8, w700
Gui, theEmailQuoteSleevePrice:Add, Text, center x12 y+10 w170, I can definitely get you pricing on your sleeve print! The quote listed below has the pricing setup for your custom design with the sleeve print. Which sleeve would you like to have your design on? If we’re including text on the sleeve, would you like it sentenced up, sentenced down, or stacked? Please click on the link below to see those options: http://www.customink.com/help_center/print-on-the-sleeve Once I get this information back from you, I can make a note in your design!
Gui, theEmailQuoteSleevePrice:Font, S16, w700
Gui, theEmailQuoteSleevePrice:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailQuoteSleevePrice:Font, S14, w700
Gui, theEmailQuoteSleevePrice:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#sleeveprice
Gui, theEmailQuoteSleevePrice:Font, underline S10, w700
Gui, theEmailQuoteSleevePrice:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailQuoteSleevePrice:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailQuoteSleevePrice:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Sleeve Price - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailQuote:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailShipping:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailShipping:+AlwaysOnTop
Gui, theEmailShipping:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailShipping:Color, FFFFFF
Gui, theEmailShipping:Font, S12, w700
Gui, theEmailShipping:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmail, Back to Email
Gui, theEmailShipping:Font, underline S14, w700
Gui, theEmailShipping:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailShippingAllShipping v_AllShipping, All Shipping
Gui, theEmailShipping:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailShippingDD v_DD, Due Date
Gui, theEmailShipping:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailShippingInternational v_International, International
Gui, theEmailShipping:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailShippingRush v_Rush, Rush
Gui, theEmailShipping:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailShippingStandard v_Standard, Standard
Gui, theEmailShipping:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailShippingSuperRush v_SuperRush, Super Rush
Gui, theEmailShipping:Font, underline S10, w700
Gui, theEmailShipping:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailShipping:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailShipping:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Shipping - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmail:destroy
Gui, theEmailShippingAllShipping:destroy
Gui, theEmailShippingDD:destroy
Gui, theEmailShippingInternational:destroy
Gui, theEmailShippingQuickTurn:destroy
Gui, theEmailShippingRush:destroy
Gui, theEmailShippingStandard:destroy
Gui, theEmailShippingSuperRush:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailShippingAllShipping:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailShippingAllShipping:+AlwaysOnTop
Gui, theEmailShippingAllShipping:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailShippingAllShipping:Color, FFFFFF
Gui, theEmailShippingAllShipping:Font, S12, w700
Gui, theEmailShippingAllShipping:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailShipping, Back to Shipping
Gui, theEmailShippingAllShipping:Font, S18, w700
Gui, theEmailShippingAllShipping:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, All Shipping
Gui, theEmailShippingAllShipping:Font, S8, w700
Gui, theEmailShippingAllShipping:Add, Text, center x12 y+10 w170, I can definitely help with a breakdown of our delivery options! - We offer free, standard two-week delivery for your order, and two rush options if you need it faster! - Rush delivery guarantees your order arrives within 6 to 8 days, for an additional 10`% of your order total. - Super Rush delivery guarantees your order arrives in 5 or fewer days, for an additional 25`% of your order total.
Gui, theEmailShippingAllShipping:Font, S16, w700
Gui, theEmailShippingAllShipping:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailShippingAllShipping:Font, S14, w700
Gui, theEmailShippingAllShipping:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#allshipping
Gui, theEmailShippingAllShipping:Font, underline S10, w700
Gui, theEmailShippingAllShipping:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailShippingAllShipping:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailShippingAllShipping:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, All Shipping - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailShipping:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailShippingDD:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailShippingDD:+AlwaysOnTop
Gui, theEmailShippingDD:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailShippingDD:Color, FFFFFF
Gui, theEmailShippingDD:Font, S12, w700
Gui, theEmailShippingDD:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailShipping, Back to Shipping
Gui, theEmailShippingDD:Font, S18, w700
Gui, theEmailShippingDD:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Due Date
Gui, theEmailShippingDD:Font, S8, w700
Gui, theEmailShippingDD:Add, Text, center x12 y+10 w170, On what date were you looking to have your order arrive? We have a couple of options that begin with our free, standard 14-day delivery. This timeframe includes everything that happens once you place the order, including production. We also have rush delivery options available if you need your order sooner.
Gui, theEmailShippingDD:Font, S16, w700
Gui, theEmailShippingDD:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailShippingDD:Font, S14, w700
Gui, theEmailShippingDD:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#dd
Gui, theEmailShippingDD:Font, underline S10, w700
Gui, theEmailShippingDD:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailShippingDD:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailShippingDD:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Due Date - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailShipping:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailShippingInternational:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailShippingInternational:+AlwaysOnTop
Gui, theEmailShippingInternational:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailShippingInternational:Color, FFFFFF
Gui, theEmailShippingInternational:Font, S12, w700
Gui, theEmailShippingInternational:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailShipping, Back to Shipping
Gui, theEmailShippingInternational:Font, S18, w700
Gui, theEmailShippingInternational:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, International
Gui, theEmailShippingInternational:Font, S8, w700
Gui, theEmailShippingInternational:Add, Text, center x12 y+10 w170, At this time, we only ship internationally to Canada, or if the address is a US Army Post Office (APO), Fleet Post Office (FPO), or Diplomatic Post Office (DPO).
Gui, theEmailShippingInternational:Font, S16, w700
Gui, theEmailShippingInternational:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailShippingInternational:Font, S14, w700
Gui, theEmailShippingInternational:Add, Text, center ym-10 x12 y+15 w180 0x200,#international
Gui, theEmailShippingInternational:Add, Text, center ym-10 x12 y+5 w180 0x200,or
Gui, theEmailShippingInternational:Add, Text, center ym-10 x12 y+5 w180 0x200,#worldwide
Gui, theEmailShippingInternational:Font, underline S10, w700
Gui, theEmailShippingInternational:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailShippingInternational:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailShippingInternational:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, International - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailShipping:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailShippingQuickTurn:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailShippingQuickTurn:+AlwaysOnTop
Gui, theEmailShippingQuickTurn:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailShippingQuickTurn:Color, FFFFFF
Gui, theEmailShippingQuickTurn:Font, S12, w700
Gui, theEmailShippingQuickTurn:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailShipping, Back to Shipping
Gui, theEmailShippingQuickTurn:Font, S18, w700
Gui, theEmailShippingQuickTurn:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Quick Turn
Gui, theEmailShippingQuickTurn:Font, S8, w700
Gui, theEmailShippingQuickTurn:Add, Text, center x12 y+10 w170, Our Quicker Turn option guarantees your order is delivered within 9-11 days, with an additional cost of 5`% of your order total. 
Gui, theEmailShippingQuickTurn:Font, S16, w700
Gui, theEmailShippingQuickTurn:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailShippingQuickTurn:Font, S14, w700
Gui, theEmailShippingQuickTurn:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#qt
Gui, theEmailShippingQuickTurn:Font, underline S10, w700
Gui, theEmailShippingQuickTurn:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailShippingQuickTurn:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailShippingQuickTurn:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Quick Turn - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailShipping:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailShippingRush:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailShippingRush:+AlwaysOnTop
Gui, theEmailShippingRush:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailShippingRush:Color, FFFFFF
Gui, theEmailShippingRush:Font, S12, w700
Gui, theEmailShippingRush:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailShipping, Back to Shipping
Gui, theEmailShippingRush:Font, S18, w700
Gui, theEmailShippingRush:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Rush
Gui, theEmailShippingRush:Font, S8, w700
Gui, theEmailShippingRush:Add, Text, center x12 y+10 w170, Choosing Rush delivery guarantees your custom order is delivered within 6-8 days, for an additional cost of 10`% of your order total.
Gui, theEmailShippingRush:Font, S16, w700
Gui, theEmailShippingRush:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailShippingRush:Font, S14, w700
Gui, theEmailShippingRush:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#rush
Gui, theEmailShippingRush:Font, underline S10, w700
Gui, theEmailShippingRush:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailShippingRush:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailShippingRush:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Rush - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailShipping:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailShippingStandard:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailShippingStandard:+AlwaysOnTop
Gui, theEmailShippingStandard:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailShippingStandard:Color, FFFFFF
Gui, theEmailShippingStandard:Font, S12, w700
Gui, theEmailShippingStandard:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailShipping, Back to Shipping
Gui, theEmailShippingStandard:Font, S18, w700
Gui, theEmailShippingStandard:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Standard
Gui, theEmailShippingStandard:Font, S8, w700
Gui, theEmailShippingStandard:Add, Text, center x12 y+10 w170, With our free, standard delivery, your package is guaranteed to deliver within two weeks from when you pay.
Gui, theEmailShippingStandard:Font, S16, w700
Gui, theEmailShippingStandard:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailShippingStandard:Font, S14, w700
Gui, theEmailShippingStandard:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#standard
Gui, theEmailShippingStandard:Font, underline S10, w700
Gui, theEmailShippingStandard:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailShippingStandard:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailShippingStandard:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Standard - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailShipping:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailShippingSuperRush:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailShippingSuperRush:+AlwaysOnTop
Gui, theEmailShippingSuperRush:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailShippingSuperRush:Color, FFFFFF
Gui, theEmailShippingSuperRush:Font, S12, w700
Gui, theEmailShippingSuperRush:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailShipping, Back to Shipping
Gui, theEmailShippingSuperRush:Font, S18, w700
Gui, theEmailShippingSuperRush:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Super Rush
Gui, theEmailShippingSuperRush:Font, S8, w700
Gui, theEmailShippingSuperRush:Add, Text, center x12 y+10 w170, Our fastest delivery option is Super Rush, where we guarantee delivery within 5 days. This service is an additional cost of 25`% of your order total.
Gui, theEmailShippingSuperRush:Font, S16, w700
Gui, theEmailShippingSuperRush:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailShippingSuperRush:Font, S14, w700
Gui, theEmailShippingSuperRush:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#sr
Gui, theEmailShippingSuperRush:Font, underline S10, w700
Gui, theEmailShippingSuperRush:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailShippingSuperRush:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailShippingSuperRush:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Super Rush - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailShipping:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailSingles:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,

Gui, theEmailSingles:+AlwaysOnTop
Gui, theEmailSingles:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailSingles:Color, FFFFFF
Gui, theEmailSingles:Font, S12, w700
Gui, theEmailSingles:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmail, Back to Email
Gui, theEmailSingles:Font, underline S14, w700
Gui, theEmailSingles:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailSinglesCanadaSingles v_CanadaSingles, Canada Singles
Gui, theEmailSingles:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gEmailSinglesNoMinimum v_NoMinimum, No Minimum
Gui, theEmailSingles:Font, underline S10, w700
Gui, theEmailSingles:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailSingles:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailSingles:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Singles - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmail:destroy
Gui, theEmailSinglesCanadaSingles:destroy
Gui, theEmailSinglesNoMinimum:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailSinglesCanadaSingles:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailSinglesCanadaSingles:+AlwaysOnTop
Gui, theEmailSinglesCanadaSingles:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailSinglesCanadaSingles:Color, FFFFFF
Gui, theEmailSinglesCanadaSingles:Font, S12, w700
Gui, theEmailSinglesCanadaSingles:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailSingles, Back to Singles
Gui, theEmailSinglesCanadaSingles:Font, S18, w700
Gui, theEmailSinglesCanadaSingles:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Canada Singles
Gui, theEmailSinglesCanadaSingles:Font, S8, w700
Gui, theEmailSinglesCanadaSingles:Add, Text, center x12 y+10 w170, I'm really sorry, currently we aren't able to deliver fewer than six items to our customers in Canada. We can print your custom design on different styles, so it equals six total, if that would work better for you! I can even help you get that set up and go over the different options that are  available! Click on the link below to check out the options that are available for our Canadian customers: http://www.customink.com/categories/canada-products/64
Gui, theEmailSinglesCanadaSingles:Font, S16, w700
Gui, theEmailSinglesCanadaSingles:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailSinglesCanadaSingles:Font, S14, w700
Gui, theEmailSinglesCanadaSingles:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#canadasingles
Gui, theEmailSinglesCanadaSingles:Font, underline S10, w700
Gui, theEmailSinglesCanadaSingles:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailSinglesCanadaSingles:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailSinglesCanadaSingles:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Canada Singles - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailSingles:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

EmailSinglesNoMinimum:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theEmailSinglesNoMinimum:+AlwaysOnTop
Gui, theEmailSinglesNoMinimum:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theEmailSinglesNoMinimum:Color, FFFFFF
Gui, theEmailSinglesNoMinimum:Font, S12, w700
Gui, theEmailSinglesNoMinimum:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gEmailSingles, Back to Singles
Gui, theEmailSinglesNoMinimum:Font, S18, w700
Gui, theEmailSinglesNoMinimum:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, No Minimum
Gui, theEmailSinglesNoMinimum:Font, S8, w700
Gui, theEmailSinglesNoMinimum:Add, Text, center x12 y+10 w170, We have a selection of shirts that are available without a minimum, so you can print your custom design on as few as just one! If you click on the link below, you'll be able to check out those shirts and can choose any color shirt under "Color choices for any size order" category. http://www.customink.com/categories/no-minimum/96/styles
Gui, theEmailSinglesNoMinimum:Font, S16, w700
Gui, theEmailSinglesNoMinimum:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theEmailSinglesNoMinimum:Font, S14, w700
Gui, theEmailSinglesNoMinimum:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#minimum
Gui, theEmailSinglesNoMinimum:Font, underline S10, w700
Gui, theEmailSinglesNoMinimum:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theEmailSinglesNoMinimum:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theEmailSinglesNoMinimum:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, No Minimum - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theEmailSingles:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

Chat:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChat:+AlwaysOnTop
Gui, theChat:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChat:Color, FFFFFF
Gui, theChat:Font, underline S14, w700
Gui, theChat:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gMenu, Back to Menu
Gui, theChat:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatContent v_Content, Content
Gui, theChat:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatDesign v_Design, Design
Gui, theChat:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatDiscount v_Discount, Discount
Gui, theChat:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatGeneral v_General, General
Gui, theChat:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatGroup v_Group, Group
Gui, theChat:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatLiveEngage v_LiveEngage, LiveEngage
Gui, theChat:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatPostOrder v_PostOrder, Post-Order
Gui, theChat:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatPreOrder v_Pre_Order, Pre-Order
Gui, theChat:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatProblem v_Problem, Problem
Gui, theChat:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatProduct v_Product, Product
Gui, theChat:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatQuote v_Quote, Quote
Gui, theChat:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatShipping v_Shipping, Shipping
Gui, theChat:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatSingles v_Singles, Singles
Gui, theChat:Font, underline S10, w700
Gui, theChat:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChat:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChat:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Chat - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theIntro:destroy
Gui, theMenu:destroy
Gui, theChatContent:destroy
Gui, theChatDesign:destroy
Gui, theChatDesign2:destroy
Gui, theChatDiscount:destroy
Gui, theChatGeneral:destroy
Gui, theChatGeneral1:destroy
Gui, theChatGroup:destroy
Gui, theChatLiveEngage:destroy
Gui, theChatPreOrder:destroy
Gui, theChatPostOrder:destroy
Gui, theChatProblem:destroy
Gui, theChatProduct:destroy
Gui, theChatQuote:destroy
Gui, theChatShipping:destroy
Gui, theChatSingles:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatContent:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatContent:+AlwaysOnTop
Gui, theChatContent:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatContent:Color, FFFFFF
Gui, theChatContent:Font, S12, w700
Gui, theChatContent:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChat, Back to Chat
Gui, theChatContent:Font, underline S14, w700
Gui, theChatContent:Add, Text, center ym-10 x12 y+8 w180 h30 0x200 cBlue gChatContentBands v_Bands, Bands
Gui, theChatContent:Add, Text, center ym-10 x12 y+8 w180 h30 0x200 cBlue gChatContentCelebs v_Celebs, Celebs
Gui, theChatContent:Add, Text, center ym-10 x12 y+8 w180 h30 0x200 cBlue gChatContentCollegeNo v_CollegeNo, College/No
Gui, theChatContent:Add, Text, center ym-10 x12 y+8 w180 h30 0x200 cBlue gChatContentCollegeYes v_CollegeYes, College/Yes
Gui, theChatContent:Add, Text, center ym-10 x12 y+8 w180 h30 0x200 cBlue gChatContentContent v_Content, Content
Gui, theChatContent:Add, Text, center ym-10 x12 y+8 w180 h30 0x200 cBlue gChatContentDisney v_Disney, Disney
Gui, theChatContent:Add, Text, center ym-10 x12 y+8 w180 h30 0x200 cBlue gChatContentGreek v_Greek, Greek
Gui, theChatContent:Add, Text, center ym-10 x12 y+8 w180 h30 0x200 cBlue gChatContentOffensive v_Offensive, Offensive
Gui, theChatContent:Add, Text, center ym-10 x12 y+8 w180 h30 0x200 cBlue gChatContentSports v_Sports, Sports
Gui, theChatContent:Add, Text, center ym-10 x12 y+8 w180 h30 0x200 cBlue gChatContentVideoGames v_VideoGames, Video Games
Gui, theChatContent:Add, Text, center ym-10 x12 y+8 w180 h30 0x200 cBlue gChatContentWatermark v_Watermark, Watermark
Gui, theChatContent:Font, underline S10, w700
Gui, theChatContent:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatContent:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatContent:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Content - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatContentBands:destroy
Gui, theChatContentCelebs:destroy
Gui, theChatContentContent:destroy
Gui, theChatContentCollegeYes:destroy
Gui, theChatContentCollegeNo:destroy
Gui, theChatContentDisney:destroy
Gui, theChatContentGreek:destroy
Gui, theChatContentOffensive:destroy
Gui, theChatContentSports:destroy
Gui, theChatContentVideoGames:destroy
Gui, theChatContentWatermark:destroy
Gui, theChat:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatContentBands:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatContentBands:+AlwaysOnTop
Gui, theChatContentBands:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatContentBands:Color, FFFFFF
Gui, theChatContentBands:Font, S12, w700
Gui, theChatContentBands:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatContent, Back to Content
Gui, theChatContentBands:Font, S18, w700
Gui, theChatContentBands:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Bands
Gui, theChatContentBands:Font, S8, w700
Gui, theChatContentBands:Add, Text, center x12 y+10 w170, We have a selection of shirts available without a minimum, so you can print your custom design on as few as just one! Click here to check out those shirts and can choose any color shirt under the "Color choices for any size order" category.
Gui, theChatContentBands:Font, S16, w700
Gui, theChatContentBands:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatContentBands:Font, S14, w700
Gui, theChatContentBands:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#bands
Gui, theChatContentBands:Font, underline S10, w700
Gui, theChatContentBands:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatContentBands:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatContentBands:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Bands - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatContent:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatContentCelebs:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatContentCelebs:+AlwaysOnTop
Gui, theChatContentCelebs:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatContentCelebs:Color, FFFFFF
Gui, theChatContentCelebs:Font, S12, w700
Gui, theChatContentCelebs:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatContent, Back to Content
Gui, theChatContentCelebs:Font, S18, w700
Gui, theChatContentCelebs:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Celebs
Gui, theChatContentCelebs:Font, S8, w700
Gui, theChatContentCelebs:Add, Text, center x12 y+10 w170, I noticed that your design includes copyrighted content owned by a celebrity. We cannot print your design as it is right now but, with a few adjustments, I can make sure your design is still something special that won’t compete with official merchandise regulations.
Gui, theChatContentCelebs:Font, S16, w700
Gui, theChatContentCelebs:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatContentCelebs:Font, S14, w700
Gui, theChatContentCelebs:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#celebs
Gui, theChatContentCelebs:Font, underline S10, w700
Gui, theChatContentCelebs:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatContentCelebs:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatContentCelebs:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Celebs - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatContent:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatContentCollegeNo:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatContentCollegeNo:+AlwaysOnTop
Gui, theChatContentCollegeNo:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatContentCollegeNo:Color, FFFFFF
Gui, theChatContentCollegeNo:Font, S12, w700
Gui, theChatContentCollegeNo:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatContent, Back to Content
Gui, theChatContentCollegeNo:Font, S20, w700
Gui, theChatContentCollegeNo:Add, Text, center ym-10 x12 y159 w180 h50 0x200 cRed, College/No
Gui, theChatContentCollegeNo:Font, S8, w700
Gui, theChatContentCollegeNo:Add, Text, center x12 y209 w180, I noticed that your design uses collegiate content that is protected by copyright. Colleges can control the use of any names, mascots, and logos associated with the school. We are always working to become officially licensed with more schools but, at this time, we cannot print content from your particular institution. 
Gui, theChatContentCollegeNo:Font, S16, w700
Gui, theChatContentCollegeNo:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatContentCollegeNo:Font, S14, w700
Gui, theChatContentCollegeNo:Add, Text, center ym-10 x12 y+10 w180 h50 0x200, #collegeno
Gui, theChatContentCollegeNo:Font, underline S10, w700
Gui, theChatContentCollegeNo:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatContentCollegeNo:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatContentCollegeNo:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, College/No - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatContent:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatContentCollegeYes:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatContentCollegeYes:+AlwaysOnTop
Gui, theChatContentCollegeYes:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatContentCollegeYes:Color, FFFFFF
Gui, theChatContentCollegeYes:Font, S12, w700
Gui, theChatContentCollegeYes:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatContent, Back to Content
Gui, theChatContentCollegeYes:Font, S20, w700
Gui, theChatContentCollegeYes:Add, Text, center ym-10 x12 y159 w180 h50 0x200 cRed, College/Yes
Gui, theChatContentCollegeYes:Font, S8, w700
Gui, theChatContentCollegeYes:Add, Text, center x12 y209 w180, I noticed that your design uses collegiate content that is protected through copyright. Colleges can control the use of any names, mascots, and logos associated with the school. We have a team of specialists who will review your order to ensure that we can print your specific content in line with your school’s particular regulations. If we have questions or need clarification, we will reach out to you with more info.
Gui, theChatContentCollegeYes:Font, S16, w700
Gui, theChatContentCollegeYes:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatContentCollegeYes:Font, S14, w700
Gui, theChatContentCollegeYes:Add, Text, center ym-10 x12 y+10 w180 h50 0x200, #collegeyes
Gui, theChatContentCollegeYes:Font, underline S10, w700
Gui, theChatContentCollegeYes:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatContentCollegeYes:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatContentCollegeYes:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, College/Yes - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatContent:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatContentContent:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatContentContent:+AlwaysOnTop
Gui, theChatContentContent:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatContentContent:Color, FFFFFF
Gui, theChatContentContent:Font, S12, w700
Gui, theChatContentContent:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatContent, Back to Content
Gui, theChatContentContent:Font, S20, w700
Gui, theChatContentContent:Add, Text, center ym-10 x12 y159 w180 h50 0x200 cRed, Content
Gui, theChatContentContent:Font, S8, w700
Gui, theChatContentContent:Add, Text, center x12 y209 w180, Once an order is placed, all designs go through our review team to ensure we do not print any protected material without permission. If we have questions regarding your order, our team will be in contact with you to help find the best way to adjust your design.
Gui, theChatContentContent:Font, S16, w700
Gui, theChatContentContent:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatContentContent:Font, S14, w700
Gui, theChatContentContent:Add, Text, center ym-10 x12 y+10 w180 h50 0x200, #content
Gui, theChatContentContent:Font, underline S10, w700
Gui, theChatContentContent:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatContentContent:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatContentContent:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Content - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatContent:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatContentDisney:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatContentDisney:+AlwaysOnTop
Gui, theChatContentDisney:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatContentDisney:Color, FFFFFF
Gui, theChatContentDisney:Font, S12, w700
Gui, theChatContentDisney:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatContent, Back to Content
Gui, theChatContentDisney:Font, S18, w700
Gui, theChatContentDisney:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Disney
Gui, theChatContentDisney:Font, S8, w700
Gui, theChatContentDisney:Add, Text, center x12 y+10 w170, Disney protects its park names, characters, and all things Disney, so we need permission from a Disney licensing official to print any of their content. If you are not able to get written permission, we can adjust your design with something from our fantastic artwork collection. Can I send you a few alternate designs to review?
Gui, theChatContentDisney:Font, S16, w700
Gui, theChatContentDisney:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatContentDisney:Font, S14, w700
Gui, theChatContentDisney:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#disney
Gui, theChatContentDisney:Font, underline S10, w700
Gui, theChatContentDisney:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatContentDisney:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatContentDisney:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Disney - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatContent:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatContentGreek:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatContentGreek:+AlwaysOnTop
Gui, theChatContentGreek:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatContentGreek:Color, FFFFFF
Gui, theChatContentGreek:Font, S12, w700
Gui, theChatContentGreek:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatContent, Back to Content
Gui, theChatContentGreek:Font, S18, w700
Gui, theChatContentGreek:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Greek
Gui, theChatContentGreek:Font, S8, w700
Gui, theChatContentGreek:Add, Text, center x12 y+10 w170, All Greek orders go through a comprehensive review process to make sure the design follows your organization’s particular set of regulations for use. This process takes place after your order is placed but before we start printing your design. If we have any questions or clarifications, we’ll be in touch soon.
Gui, theChatContentGreek:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatContentGreek:Font, S14, w700
Gui, theChatContentGreek:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#greek
Gui, theChatContentGreek:Font, underline S10, w700
Gui, theChatContentGreek:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatContentGreek:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatContentGreek:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Greek - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatContent:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatContentOffensive:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatContentOffensive:+AlwaysOnTop
Gui, theChatContentOffensive:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatContentOffensive:Color, FFFFFF
Gui, theChatContentOffensive:Font, S12, w700
Gui, theChatContentOffensive:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatContent, Back to Content
Gui, theChatContentOffensive:Font, S18, w700
Gui, theChatContentOffensive:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Offensive
Gui, theChatContentOffensive:Font, S8, w700
Gui, theChatContentOffensive:Add, Text, center x12 y+10 w170, While reviewing your design, I noticed that it has content that does not follow the standards we set forth in our User Agreement. We will not print material that can be considered unlawful, harmful, threatening, abusive, harassing, tortuous, defamatory, vulgar, obscene, libelous, invasive of another's privacy, hateful, or racially, ethnically or otherwise objectionable. In order to move forward, we need to ___________________________.
Gui, theChatContentOffensive:Font, S16, w700
Gui, theChatContentOffensive:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatContentOffensive:Font, S14, w700
Gui, theChatContentOffensive:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#offensive
Gui, theChatContentOffensive:Font, underline S10, w700
Gui, theChatContentOffensive:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatContentOffensive:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatContentOffensive:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Offensive - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatContent:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatContentSports:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatContentSports:+AlwaysOnTop
Gui, theChatContentSports:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatContentSports:Color, FFFFFF
Gui, theChatContentSports:Font, S12, w700
Gui, theChatContentSports:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatContent, Back to Content
Gui, theChatContentSports:Font, S18, w700
Gui, theChatContentSports:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Sports
Gui, theChatContentSports:Font, S8, w700
Gui, theChatContentSports:Add, Text, center x12 y+10 w170, I noticed that your design includes copyrighted content owned by a sports franchise. We cannot print your design as it is right now but, with a few adjustments, I can make sure your design is still something special that won’t compete with official merchandise regulations. Can I send you a few alternate designs that would fix this issue?
Gui, theChatContentSports:Font, S16, w700
Gui, theChatContentSports:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatContentSports:Font, S14, w700
Gui, theChatContentSports:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#sports
Gui, theChatContentSports:Font, underline S10, w700
Gui, theChatContentSports:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatContentSports:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatContentSports:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Sports - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatContent:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatContentVideoGames:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatContentVideoGames:+AlwaysOnTop
Gui, theChatContentVideoGames:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatContentVideoGames:Color, FFFFFF
Gui, theChatContentVideoGames:Font, S12, w700
Gui, theChatContentVideoGames:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatContent, Back to Content
Gui, theChatContentVideoGames:Font, S18, w700
Gui, theChatContentVideoGames:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Video Games
Gui, theChatContentVideoGames:Font, S8, w700
Gui, theChatContentVideoGames:Add, Text, center x12 y+10 w170, I noticed that your design uses copyrighted content owned by a gaming company. Video game companies protect their logos, characters, promotional materials, and even screenshots from their games. To move forward, we will need written permission from someone at the company. If you are not able to get written permission, we can help you make adjustments to your design by replacing the content. Can I send you a few alternate designs that would fix this issue?
Gui, theChatContentVideoGames:Font, S16, w700
Gui, theChatContentVideoGames:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatContentVideoGames:Font, S14, w700
Gui, theChatContentVideoGames:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#videogames
Gui, theChatContentVideoGames:Font, underline S10, w700
Gui, theChatContentVideoGames:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatContentVideoGames:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatContentVideoGames:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Video Games - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatContent:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatContentWatermark:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatContentWatermark:+AlwaysOnTop
Gui, theChatContentWatermark:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatContentWatermark:Color, FFFFFF
Gui, theChatContentWatermark:Font, S12, w700
Gui, theChatContentWatermark:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatContent, Back to Content
Gui, theChatContentWatermark:Font, S18, w700
Gui, theChatContentWatermark:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Watermark
Gui, theChatContentWatermark:Font, S8, w700
Gui, theChatContentWatermark:Add, Text, center x12 y+10 w170, I noticed that your design uses content protected by a watermark. Companies and individuals protect the images they own with watermarks to prevent unauthorized use. To fix this, you have two options. You can purchase the artwork from the source and send us both the receipt and the new art file without the watermark or we can replace the artwork with something similar from our extensive art library. 
Gui, theChatContentWatermark:Font, S16, w700
Gui, theChatContentWatermark:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatContentWatermark:Font, S14, w700
Gui, theChatContentWatermark:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#watermark
Gui, theChatContentWatermark:Font, underline S10, w700
Gui, theChatContentWatermark:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatContentWatermark:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatContentWatermark:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Watermark - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatContent:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatDesign:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatDesign:+AlwaysOnTop
Gui, theChatDesign:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatDesign:Color, FFFFFF
Gui, theChatDesign:Font, S12, w700
Gui, theChatDesign:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChat, Back to Chat
Gui, theChatDesign:Font, underline S14, w700
Gui, theChatDesign:Add, Text, center ym-10 x12 y+8 w180 h25 0x200 cBlue gChatDesignBranding v_Branding, Branding
Gui, theChatDesign:Add, Text, center ym-10 x12 y+8 w180 h30 0x200 cBlue gChatDesignColorMax v_ColorMax, Color Max
Gui, theChatDesign:Add, Text, center ym-10 x12 y+8 w180 h25 0x200 cBlue gChatDesignCombineColors v_CombineColors, Combine Colors
Gui, theChatDesign:Add, Text, center ym-10 x12 y+8 w180 h25 0x200 cBlue gChatDesignCombineDesigns v_CombineDesigns, Combine Designs
Gui, theChatDesign:Add, Text, center ym-10 x12 y+8 w180 h25 0x200 cBlue gChatDesignCombineStyles v_CombineStyles, Combine Styles
Gui, theChatDesign:Add, Text, center ym-10 x12 y+8 w180 h25 0x200 cBlue gChatDesignDesignHelp v_DesignHelp, Design Help
Gui, theChatDesign:Add, Text, center ym-10 x12 y+8 w180 h25 0x200 cBlue gChatDesignDesigning v_Designing, Designing
Gui, theChatDesign:Add, Text, center ym-10 x12 y+8 w180 h25 0x200 cBlue gChatDesignDesignLink v_DesignLink, Design Link
Gui, theChatDesign:Add, Text, center ym-10 x12 y+8 w180 h25 0x200 cBlue gChatDesignDesignSaved v_DesignSaved, Design Saved
Gui, theChatDesign:Add, Text, center ym-10 x12 y+8 w180 h25 0x200 cBlue gChatDesignDesignTeam v_DesignTeam, Design Team
Gui, theChatDesign:Add, Text, center ym-10 x12 y+8 w180 h25 0x200 cBlue gChatDesignDPI v_DPI, DPI
Gui, theChatDesign:Add, Text, center ym-10 x12 y+8 w180 h25 0x200 cBlue gChatDesignDPIBulk v_DPIBulk, DPI Bulk
Gui, theChatDesign:Add, Text, center ym-10 x12 y+8 w180 h25 0x200 cBlue gChatDesignDPISingles v_DPISingles, DPI Singles
Gui, theChatDesign:Add, Text, center ym-10 x12 y+8 w180 h25 0x200 cBlue gChatDesignEmbroidery v_Embroidery, Embroidery
Gui, theChatDesign:Add, Text, center ym-10 x12 y+8 w180 h25 0x200 cBlue gChatDesignFiletypes v_Filetypes, Filetypes
Gui, theChatDesign:Font, underline S12, w700
Gui, theChatDesign:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatDesign2 v_ChatDesign2, Next
Gui, theChatDesign:Font, underline S10, w700
Gui, theChatDesign:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatDesign:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatDesign:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Design - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChat:destroy
Gui, theChatDesign2:destroy
Gui, theChatDesignBranding:destroy
Gui, theChatDesignColorMax:destroy
Gui, theChatDesignDesigning:destroy
Gui, theChatDesignCombineColors:destroy
Gui, theChatDesignCombineStyles:destroy
Gui, theChatDesignCombineDesigns:destroy
Gui, theChatDesignCreativeServices:destroy
Gui, theChatDesignCreativeServices1:destroy
Gui, theChatDesignCreativeServices2:destroy
Gui, theChatDesignDesignHelp:destroy
Gui, theChatDesignDesignLink:destroy
Gui, theChatDesignDesignSaved:destroy
Gui, theChatDesignDesignTeam:destroy
Gui, theChatDesignDPI:destroy
Gui, theChatDesignDPIBulk:destroy
Gui, theChatDesignDPIBulk1:destroy
Gui, theChatDesignDPI1:destroy
Gui, theChatDesignDPISingles:destroy
Gui, theChatDesignEmbroidery:destroy
Gui, theChatDesignFiletypes:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatDesignBranding:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatDesignBranding:+AlwaysOnTop
Gui, theChatDesignBranding:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatDesignBranding:Color, FFFFFF
Gui, theChatDesignBranding:Font, S12, w700
Gui, theChatDesignBranding:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatDesign, Back to Design
Gui, theChatDesignBranding:Font, S18, w700
Gui, theChatDesignBranding:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Branding
Gui, theChatDesignBranding:Font, S8, w700
Gui, theChatDesignBranding:Add, Text, center x12 y+10 w170, We print a small tagless Inky logo with care instructions on the inside collar of the shirt, as well as a removable hang tag. Are you okay with leaving these on the shirts, or would you prefer we remove them?
Gui, theChatDesignBranding:Font, S16, w700
Gui, theChatDesignBranding:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatDesignBranding:Font, S14, w700
Gui, theChatDesignBranding:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#branding
Gui, theChatDesignBranding:Font, underline S10, w700
Gui, theChatDesignBranding:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatDesignBranding:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatDesignBranding:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Branding - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatDesign:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatDesignColorMax:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatDesignColorMax:+AlwaysOnTop
Gui, theChatDesignColorMax:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatDesignColorMax:Color, FFFFFF
Gui, theChatDesignColorMax:Font, S12, w700
Gui, theChatDesignColorMax:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatDesign, Back to Design
Gui, theChatDesignColorMax:Font, S18, w700
Gui, theChatDesignColorMax:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Color Max
Gui, theChatDesignColorMax:Font, S8, w700
Gui, theChatDesignColorMax:Add, Text, center x12 y+10 w170, Our performance shirts are able to receive a maximum of two colors during the printing process. I can help pick the two best colors to keep in your design and have my design team make those adjustments to your artwork. After the order is placed, we’ll send you an email proof of any changes before we print. This is at no cost to you because, we want to make sure you're 100`% satisfied with your custom artwork.
Gui, theChatDesignColorMax:Font, S16, w700
Gui, theChatDesignColorMax:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatDesignColorMax:Font, S14, w700
Gui, theChatDesignColorMax:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#colormax
Gui, theChatDesignColorMax:Font, underline S10, w700
Gui, theChatDesignColorMax:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatDesignColorMax:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatDesignColorMax:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Color Max - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatDesign:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return


ChatDesignCombineColors:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatDesignCombineColors:+AlwaysOnTop
Gui, theChatDesignCombineColors:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatDesignCombineColors:Color, FFFFFF
Gui, theChatDesignCombineColors:Font, S12, w700
Gui, theChatDesignCombineColors:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatDesign, Back to Design
Gui, theChatDesignCombineColors:Font, S16, w700
Gui, theChatDesignCombineColors:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Combine Colors
Gui, theChatDesignCombineColors:Font, S8, w700
Gui, theChatDesignCombineColors:Add, Text, center x12 y+10 w170, You can definitely mix different colors of the same item in our Design Lab! If you click on "Your Items" you'll see the option to "Add Another Color" of the same item. If you like, I can open up your design and select these colors for you!
Gui, theChatDesignCombineColors:Font, S16, w700
Gui, theChatDesignCombineColors:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatDesignCombineColors:Font, S14, w700
Gui, theChatDesignCombineColors:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#combinecolors
Gui, theChatDesignCombineColors:Font, underline S10, w700
Gui, theChatDesignCombineColors:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatDesignCombineColors:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatDesignCombineColors:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Combine Colors - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatDesign:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatDesignCombineDesigns:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatDesignCombineDesigns:+AlwaysOnTop
Gui, theChatDesignCombineDesigns:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatDesignCombineDesigns:Color, FFFFFF
Gui, theChatDesignCombineDesigns:Font, S12, w700
Gui, theChatDesignCombineDesigns:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatDesign, Back to Design
Gui, theChatDesignCombineDesigns:Font, S16, w700
Gui, theChatDesignCombineDesigns:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Combine Designs
Gui, theChatDesignCombineDesigns:Font, S8, w700
Gui, theChatDesignCombineDesigns:Add, Text, center x12 y+10 w170, Our Design Lab can only work with one design at a time, but I can handle multiple designs for you on my end. If you'd like, we can work through the details of your order and, when you're ready I can take a single payment over the phone. Does that work for you?
Gui, theChatDesignCombineDesigns:Font, S16, w700
Gui, theChatDesignCombineDesigns:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatDesignCombineDesigns:Font, S14, w700
Gui, theChatDesignCombineDesigns:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#combinedesigns
Gui, theChatDesignCombineDesigns:Font, underline S10, w700
Gui, theChatDesignCombineDesigns:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatDesignCombineDesigns:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatDesignCombineDesigns:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Combine Designs - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatDesign:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatDesignCombineStyles:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatDesignCombineStyles:+AlwaysOnTop
Gui, theChatDesignCombineStyles:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatDesignCombineStyles:Color, FFFFFF
Gui, theChatDesignCombineStyles:Font, S12, w700
Gui, theChatDesignCombineStyles:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatDesign, Back to Design
Gui, theChatDesignCombineStyles:Font, S18, w700
Gui, theChatDesignCombineStyles:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Combine Styles
Gui, theChatDesignCombineStyles:Font, S8, w700
Gui, theChatDesignCombineStyles:Add, Text, center x12 y+10 w170, You can definitely mix and match different styles in the same order! The Design Lab allows you to add select styles that match the original item style you picked. If you're in the Design Lab, click on the "Items" tab and you'll be given the option to add another style to your order. Once you've selected the additional style, you'll see all the style options listed out with your created design on each one!
Gui, theChatDesignCombineStyles:Font, S16, w700
Gui, theChatDesignCombineStyles:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatDesignCombineStyles:Font, S14, w700
Gui, theChatDesignCombineStyles:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#combinestyles
Gui, theChatDesignCombineStyles:Font, underline S10, w700
Gui, theChatDesignCombineStyles:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatDesignCombineStyles:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatDesignCombineStyles:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Combine Styles - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatDesign:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatDesignDesignHelp:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatDesignDesignHelp:+AlwaysOnTop
Gui, theChatDesignDesignHelp:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatDesignDesignHelp:Color, FFFFFF
Gui, theChatDesignDesignHelp:Font, S12, w700
Gui, theChatDesignDesignHelp:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatDesign, Back to Design
Gui, theChatDesignDesignHelp:Font, S18, w700
Gui, theChatDesignDesignHelp:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Design Help
Gui, theChatDesignDesignHelp:Font, S8, w700
Gui, theChatDesignDesignHelp:Add, Text, center x12 y+10 w170, I'm happy to help you with your design today! Do you have your design currently saved in our Design Lab? If so, I can pull it up using your email address.
Gui, theChatDesignDesignHelp:Font, S16, w700
Gui, theChatDesignDesignHelp:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatDesignDesignHelp:Font, S14, w700
Gui, theChatDesignDesignHelp:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#designhelp
Gui, theChatDesignDesignHelp:Font, underline S10, w700
Gui, theChatDesignDesignHelp:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatDesignDesignHelp:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatDesignDesignHelp:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Design Help - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatDesign:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatDesignDesigning:
WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatDesignDesigning:+AlwaysOnTop
Gui, theChatDesignDesigning:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatDesignDesigning:Color, FFFFFF
Gui, theChatDesignDesigning:Font, S12, w700
Gui, theChatDesignDesigning:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatDesign, Back to Design
Gui, theChatDesignDesigning:Font, S18, w700
Gui, theChatDesignDesigning:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Designing
Gui, theChatDesignDesigning:Font, S8, w700
Gui, theChatDesignDesigning:Add, Text, center x12 y+10 w170, This design work will just take a few minutes, would you mind waiting with me or would you prefer that I email you the link to the design instead?
Gui, theChatDesignDesigning:Font, S16, w700
Gui, theChatDesignDesigning:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatDesignDesigning:Font, S14, w700
Gui, theChatDesignDesigning:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#designing
Gui, theChatDesignDesigning:Font, underline S10, w700
Gui, theChatDesignDesigning:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatDesignDesigning:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatDesignDesigning:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Designing - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatDesign:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatDesignDesignLink:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatDesignDesignLink:+AlwaysOnTop
Gui, theChatDesignDesignLink:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatDesignDesignLink:Color, FFFFFF
Gui, theChatDesignDesignLink:Font, S12, w700
Gui, theChatDesignDesignLink:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatDesign, Back to Design
Gui, theChatDesignDesignLink:Font, S18, w700
Gui, theChatDesignDesignLink:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Design Link
Gui, theChatDesignDesignLink:Font, S8, w700
Gui, theChatDesignDesignLink:Add, Text, center x12 y+10 w170, Please click on the link below to check out your design: *copied design link* I'm happy to make any changes you'd like to see! 
Gui, theChatDesignDesignLink:Font, S16, w700
Gui, theChatDesignDesignLink:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatDesignDesignLink:Font, S14, w700
Gui, theChatDesignDesignLink:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#designlink
Gui, theChatDesignDesignLink:Font, underline S10, w700
Gui, theChatDesignDesignLink:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatDesignDesignLink:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatDesignDesignLink:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Design Link - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatDesign:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatDesignDesignSaved:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatDesignDesignSaved:+AlwaysOnTop
Gui, theChatDesignDesignSaved:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatDesignDesignSaved:Color, FFFFFF
Gui, theChatDesignDesignSaved:Font, S12, w700
Gui, theChatDesignDesignSaved:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatDesign, Back to Design
Gui, theChatDesignDesignSaved:Font, S18, w700
Gui, theChatDesignDesignSaved:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Design Saved
Gui, theChatDesignDesignSaved:Font, S8, w700
Gui, theChatDesignDesignSaved:Add, Text, center x12 y+10 w170, I've saved your design and left notes under your account so we'll be able to pick up where we left off last time if you start a new chat. Feel free to ask for $!{operator.nickname} when you chat back in and I'll be happy to help!
Gui, theChatDesignDesignSaved:Font, S16, w700
Gui, theChatDesignDesignSaved:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatDesignDesignSaved:Font, S14, w700
Gui, theChatDesignDesignSaved:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#designsaved
Gui, theChatDesignDesignSaved:Font, underline S10, w700
Gui, theChatDesignDesignSaved:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatDesignDesignSaved:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatDesignDesignSaved:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Design Saved - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatDesign:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatDesignDesignTeam:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatDesignDesignTeam:+AlwaysOnTop
Gui, theChatDesignDesignTeam:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatDesignDesignTeam:Color, FFFFFF
Gui, theChatDesignDesignTeam:Font, S12, w700
Gui, theChatDesignDesignTeam:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatDesign, Back to Design
Gui, theChatDesignDesignTeam:Font, S18, w700
Gui, theChatDesignDesignTeam:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Design Team
Gui, theChatDesignDesignTeam:Font, S8, w700
Gui, theChatDesignDesignTeam:Add, Text, center x12 y+10 w170, I can definitely have our design team make adjustments to your artwork! Once you place your order with us, our design team will get started on those changes and we'll send you an proof email containing a proof of those changes that will require your approval before we print.
Gui, theChatDesignDesignTeam:Font, S16, w700
Gui, theChatDesignDesignTeam:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatDesignDesignTeam:Font, S14, w700
Gui, theChatDesignDesignTeam:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#designteam
Gui, theChatDesignDesignTeam:Font, underline S10, w700
Gui, theChatDesignDesignTeam:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatDesignDesignTeam:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatDesignDesignTeam:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Design Team - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatDesign:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatDesignDPI:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatDesignDPI:+AlwaysOnTop
Gui, theChatDesignDPI:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatDesignDPI:Color, FFFFFF
Gui, theChatDesignDPI:Font, S12, w700
Gui, theChatDesignDPI:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatDesign, Back to Design
Gui, theChatDesignDPI:Font, S18, w700
Gui, theChatDesignDPI:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, DPI
Gui, theChatDesignDPI:Font, S8, w700
Gui, theChatDesignDPI:Add, Text, center x12 y+10 w170, We're able to print your photo at a high quality by requiring a minimum resolution to print at the size you want it in your design. This guarantees your image will look great when we print. If your artwork needs to be at a specific size, but you don't have a higher resolution image available, for orders of 6 or more pieces we offer our free redraw service. After you place your order, with completed payment, our expert design team will redraw your design at any size you'd like in up to 4 colors and show you the design in a free proof email. We would then just need your approval of the design before we go to print.
Gui, theChatDesignDPI:Font, S11, w700
Gui, theChatDesignDPI:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cBlue gChatDesignDPI1, Next
Gui, theChatDesignDPI:Font, S16, w700
Gui, theChatDesignDPI:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatDesignDPI:Font, S14, w700
Gui, theChatDesignDPI:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#dpi
Gui, theChatDesignDPI:Font, underline S10, w700
Gui, theChatDesignDPI:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatDesignDPI:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatDesignDPI:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, DPI - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatDesign:destroy
Gui, theChatDesignDPI1:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatDesignDPIBulk:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatDesignDPIBulk:+AlwaysOnTop
Gui, theChatDesignDPIBulk:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatDesignDPIBulk:Color, FFFFFF
Gui, theChatDesignDPIBulk:Font, S12, w700
Gui, theChatDesignDPIBulk:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatDesign, Back to Design
Gui, theChatDesignDPIBulk:Font, S18, w700
Gui, theChatDesignDPIBulk:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, DPI Bulk
Gui, theChatDesignDPIBulk:Font, S8, w700
Gui, theChatDesignDPIBulk:Add, Text, center x12 y+10 w170, We can absolutely work with your photograph and transform it into a design on one of our products. The final printed design may depend on the quality of your image, the type of product you're interested in, and the style of design you're looking for. To guarantee your image will look great when we print it, we require a minimum resolution determined by the size of the printed design. Currently, your image is not at a high enough resolution to print at your desired size. Do you happen to have a higher-resolution image we can use instead? If not, we can create something for you in our Design Lab using our awesome artwork!
Gui, theChatDesignDPIBulk:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatDesignDPIBulk:Font, S14, w700
Gui, theChatDesignDPIBulk:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#dpibulk
Gui, theChatDesignDPIBulk:Font, underline S10, w700
Gui, theChatDesignDPIBulk:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatDesignDPIBulk:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatDesignDPIBulk:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, DPI Bulk - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatDesign:destroy
Gui, theChatDesignDPIBulk1:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy

Return

ChatDesignDPIBulk1:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatDesignDPIBulk1:+AlwaysOnTop
Gui, theChatDesignDPIBulk1:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatDesignDPIBulk1:Color, FFFFFF
Gui, theChatDesignDPIBulk1:Font, S12, w700
Gui, theChatDesignDPIBulk1:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatDesign, Back to Design
Gui, theChatDesignDPIBulk1:Font, S18, w700
Gui, theChatDesignDPIBulk1:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, DPI Bulk
Gui, theChatDesignDPIBulk1:Font, S8, w700
Gui, theChatDesignDPIBulk1:Add, Text, center x12 y+10 w170, We can absolutely work with your photograph and transform it into a design on one of our products. The final print we are able to execute may depend on the quality of your image, the type of product you're interested in, and the style of design you're looking for. We're able to print your photo at a high quality by requiring a minimum resolution to print at the size you want it in your design. This guarantees your image will look great when we print. Currently, your image is not at a high enough resolution to print at your current size. Do you happen to have a higher-resolution image we can use instead? If not, we can create something for you in our Design Lab using our awesome artwork! Gui, theChatDesignDPIBulk1:Font, S11, w700
Gui, theChatDesignDPIBulk1:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cBlue gChatDesignDPIBulk, Prev
Gui, theChatDesignDPIBulk1:Font, S16, w700
Gui, theChatDesignDPIBulk1:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatDesignDPIBulk1:Font, S14, w700
Gui, theChatDesignDPIBulk1:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#dpibulk
Gui, theChatDesignDPIBulk1:Font, underline S10, w700
Gui, theChatDesignDPIBulk1:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatDesignDPIBulk1:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatDesignDPIBulk1:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, DPI Bulk - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatDesign:destroy
Gui, theChatDesignDPIBulk:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy

Return

ChatDesignDPI1:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatDesignDPI1:+AlwaysOnTop
Gui, theChatDesignDPI1:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatDesignDPI1:Color, FFFFFF
Gui, theChatDesignDPI1:Font, S12, w700
Gui, theChatDesignDPI1:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatDesign, Back to Design
Gui, theChatDesignDPI1:Font, S18, w700
Gui, theChatDesignDPI1:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, DPI
Gui, theChatDesignDPI1:Font, S8, w700
Gui, theChatDesignDPI1:Add, Text, center x12 y+10 w170, Finally, if your image is not the best quality but halftone printing doesn't appeal to you (or you are looking for a more creative option), we can interpret your image through an artistic re-draw. Our artists can literally re-draw your photograph and make it into a dynamic graphic with multiple colors. We have multiple examples of these redraws to send you if you would like to see them beforehand. This option also gives the ability to control cost as you can pick the number of colors in the design.
Gui, theChatDesignDPI1:Font, S11, w700
Gui, theChatDesignDPI1:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cBlue gChatDesignDPI, Prev
Gui, theChatDesignDPI1:Font, S16, w700
Gui, theChatDesignDPI1:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatDesignDPI1:Font, S14, w700
Gui, theChatDesignDPI1:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#dpi
Gui, theChatDesignDPI1:Font, underline S10, w700
Gui, theChatDesignDPI1:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatDesignDPI1:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatDesignDPI1:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, DPI - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatDesign:destroy
Gui, theChatDesignDPI:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatDesignDPISingles:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatDesignDPISingles:+AlwaysOnTop
Gui, theChatDesignDPISingles:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatDesignDPISingles:Color, FFFFFF
Gui, theChatDesignDPISingles:Font, S12, w700
Gui, theChatDesignDPISingles:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatDesign, Back to Design
Gui, theChatDesignDPISingles:Font, S18, w700
Gui, theChatDesignDPISingles:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, DPI Singles
Gui, theChatDesignDPISingles:Font, S8, w700
Gui, theChatDesignDPISingles:Add, Text, center x12 y+10 w170, To guarantee your image will look great when we print it, we require a minimum resolution determined by the size of the printed design. Your image is not at a high enough resolution to print at your current size. Do you happen to have a higher-resolution image we can use instead? If not, we can create something for you in our Design Lab using our huge selection of artwork!
Gui, theChatDesignDPISingles:Font, S16, w700
Gui, theChatDesignDPISingles:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatDesignDPISingles:Font, S14, w700
Gui, theChatDesignDPISingles:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#dpisingles
Gui, theChatDesignDPISingles:Font, underline S10, w700
Gui, theChatDesignDPISingles:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatDesignDPISingles:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatDesignDPISingles:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, DPI Singles - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatDesign:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy

Return

ChatDesignEmbroidery:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatDesignEmbroidery:+AlwaysOnTop
Gui, theChatDesignEmbroidery:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatDesignEmbroidery:Color, FFFFFF
Gui, theChatDesignEmbroidery:Font, S12, w700
Gui, theChatDesignEmbroidery:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatDesign, Back to Design
Gui, theChatDesignEmbroidery:Font, S18, w700
Gui, theChatDesignEmbroidery:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Embroidery
Gui, theChatDesignEmbroidery:Font, S8, w700
Gui, theChatDesignEmbroidery:Add, Text, center x12 y+10 w170, We are able to embroider your custom design on up to a 5"x5" area on many of our items. Our embroidery process works best with designs that contain thick lines and simple detail. If needed, we can have our production team help tweak your design to make sure that it will look great when embroidered.
Gui, theChatDesignEmbroidery:Font, S16, w700
Gui, theChatDesignEmbroidery:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatDesignEmbroidery:Font, S14, w700
Gui, theChatDesignEmbroidery:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#embroidery
Gui, theChatDesignEmbroidery:Font, underline S10, w700
Gui, theChatDesignEmbroidery:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatDesignEmbroidery:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatDesignEmbroidery:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Embroidery - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatDesign:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatDesignFiletypes:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatDesignFiletypes:+AlwaysOnTop
Gui, theChatDesignFiletypes:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatDesignFiletypes:Color, FFFFFF
Gui, theChatDesignFiletypes:Font, S12, w700
Gui, theChatDesignFiletypes:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatDesign, Back to Design
Gui, theChatDesignFiletypes:Font, S18, w700
Gui, theChatDesignFiletypes:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Filetypes
Gui, theChatDesignFiletypes:Font, S8, w700
Gui, theChatDesignFiletypes:Add, Text, center x12 y+10 w170, You can upload many image file types into our Design Lab, including: jpeg, jpg, gif, bmp, pdf, ai, psd. If you're working with a different file type, including: doc, ppt, zip file or any other format, please respond to this email with that artwork attached and I'll take care of it for you!
Gui, theChatDesignFiletypes:Font, S16, w700
Gui, theChatDesignFiletypes:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatDesignFiletypes:Font, S14, w700
Gui, theChatDesignFiletypes:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#filetypes
Gui, theChatDesignFiletypes:Font, underline S10, w700
Gui, theChatDesignFiletypes:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatDesignFiletypes:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatDesignFiletypes:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Filetypes - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatDesign:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatDesignInkChange:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatDesignInkChange:+AlwaysOnTop
Gui, theChatDesignInkChange:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatDesignInkChange:Color, FFFFFF
Gui, theChatDesignInkChange:Font, S12, w700
Gui, theChatDesignInkChange:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatDesign2, Back to Design
Gui, theChatDesignInkChange:Font, S18, w700
Gui, theChatDesignInkChange:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Ink Change
Gui, theChatDesignInkChange:Font, S8, w700
Gui, theChatDesignInkChange:Add, Text, center x12 y+10 w170,We can definitely use different ink colors within your order! We will need to use each ink color on at least 6 items in your order, and there is a $10 change  for each color change. You get one free ink change for every $200 spent in your order, so most of the time there is one built in for free.  If you give us a call at 800-293-4232 when it's time to order, we’ll be happy to see that those ink changes are applied.
Gui, theChatDesignInkChange:Font, S16, w700
Gui, theChatDesignInkChange:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatDesignInkChange:Font, S14, w700
Gui, theChatDesignInkChange:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#inkchange
Gui, theChatDesignInkChange:Font, underline S10, w700
Gui, theChatDesignInkChange:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatDesignInkChange:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatDesignInkChange:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Ink Change - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatDesign2:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatDesignPers:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatDesignPers:+AlwaysOnTop
Gui, theChatDesignPers:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatDesignPers:Color, FFFFFF
Gui, theChatDesignPers:Font, S12, w700
Gui, theChatDesignPers:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatDesign2, Back to Design
Gui, theChatDesignPers:Font, S18, w700
Gui, theChatDesignPers:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, PERS
Gui, theChatDesignPers:Font, S8, w700
Gui, theChatDesignPers:Add, Text, center x12 y+10 w170, Our basic guidelines are $4.50 per personalized name, and $2.50 per personalized number. Did you already have a list of your names prepared? If so, I can take a look and finalize the pricing for you.
Gui, theChatDesignPers:Font, S16, w700
Gui, theChatDesignPers:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatDesignPers:Font, S14, w700
Gui, theChatDesignPers:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#pers
Gui, theChatDesignPers:Font, underline S10, w700
Gui, theChatDesignPers:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatDesignPers:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatDesignPers:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, PERS - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatDesign2:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatDesignPMS:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatDesignPMS:+AlwaysOnTop
Gui, theChatDesignPMS:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatDesignPMS:Color, FFFFFF
Gui, theChatDesignPMS:Font, S12, w700
Gui, theChatDesignPMS:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatDesign2, Back to Design
Gui, theChatDesignPMS:Font, S18, w700
Gui, theChatDesignPMS:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, PMS
Gui, theChatDesignPMS:Font, S8, w700
Gui, theChatDesignPMS:Add, Text, center x12 y+10 w170, We are definitely able to match your exact color preferences when screenprinting if you have a PMS pantone code that we can use for the ink. For this service, there is a $10 charge for each color match, with one free pantone match for every $200 spent.
Gui, theChatDesignPMS:Font, S16, w700
Gui, theChatDesignPMS:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatDesignPMS:Font, S14, w700
Gui, theChatDesignPMS:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#pms
Gui, theChatDesignPMS:Font, underline S10, w700
Gui, theChatDesignPMS:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatDesignPMS:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatDesignPMS:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, PMS - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatDesign2:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatDesignPMSDigital:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatDesignPMSDigital:+AlwaysOnTop
Gui, theChatDesignPMSDigital:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatDesignPMSDigital:Color, FFFFFF
Gui, theChatDesignPMSDigital:Font, S12, w700
Gui, theChatDesignPMSDigital:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatDesign2, Back to Design
Gui, theChatDesignPMSDigital:Font, S18, w700
Gui, theChatDesignPMSDigital:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, PMS Digital
Gui, theChatDesignPMSDigital:Font, S8, w700
Gui, theChatDesignPMSDigital:Add, Text, center x12 y+10 w170, With your upcoming order, we need to use a digital method to bring your design to life. With that method we aren't able to guarantee PMS matches. The ink is set to match the colors as closely as possible, but we would not be able to guarantee an exact match.
Gui, theChatDesignPMSDigital:Font, S16, w700
Gui, theChatDesignPMSDigital:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatDesignPMSDigital:Font, S14, w700
Gui, theChatDesignPMSDigital:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#pmsdigital
Gui, theChatDesignPMSDigital:Font, underline S10, w700
Gui, theChatDesignPMSDigital:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatDesignPMSDigital:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatDesignPMSDigital:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, PMS Digital - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatDesign2:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatDesignPPS:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatDesignPPS:+AlwaysOnTop
Gui, theChatDesignPPS:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatDesignPPS:Color, FFFFFF
Gui, theChatDesignPPS:Font, S12, w700
Gui, theChatDesignPPS:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatDesign2, Back to Design
Gui, theChatDesignPPS:Font, S18, w700
Gui, theChatDesignPPS:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, PPS
Gui, theChatDesignPPS:Font, S8, w700
Gui, theChatDesignPPS:Add, Text, center x12 y+10 w170, After you place an order with us for 250+ items or your order total is $2,500+, we send a printed pre-production sample. You can pick out the size and we'll get you a real printed shirt in about a week. With your approval, we will then complete printing for the rest of your order. If you don’t qualify for a free sample, you can  have one made for $75.
Gui, theChatDesignPPS:Font, S16, w700
Gui, theChatDesignPPS:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatDesignPPS:Font, S14, w700
Gui, theChatDesignPPS:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#PPS
Gui, theChatDesignPPS:Font, underline S10, w700
Gui, theChatDesignPPS:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatDesignPPS:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatDesignPPS:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, PPS - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatDesign2:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatDesignRedraw:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatDesignRedraw:+AlwaysOnTop
Gui, theChatDesignRedraw:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatDesignRedraw:Color, FFFFFF
Gui, theChatDesignRedraw:Font, S12, w700
Gui, theChatDesignRedraw:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatDesign2, Back to Design
Gui, theChatDesignRedraw:Font, S18, w700
Gui, theChatDesignRedraw:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Redraw
Gui, theChatDesignRedraw:Font, S8, w700
Gui, theChatDesignRedraw:Add, Text, center x12 y+10 w170, After your order is placed, we can have our expert design team redraw your design to ensure a high quality print! You'll see the artwork changes in the free picture proof email that we send you before we go to print.
Gui, theChatDesignRedraw:Font, S16, w700
Gui, theChatDesignRedraw:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatDesignRedraw:Font, S14, w700
Gui, theChatDesignRedraw:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#redraw
Gui, theChatDesignRedraw:Font, underline S10, w700
Gui, theChatDesignRedraw:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatDesignRedraw:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatDesignRedraw:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Redraw - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatDesign2:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatDesign2:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatDesign2:+AlwaysOnTop
Gui, theChatDesign2:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatDesign2:Color, FFFFFF
Gui, theChatDesign2:Font, S12, w700
Gui, theChatDesign2:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChat, Back to Chat
Gui, theChatDesign2:Font, underline S14, w700
Gui, theChatDesign2:Add, Text, center ym-10 x12 y+8 w180 h25 0x200 cBlue gChatDesignInkChange v_InkChange, Ink Change
Gui, theChatDesign2:Add, Text, center ym-10 x12 y+8 w180 h25 0x200 cBlue gChatDesignPers v_Pers, PERS
Gui, theChatDesign2:Add, Text, center ym-10 x12 y+8 w180 h25 0x200 cBlue gChatDesignPMS v_PMS, PMS
Gui, theChatDesign2:Add, Text, center ym-10 x12 y+8 w180 h25 0x200 cBlue gChatDesignPMSDigital v_PMSDigital, PMS Digital
Gui, theChatDesign2:Add, Text, center ym-10 x12 y+8 w180 h25 0x200 cBlue gChatDesignPPS v_PPS, PPS
Gui, theChatDesign2:Add, Text, center ym-10 x12 y+8 w180 h25 0x200 cBlue gChatDesignRetrieve v_Retrieve, Retrieve
Gui, theChatDesign2:Add, Text, center ym-10 x12 y+8 w180 h25 0x200 cBlue gChatDesignRotate v_Rotate, Rotate
Gui, theChatDesign2:Add, Text, center ym-10 x12 y+8 w180 h25 0x200 cBlue gChatDesignRedraw v_Redraw, Redraw
Gui, theChatDesign2:Add, Text, center ym-10 x12 y+8 w180 h30 0x200 cBlue gChatDesignSleeveHelp v_SleeveHelp, Sleeve Help
Gui, theChatDesign2:Add, Text, center ym-10 x12 y+8 w180 h25 0x200 cBlue gChatDesignSpVsDig v_SpVsDig, SP vs Digital
Gui, theChatDesign2:Add, Text, center ym-10 x12 y+8 w180 h30 0x200 cBlue gChatDesignSubtleBlank v_SubtleBlank, Subtle Blank
Gui, theChatDesign2:Add, Text, center ym-10 x12 y+8 w180 h30 0x200 cBlue gChatDesignSubtleInk v_SubtleInk, Subtle Ink
Gui, theChatDesign2:Add, Text, center ym-10 x12 y+8 w180 h30 0x200 cBlue gChatDesignUploadHelp v_UploadHelp, Upload Help
Gui, theChatDesign2:Add, Text, center ym-10 x12 y+8 w180 h30 0x200 cBlue gChatDesignUploadWhite v_UploadWhite, Upload White
Gui, theChatDesign2:Add, Text, center ym-10 x12 y+8 w180 h30 0x200 cBlue gChatDesignVSS v_VSS, VSS
Gui, theChatDesign2:Font, underline S12, w700
Gui, theChatDesign2:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatDesign v_ChatDesign, Previous
Gui, theChatDesign2:Font, underline S10, w700
Gui, theChatDesign2:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatDesign2:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatDesign2:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Design - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChat:destroy
Gui, theChatDesign:destroy
Gui, theChatDesignPers:destroy
Gui, theChatDesignSpVsDig:destroy
Gui, theChatDesignInkChange:destroy
Gui, theChatDesignPMS:destroy
Gui, theChatDesignPMSDigital:destroy
Gui, theChatDesignPPS:destroy
Gui, theChatDesignRedraw:destroy
Gui, theChatDesignRetrieve:destroy
Gui, theChatDesignRotate:destroy
Gui, theChatDesignSample:destroy
Gui, theChatDesignSleeveHelp:destroy
Gui, theChatDesignSubtleBlank:destroy
Gui, theChatDesignSubtleInk:destroy
Gui, theChatDesignUploadHelp:destroy
Gui, theChatDesignUploadWhite:destroy
Gui, theChatDesignVSS:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatDesignRetrieve:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatDesignRetrieve:+AlwaysOnTop
Gui, theChatDesignRetrieve:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatDesignRetrieve:Color, FFFFFF
Gui, theChatDesignRetrieve:Font, S12, w700
Gui, theChatDesignRetrieve:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatDesign2, Back to Design
Gui, theChatDesignRetrieve:Font, S18, w700
Gui, theChatDesignRetrieve:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Retrieve
Gui, theChatDesignRetrieve:Font, S8, w700
Gui, theChatDesignRetrieve:Add, Text, center x12 y+10 w170, I can pull your design up here with your email address. May I have the name of your design?
Gui, theChatDesignRetrieve:Font, S16, w700
Gui, theChatDesignRetrieve:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatDesignRetrieve:Font, S14, w700
Gui, theChatDesignRetrieve:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#retrieve
Gui, theChatDesignRetrieve:Font, underline S10, w700
Gui, theChatDesignRetrieve:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatDesignRetrieve:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatDesignRetrieve:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Retrieve - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatDesign2:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatDesignRotate:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatDesignRotate:+AlwaysOnTop
Gui, theChatDesignRotate:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatDesignRotate:Color, FFFFFF
Gui, theChatDesignRotate:Font, S12, w700
Gui, theChatDesignRotate:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatDesign2, Back to Design
Gui, theChatDesignRotate:Font, S18, w700
Gui, theChatDesignRotate:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Rotate
Gui, theChatDesignRotate:Font, S8, w700
Gui, theChatDesignRotate:Add, Text, center x12 y+10 w170, I can definitely help you move your design from front to back in the Design Lab! If you look directly above the image, you'll notice a red button that says "Rotate". If you click that button, you can continue to work on the opposite side.
Gui, theChatDesignRotate:Font, S16, w700
Gui, theChatDesignRotate:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatDesignRotate:Font, S14, w700
Gui, theChatDesignRotate:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#rotate
Gui, theChatDesignRotate:Font, underline S10, w700
Gui, theChatDesignRotate:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatDesignRotate:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatDesignRotate:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Rotate - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatDesign2:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatDesignSample:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatDesignSample:+AlwaysOnTop
Gui, theChatDesignSample:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatDesignSample:Color, FFFFFF
Gui, theChatDesignSample:Font, S12, w700
Gui, theChatDesignSample:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatDesign2, Back to Design
Gui, theChatDesignSample:Font, S18, w700
Gui, theChatDesignSample:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Sample
Gui, theChatDesignSample:Font, S8, w700
Gui, theChatDesignSample:Add, Text, center x12 y+10 w170, If you would like, I’m happy to get you set up with a blank sample of the items that you're considering! This allows you to check out the fit and feel before you place your printed order with us! We offer these blank samples at a low cost and can have them delivered to you within a week with our free shipping. Would that work for you?Gui, theChatDesignSample:Font, S16, w700
Gui, theChatDesignSample:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatDesignSample:Font, S14, w700
Gui, theChatDesignSample:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#sample
Gui, theChatDesignSample:Font, underline S10, w700
Gui, theChatDesignSample:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatDesignSample:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatDesignSample:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Sample - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatDesign2:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatDesignSleeveHelp:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatDesignSleeveHelp:+AlwaysOnTop
Gui, theChatDesignSleeveHelp:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatDesignSleeveHelp:Color, FFFFFF
Gui, theChatDesignSleeveHelp:Font, S12, w700
Gui, theChatDesignSleeveHelp:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatDesign2, Back to Design
Gui, theChatDesignSleeveHelp:Font, S18, w700
Gui, theChatDesignSleeveHelp:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Sleeve Help
Gui, theChatDesignSleeveHelp:Font, S8, w700
Gui, theChatDesignSleeveHelp:Add, Text, center x12 y+10 w170, I'm happy to help you with your sleeve print! Our Design Lab is not currently setup to show you what your sleeve print would look like, but I can make a note that you are interested in sleeve printing in your account. After you place your order and complete payment, our design team will send you a free proof email and you'll be able to see how that sleeve design looks.
Gui, theChatDesignSleeveHelp:Font, S16, w700
Gui, theChatDesignSleeveHelp:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatDesignSleeveHelp:Font, S14, w700
Gui, theChatDesignSleeveHelp:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#sleevehelp
Gui, theChatDesignSleeveHelp:Font, underline S10, w700
Gui, theChatDesignSleeveHelp:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatDesignSleeveHelp:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatDesignSleeveHelp:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Sleeve Help - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatDesign2:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatDesignSpVsDig:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatDesignSpVsDig:+AlwaysOnTop
Gui, theChatDesignSpVsDig:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatDesignSpVsDig:Color, FFFFFF
Gui, theChatDesignSpVsDig:Font, S12, w700
Gui, theChatDesignSpVsDig:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatDesign2, Back to Design
Gui, theChatDesignSpVsDig:Font, S18, w700
Gui, theChatDesignSpVsDig:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, SP vs Dig
Gui, theChatDesignSpVsDig:Font, S8, w700
Gui, theChatDesignSpVsDig:Add, Text, center x12 y+10 w170, CustomInk offers two different methods of printing, depending on what best suits your artwork. We offer traditional screen printing for the majority of our products, as well as digital printing on selected items. Screen printing involves creating a stencil (printers call this a "screen"), and then using that stencil to apply layers of different color inks. Digital printing is a much newer process by which your artwork is processed by a computer, and then printed in ink directly onto the surface of your product. Digital printing is not a heat transfer or applique, as the ink is directly applied to the fabric of your shirt.
Gui, theChatDesignSpVsDig:Font, S16, w700
Gui, theChatDesignSpVsDig:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatDesignSpVsDig:Font, S14, w700
Gui, theChatDesignSpVsDig:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#spvsdig
Gui, theChatDesignSpVsDig:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatDesignSpVsDig:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatDesignSpVsDig:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Sleeve Help - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatDesign2:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatDesignSubtleBlank:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatDesignSubtleBlank:+AlwaysOnTop
Gui, theChatDesignSubtleBlank:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatDesignSubtleBlank:Color, FFFFFF
Gui, theChatDesignSubtleBlank:Font, S12, w700
Gui, theChatDesignSubtleBlank:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatDesign2, Back to Design
Gui, theChatDesignSubtleBlank:Font, S18, w700
Gui, theChatDesignSubtleBlank:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Subtle Blank
Gui, theChatDesignSubtleBlank:Font, S8, w700
Gui, theChatDesignSubtleBlank:Add, Text, center x12 y+10 w170, While reviewing your design, I noticed that we're using ***color ink*** that can appear subtle on the ***color item*** on which we're printing. If you'd like, I'd be happy to go over some alternatives that would have a better contrast.
Gui, theChatDesignSubtleBlank:Font, S16, w700
Gui, theChatDesignSubtleBlank:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatDesignSubtleBlank:Font, S14, w700
Gui, theChatDesignSubtleBlank:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#subtleblank
Gui, theChatDesignSubtleBlank:Font, underline S10, w700
Gui, theChatDesignSubtleBlank:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatDesignSubtleBlank:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatDesignSubtleBlank:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Subtle Blank - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatDesign2:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatDesignSubtleInk:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatDesignSubtleInk:+AlwaysOnTop
Gui, theChatDesignSubtleInk:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatDesignSubtleInk:Color, FFFFFF
Gui, theChatDesignSubtleInk:Font, S12, w700
Gui, theChatDesignSubtleInk:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatDesign2, Back to Design
Gui, theChatDesignSubtleInk:Font, S18, w700
Gui, theChatDesignSubtleInk:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Subtle Ink
Gui, theChatDesignSubtleInk:Font, S8, w700
Gui, theChatDesignSubtleInk:Add, Text, center x12 y+10 w170, While reviewing your design, I noticed that the ***ink colors*** may appear subtle when used together. If you'd like, I'd be happy to go over some alternatives that would have a better contrast.
Gui, theChatDesignSubtleInk:Font, S16, w700
Gui, theChatDesignSubtleInk:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatDesignSubtleInk:Font, S14, w700
Gui, theChatDesignSubtleInk:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#subtleink
Gui, theChatDesignSubtleInk:Font, underline S10, w700
Gui, theChatDesignSubtleInk:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatDesignSubtleInk:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatDesignSubtleInk:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Subtle Ink - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatDesign2:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatDesignUploadHelp:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatDesignUploadHelp:+AlwaysOnTop
Gui, theChatDesignUploadHelp:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatDesignUploadHelp:Color, FFFFFF
Gui, theChatDesignUploadHelp:Font, S12, w700
Gui, theChatDesignUploadHelp:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatDesign2, Back to Design
Gui, theChatDesignUploadHelp:Font, S18, w700
Gui, theChatDesignUploadHelp:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Upload Help
Gui, theChatDesignUploadHelp:Font, S8, w700
Gui, theChatDesignUploadHelp:Add, Text, center x12 y+10 w170, I'm happy to upload your artwork into our Design Lab. If you can respond to the email I'm sending with your artwork attached, I’ll take it from there! Of course, if there are any adjustments or changes you would like me to make to your artwork, feel free to include those details and I’ll take care of those as well.
Gui, theChatDesignUploadHelp:Font, S16, w700
Gui, theChatDesignUploadHelp:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatDesignUploadHelp:Font, S14, w700
Gui, theChatDesignUploadHelp:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#uploadhelp
Gui, theChatDesignUploadHelp:Font, underline S10, w700
Gui, theChatDesignUploadHelp:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatDesignUploadHelp:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatDesignUploadHelp:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Upload Help - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatDesign2:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatDesignUploadWhite:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatDesignUploadWhite:+AlwaysOnTop
Gui, theChatDesignUploadWhite:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatDesignUploadWhite:Color, FFFFFF
Gui, theChatDesignUploadWhite:Font, S12, w700
Gui, theChatDesignUploadWhite:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatDesign2, Back to Design
Gui, theChatDesignUploadWhite:Font, S18, w700
Gui, theChatDesignUploadWhite:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Upload White
Gui, theChatDesignUploadWhite:Font, S8, w700
Gui, theChatDesignUploadWhite:Add, Text, center x12 y+10 w170, Sometimes our Design Lab registers white as a background color and removes it from the image. Please feel free to attach your art in your response to this email and I can take care of it for you. If you would like to continue working on this by yourself, change your design color to black and then upload it into the Lab again. It will allow you to upload it and then change the color back to white (or any color you want)!
Gui, theChatDesignUploadWhite:Font, S16, w700
Gui, theChatDesignUploadWhite:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatDesignUploadWhite:Font, S14, w700
Gui, theChatDesignUploadWhite:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#uploadwhite
Gui, theChatDesignUploadWhite:Font, underline S10, w700
Gui, theChatDesignUploadWhite:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatDesignUploadWhite:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatDesignUploadWhite:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Upload White - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatDesign2:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatDesignVSS:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatDesignVSS:+AlwaysOnTop
Gui, theChatDesignVSS:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatDesignVSS:Color, FFFFFF
Gui, theChatDesignVSS:Font, S12, w700
Gui, theChatDesignVSS:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatDesign2, Back to Design
Gui, theChatDesignVSS:Font, S18, w700
Gui, theChatDesignVSS:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, VSS
Gui, theChatDesignVSS:Font, S8, w700
Gui, theChatDesignVSS:Add, Text, center x12 y+10 w170, To print your order, we need to have your design sized the same on all shirts in your order. This means the design may look a bit large on the smaller sizes, and small on the larger sizes. The link below gives you an idea of what I mean: http://www.customink.com/help_center/designs-on-different-sizes We do have an option to make an additional setup to print on the smaller sizes in your order for an additional cost. If you’re interested in doing so, I can give you a quote how much that would cost.
Gui, theChatDesignVSS:Font, S16, w700
Gui, theChatDesignVSS:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatDesignVSS:Font, S14, w700
Gui, theChatDesignVSS:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#vss
Gui, theChatDesignVSS:Font, underline S10, w700
Gui, theChatDesignVSS:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatDesignVSS:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatDesignVSS:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, VSS - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatDesign2:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatDiscount:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatDiscount:+AlwaysOnTop
Gui, theChatDiscount:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatDiscount:Color, FFFFFF
Gui, theChatDiscount:Font, S12, w700
Gui, theChatDiscount:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChat, Back to Chat
Gui, theChatDiscount:Font, underline S14, w700
Gui, theChatDiscount:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatDiscountBooster v_Booster, Booster
;Gui, theChatDiscount:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatDiscountCharity v_Charity, Charity
Gui, theChatDiscount:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatDiscountDiscount v_Discount, Discount
;Gui, theChatDiscount:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatDiscountPear v_Pear, Pear
Gui, theChatDiscount:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatDiscountPriceHelp v_PriceHelp, Price Help
Gui, theChatDiscount:Font, underline S10, w700
Gui, theChatDiscount:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatDiscount:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatDiscount:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Discount - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChat:destroy
Gui, theChatDiscountBooster:destroy
Gui, theChatDiscountCharity:destroy
Gui, theChatDiscountDiscount:destroy
Gui, theChatDiscountPear:destroy
Gui, theChatDiscountPriceHelp:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatDiscountBooster:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatDiscountBooster:+AlwaysOnTop
Gui, theChatDiscountBooster:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatDiscountBooster:Color, FFFFFF
Gui, theChatDiscountBooster:Font, S12, w700
Gui, theChatDiscountBooster:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatDiscount, Back to Discount
Gui, theChatDiscountBooster:Font, S18, w700
Gui, theChatDiscountBooster:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Booster
Gui, theChatDiscountBooster:Font, S8, w700
Gui, theChatDiscountBooster:Add, Text, center x12 y+10 w170, So many of our customers were doing amazing work for fundraisers and charities that we created Booster, a site devoted to helping group organizers use custom t-shirts as a fundraising tool. It's a unique way to fundraise, while building awareness of your cause within your community. You get to create an awesome design, set the price, and then use your personalized website to sell the shirts online. The difference between the print cost and price you've selected then goes to the non-profit or individual of your choice! For more information about Booster, please click on the link below: http://booster.com If you'd like, I’m happy to take down your information and have a campaign advisor get in touch with you by phone or email to help you get started.
Gui, theChatDiscountBooster:Font, S16, w700
Gui, theChatDiscountBooster:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatDiscountBooster:Font, S14, w700
Gui, theChatDiscountBooster:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#booster
Gui, theChatDiscountBooster:Font, underline S10, w700
Gui, theChatDiscountBooster:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatDiscountBooster:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatDiscountBooster:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Booster - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatDiscount:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatDiscountCharity:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatDiscountCharity:+AlwaysOnTop
Gui, theChatDiscountCharity:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatDiscountCharity:Color, FFFFFF
Gui, theChatDiscountCharity:Font, S12, w700
Gui, theChatDiscountCharity:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatDiscount, Back to Discount
Gui, theChatDiscountCharity:Font, S18, w700
Gui, theChatDiscountCharity:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Charity
Gui, theChatDiscountCharity:Font, S8, w700
Gui, theChatDiscountCharity:Add, Text, center x12 y+10 w170, I definitely applaud the charitable work that your group is doing for the community! While we don't have any specific discounts that we are able to make, we do have a sponsorship website called Pear where your group can raise sponsorship dollars from local and national brands by gathering support from friends and family. It's free and very easy to sign up. For more information, please click on the link below to visit the PearUp.com website: https://www.pearup.com/find-a-sponsor
Gui, theChatDiscountCharity:Font, S16, w700
Gui, theChatDiscountCharity:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatDiscountCharity:Font, S14, w700
Gui, theChatDiscountCharity:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#charity
Gui, theChatDiscountCharity:Font, underline S10, w700
Gui, theChatDiscountCharity:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatDiscountCharity:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatDiscountCharity:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Charity - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatDiscount:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatDiscountDiscount:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatDiscountDiscount:+AlwaysOnTop
Gui, theChatDiscountDiscount:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatDiscountDiscount:Color, FFFFFF
Gui, theChatDiscountDiscount:Font, S12, w700
Gui, theChatDiscountDiscount:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatDiscount, Back to Discount
Gui, theChatDiscountDiscount:Font, S18, w700
Gui, theChatDiscountDiscount:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Discount
Gui, theChatDiscountDiscount:Font, S8, w700
Gui, theChatDiscountDiscount:Add, Text, center x12 y+10 w170, While we do not have specific discounts available, we can connect you with sponsors who can help you raise sponsorship dollars for your order. Pear is an easy service that can help your group to raise money from local and national brands by gathering support from friends and family. For more information, please click on the link below to visit the PearUp.com website: https://www.pearup.com/find-a-sponsor
Gui, theChatDiscountDiscount:Font, S16, w700
Gui, theChatDiscountDiscount:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatDiscountDiscount:Font, S14, w700
Gui, theChatDiscountDiscount:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#discount
Gui, theChatDiscountDiscount:Font, underline S10, w700
Gui, theChatDiscountDiscount:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatDiscountDiscount:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatDiscountDiscount:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Discount - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatDiscount:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatDiscountPear:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatDiscountPear:+AlwaysOnTop
Gui, theChatDiscountPear:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatDiscountPear:Color, FFFFFF
Gui, theChatDiscountPear:Font, S12, w700
Gui, theChatDiscountPear:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatDiscount, Back to Discount
Gui, theChatDiscountPear:Font, S18, w700
Gui, theChatDiscountPear:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Pear
Gui, theChatDiscountPear:Font, S8, w700
Gui, theChatDiscountPear:Add, Text, center x12 y+10 w170, We’ve partnered with a sponsorship website called Pear where your group can raise sponsorship dollars from local and national brands by gathering support from friends and family. It's free and very easy to sign up. Would you like me to send you a link so you can check it out?
Gui, theChatDiscountPear:Font, S16, w700
Gui, theChatDiscountPear:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatDiscountPear:Font, S14, w700
Gui, theChatDiscountPear:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#pear
Gui, theChatDiscountPear:Font, underline S10, w700
Gui, theChatDiscountPear:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatDiscountPear:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatDiscountPear:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Pear - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatDiscount:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatDiscountPriceHelp:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatDiscountPriceHelp:+AlwaysOnTop
Gui, theChatDiscountPriceHelp:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatDiscountPriceHelp:Color, FFFFFF
Gui, theChatDiscountPriceHelp:Font, S12, w700
Gui, theChatDiscountPriceHelp:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatDiscount, Back to Discount
Gui, theChatDiscountPriceHelp:Font, S18, w700
Gui, theChatDiscountPriceHelp:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Price Help
Gui, theChatDiscountPriceHelp:Font, S8, w700
Gui, theChatDiscountPriceHelp:Add, Text, center x12 y+10 w170, I'll be happy to help go over some of our more budget-friendly options with you! Is there a specific budget that you would like to stay within?
Gui, theChatDiscountPriceHelp:Font, S16, w700
Gui, theChatDiscountPriceHelp:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatDiscountPriceHelp:Font, S14, w700
Gui, theChatDiscountPriceHelp:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#pricehelp
Gui, theChatDiscountPriceHelp:Font, underline S10, w700
Gui, theChatDiscountPriceHelp:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatDiscountPriceHelp:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatDiscountPriceHelp:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Price Help - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatDiscount:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatGeneral:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatGeneral:+AlwaysOnTop
Gui, theChatGeneral:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatGeneral:Color, FFFFFF
Gui, theChatGeneral:Font, S12, w700
Gui, theChatGeneral:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChat, Back to Chat
Gui, theChatGeneral:Font, underline S14, w700
Gui, theChatGeneral:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatGeneralByeOrder v_ByeOrder, Bye/Order
Gui, theChatGeneral:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatGeneralChecking v_Checking, Checking
Gui, theChatGeneral:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatGeneralClose v_Close, Close
Gui, theChatGeneral:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatGeneralCR v_CR, Customer Reports
Gui, theChatGeneral:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatGeneralDesigning v_Designing, Designing
Gui, theChatGeneral:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatGeneralEmail v_Email, Email
Gui, theChatGeneral:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatFollowUpDesign v_FollowUpDesign, Follow Up/Design
Gui, theChatGeneral:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatFollowUpFix v_FollowUpFix, Follow Up/Fix
Gui, theChatGeneral:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatFollowUp v_FollowUp, Follow Up/General
Gui, theChatGeneral:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatFollowUpOrder v_FollowUpOrder, Follow Up/Order
Gui, theChatGeneral:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatFollowUpQuote v_FollowUpQuote, Follow Up/Quote
Gui, theChatGeneral:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatGeneralHelp v_Help, Help

Gui, theChatGeneral:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cBlue gChatGeneral1, Next
Gui, theChatGeneral:Font, underline S10, w700
Gui, theChatGeneral:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatGeneral:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatGeneral:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, General - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChat:destroy
Gui, theChatGeneralByeOrder:destroy
Gui, theChatGeneralChecking:destroy
Gui, theChatGeneralClose:destroy
Gui, theChatGeneralCust:destroy
Gui, theChatGeneralDesigning:destroy
Gui, theChatGeneralFollowUp:destroy
Gui, theChatGeneralFollowUpOrder:destroy
Gui, theChatGeneralFollowUpDesign:destroy
Gui, theChatGeneralFollowUpQuote:destroy
Gui, theChatGeneralCR:destroy
Gui, theChatGeneralEmail:destroy
Gui, theChatFollowUpFix:destroy
Gui, theChatGeneralHelp:destroy
Gui, theChatGeneral1:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatGeneral1:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatGeneral1:+AlwaysOnTop
Gui, theChatGeneral1:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatGeneral1:Color, FFFFFF
Gui, theChatGeneral1:Font, S12, w700
Gui, theChatGeneral1:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChat, Back to Chat
Gui, theChatGeneral1:Font, underline S14, w700
Gui, theChatGeneral1:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatGeneralHeyDesign v_HeyDesign, Hey/Design
Gui, theChatGeneral1:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatGeneralHeyPricing v_HeyPricing, Hey/Pricing
Gui, theChatGeneral1:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatGeneralMe v_Me, Me
Gui, theChatGeneral1:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatGeneralOOO v_OOO, Out of Office
Gui, theChatGeneral1:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatGeneralPerksBulk v_PerksBulk, Perks - Bulk
Gui, theChatGeneral1:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatGeneralPerksSingles v_PerksSingles, Perks - Singles
Gui, theChatGeneral1:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatGeneralQuote v_Quote, Quote?
Gui, theChatGeneral1:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cBlue gChatGeneral, Prev
Gui, theChatGeneral1:Font, underline S10, w700
Gui, theChatGeneral1:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatGeneral1:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatGeneral1:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, General - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChat:destroy
Gui, theChatGeneralHeyDesign:destroy
Gui, theChatGeneralHeyPricing:destroy
Gui, theChatGeneralPerksBulk:destroy
Gui, theChatGeneralPerksSingles:destroy
Gui, theChatGeneralMe:destroy
Gui, theChatGeneralOOO:destroy
Gui, theChatGeneralQuote:destroy
Gui, theChatGeneral:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatGeneralByeOrder:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatGeneralByeOrder:+AlwaysOnTop
Gui, theChatGeneralByeOrder:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatGeneralByeOrder:Color, FFFFFF
Gui, theChatGeneralByeOrder:Font, S12, w700
Gui, theChatGeneralByeOrder:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatGeneral, Back to General
Gui, theChatGeneralByeOrder:Font, S18, w700
Gui, theChatGeneralByeOrder:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Bye/Order
Gui, theChatGeneralByeOrder:Font, S8, w700
Gui, theChatGeneralByeOrder:Add, Text, center x12 y+10 w170, If you have any other questions along the way, feel free to reply to this email or call me directly.  Once I hear back, we'll be able to take the next steps in making your design come to life.  I've included all of my contact information below. Thanks again for choosing CustomInk. I look forward to hearing from you!
Gui, theChatGeneralByeOrder:Font, S16, w700
Gui, theChatGeneralByeOrder:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatGeneralByeOrder:Font, S14, w700
Gui, theChatGeneralByeOrder:Add, Text, center ym-10 x12 y+10 w180 h50 0x200, #byeorder
Gui, theChatGeneralByeOrder:Font, underline S10, w700
Gui, theChatGeneralByeOrder:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatGeneralByeOrder:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatGeneralByeOrder:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Bye/Order - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatGeneral:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatGeneralChecking:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatGeneralChecking:+AlwaysOnTop
Gui, theChatGeneralChecking:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatGeneralChecking:Color, FFFFFF
Gui, theChatGeneralChecking:Font, S12, w700
Gui, theChatGeneralChecking:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatGeneral, Back to General
Gui, theChatGeneralChecking:Font, S18, w700
Gui, theChatGeneralChecking:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Bye/Order
Gui, theChatGeneralChecking:Font, S8, w700
Gui, theChatGeneralChecking:Add, Text, center x12 y+10 w170, I'm going to take a couple of minutes and check into this for you, would you mind waiting with me, or would you prefer that I email that information to you instead?
Gui, theChatGeneralChecking:Font, S16, w700
Gui, theChatGeneralChecking:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatGeneralChecking:Font, S14, w700
Gui, theChatGeneralChecking:Add, Text, center ym-10 x12 y+10 w180 h50 0x200, #checking
Gui, theChatGeneralChecking:Font, underline S10, w700
Gui, theChatGeneralChecking:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatGeneralChecking:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatGeneralChecking:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Checking - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatGeneral:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatGeneralClose:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatGeneralClose:+AlwaysOnTop
Gui, theChatGeneralClose:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatGeneralClose:Color, FFFFFF
Gui, theChatGeneralClose:Font, S12, w700
Gui, theChatGeneralClose:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatGeneral, Back to General
Gui, theChatGeneralClose:Font, S18, w700
Gui, theChatGeneralClose:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Close
Gui, theChatGeneralClose:Font, S8, w700
Gui, theChatGeneralClose:Add, Text, center x12 y+10 w170, Please feel free to respond to this email or give me a call if you have any questions and I'll be happy to help! My contact details are listed below. Thank you again for choosing CustomInk and I hope you have a wonderful day!
Gui, theChatGeneralClose:Font, S16, w700
Gui, theChatGeneralClose:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatGeneralClose:Font, S14, w700
Gui, theChatGeneralClose:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#close
Gui, theChatGeneralClose:Font, underline S10, w700
Gui, theChatGeneralClose:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatGeneralClose:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatGeneralClose:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Close - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatGeneral:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatGeneralCR:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatGeneralCR:+AlwaysOnTop
Gui, theChatGeneralCR:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatGeneralCR:Color, FFFFFF
Gui, theChatGeneralCR:Font, S12, w700
Gui, theChatGeneralCR:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatGeneral, Back to General
Gui, theChatGeneralCR:Font, S16, w700
Gui, theChatGeneralCR:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Customer Reports
Gui, theChatGeneralCR:Font, S8, w700
Gui, theChatGeneralCR:Add, Text, center x12 y+10 w170, Using this hotkey will automatically print "Customer reports that".
Gui, theChatGeneralCR:Font, S16, w700
Gui, theChatGeneralCR:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatGeneralCR:Font, S14, w700
Gui, theChatGeneralCR:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#cr
Gui, theChatGeneralCR:Font, underline S10, w700
Gui, theChatGeneralCR:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatGeneralCR:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatGeneralCR:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Customer Reports - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatGeneral:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatGeneralDesigning:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatGeneralDesigning:+AlwaysOnTop
Gui, theChatGeneralDesigning:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatGeneralDesigning:Color, FFFFFF
Gui, theChatGeneralDesigning:Font, S12, w700
Gui, theChatGeneralDesigning:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatGeneral, Back to General
Gui, theChatGeneralDesigning:Font, S18, w700
Gui, theChatGeneralDesigning:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Designing
Gui, theChatGeneralDesigning:Font, S8, w700
Gui, theChatGeneralDesigning:Add, Text, center x12 y+10 w170, This design work will just take a few minutes, would you mind waiting with me or would you prefer that email you the link to the design instead?
Gui, theChatGeneralDesigning:Font, S16, w700
Gui, theChatGeneralDesigning:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatGeneralDesigning:Font, S14, w700
Gui, theChatGeneralDesigning:Add, Text, center ym-10 x12 y+10 w180 h50 0x200, #designing
Gui, theChatGeneralDesigning:Font, underline S10, w700
Gui, theChatGeneralDesigning:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatGeneralDesigning:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatGeneralDesigning:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Designing - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatGeneral:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatGeneralEmail:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatGeneralEmail:+AlwaysOnTop
Gui, theChatGeneralEmail:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatGeneralEmail:Color, FFFFFF
Gui, theChatGeneralEmail:Font, S12, w700
Gui, theChatGeneralEmail:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatGeneral, Back to General
Gui, theChatGeneralEmail:Font, S18, w700
Gui, theChatGeneralEmail:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, E-mail
Gui, theChatGeneralEmail:Font, S8, w700
Gui, theChatGeneralEmail:Add, Text, center x12 y+10 w170, May I have your email address so I can pull up your account?
Gui, theChatGeneralEmail:Font, S16, w700
Gui, theChatGeneralEmail:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatGeneralEmail:Font, S14, w700
Gui, theChatGeneralEmail:Add, Text, center ym-10 x12 y+10 w180 h50 0x200, #email
Gui, theChatGeneralEmail:Font, underline S10, w700
Gui, theChatGeneralEmail:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatGeneralEmail:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatGeneralEmail:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, E-mail - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatGeneral:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatFollowUp:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatGeneralFollowUp:+AlwaysOnTop
Gui, theChatGeneralFollowUp:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatGeneralFollowUp:Color, FFFFFF
Gui, theChatGeneralFollowUp:Font, S12, w700
Gui, theChatGeneralFollowUp:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatGeneral, Back to General
Gui, theChatGeneralFollowUp:Font, S16, w700
Gui, theChatGeneralFollowUp:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Follow Up/General
Gui, theChatGeneralFollowUp:Font, S8, w700
Gui, theChatGeneralFollowUp:Add, Text, center x12 y+10 w170, Thank you for choosing CustomInk! It was a pleasure (***speaking, chatting, emailing, etc.***) with you earlier and I'm happy to be able to help you! Whether you need some help in creating a design from scratch, touching up some artwork, or selecting the perfect product, please feel free to reach out to me with anything you need. My contact details are listed below. Thanks again for choosing CustomInk and I hope you have a wonderful day!
Gui, theChatGeneralFollowUp:Font, S16, w700
Gui, theChatGeneralFollowUp:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatGeneralFollowUp:Font, S14, w700
Gui, theChatGeneralFollowUp:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#followup
Gui, theChatGeneralFollowUp:Font, underline S10, w700
Gui, theChatGeneralFollowUp:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatGeneralFollowUp:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatGeneralFollowUp:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Follow Up/General - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatGeneral:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatFollowUpDesign:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatGeneralFollowUpDesign:+AlwaysOnTop
Gui, theChatGeneralFollowUpDesign:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatGeneralFollowUpDesign:Color, FFFFFF
Gui, theChatGeneralFollowUpDesign:Font, S12, w700
Gui, theChatGeneralFollowUpDesign:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatGeneral, Back to General
Gui, theChatGeneralFollowUpDesign:Font, S16, w700
Gui, theChatGeneralFollowUpDesign:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Follow Up/Design
Gui, theChatGeneralFollowUpDesign:Font, S8, w700
Gui, theChatGeneralFollowUpDesign:Add, Text, center x12 y+10 w170, Thank you so much for your call today! I loved talking about ____________________. I wanted to make sure I sent over the design that we created together today. ***Paste Design Link Here***
Gui, theChatGeneralFollowUpDesign:Font, S16, w700
Gui, theChatGeneralFollowUpDesign:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatGeneralFollowUpDesign:Font, S14, w700
Gui, theChatGeneralFollowUpDesign:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#followdesign
Gui, theChatGeneralFollowUpDesign:Font, underline S10, w700
Gui, theChatGeneralFollowUpDesign:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatGeneralFollowUpDesign:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatGeneralFollowUpDesign:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Follow Up/Design - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatGeneral:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatFollowUpFix:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatFollowUpFix:+AlwaysOnTop
Gui, theChatFollowUpFix:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatFollowUpFix:Color, FFFFFF
Gui, theChatFollowUpFix:Font, S12, w700
Gui, theChatFollowUpFix:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatGeneral, Back to General
Gui, theChatFollowUpFix:Font, S16, w700
Gui, theChatFollowUpFix:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Follow Up/Fix
Gui, theChatFollowUpFix:Font, S8, w700
Gui, theChatFollowUpFix:Add, Text, center x12 y+10 w170, Thank you so much for hanging in there! I saw that your replacements delivered recently, and wanted to see how you liked them. I hope they look exactly as you were hoping this time around. What do you think?
Gui, theChatFollowUpFix:Font, S16, w700
Gui, theChatFollowUpFix:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatFollowUpFix:Font, S14, w700
Gui, theChatFollowUpFix:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#followfix
Gui, theChatFollowUpFix:Font, underline S10, w700
Gui, theChatFollowUpFix:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatFollowUpFix:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatFollowUpFix:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Follow Up/Fix - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatGeneral:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatFollowUpOrder:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatGeneralFollowUpOrder:+AlwaysOnTop
Gui, theChatGeneralFollowUpOrder:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatGeneralFollowUpOrder:Color, FFFFFF
Gui, theChatGeneralFollowUpOrder:Font, S12, w700
Gui, theChatGeneralFollowUpOrder:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatGeneral, Back to General
Gui, theChatGeneralFollowUpOrder:Font, S16, w700
Gui, theChatGeneralFollowUpOrder:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Follow Up/Order
Gui, theChatGeneralFollowUpOrder:Font, S8, w700
Gui, theChatGeneralFollowUpOrder:Add, Text, center x12 y+10 w170, I just wanted to send you a personal thank you for ordering with us. I think that these shirts are going to be perfect for your _________________________. Please know that my service does not end here and if there is anything else that I can do to help, let me know. I've included all of my contact information below just for you. Thanks again, and I hope that you have a great rest of your day!
Gui, theChatGeneralFollowUpOrder:Font, S16, w700
Gui, theChatGeneralFollowUpOrder:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatGeneralFollowUpOrder:Font, S14, w700
Gui, theChatGeneralFollowUpOrder:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#followorder
Gui, theChatGeneralFollowUpOrder:Font, underline S10, w700
Gui, theChatGeneralFollowUpOrder:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatGeneralFollowUpOrder:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatGeneralFollowUpOrder:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Follow Up/Order - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatGeneral:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatFollowUpQuote:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatGeneralFollowUpQuote:+AlwaysOnTop
Gui, theChatGeneralFollowUpQuote:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatGeneralFollowUpQuote:Color, FFFFFF
Gui, theChatGeneralFollowUpQuote:Font, S12, w700
Gui, theChatGeneralFollowUpQuote:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatGeneral, Back to General
Gui, theChatGeneralFollowUpQuote:Font, S16, w700
Gui, theChatGeneralFollowUpQuote:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Follow Up/Quote
Gui, theChatGeneralFollowUpQuote:Font, S8, w700
Gui, theChatGeneralFollowUpQuote:Add, Text, center x12 y+10 w170, Thank you so much for your call today! I loved talking about _________________. I wanted to make sure that I sent over the quote that we had discussed. ***Paste Quote Here***
Gui, theChatGeneralFollowUpQuote:Font, S16, w700
Gui, theChatGeneralFollowUpQuote:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatGeneralFollowUpQuote:Font, S14, w700
Gui, theChatGeneralFollowUpQuote:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#followquote
Gui, theChatGeneralFollowUpQuote:Font, underline S10, w700
Gui, theChatGeneralFollowUpQuote:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatGeneralFollowUpQuote:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatGeneralFollowUpQuote:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Follow Up/Quote - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatGeneral:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatGeneralHelp:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatGeneralHelp:+AlwaysOnTop
Gui, theChatGeneralHelp:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatGeneralHelp:Color, FFFFFF
Gui, theChatGeneralHelp:Font, S12, w700
Gui, theChatGeneralHelp:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatGeneral, Back to General
Gui, theChatGeneralHelp:Font, S18, w700
Gui, theChatGeneralHelp:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Help
Gui, theChatGeneralHelp:Font, S8, w700
Gui, theChatGeneralHelp:Add, Text, center x12 y+10 w170, Is there anything else I can help you with today?
Gui, theChatGeneralHelp:Font, S16, w700
Gui, theChatGeneralHelp:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatGeneralHelp:Font, S14, w700
Gui, theChatGeneralHelp:Add, Text, center ym-10 x12 y+10 w180 h50 0x200, #help
Gui, theChatGeneralHelp:Font, underline S10, w700
Gui, theChatGeneralHelp:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatGeneralHelp:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatGeneralHelp:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Help - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatGeneral:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatGeneralHeyDesign:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatGeneralHeyDesign:+AlwaysOnTop
Gui, theChatGeneralHeyDesign:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatGeneralHeyDesign:Color, FFFFFF
Gui, theChatGeneralHeyDesign:Font, S12, w700
Gui, theChatGeneralHeyDesign:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatGeneral1, Back to General
Gui, theChatGeneralHeyDesign:Font, S18, w700
Gui, theChatGeneralHeyDesign:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Hey/Design
Gui, theChatGeneralHeyDesign:Font, S8, w700
Gui, theChatGeneralHeyDesign:Add, Text, center x12 y+10 w170, Thank you for choosing CustomInk! I'm happy to help you with your design and you can count on me to help with anything you need while we bring your custom design to life!
Gui, theChatGeneralHeyDesign:Font, S16, w700
Gui, theChatGeneralHeyDesign:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatGeneralHeyDesign:Font, S14, w700
Gui, theChatGeneralHeyDesign:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#heydesign
Gui, theChatGeneralHeyDesign:Font, underline S10, w700
Gui, theChatGeneralHeyDesign:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatGeneralHeyDesign:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatGeneralHeyDesign:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Hey/Design - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatGeneral1:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatGeneralHeyPricing:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatGeneralHeyPricing:+AlwaysOnTop
Gui, theChatGeneralHeyPricing:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatGeneralHeyPricing:Color, FFFFFF
Gui, theChatGeneralHeyPricing:Font, S12, w700
Gui, theChatGeneralHeyPricing:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatGeneral1, Back to General
Gui, theChatGeneralHeyPricing:Font, S18, w700
Gui, theChatGeneralHeyPricing:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Hey/Pricing
Gui, theChatGeneralHeyPricing:Font, S8, w700
Gui, theChatGeneralHeyPricing:Add, Text, center x12 y+10 w170, Thank you for choosing CustomInk! I'm happy to help put together a quote for your custom design and you can count on me to make sure that your experience with us is outstanding!
Gui, theChatGeneralHeyPricing:Font, S16, w700
Gui, theChatGeneralHeyPricing:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatGeneralHeyPricing:Font, S14, w700
Gui, theChatGeneralHeyPricing:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#heypricing
Gui, theChatGeneralHeyPricing:Font, underline S10, w700
Gui, theChatGeneralHeyPricing:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatGeneralHeyPricing:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatGeneralHeyPricing:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Hey/Pricing - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatGeneral1:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatGeneralMe:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatGeneralMe:+AlwaysOnTop
Gui, theChatGeneralMe:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatGeneralMe:Color, FFFFFF
Gui, theChatGeneralMe:Font, S12, w700
Gui, theChatGeneralMe:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatGeneral1, Back to General
Gui, theChatGeneralMe:Font, S18, w700
Gui, theChatGeneralMe:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Me
Gui, theChatGeneralMe:Font, S8, w700
Gui, theChatGeneralMe:Add, Text, center x12 y+10 w170, Using this hotkey will print your first and last name.
Gui, theChatGeneralMe:Font, S16, w700
Gui, theChatGeneralMe:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatGeneralMe:Font, S14, w700
Gui, theChatGeneralMe:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#me
Gui, theChatGeneralMe:Font, underline S10, w700
Gui, theChatGeneralMe:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatGeneralMe:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatGeneralMe:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Me - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatGeneral1:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return



ChatGeneralOOO:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatGeneralOOO:+AlwaysOnTop
Gui, theChatGeneralOOO:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatGeneralOOO:Color, FFFFFF
Gui, theChatGeneralOOO:Font, S12, w700
Gui, theChatGeneralOOO:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatGeneral1, Back to General
Gui, theChatGeneralOOO:Font, S18, w700
Gui, theChatGeneralOOO:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Out of Office
Gui, theChatGeneralOOO:Font, S8, w700
Gui, theChatGeneralOOO:Add, Text, center x12 y+10 w170, Thank you so much for emailing back in! {REP} is not in the office at the moment but I am happy to help out the best I can.
Gui, theChatGeneralOOO:Font, S16, w700
Gui, theChatGeneralOOO:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatGeneralOOO:Font, S14, w700
Gui, theChatGeneralOOO:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#ooo
Gui, theChatGeneralOOO:Font, underline S10, w700
Gui, theChatGeneralOOO:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatGeneralOOO:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatGeneralOOO:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Out of Office - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatGeneral1:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatGeneralPerksBulk:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatGeneralPerksBulk:+AlwaysOnTop
Gui, theChatGeneralPerksBulk:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatGeneralPerksBulk:Color, FFFFFF
Gui, theChatGeneralPerksBulk:Font, S12, w700
Gui, theChatGeneralPerksBulk:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatGeneral1, Back to General
Gui, theChatGeneralPerksBulk:Font, S18, w700
Gui, theChatGeneralPerksBulk:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Perks - Bulk
Gui, theChatGeneralPerksBulk:Font, S8, w700
Gui, theChatGeneralPerksBulk:Add, Text, center x12 y+10 w170, Every CustomInk order comes with: *Artistic adjustments to alignment, art, or text for the best print possible *Free proof email to review any adjustments before printing *Free shipping with a guaranteed delivery date *CustomInk’s quality and money-back guarantee
Gui, theChatGeneralPerksBulk:Font, S16, w700
Gui, theChatGeneralPerksBulk:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatGeneralPerksBulk:Font, S14, w700
Gui, theChatGeneralPerksBulk:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#bulkperks
Gui, theChatGeneralPerksBulk:Font, underline S10, w700
Gui, theChatGeneralPerksBulk:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatGeneralPerksBulk:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatGeneralPerksBulk:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Perks - Bulk - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatGeneral1:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatGeneralPerksSingles:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatGeneralPerksSingles:+AlwaysOnTop
Gui, theChatGeneralPerksSingles:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatGeneralPerksSingles:Color, FFFFFF
Gui, theChatGeneralPerksSingles:Font, S12, w700
Gui, theChatGeneralPerksSingles:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatGeneral1, Back to General
Gui, theChatGeneralPerksSingles:Font, S18, w700
Gui, theChatGeneralPerksSingles:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Perks - Singles
Gui, theChatGeneralPerksSingles:Font, S8, w700
Gui, theChatGeneralPerksSingles:Add, Text, center x12 y+10 w170, Every CustomInk order comes with: *Artistic adjustments to alignment, art, or text for the best print *Free, two-week shipping with a guaranteed delivery date
Gui, theChatGeneralPerksSingles:Font, S16, w700
Gui, theChatGeneralPerksSingles:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatGeneralPerksSingles:Font, S14, w700
Gui, theChatGeneralPerksSingles:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#singlesperks
Gui, theChatGeneralPerksSingles:Font, underline S10, w700
Gui, theChatGeneralPerksSingles:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatGeneralPerksSingles:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatGeneralPerksSingles:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Perks - Singles - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatGeneral1:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatGeneralQuote:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatGeneralQuote:+AlwaysOnTop
Gui, theChatGeneralQuote:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatGeneralQuote:Color, FFFFFF
Gui, theChatGeneralQuote:Font, S12, w700
Gui, theChatGeneralQuote:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatGeneral1, Back to General
Gui, theChatGeneralQuote:Font, S18, w700
Gui, theChatGeneralQuote:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Quote?
Gui, theChatGeneralQuote:Font, S8, w700
Gui, theChatGeneralQuote:Add, Text, center x12 y+10 w170, If you'd like, I can show you some pricing for your custom design. I'd be happy to email it to you, as well!
Gui, theChatGeneralQuote:Font, S16, w700
Gui, theChatGeneralQuote:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatGeneralQuote:Font, S14, w700
Gui, theChatGeneralQuote:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#quote?
Gui, theChatGeneralQuote:Font, underline S10, w700
Gui, theChatGeneralQuote:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatGeneralQuote:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatGeneralQuote:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Quote? - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatGeneral1:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatGroup:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatGroup:+AlwaysOnTop
Gui, theChatGroup:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatGroup:Color, FFFFFF
Gui, theChatGroup:Font, S12, w700
Gui, theChatGroup:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChat, Back to Chat
Gui, theChatGroup:Font, underline S14, w700
Gui, theChatGroup:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatGroupGOF v_GOF, GOF
Gui, theChatGroup:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatGroupGOFCancel v_GOFCancel, GOF Cancel
Gui, theChatGroup:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatGroupGOFDesign v_GOFDesign, GOF Design
Gui, theChatGroup:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatGroupGOFPrice v_GOFPrice, GOF Price
Gui, theChatGroup:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatGroupGOFSetup v_GOFSetup, GOF Setup
Gui, theChatGroup:Font, underline S10, w700
Gui, theChatGroup:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatGroup:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatGroup:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Group - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChat:destroy
Gui, theChatGroupGOF:destroy
Gui, theChatGroupGOFCancel:destroy
Gui, theChatGroupGOFDesign:destroy
Gui, theChatGroupGOFPrice:destroy
Gui, theChatGroupGOFSetup:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatGroupGOF:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatGroupGOF:+AlwaysOnTop
Gui, theChatGroupGOF:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatGroupGOF:Color, FFFFFF
Gui, theChatGroupGOF:Font, S12, w700
Gui, theChatGroupGOF:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatGroup, Back to Group
Gui, theChatGroupGOF:Font, S18, w700
Gui, theChatGroupGOF:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, GOF
Gui, theChatGroupGOF:Font, S8, w700
Gui, theChatGroupGOF:Add, Text, center x12 y+10 w170, If you want to use our online Group Order Form to coordinate your group's order, you can share the design with your group, have them pick their own sizes, and even take individual payments online. It's free to use and can be very helpful in coordinating for any sized group. You can set a deadline for your group members to make their selections and then place one order for everyone. I can help you get started, if you’d like?
Gui, theChatGroupGOF:Font, S16, w700
Gui, theChatGroupGOF:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatGroupGOF:Font, S14, w700
Gui, theChatGroupGOF:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#gof
Gui, theChatGroupGOF:Font, underline S10, w700
Gui, theChatGroupGOF:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatGroupGOF:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatGroupGOF:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, GOF - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatGroup:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatGroupGOFCancel:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatGroupGOFCancel:+AlwaysOnTop
Gui, theChatGroupGOFCancel:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatGroupGOFCancel:Color, FFFFFF
Gui, theChatGroupGOFCancel:Font, S12, w700
Gui, theChatGroupGOFCancel:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatGroup, Back to Group
Gui, theChatGroupGOFCancel:Font, S18, w700
Gui, theChatGroupGOFCancel:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, GOF Cancel
Gui, theChatGroupGOFCancel:Font, S8, w700
Gui, theChatGroupGOFCancel:Add, Text, center x12 y+10 w170, I can definitely help you cancel your group’s order. Keep in mind, anyone who has already paid online will be refunded and your group will no longer be able to use that link again. If you’re sure you’d like to cancel your entire order, confirm that with me and I'll take care of it for you!
Gui, theChatGroupGOFCancel:Font, S16, w700
Gui, theChatGroupGOFCancel:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatGroupGOFCancel:Font, S14, w700
Gui, theChatGroupGOFCancel:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#gofcancel
Gui, theChatGroupGOFCancel:Font, underline S10, w700
Gui, theChatGroupGOFCancel:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatGroupGOFCancel:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatGroupGOFCancel:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, GOF Cancel - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatGroup:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatGroupGOFDesign:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatGroupGOFDesign:+AlwaysOnTop
Gui, theChatGroupGOFDesign:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatGroupGOFDesign:Color, FFFFFF
Gui, theChatGroupGOFDesign:Font, S12, w700
Gui, theChatGroupGOFDesign:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatGroup, Back to Group
Gui, theChatGroupGOFDesign:Font, S18, w700
Gui, theChatGroupGOFDesign:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, GOF Design
Gui, theChatGroupGOFDesign:Font, S8, w700
Gui, theChatGroupGOFDesign:Add, Text, center x12 y+10 w170, Once your Group Order Form is started, we can’t change the design that it links to. We can always cancel that form and start up a new one for you to share. Anyone who's signed up will be refunded if they've paid online and they'll need to place their order again within the new Group Order Form.
Gui, theChatGroupGOFDesign:Font, S16, w700
Gui, theChatGroupGOFDesign:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatGroupGOFDesign:Font, S14, w700
Gui, theChatGroupGOFDesign:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#gofdesign
Gui, theChatGroupGOFDesign:Font, underline S10, w700
Gui, theChatGroupGOFDesign:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatGroupGOFDesign:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatGroupGOFDesign:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, GOF Design - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatGroup:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatGroupGOFPrice:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatGroupGOFPrice:+AlwaysOnTop
Gui, theChatGroupGOFPrice:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatGroupGOFPrice:Color, FFFFFF
Gui, theChatGroupGOFPrice:Font, S12, w700
Gui, theChatGroupGOFPrice:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatGroup, Back to Group
Gui, theChatGroupGOFPrice:Font, S18, w700
Gui, theChatGroupGOFPrice:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, GOF Price
Gui, theChatGroupGOFPrice:Font, S8, w700
Gui, theChatGroupGOFPrice:Add, Text, center x12 y+10 w170, When you set up a Group Order Form, you're asked to select the number of shirts you think your group will order. This helps us estimate how much each shirt will cost.If more people sign up than you originally estimate, the per-item cost will drop and we'll cut you a check for the difference at the end. If fewer people sign up than estimated, the per-shirt cost goes up and you will have to make up that difference when the final group order is placed.
Gui, theChatGroupGOFPrice:Font, S16, w700
Gui, theChatGroupGOFPrice:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatGroupGOFPrice:Font, S14, w700
Gui, theChatGroupGOFPrice:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#gofprice
Gui, theChatGroupGOFPrice:Font, underline S10, w700
Gui, theChatGroupGOFPrice:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatGroupGOFPrice:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatGroupGOFPrice:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, GOF Price - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatGroup:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatGroupGOFSetup:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatGroupGOFSetup:+AlwaysOnTop
Gui, theChatGroupGOFSetup:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatGroupGOFSetup:Color, FFFFFF
Gui, theChatGroupGOFSetup:Font, S12, w700
Gui, theChatGroupGOFSetup:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatGroup, Back to Group
Gui, theChatGroupGOFSetup:Font, S18, w700
Gui, theChatGroupGOFSetup:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, GOF Setup
Gui, theChatGroupGOFSetup:Font, S8, w700
Gui, theChatGroupGOFSetup:Add, Text, center x12 y+10 w170, I can definitely help you get your Group Order Form setup! Please click on the link below to get started: *copied GOF link* You'll be able to estimate the number of shirts you need, add group information, and share the link with everyone in your group. If you have questions about setting things up, I'll be happy to help!
Gui, theChatGroupGOFSetup:Font, S16, w700
Gui, theChatGroupGOFSetup:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatGroupGOFSetup:Font, S14, w700
Gui, theChatGroupGOFSetup:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#gofsetup
Gui, theChatGroupGOFSetup:Font, underline S10, w700
Gui, theChatGroupGOFSetup:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatGroupGOFSetup:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatGroupGOFSetup:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, GOF Setup - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatGroup:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatLiveEngage:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatLiveEngage:+AlwaysOnTop
Gui, theChatLiveEngage:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatLiveEngage:Color, FFFFFF
Gui, theChatLiveEngage:Font, S12, w700
Gui, theChatLiveEngage:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChat, Back to Chat
Gui, theChatLiveEngage:Font, underline S13, w700
Gui, theChatLiveEngage:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatLiveEngageByeSurvey v_ByeSurvey, Bye/Survey
Gui, theChatLiveEngage:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatLiveEngageDiscounts v_Discounts, Discounts
Gui, theChatLiveEngage:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatLiveEngageEmail v_Email, Email
Gui, theChatLiveEngage:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatLiveEngageGreetingWName v_GOFPrice, Greeting W/ Name
Gui, theChatLiveEngage:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatLiveEngageGreetingWOName v_GreetingWOName, Greeting W/O Name
Gui, theChatLiveEngage:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatLiveEngageInternational v_International, International
Gui, theChatLiveEngage:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatLiveEngageLostYouWName v_LostYouWName, Lost You W/ Name
Gui, theChatLiveEngage:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatLiveEngageLostYouWOName v_LostYouWOName, Lost You W/O Name
Gui, theChatLiveEngage:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatLiveEngageNoCommWName v_NoCommWName, No Comm W/ Name
Gui, theChatLiveEngage:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatLiveEngageNoCommWOName v_NoCommWOName, No Comm W/O Name
Gui, theChatLiveEngage:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatLiveEngageSimpleIntroName v_SimpleIntroName, Simple Intro Name
Gui, theChatLiveEngage:Font, underline S10, w700
Gui, theChatLiveEngage:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatLiveEngage:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatLiveEngage:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, LiveEngage - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChat:destroy
Gui, theChatLiveEngageByeSurvey:destroy
Gui, theChatLiveEngageDiscounts:destroy
Gui, theChatLiveEngageEmail:destroy
Gui, theChatLiveEngageGreetingWName:destroy
Gui, theChatLiveEngageGreetingWOName:destroy
Gui, theChatLiveEngageInternational:destroy
Gui, theChatLiveEngageLostYouWName:destroy
Gui, theChatLiveEngageLostYouWOName:destroy
Gui, theChatLiveEngageMilitary:destroy
Gui, theChatLiveEngageNoCommWName:destroy
Gui, theChatLiveEngageNoCommWOName:destroy
Gui, theChatLiveEngageSimpleIntroName:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatLiveEngageByeSurvey:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatLiveEngageByeSurvey:+AlwaysOnTop
Gui, theChatLiveEngageByeSurvey:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatLiveEngageByeSurvey:Color, FFFFFF
Gui, theChatLiveEngageByeSurvey:Font, S12, w700
Gui, theChatLiveEngageByeSurvey:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatLiveEngage, Back to LiveEngage
Gui, theChatLiveEngageByeSurvey:Font, S18, w700
Gui, theChatLiveEngageByeSurvey:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Bye/Survey
Gui, theChatLiveEngageByeSurvey:Font, S8, w700
Gui, theChatLiveEngageByeSurvey:Add, Text, center x12 y+10 w170, Thank you again for chatting with CustomInk, where T-Shirts Unite! If you have future questions, my name was $!{operator.nickname} and you can always request my assistance over our chat service, or through e-mail at service@customink.com. Please be sure to click the "Close" button in the top right hand corner of this chat window- this allows you to send a copy of our chat to yourself for your records.
Gui, theChatLiveEngageByeSurvey:Font, S16, w700
Gui, theChatLiveEngageByeSurvey:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatLiveEngageByeSurvey:Font, S14, w700
Gui, theChatLiveEngageByeSurvey:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,Alt + X
Gui, theChatLiveEngageByeSurvey:Font, underline S10, w700
Gui, theChatLiveEngageByeSurvey:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatLiveEngageByeSurvey:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatLiveEngageByeSurvey:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Bye/Survey - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatLiveEngage:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatLiveEngageDiscounts:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatLiveEngageDiscounts:+AlwaysOnTop
Gui, theChatLiveEngageDiscounts:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatLiveEngageDiscounts:Color, FFFFFF
Gui, theChatLiveEngageDiscounts:Font, S12, w700
Gui, theChatLiveEngageDiscounts:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatLiveEngage, Back to LiveEngage
Gui, theChatLiveEngageDiscounts:Font, S18, w700
Gui, theChatLiveEngageDiscounts:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Discounts
Gui, theChatLiveEngageDiscounts:Font, S8, w700
Gui, theChatLiveEngageDiscounts:Add, Text, center x12 y+10 w170, We often get requests for discounts for specific groups and since we are unable to accommodate all requests, we have chosen to offer an alternative for all our customers. Pear - our dedicated sponsorship website - can help groups raise sponsorship dollars from local and national brands by gathering support from your friends and family. It's completely free and very easy to sign up, do you think this would work for your group?
Gui, theChatLiveEngageDiscounts:Font, S16, w700
Gui, theChatLiveEngageDiscounts:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatLiveEngageDiscounts:Font, S14, w700
Gui, theChatLiveEngageDiscounts:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,Alt + D
Gui, theChatLiveEngageDiscounts:Font, underline S10, w700
Gui, theChatLiveEngageDiscounts:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatLiveEngageDiscounts:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatLiveEngageDiscounts:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Discounts - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatLiveEngage:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatLiveEngageEmail:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatLiveEngageEmail:+AlwaysOnTop
Gui, theChatLiveEngageEmail:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatLiveEngageEmail:Color, FFFFFF
Gui, theChatLiveEngageEmail:Font, S12, w700
Gui, theChatLiveEngageEmail:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatLiveEngage, Back to LiveEngage
Gui, theChatLiveEngageEmail:Font, S18, w700
Gui, theChatLiveEngageEmail:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Email
Gui, theChatLiveEngageEmail:Font, S8, w700
Gui, theChatLiveEngageEmail:Add, Text, center x12 y+10 w170, May I have your email address so I can pull up your account?
Gui, theChatLiveEngageEmail:Font, S16, w700
Gui, theChatLiveEngageEmail:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatLiveEngageEmail:Font, S14, w700
Gui, theChatLiveEngageEmail:Add, Text, center ym-10 x12 y+10 w180 h50 0x200, #email
Gui, theChatLiveEngageEmail:Font, underline S10, w700
Gui, theChatLiveEngageEmail:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatLiveEngageEmail:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatLiveEngageEmail:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Email - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatLiveEngage:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatLiveEngageGreetingWName:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatLiveEngageGreetingWName:+AlwaysOnTop
Gui, theChatLiveEngageGreetingWName:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatLiveEngageGreetingWName:Color, FFFFFF
Gui, theChatLiveEngageGreetingWName:Font, S12, w700
Gui, theChatLiveEngageGreetingWName:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatLiveEngage, Back to LiveEngage
Gui, theChatLiveEngageGreetingWName:Font, S16, w700
Gui, theChatLiveEngageGreetingWName:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Greeting W/ Name
Gui, theChatLiveEngageGreetingWName:Font, S8, w700
Gui, theChatLiveEngageGreetingWName:Add, Text, center x12 y+10 w170, Hi $!{vars.get("identifier")}! Thank you for chatting with CustomInk! I'm quickly reviewing the survey you've filled out to see what I can personally help you with today.
Gui, theChatLiveEngageGreetingWName:Font, S16, w700
Gui, theChatLiveEngageGreetingWName:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatLiveEngageGreetingWName:Font, S14, w700
Gui, theChatLiveEngageGreetingWName:Add, Text, center ym-10 x12 y+10 w180 h50 0x200, Alt + H
Gui, theChatLiveEngageGreetingWName:Font, underline S10, w700
Gui, theChatLiveEngageGreetingWName:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatLiveEngageGreetingWName:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatLiveEngageGreetingWName:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Greeting W/ Name - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatLiveEngage:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatLiveEngageGreetingWOName:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatLiveEngageGreetingWOName:+AlwaysOnTop
Gui, theChatLiveEngageGreetingWOName:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatLiveEngageGreetingWOName:Color, FFFFFF
Gui, theChatLiveEngageGreetingWOName:Font, S12, w700
Gui, theChatLiveEngageGreetingWOName:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatLiveEngage, Back to LiveEngage
Gui, theChatLiveEngageGreetingWOName:Font, S14, w700
Gui, theChatLiveEngageGreetingWOName:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Greeting W/O Name
Gui, theChatLiveEngageGreetingWOName:Font, S8, w700
Gui, theChatLiveEngageGreetingWOName:Add, Text, center x12 y+10 w170, Hey there, thank you for chatting with CustomInk!  I'm quickly reviewing the survey you've filled out to see what I can personally help you with today.
Gui, theChatLiveEngageGreetingWOName:Font, S16, w700
Gui, theChatLiveEngageGreetingWOName:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatLiveEngageGreetingWOName:Font, S14, w700
Gui, theChatLiveEngageGreetingWOName:Add, Text, center ym-10 x12 y+10 w180 h50 0x200, Alt + S
Gui, theChatLiveEngageGreetingWOName:Font, underline S10, w700
Gui, theChatLiveEngageGreetingWOName:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatLiveEngageGreetingWOName:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatLiveEngageGreetingWOName:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Greeting W/O Name - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatLiveEngage:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatLiveEngageInternational:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatLiveEngageInternational:+AlwaysOnTop
Gui, theChatLiveEngageInternational:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatLiveEngageInternational:Color, FFFFFF
Gui, theChatLiveEngageInternational:Font, S12, w700
Gui, theChatLiveEngageInternational:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatLiveEngage, Back to LiveEngage
Gui, theChatLiveEngageInternational:Font, S18, w700
Gui, theChatLiveEngageInternational:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, International
Gui, theChatLiveEngageInternational:Font, S8, w700
Gui, theChatLiveEngageInternational:Add, Text, center x12 y+10 w170, At this time, we only ship internationally to Canada, or if the address is a US Army Post Office (APO), Fleet Post Office (FPO), or Diplomatic Post Office (DPO).
Gui, theChatLiveEngageInternational:Font, S16, w700
Gui, theChatLiveEngageInternational:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatLiveEngageInternational:Font, S14, w700
Gui, theChatLiveEngageInternational:Add, Text, center ym-10 x12 y+10 w180 0x200, Alt + Z
Gui, theChatLiveEngageInternational:Add, Text, center ym-10 x12 y+5 w180 0x200,or
Gui, theChatLiveEngageInternational:Add, Text, center ym-10 x12 y+5 w180 0x200,#international
Gui, theChatLiveEngageInternational:Add, Text, center ym-10 x12 y+5 w180 0x200,or
Gui, theChatLiveEngageInternational:Add, Text, center ym-10 x12 y+5 w180 0x200,#worldwide
Gui, theChatLiveEngageInternational:Font, underline S10, w700
Gui, theChatLiveEngageInternational:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatLiveEngageInternational:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatLiveEngageInternational:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, International - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatLiveEngage:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatLiveEngageLostYouWName:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatLiveEngageLostYouWName:+AlwaysOnTop
Gui, theChatLiveEngageLostYouWName:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatLiveEngageLostYouWName:Color, FFFFFF
Gui, theChatLiveEngageLostYouWName:Font, S12, w700
Gui, theChatLiveEngageLostYouWName:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatLiveEngage, Back to LiveEngage
Gui, theChatLiveEngageLostYouWName:Font, S16, w700
Gui, theChatLiveEngageLostYouWName:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Lost You W/ Name
Gui, theChatLiveEngageLostYouWName:Font, S8, w700
Gui, theChatLiveEngageLostYouWName:Add, Text, center x12 y+10 w170, Hey there, thanks for chatting with CustomInk! I'm more than happy to personally help with anything you may need!
Gui, theChatLiveEngageLostYouWName:Font, S16, w700
Gui, theChatLiveEngageLostYouWName:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatLiveEngageLostYouWName:Font, S14, w700
Gui, theChatLiveEngageLostYouWName:Add, Text, center ym-10 x12 y+10 w180 h50 0x200, Alt + I
Gui, theChatLiveEngageLostYouWName:Font, underline S10, w700
Gui, theChatLiveEngageLostYouWName:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatLiveEngageLostYouWName:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatLiveEngageLostYouWName:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Lost You W/ Name - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatLiveEngage:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatLiveEngageLostYouWOName:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatLiveEngageLostYouWOName:+AlwaysOnTop
Gui, theChatLiveEngageLostYouWOName:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatLiveEngageLostYouWOName:Color, FFFFFF
Gui, theChatLiveEngageLostYouWOName:Font, S12, w700
Gui, theChatLiveEngageLostYouWOName:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatLiveEngage, Back to LiveEngage
Gui, theChatLiveEngageLostYouWOName:Font, S14, w700
Gui, theChatLiveEngageLostYouWOName:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Lost You W/O Name
Gui, theChatLiveEngageLostYouWOName:Font, S8, w700
Gui, theChatLiveEngageLostYouWOName:Add, Text, center x12 y+10 w170, I'm so sorry, it looks like I've lost you at the moment! I definitely want to continue personally assisting you, so I've saved everything we've spoken about to your account and we can pick up right where we left off when you can reach us again. Please feel free to give me another chat, shoot me an email at service@customink.com, or give us a ring at 1-800-293-4232, and any of our t-shirt ambassadors would be happy to help.
Gui, theChatLiveEngageLostYouWOName:Font, S16, w700
Gui, theChatLiveEngageLostYouWOName:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatLiveEngageLostYouWOName:Font, S14, w700
Gui, theChatLiveEngageLostYouWOName:Add, Text, center ym-10 x12 y+10 w180 h50 0x200, Alt + B
Gui, theChatLiveEngageLostYouWOName:Font, underline S10, w700
Gui, theChatLiveEngageLostYouWOName:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatLiveEngageLostYouWOName:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatLiveEngageLostYouWOName:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Lost You W/O Name - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatLiveEngage:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatLiveEngageMilitary:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatLiveEngageMilitary:+AlwaysOnTop
Gui, theChatLiveEngageMilitary:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatLiveEngageMilitary:Color, FFFFFF
Gui, theChatLiveEngageMilitary:Font, S12, w700
Gui, theChatLiveEngageMilitary:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatLiveEngage, Back to LiveEngage
Gui, theChatLiveEngageMilitary:Font, S16, w700
Gui, theChatLiveEngageMilitary:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Military
Gui, theChatLiveEngageMilitary:Font, S8, w700
Gui, theChatLiveEngageMilitary:Add, Text, center x12 y+10 w170, Our discounts are offered to all customers in the way of bulk pricing. For our military customers, we are happy to offer free Creative Art Services. This service will allow you to create artwork from scratch or have us touch up your images before placing your order.
Gui, theChatLiveEngageMilitary:Font, S16, w700
Gui, theChatLiveEngageMilitary:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatLiveEngageMilitary:Font, S14, w700
Gui, theChatLiveEngageMilitary:Add, Text, center ym-10 x12 y+10 w180 h50 0x200, Alt + A
Gui, theChatLiveEngageMilitary:Font, underline S10, w700
Gui, theChatLiveEngageMilitary:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatLiveEngageMilitary:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatLiveEngageMilitary:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Military - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatLiveEngage:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatLiveEngageNoCommWName:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatLiveEngageNoCommWName:+AlwaysOnTop
Gui, theChatLiveEngageNoCommWName:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatLiveEngageNoCommWName:Color, FFFFFF
Gui, theChatLiveEngageNoCommWName:Font, S12, w700
Gui, theChatLiveEngageNoCommWName:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatLiveEngage, Back to LiveEngage
Gui, theChatLiveEngageNoCommWName:Font, S14, w700
Gui, theChatLiveEngageNoCommWName:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, No Comm W/ Name
Gui, theChatLiveEngageNoCommWName:Font, S8, w700
Gui, theChatLiveEngageNoCommWName:Add, Text, center x12 y+10 w170, I'm so sorry $!{vars.get("identifier")}, it looks like I've lost you at the moment! I definitely want to continue personally assisting you, so I've saved everything we've spoken about to your account and we can pick up right where we left off when you can reach us again. Please feel free to give me another chat, shoot me an e-mail at service@customink.com, or give us a ring at 1-800-293-4232, and any of our t-shirt ambassadors will be happy to help!
Gui, theChatLiveEngageNoCommWName:Font, S16, w700
Gui, theChatLiveEngageNoCommWName:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatLiveEngageNoCommWName:Font, S14, w700
Gui, theChatLiveEngageNoCommWName:Add, Text, center ym-10 x12 y+10 w180 h50 0x200, Alt + V
Gui, theChatLiveEngageNoCommWName:Font, underline S10, w700
Gui, theChatLiveEngageNoCommWName:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatLiveEngageNoCommWName:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatLiveEngageNoCommWName:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, No Comm W/ Name - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatLiveEngage:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatLiveEngageNoCommWOName:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatLiveEngageNoCommWOName:+AlwaysOnTop
Gui, theChatLiveEngageNoCommWOName:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatLiveEngageNoCommWOName:Color, FFFFFF
Gui, theChatLiveEngageNoCommWOName:Font, S12, w700
Gui, theChatLiveEngageNoCommWOName:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatLiveEngage, Back to LiveEngage
Gui, theChatLiveEngageNoCommWOName:Font, S13, w700
Gui, theChatLiveEngageNoCommWOName:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, No Comm W/O Name
Gui, theChatLiveEngageNoCommWOName:Font, S8, w700
Gui, theChatLiveEngageNoCommWOName:Add, Text, center x12 y+10 w170,It looks like we weren't able to chat with you this time around. If you got your question answered - that's great! If not, chat us again, shoot me an e-mail at service@customink.com, or give us a ring at 1-800-293-4232, and any of our t-shirt ambassadors would be happy to help!
Gui, theChatLiveEngageNoCommWOName:Font, S16, w700
Gui, theChatLiveEngageNoCommWOName:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatLiveEngageNoCommWOName:Font, S14, w700
Gui, theChatLiveEngageNoCommWOName:Add, Text, center ym-10 x12 y+10 w180 h50 0x200, Alt + C
Gui, theChatLiveEngageNoCommWOName:Font, underline S10, w700
Gui, theChatLiveEngageNoCommWOName:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatLiveEngageNoCommWOName:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatLiveEngageNoCommWOName:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, No Comm W/O Name - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatLiveEngage:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatLiveEngageSimpleIntroName:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatLiveEngageSimpleIntroName:+AlwaysOnTop
Gui, theChatLiveEngageSimpleIntroName:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatLiveEngageSimpleIntroName:Color, FFFFFF
Gui, theChatLiveEngageSimpleIntroName:Font, S12, w700
Gui, theChatLiveEngageSimpleIntroName:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatLiveEngage, Back to LiveEngage
Gui, theChatLiveEngageSimpleIntroName:Font, S14, w700
Gui, theChatLiveEngageSimpleIntroName:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Simple Intro Name
Gui, theChatLiveEngageSimpleIntroName:Font, S8, w700
Gui, theChatLiveEngageSimpleIntroName:Add, Text, center x12 y+10 w170,It looks like we weren't able to chat with you this time around. If you got your question answered - that's great! If not, chat us again, shoot me an e-mail at service@customink.com, or give us a ring at 1-800-293-4232, and any of our t-shirt ambassadors would be happy to help!
Gui, theChatLiveEngageSimpleIntroName:Font, S16, w700
Gui, theChatLiveEngageSimpleIntroName:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatLiveEngageSimpleIntroName:Font, S14, w700
Gui, theChatLiveEngageSimpleIntroName:Add, Text, center ym-10 x12 y+10 w180 h50 0x200, Alt + N
Gui, theChatLiveEngageSimpleIntroName:Font, underline S10, w700
Gui, theChatLiveEngageSimpleIntroName:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatLiveEngageSimpleIntroName:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatLiveEngageSimpleIntroName:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Simple Intro Name - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatLiveEngage:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatPostOrder:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatPostOrder:+AlwaysOnTop
Gui, theChatPostOrder:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatPostOrder:Color, FFFFFF
Gui, theChatPostOrder:Font, S12, w700
Gui, theChatPostOrder:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChat, Back to Chat
Gui, theChatPostOrder:Font, underline S14, w700
Gui, theChatPostOrder:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatPostOrderCancelOrder v_CancelOrder, Cancel Order
Gui, theChatPostOrder:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatPostOrderCheckInfo v_CheckInfo, Check Info
Gui, theChatPostOrder:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatPostOrderDelivered v_Delivered, Delivered
Gui, theChatPostOrder:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatPostOrderOrderDone v_OrderDone, Order Done
Gui, theChatPostOrder:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatPostOrderOrderDoneLink v_OrderDoneLink, Order Done Link
Gui, theChatPostOrder:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatPostOrderPEML v_PEML, PEML Approval
Gui, theChatPostOrder:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatPostOrderPOInfo v_POInfo, PO Info
Gui, theChatPostOrder:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatPostOrderTracking v_Tracking, Tracking
Gui, theChatPostOrder:Font, underline S10, w700
Gui, theChatPostOrder:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatPostOrder:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatPostOrder:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Group - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChat:destroy
Gui, theChatPostOrderCancelOrder:destroy
Gui, theChatPostOrderCheckInfo:destroy
Gui, theChatPostOrderDelivered:destroy
Gui, theChatPostOrderOrderDone:destroy
Gui, theChatPostOrderOrderDoneLink:destroy
Gui, theChatPostOrderPEML:destroy
Gui, theChatPostOrderPOInfo:destroy
Gui, theChatPostOrderTracking:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatPostOrderCancelOrder:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatPostOrderCancelOrder:+AlwaysOnTop
Gui, theChatPostOrderCancelOrder:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatPostOrderCancelOrder:Color, FFFFFF
Gui, theChatPostOrderCancelOrder:Font, S12, w700
Gui, theChatPostOrderCancelOrder:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatPostOrder, Back to Post-Order
Gui, theChatPostOrderCancelOrder:Font, S18, w700
Gui, theChatPostOrderCancelOrder:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Cancel Order
Gui, theChatPostOrderCancelOrder:Font, S8, w700
Gui, theChatPostOrderCancelOrder:Add, Text, center x12 y+10 w170, I'm sorry to hear that you're canceling your order with us. However, I'm happy to help you with anything you need. It’ll just be one moment while I pull up your order and I'll get everything taken care of.
Gui, theChatPostOrderCancelOrder:Font, S16, w700
Gui, theChatPostOrderCancelOrder:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatPostOrderCancelOrder:Font, S14, w700
Gui, theChatPostOrderCancelOrder:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#cancelorder
Gui, theChatPostOrderCancelOrder:Font, underline S10, w700
Gui, theChatPostOrderCancelOrder:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatPostOrderCancelOrder:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatPostOrderCancelOrder:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Cancel Order - AHK
; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatPostOrder:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatPostOrderCheckInfo:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatPostOrderCheckInfo:+AlwaysOnTop
Gui, theChatPostOrderCheckInfo:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatPostOrderCheckInfo:Color, FFFFFF
Gui, theChatPostOrderCheckInfo:Font, S12, w700
Gui, theChatPostOrderCheckInfo:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatPostOrder, Back to Post-Order
Gui, theChatPostOrderCheckInfo:Font, S18, w700
Gui, theChatPostOrderCheckInfo:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Check Info
Gui, theChatPostOrderCheckInfo:Font, S8, w700
Gui, theChatPostOrderCheckInfo:Add, Text, center x12 y+10 w170, CustomInk's mailing address for checks/money orders varies depending on the method you use to send it. Make sure to reference your CustomInk order number: (*copied order number*) in the Memo section. When sending your payment by traditional mail: CustomInk PO Box 759439 Baltimore, MD 21275-9439 Attn: Accounts Receivable When sending your payment via any expedited fashion (Priority, 2nd Day, Overnight, etc.), FedEx or UPS: CustomInk Attn: Accounts Receivable 2910 District Ave Fairfax, VA 22031 Once we receive the check, we will be able to provide you with your guaranteed delivery date and begin processing your order. If you have any questions, please feel free to contact me at 800-293-4232 or respond to this email and I'll be happy to help you!
Gui, theChatPostOrderCheckInfo:Font, S16, w700
Gui, theChatPostOrderCheckInfo:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatPostOrderCheckInfo:Font, S14, w700
Gui, theChatPostOrderCheckInfo:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#checkinfo
Gui, theChatPostOrderCheckInfo:Font, underline S10, w700
Gui, theChatPostOrderCheckInfo:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatPostOrderCheckInfo:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatPostOrderCheckInfo:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Check Info - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatPostOrder:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatPostOrderDelivered:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatPostOrderDelivered:+AlwaysOnTop
Gui, theChatPostOrderDelivered:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatPostOrderDelivered:Color, FFFFFF
Gui, theChatPostOrderDelivered:Font, S12, w700
Gui, theChatPostOrderDelivered:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatPostOrder, Back to Post-Order
Gui, theChatPostOrderDelivered:Font, S18, w700
Gui, theChatPostOrderDelivered:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Delivered
Gui, theChatPostOrderDelivered:Font, S8, w700
Gui, theChatPostOrderDelivered:Add, Text, center x12 y+10 w170, Thank you for choosing CustomInk! I've been keeping track of your order since it was placed to make sure that everything has went smoothly and I saw it was recently delivered to you. I'm reaching out to you to make sure that you're 100`% satisfied with your custom items and to let you know that I'm here for you if you need anything at all! If you have any questions, please feel free to give me a call or respond to this e-mail and I'll be happy to help you! My personal contact details are listed below. Thanks again for choosing CustomInk and I hope you have a wonderful day!
Gui, theChatPostOrderDelivered:Font, S16, w700
Gui, theChatPostOrderDelivered:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatPostOrderDelivered:Font, S14, w700
Gui, theChatPostOrderDelivered:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#delivered
Gui, theChatPostOrderDelivered:Font, underline S10, w700
Gui, theChatPostOrderDelivered:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatPostOrderDelivered:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatPostOrderDelivered:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Delivered - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatPostOrder:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatPostOrderOrderDone:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatPostOrderOrderDone:+AlwaysOnTop
Gui, theChatPostOrderOrderDone:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatPostOrderOrderDone:Color, FFFFFF
Gui, theChatPostOrderOrderDone:Font, S12, w700
Gui, theChatPostOrderOrderDone:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatPostOrder, Back to Post-Order
Gui, theChatPostOrderOrderDone:Font, S18, w700
Gui, theChatPostOrderOrderDone:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Order Done
Gui, theChatPostOrderOrderDone:Font, S8, w700
Gui, theChatPostOrderOrderDone:Add, Text, center x12 y+10 w170, Ok, we’re all setup here! Your order is currently pending and we’ll start processing it just as soon as we complete payment. Your order number is %incNumber% and I’ll send you a confirmation email with all of your billing and tracking information. Once the payment has been received, the delivery clock for your order will begin.
Gui, theChatPostOrderOrderDone:Font, S16, w700
Gui, theChatPostOrderOrderDone:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatPostOrderOrderDone:Font, S14, w700
Gui, theChatPostOrderOrderDone:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#orderdone
Gui, theChatPostOrderOrderDone:Font, underline S10, w700
Gui, theChatPostOrderOrderDone:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatPostOrderOrderDone:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatPostOrderOrderDone:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Order Done - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatPostOrder:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatPostOrderOrderDoneLink:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatPostOrderOrderDoneLink:+AlwaysOnTop
Gui, theChatPostOrderOrderDoneLink:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatPostOrderOrderDoneLink:Color, FFFFFF
Gui, theChatPostOrderOrderDoneLink:Font, S12, w700
Gui, theChatPostOrderOrderDoneLink:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatPostOrder, Back to Post-Order
Gui, theChatPostOrderOrderDoneLink:Font, S18, w700
Gui, theChatPostOrderOrderDoneLink:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Order Done Link
Gui, theChatPostOrderOrderDoneLink:Font, S8, w700
Gui, theChatPostOrderOrderDoneLink:Add, Text, center x12 y+10 w170, Ok, we’re all setup here! Your order is currently pending and we’ll start processing it just as soon as we receive payment. Your order number is *copied order number* and I’m sending you a confirmation email with all of your billing details as well as a link where you can track your order. To complete payment, please click here to pay through our secure on-line system. Once the payment has been received, the delivery clock for your order will begin.
Gui, theChatPostOrderOrderDoneLink:Font, S16, w700
Gui, theChatPostOrderOrderDoneLink:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatPostOrderOrderDoneLink:Font, S14, w700
Gui, theChatPostOrderOrderDoneLink:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#orderdonelink
Gui, theChatPostOrderOrderDoneLink:Font, underline S10, w700
Gui, theChatPostOrderOrderDoneLink:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatPostOrderOrderDoneLink:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatPostOrderOrderDoneLink:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Order Done Link - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatPostOrder:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatPostOrderPEML:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatPostOrderPEML:+AlwaysOnTop
Gui, theChatPostOrderPEML:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatPostOrderPEML:Color, FFFFFF
Gui, theChatPostOrderPEML:Font, S12, w700
Gui, theChatPostOrderPEML:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatPostOrder, Back to Post-Order
Gui, theChatPostOrderPEML:Font, S18, w700
Gui, theChatPostOrderPEML:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, PEML Approval
Gui, theChatPostOrderPEML:Font, S8, w700
Gui, theChatPostOrderPEML:Add, Text, center x12 y+10 w170, Hi xxxx, Thank you for approving your proof! I’ve forwarded your order to our printing team. Your schedule is still guaranteed for your original delivery date of xxxxxxxx. Once your order ships, you’ll receive an email with tracking information. Please let me know if there is anything additional I can help you with. You can reply to this email, or call me at 1 (866) 485-8160. Thanks again,
Gui, theChatPostOrderPEML:Font, S16, w700
Gui, theChatPostOrderPEML:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatPostOrderPEML:Font, S14, w700
Gui, theChatPostOrderPEML:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#peml
Gui, theChatPostOrderPEML:Font, underline S10, w700
Gui, theChatPostOrderPEML:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatPostOrderPEML:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatPostOrderPEML:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, PEML Approval - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatPostOrder:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatPostOrderPOInfo:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatPostOrderPOInfo:+AlwaysOnTop
Gui, theChatPostOrderPOInfo:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatPostOrderPOInfo:Color, FFFFFF
Gui, theChatPostOrderPOInfo:Font, S12, w700
Gui, theChatPostOrderPOInfo:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatPostOrder, Back to Post-Order
Gui, theChatPostOrderPOInfo:Font, S18, w700
Gui, theChatPostOrderPOInfo:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, PO Info
Gui, theChatPostOrderPOInfo:Font, S8, w700
Gui, theChatPostOrderPOInfo:Add, Text, center x12 y+10 w170, Here are instructions to complete your order with CustomInk: To complete your pending order, please fax a copy of your PO to 703-935-0080. Please be sure your faxed PO includes the following information: * Purchase order number and date * Your CustomInk order number: (*copied order number*) * Billing address * Total $ amount * Authorized signature Your approval will be required to complete your order. We will send you an email as soon as your proofs are ready. Please monitor your email for this to avoid delays in your order. Your delivery date will be confirmed once we receive your signed PO.
Gui, theChatPostOrderPOInfo:Font, S16, w700
Gui, theChatPostOrderPOInfo:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatPostOrderPOInfo:Font, S14, w700
Gui, theChatPostOrderPOInfo:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#poinfo
Gui, theChatPostOrderPOInfo:Font, underline S10, w700
Gui, theChatPostOrderPOInfo:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatPostOrderPOInfo:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatPostOrderPOInfo:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, PO Info - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatPostOrder:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatPostOrderTracking:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatPostOrderTracking:+AlwaysOnTop
Gui, theChatPostOrderTracking:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatPostOrderTracking:Color, FFFFFF
Gui, theChatPostOrderTracking:Font, S12, w700
Gui, theChatPostOrderTracking:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatPostOrder, Back to Post-Order
Gui, theChatPostOrderTracking:Font, S18, w700
Gui, theChatPostOrderTracking:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Tracking
Gui, theChatPostOrderTracking:Font, S8, w700
Gui, theChatPostOrderTracking:Add, Text, center x12 y+10 w170, You can track your order status with us by using the following link: http://wwwapps.ups.com/WebTracking/track?track=yes&trackNums=%upsTracking%=*copied tracking number* Would you like me to send you an email with this link for reference?
Gui, theChatPostOrderTracking:Font, S16, w700
Gui, theChatPostOrderTracking:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatPostOrderTracking:Font, S14, w700
Gui, theChatPostOrderTracking:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#tracking
Gui, theChatPostOrderTracking:Font, underline S10, w700
Gui, theChatPostOrderTracking:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatPostOrderTracking:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatPostOrderTracking:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Tracking - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatPostOrder:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return 

ChatPreOrder:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatPreOrder:+AlwaysOnTop
Gui, theChatPreOrder:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatPreOrder:Color, FFFFFF
Gui, theChatPreOrder:Font, S12, w700
Gui, theChatPreOrder:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChat, Back to Chat
Gui, theChatPreOrder:Font, underline S14, w700
Gui, theChatPreOrder:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatPreOrderPreAddress v_PreAddress, Pre-Address
Gui, theChatPreOrder:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatPreOrderPreConfirm v_PreConfirm, Pre-Confirm
Gui, theChatPreOrder:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatPreOrderPreContact v_PreContact, Pre-Contact
Gui, theChatPreOrder:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatPreOrderPreShipping v_PreShipping, Pre-Shipping
Gui, theChatPreOrder:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatPreOrderPreSingles v_PreSingles, Pre-Singles
Gui, theChatPreOrder:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatPreOrderVoucherCode v_VoucherCode, Voucher Code
Gui, theChatPreOrder:Font, underline S10, w700
Gui, theChatPreOrder:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatPreOrder:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatPreOrder:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Pre-Order - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChat:destroy
Gui, theChatPreOrderPreAddress:destroy
Gui, theChatPreOrderPreConfirm:destroy
Gui, theChatPreOrderPreContact:destroy
Gui, theChatPreOrderPreShipping:destroy
Gui, theChatPreOrderPreSingles:destroy
Gui, theChatPreOrderVoucherCode:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatPreOrderPreAddress:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatPreOrderPreAddress:+AlwaysOnTop
Gui, theChatPreOrderPreAddress:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatPreOrderPreAddress:Color, FFFFFF
Gui, theChatPreOrderPreAddress:Font, S12, w700
Gui, theChatPreOrderPreAddress:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatPreOrder, Back to Pre-Order
Gui, theChatPreOrderPreAddress:Font, S18, w700
Gui, theChatPreOrderPreAddress:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Pre-Address
Gui, theChatPreOrderPreAddress:Font, S8, w700
Gui, theChatPreOrderPreAddress:Add, Text, center x12 y+10 w170, Thanks! What address would you like us to use for delivery? Is this a business or residence?
Gui, theChatPreOrderPreAddress:Font, S16, w700
Gui, theChatPreOrderPreAddress:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatPreOrderPreAddress:Font, S14, w700
Gui, theChatPreOrderPreAddress:Add, Text, center ym-10 x12 y+10 w180 h50 0x200, #preaddress
Gui, theChatPreOrderPreAddress:Font, underline S10, w700
Gui, theChatPreOrderPreAddress:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatPreOrderPreAddress:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatPreOrderPreAddress:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Pre-Address - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatPreOrder:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatPreOrderPreConfirm:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatPreOrderPreConfirm:+AlwaysOnTop
Gui, theChatPreOrderPreConfirm:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatPreOrderPreConfirm:Color, FFFFFF
Gui, theChatPreOrderPreConfirm:Font, S12, w700
Gui, theChatPreOrderPreConfirm:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatPreOrder, Back to Pre-Order
Gui, theChatPreOrderPreConfirm:Font, S18, w700
Gui, theChatPreOrderPreConfirm:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Pre-Confirm
Gui, theChatPreOrderPreConfirm:Font, S8, w700
Gui, theChatPreOrderPreConfirm:Add, Text, center x12 y+10 w170, It looks like everything here is setup! To confirm, we're guaranteed to deliver ____ total items to your *copied street address* address on or before _________. The all-inclusive total for your order is _______. If everything looks good to you, I can place the order now and send you the link to complete payment on our website.
Gui, theChatPreOrderPreConfirm:Font, S16, w700
Gui, theChatPreOrderPreConfirm:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatPreOrderPreConfirm:Font, S14, w700
Gui, theChatPreOrderPreConfirm:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#preconfirm
Gui, theChatPreOrderPreConfirm:Font, underline S10, w700
Gui, theChatPreOrderPreConfirm:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatPreOrderPreConfirm:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatPreOrderPreConfirm:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Pre-Confirm - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatPreOrder:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatPreOrderPreContact:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatPreOrderPreContact:+AlwaysOnTop
Gui, theChatPreOrderPreContact:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatPreOrderPreContact:Color, FFFFFF
Gui, theChatPreOrderPreContact:Font, S12, w700
Gui, theChatPreOrderPreContact:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatPreOrder, Back to Pre-Order
Gui, theChatPreOrderPreContact:Font, S18, w700
Gui, theChatPreOrderPreContact:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Pre-Contact
Gui, theChatPreOrderPreContact:Font, S8, w700
Gui, theChatPreOrderPreContact:Add, Text, center x12 y+10 w170, May I have your full name and a good number where we can reach you if we have questions about the order? Also, may I ask how you heard about us?
Gui, theChatPreOrderPreContact:Font, S16, w700
Gui, theChatPreOrderPreContact:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatPreOrderPreContact:Font, S14, w700
Gui, theChatPreOrderPreContact:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#precontact
Gui, theChatPreOrderPreContact:Font, underline S10, w700
Gui, theChatPreOrderPreContact:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatPreOrderPreContact:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatPreOrderPreContact:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Pre-Contact - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatPreOrder:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatPreOrderPreShipping:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatPreOrderPreShipping:+AlwaysOnTop
Gui, theChatPreOrderPreShipping:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatPreOrderPreShipping:Color, FFFFFF
Gui, theChatPreOrderPreShipping:Font, S12, w700
Gui, theChatPreOrderPreShipping:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatPreOrder, Back to Pre-Order
Gui, theChatPreOrderPreShipping:Font, S18, w700
Gui, theChatPreOrderPreShipping:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Pre-Shipping
Gui, theChatPreOrderPreShipping:Font, S8, w700
Gui, theChatPreOrderPreShipping:Add, Text, center x12 y+10 w170, Great, I've got that noted. I can guarantee your order to be delivered on or before ___________. Does that date work for you?
Gui, theChatPreOrderPreShipping:Font, S16, w700
Gui, theChatPreOrderPreShipping:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatPreOrderPreShipping:Font, S14, w700
Gui, theChatPreOrderPreShipping:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#preshipping
Gui, theChatPreOrderPreShipping:Font, underline S10, w700
Gui, theChatPreOrderPreShipping:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatPreOrderPreShipping:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatPreOrderPreShipping:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Pre-Shipping - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatPreOrder:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatPreOrderPreSingles:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatPreOrderPreSingles:+AlwaysOnTop
Gui, theChatPreOrderPreSingles:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatPreOrderPreSingles:Color, FFFFFF
Gui, theChatPreOrderPreSingles:Font, S12, w700
Gui, theChatPreOrderPreSingles:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatPreOrder, Back to Pre-Order
Gui, theChatPreOrderPreSingles:Font, S18, w700
Gui, theChatPreOrderPreSingles:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Pre-Singles
Gui, theChatPreOrderPreSingles:Font, S8, w700
Gui, theChatPreOrderPreSingles:Add, Text, center x12 y+10 w170, I would love to help, however, we don't currently have a way to take payment through chat. If you'd like to place your order over the phone with us, please give us a call at 800-293-4232 and we'll be happy to get everything setup for you!
Gui, theChatPreOrderPreSingles:Font, S16, w700
Gui, theChatPreOrderPreSingles:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatPreOrderPreSingles:Font, S14, w700
Gui, theChatPreOrderPreSingles:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#presingles
Gui, theChatPreOrderPreSingles:Font, underline S10, w700
Gui, theChatPreOrderPreSingles:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatPreOrderPreSingles:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatPreOrderPreSingles:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Pre-Singles - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatPreOrder:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatPreOrderVoucherCode:

WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatPreOrderVoucherCode:+AlwaysOnTop
Gui, theChatPreOrderVoucherCode:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatPreOrderVoucherCode:Color, FFFFFF
Gui, theChatPreOrderVoucherCode:Font, S12, w700
Gui, theChatPreOrderVoucherCode:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatPreOrder, Back to Pre-Order
Gui, theChatPreOrderVoucherCode:Font, S18, w700
Gui, theChatPreOrderVoucherCode:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Voucher Code
Gui, theChatPreOrderVoucherCode:Font, S8, w700
Gui, theChatPreOrderVoucherCode:Add, Text, center x12 y+10 w170, After you finish working in the Design Lab, the first page of the checkout cart is the Summary Page. Beneath your current order total will be red text, which reads, "Do you have a voucher code?". Clicking this text will reveal a box where you can enter your unique code! Please let me know if this works, as I'd be happy to personally enter that code for you as well.
Gui, theChatPreOrderVoucherCode:Font, S16, w700
Gui, theChatPreOrderVoucherCode:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatPreOrderVoucherCode:Font, S14, w700
Gui, theChatPreOrderVoucherCode:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#vouchercode
Gui, theChatPreOrderVoucherCode:Font, underline S10, w700
Gui, theChatPreOrderVoucherCode:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatPreOrderVoucherCode:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatPreOrderVoucherCode:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Voucher Code - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatPreOrder:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatProblem:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,



Gui, theChatProblem:+AlwaysOnTop
Gui, theChatProblem:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatProblem:Color, FFFFFF
Gui, theChatProblem:Font, S12, w700
Gui, theChatProblem:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChat, Back to Chat
Gui, theChatProblem:Font, underline S14, w700
Gui, theChatProblem:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatProblemConfirmFix v_ConfirmFix, Confirm Fix
Gui, theChatProblem:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatProblemCrookedPhoto v_CrookedPhoto, Crooked Photo
Gui, theChatProblem:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatProblemCrookedReport v_CrookedReport, Crooked Report
Gui, theChatProblem:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatProblemGhosting v_Ghosting, Ghosting
Gui, theChatProblem:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatProblemPartial v_Partial, Partial
Gui, theChatProblem:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatProblemProblemFull v_ProblemFull, Problem Full
Gui, theChatProblem:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatProblemProblemHelp v_ProblemHelp, Problem Help
Gui, theChatProblem:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatProblemProblemPhoto v_ProblemPhoto, Problem Photo
Gui, theChatProblem:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatProblemProblemReturn v_ProblemReturn, Problem Return
Gui, theChatProblem:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatProblemProblemReview v_ProblemReview, Problem Review
Gui, theChatProblem:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatProblemProblemSizing v_ProblemSizing, Problem Sizing
Gui, theChatProblem:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatProblemProblemTones v_ProblemTones, Problem Tones
Gui, theChatProblem:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatProblemSwapPackage v_SwapPackage, Swap Package
Gui, theChatProblem:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatProblemVoucher v_Voucher, Voucher

Gui, theChatProblem:Font, underline S10, w700
Gui, theChatProblem:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatProblem:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatProblem:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Problem - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChat:destroy
Gui, theChatProblemConfirmFix:destroy
Gui, theChatProblemCrookedPhoto:destroy
Gui, theChatProblemCrookedReport:destroy
Gui, theChatProblemGhosting:destroy
Gui, theChatProblemPartial:destroy
Gui, theChatProblemProblemFull:destroy
Gui, theChatProblemProblemHelp:destroy
Gui, theChatProblemProblemPhoto:destroy
Gui, theChatProblemProblemReturn:destroy
Gui, theChatProblemProblemReview:destroy
Gui, theChatProblemProblemSizing:destroy
Gui, theChatProblemProblemTones:destroy
Gui, theChatProblemSwapPackage:destroy
Gui, theChatProblemProblemVoucher:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatProblemConfirmFix:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatProblemConfirmFix:+AlwaysOnTop
Gui, theChatProblemConfirmFix:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatProblemConfirmFix:Color, FFFFFF
Gui, theChatProblemConfirmFix:Font, S12, w700
Gui, theChatProblemConfirmFix:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatProblem, Back to Problem
Gui, theChatProblemConfirmFix:Font, S18, w700
Gui, theChatProblemConfirmFix:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Confirm Fix
Gui, theChatProblemConfirmFix:Font, S8, w700
Gui, theChatProblemConfirmFix:Add, Text, center x12 y+10 w170, Before we start your replacement order, I wanted to check in with you and see if there are any changes you would like to make to your artwork or sizes before we start?  If not, we can proceed right away. Please see the breakdown for the items and sizes we are sending you in this shipment: {Quote Only}
Gui, theChatProblemConfirmFix:Font, S16, w700
Gui, theChatProblemConfirmFix:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatProblemConfirmFix:Font, S14, w700
Gui, theChatProblemConfirmFix:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#confirmfix
Gui, theChatProblemConfirmFix:Font, underline S10, w700
Gui, theChatProblemConfirmFix:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatProblemConfirmFix:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatProblemConfirmFix:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Confirm Fix - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatProblem:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatProblemCrookedPhoto:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatProblemCrookedPhoto:+AlwaysOnTop
Gui, theChatProblemCrookedPhoto:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatProblemCrookedPhoto:Color, FFFFFF
Gui, theChatProblemCrookedPhoto:Font, S12, w700
Gui, theChatProblemCrookedPhoto:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatProblem, Back to Problem
Gui, theChatProblemCrookedPhoto:Font, S18, w700
Gui, theChatProblemCrookedPhoto:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Crooked Photo
Gui, theChatProblemCrookedPhoto:Font, S8, w700
Gui, theChatProblemCrookedPhoto:Add, Text, center x12 y+10 w170, I am so sorry to hear that your items came in crooked. Sometimes the print team slightly tilt the artwork so that it appears straight when you wear it. Would you mind trying on your shirts and seeing if this is the issue?
Gui, theChatProblemCrookedPhoto:Font, S16, w700
Gui, theChatProblemCrookedPhoto:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatProblemCrookedPhoto:Font, S14, w700
Gui, theChatProblemCrookedPhoto:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#crookedphoto
Gui, theChatProblemCrookedPhoto:Font, underline S10, w700
Gui, theChatProblemCrookedPhoto:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatProblemCrookedPhoto:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatProblemCrookedPhoto:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Crooked Photo - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatProblem:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return


ChatProblemCrookedReport:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatProblemCrookedReport:+AlwaysOnTop
Gui, theChatProblemCrookedReport:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatProblemCrookedReport:Color, FFFFFF
Gui, theChatProblemCrookedReport:Font, S12, w700
Gui, theChatProblemCrookedReport:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatProblem, Back to Problem
Gui, theChatProblemCrookedReport:Font, S18, w700
Gui, theChatProblemCrookedReport:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Crooked Report
Gui, theChatProblemCrookedReport:Font, S8, w700
Gui, theChatProblemCrookedReport:Add, Text, center x12 y+10 w170, Thank you so much for Chating in! I am so sorry to hear that something went wrong in your order. Something I've found that helps either solve or mitigate this issue is trying the garments on--a lot of the time, designs can look off-center or crooked out of the box, however the effect goes away when those items are worn. Will you let me know if this happens?
Gui, theChatProblemCrookedReport:Font, S16, w700
Gui, theChatProblemCrookedReport:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatProblemCrookedReport:Font, S14, w700
Gui, theChatProblemCrookedReport:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#crookedreport
Gui, theChatProblemCrookedReport:Font, underline S10, w700
Gui, theChatProblemCrookedReport:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatProblemCrookedReport:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatProblemCrookedReport:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Crooked Report - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatProblem:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatProblemGhosting:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatProblemGhosting:+AlwaysOnTop
Gui, theChatProblemGhosting:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatProblemGhosting:Color, FFFFFF
Gui, theChatProblemGhosting:Font, S12, w700
Gui, theChatProblemGhosting:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatProblem, Back to Problem
Gui, theChatProblemGhosting:Font, S18, w700
Gui, theChatProblemGhosting:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Ghosting
Gui, theChatProblemGhosting:Font, S8, w700
Gui, theChatProblemGhosting:Add, Text, center x12 y+10 w170, What you are describing sounds like an issue we occasionally run into that happens when there is a unique combination of temperature and humidity during the shipping process. If I am correct, the great news is that a quick run through the wash will completely remedy this situation. Please take a picture showing the the shirts and reply back to this email so I can be sure. Then, I’ll likely have you toss at least one in the wash to see if that fixes things. If not, I can work on getting the shirts back for our team to inspect.
Gui, theChatProblemGhosting:Font, S16, w700
Gui, theChatProblemGhosting:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatProblemGhosting:Font, S14, w700
Gui, theChatProblemGhosting:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#ghosting
Gui, theChatProblemGhosting:Font, underline S10, w700
Gui, theChatProblemGhosting:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatProblemGhosting:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatProblemGhosting:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Ghosting - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatProblem:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatProblemPartial:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatProblemPartial:+AlwaysOnTop
Gui, theChatProblemPartial:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatProblemPartial:Color, FFFFFF
Gui, theChatProblemPartial:Font, S12, w700
Gui, theChatProblemPartial:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatProblem, Back to Problem
Gui, theChatProblemPartial:Font, S18, w700
Gui, theChatProblemPartial:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Partial
Gui, theChatProblemPartial:Font, S8, w700
Gui, theChatProblemPartial:Add, Text, center x12 y+10 w170, Thank you so much for getting back to me! I am so sorry about the issues you’ve experienced with your order. I can offer a partial refund back on your order of {AMOUNT HERE} for the inconvenience this has all caused. Would that work out for you?
Gui, theChatProblemPartial:Font, S16, w700
Gui, theChatProblemPartial:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatProblemPartial:Font, S14, w700
Gui, theChatProblemPartial:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#partial
Gui, theChatProblemPartial:Font, underline S10, w700
Gui, theChatProblemPartial:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatProblemPartial:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatProblemPartial:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Partial - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatProblem:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return


ChatProblemProblemFull:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatProblemProblemFull:+AlwaysOnTop
Gui, theChatProblemProblemFull:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatProblemProblemFull:Color, FFFFFF
Gui, theChatProblemProblemFull:Font, S12, w700
Gui, theChatProblemProblemFull:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatProblem, Back to Problem
Gui, theChatProblemProblemFull:Font, S18, w700
Gui, theChatProblemProblemFull:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Problem Full
Gui, theChatProblemProblemFull:Font, S8, w700
Gui, theChatProblemProblemFull:Add, Text, center x12 y+10 w170, Hello there, Thanks so much for reaching out to us about the problems you discovered with your order. I am so sorry to hear that the final product was inconsistent with the quality you were expecting. I want to be sure you're totally satisfied, and I can definitely work with you on getting this resolved. Is it possible for you to send me some photos of the problem spots? They can be a big help in documenting the mistakes up front and give us insight into the cause of the problem. It's possible we may need to get those returned to fully understand the issue and ensure we provide you with the best resolution possible. I want to make sure I'm working within your timeline, is there an upcoming event you need these for?  If it turns out that we don't have time for a full investigation, I'm happy to discuss other options with you. Please let me know if you have any questions or concerns about all of this, and I again apologize for the problem with your order. Thanks, and I look forward to hearing from you,
Gui, theChatProblemProblemFull:Font, S16, w700
Gui, theChatProblemProblemFull:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatProblemProblemFull:Font, S14, w700
Gui, theChatProblemProblemFull:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#probfull
Gui, theChatProblemProblemFull:Font, underline S10, w700
Gui, theChatProblemProblemFull:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatProblemProblemFull:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatProblemProblemFull:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Problem Full - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatProblem:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatProblemProblemHelp:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatProblemProblemHelp:+AlwaysOnTop
Gui, theChatProblemProblemHelp:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatProblemProblemHelp:Color, FFFFFF
Gui, theChatProblemProblemHelp:Font, S12, w700
Gui, theChatProblemProblemHelp:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatProblem, Back to Problem
Gui, theChatProblemProblemHelp:Font, S18, w700
Gui, theChatProblemProblemHelp:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Problem Help
Gui, theChatProblemProblemHelp:Font, S8, w700
Gui, theChatProblemProblemHelp:Add, Text, center x12 y+10 w170, I'm sorry to hear that there was a problem with your order. I'm here to help you find the right solution.
Gui, theChatProblemProblemHelp:Font, S16, w700
Gui, theChatProblemProblemHelp:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatProblemProblemHelp:Font, S14, w700
Gui, theChatProblemProblemHelp:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#probhelp
Gui, theChatProblemProblemHelp:Font, underline S10, w700
Gui, theChatProblemProblemHelp:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatProblemProblemHelp:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatProblemProblemHelp:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Problem Help - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatProblem:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatProblemProblemPhoto:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatProblemProblemPhoto:+AlwaysOnTop
Gui, theChatProblemProblemPhoto:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatProblemProblemPhoto:Color, FFFFFF
Gui, theChatProblemProblemPhoto:Font, S12, w700
Gui, theChatProblemProblemPhoto:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatProblem, Back to Problem
Gui, theChatProblemProblemPhoto:Font, S18, w700
Gui, theChatProblemProblemPhoto:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Problem Photo
Gui, theChatProblemProblemPhoto:Font, S8, w700
Gui, theChatProblemProblemPhoto:Add, Text, center x12 y+10 w170, Would it be possible for you to take photos so I can review the problem? I can send you an email and, if you can respond to the email with those photos attached, I can review them with my production team and figure out the best solution! If you have a little bit of time, I can send you the email right now and we can work to get this resolved while we're chatting. Alternatively, I can email or give you a call just as soon as I've found a resolution for this issue so you don't have to wait while I'm working on this.
Gui, theChatProblemProblemPhoto:Font, S16, w700
Gui, theChatProblemProblemPhoto:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatProblemProblemPhoto:Font, S14, w700
Gui, theChatProblemProblemPhoto:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#probphoto
Gui, theChatProblemProblemPhoto:Font, underline S10, w700
Gui, theChatProblemProblemPhoto:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatProblemProblemPhoto:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatProblemProblemPhoto:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Problem Photo - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatProblem:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatProblemProblemReturn:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatProblemProblemReturn:+AlwaysOnTop
Gui, theChatProblemProblemReturn:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatProblemProblemReturn:Color, FFFFFF
Gui, theChatProblemProblemReturn:Font, S12, w700
Gui, theChatProblemProblemReturn:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatProblem, Back to Problem
Gui, theChatProblemProblemReturn:Font, S18, w700
Gui, theChatProblemProblemReturn:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Problem Return
Gui, theChatProblemProblemReturn:Font, S8, w700
Gui, theChatProblemProblemReturn:Add, Text, center x12 y+10 w170, I would like to get your order returned to us for inspection. Our team will go over every aspect of the items and your reported concerns to see what happened with your order. If it is correctly printed as it was supposed to be done, we can arrange to have this sent back to you in a timely manner so we do not miss your event. If they are not, we will contact you to see how you would like to proceed.
Gui, theChatProblemProblemReturn:Font, S16, w700
Gui, theChatProblemProblemReturn:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatProblemProblemReturn:Font, S14, w700
Gui, theChatProblemProblemReturn:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#probreturn
Gui, theChatProblemProblemReturn:Font, underline S10, w700
Gui, theChatProblemProblemReturn:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatProblemProblemReturn:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatProblemProblemReturn:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Problem Return - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatProblem:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatProblemProblemReview:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatProblemProblemReview:+AlwaysOnTop
Gui, theChatProblemProblemReview:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatProblemProblemReview:Color, FFFFFF
Gui, theChatProblemProblemReview:Font, S12, w700
Gui, theChatProblemProblemReview:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatProblem, Back to Problem
Gui, theChatProblemProblemReview:Font, S18, w700
Gui, theChatProblemProblemReview:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Problem Review
Gui, theChatProblemProblemReview:Font, S8, w700
Gui, theChatProblemProblemReview:Add, Text, center x12 y+10 w170, I'm going to take a moment to review your order here, but I'll still be here if you need anything in the meantime!
Gui, theChatProblemProblemReview:Font, S16, w700
Gui, theChatProblemProblemReview:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatProblemProblemReview:Font, S14, w700
Gui, theChatProblemProblemReview:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#probreview
Gui, theChatProblemProblemReview:Font, underline S10, w700
Gui, theChatProblemProblemReview:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatProblemProblemReview:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatProblemProblemReview:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Problem Review - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatProblem:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatProblemProblemSizing:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatProblemProblemSizing:+AlwaysOnTop
Gui, theChatProblemProblemSizing:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatProblemProblemSizing:Color, FFFFFF
Gui, theChatProblemProblemSizing:Font, S12, w700
Gui, theChatProblemProblemSizing:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatProblem, Back to Problem
Gui, theChatProblemProblemSizing:Font, S18, w700
Gui, theChatProblemProblemSizing:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Problem Sizing
Gui, theChatProblemProblemSizing:Font, S8, w700
Gui, theChatProblemProblemSizing:Add, Text, center x12 y+10 w170, I definitely understand that sizing can be a hard one to determine when you are ordering online. We try to keep this as intuitive as possible. Did you get a chance to look at our sizing line up for these items? [SIZING LINE UP] How do you feel your shirts are fitting in comparison to this sizing chart? Each person’s body is unique, which may cause items to fit differently. However, sometimes there are manufacturing errors where the item is mislabeled or incorrectly made. Because of these possibilities, we may have you send these items back for a print specialist to inspect. If these items are incorrect, we will replace them. If they are what we state on our sizing line up, we can work out some special pricing on a new order for items that are needed. Does that work for you?
Gui, theChatProblemProblemSizing:Font, S16, w700
Gui, theChatProblemProblemSizing:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatProblemProblemSizing:Font, S14, w700
Gui, theChatProblemProblemSizing:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#probsizing
Gui, theChatProblemProblemSizing:Font, underline S10, w700
Gui, theChatProblemProblemSizing:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatProblemProblemSizing:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatProblemProblemSizing:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Problem Sizing - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatProblem:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatProblemProblemTones:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatProblemProblemTones:+AlwaysOnTop
Gui, theChatProblemProblemTones:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatProblemProblemTones:Color, FFFFFF
Gui, theChatProblemProblemTones:Font, S12, w700
Gui, theChatProblemProblemTones:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatProblem, Back to Problem
Gui, theChatProblemProblemTones:Font, S18, w700
Gui, theChatProblemProblemTones:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Problem Tones
Gui, theChatProblemProblemTones:Font, S8, w700
Gui, theChatProblemProblemTones:Add, Text, center x12 y+10 w170, You had mentioned that your design looks different than you had imagined. It appears in your design we used halftones to create the shading in your artwork. This is a series of dots that are printed on your shirt to create a gradient affect from a light to dark color. These are a finely executed print process to make it appears as close to your original artwork as possible. Would you mind sending me a photo so I can see if your halftones were done correctly?
Gui, theChatProblemProblemTones:Font, S16, w700
Gui, theChatProblemProblemTones:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatProblemProblemTones:Font, S14, w700
Gui, theChatProblemProblemTones:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#probtones
Gui, theChatProblemProblemTones:Font, underline S10, w700
Gui, theChatProblemProblemTones:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatProblemProblemTones:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatProblemProblemTones:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Problem Tones - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatProblem:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return


ChatProblemSwapPackage:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatProblemSwapPackage:+AlwaysOnTop
Gui, theChatProblemSwapPackage:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatProblemSwapPackage:Color, FFFFFF
Gui, theChatProblemSwapPackage:Font, S12, w700
Gui, theChatProblemSwapPackage:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatProblem, Back to Problem
Gui, theChatProblemSwapPackage:Font, S18, w700
Gui, theChatProblemSwapPackage:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Swap Package
Gui, theChatProblemSwapPackage:Font, S8, w700
Gui, theChatProblemSwapPackage:Add, Text, center x12 y+10 w170, Today's Date:Order Numbers Involved: (a) (b)Which Order Reported and How:How Was The Corresponding Order Contacted:Location Of Orders:(a):(b):Event Dates:(a):(b):Investigation Steps:Pick-up/Return Tracking Numbers, or Fix Order Numbers:(a):(b):Resolution Options:
Gui, theChatProblemSwapPackage:Font, S16, w700
Gui, theChatProblemSwapPackage:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatProblemSwapPackage:Font, S14, w700
Gui, theChatProblemSwapPackage:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#swappackage
Gui, theChatProblemSwapPackage:Font, underline S10, w700
Gui, theChatProblemSwapPackage:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatProblemSwapPackage:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatProblemSwapPackage:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Swap Package - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatProblem:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return


ChatProblemVoucher:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatProblemProblemVoucher:+AlwaysOnTop
Gui, theChatProblemProblemVoucher:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatProblemProblemVoucher:Color, FFFFFF
Gui, theChatProblemProblemVoucher:Font, S12, w700
Gui, theChatProblemProblemVoucher:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatProblem, Back to Problem
Gui, theChatProblemProblemVoucher:Font, S18, w700
Gui, theChatProblemProblemVoucher:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Voucher
Gui, theChatProblemProblemVoucher:Font, S8, w700
Gui, theChatProblemProblemVoucher:Add, Text, center x12 y+10 w170, I hope you're having a great week! I wanted to touch base with you because I see your replacement order was delivered. How does it look? I have created a voucher for the inconvenience. You can apply it at checkout: *copied voucher number* This code for $XX will be on file in our system, so don't worry if you lose this email, just give us a call and we can take care of the rest. Please let me know if you have any questions or concerns, and thanks for your patience in working through this issue!
Gui, theChatProblemProblemVoucher:Font, S16, w700
Gui, theChatProblemProblemVoucher:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatProblemProblemVoucher:Font, S14, w700
Gui, theChatProblemProblemVoucher:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#voucher
Gui, theChatProblemProblemVoucher:Font, underline S10, w700
Gui, theChatProblemProblemVoucher:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatProblemProblemVoucher:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatProblemProblemVoucher:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Voucher - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatProblem:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatProduct:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatProduct:+AlwaysOnTop
Gui, theChatProduct:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatProduct:Color, FFFFFF
Gui, theChatProduct:Font, S12, w700
Gui, theChatProduct:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChat, Back to Chat
Gui, theChatProduct:Font, underline S14, w700
Gui, theChatProduct:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatProductsBottles v_Bottles, Bottles
Gui, theChatProduct:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatProductsCanadaBlanks v_CanadaBlanks, Canada Blanks
Gui, theChatProduct:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatProductsCups v_Cups, Cups
Gui, theChatProduct:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatProductsGlasses v_Glasses, Glasses
Gui, theChatProduct:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatProductsKoozies v_Koozies, Koozies
Gui, theChatProduct:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatProductsMagnets v_Magnets, Magnets
Gui, theChatProduct:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatProductsMousepads v_Mousepads, Mousepads
Gui, theChatProduct:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatProductsMugs v_Mugs, Mugs
Gui, theChatProduct:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatProductsPaper v_Paper, Paper
Gui, theChatProduct:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatProductsPens v_Pens, Pens
Gui, theChatProduct:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatProductsSample v_Sample, Sample
Gui, theChatProduct:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatProductsStickers v_Stickers, Stickers
Gui, theChatProduct:Font, underline S10, w700
Gui, theChatProduct:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatProduct:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatProduct:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Problem - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChat:destroy
Gui, theChatProductBottles:destroy
Gui, theChatProductCanadaBlanks:destroy
Gui, theChatProductCups:destroy
Gui, theChatProductGlasses:destroy
Gui, theChatProductKoozies:destroy
Gui, theChatProductMagnets:destroy
Gui, theChatProductMousepads:destroy
Gui, theChatProductMugs:destroy
Gui, theChatProductPaper:destroy
Gui, theChatProductPens:destroy
Gui, theChatProductSample:destroy
Gui, theChatProductStickers:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatProductsBottles:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatProductBottles:+AlwaysOnTop
Gui, theChatProductBottles:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatProductBottles:Color, FFFFFF
Gui, theChatProductBottles:Font, S12, w700
Gui, theChatProductBottles:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatProduct, Back to Product
Gui, theChatProductBottles:Font, S18, w700
Gui, theChatProductBottles:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Bottles
Gui, theChatProductBottles:Font, S8, w700
Gui, theChatProductBottles:Add, Text, center x12 y+10 w170, Currently, the minimum to order water bottles ranges between 50 and 100, depending on the particular product. Printing on bottles is very labor intensive, and having a higher minimum allows us to give your order the attention it deserves.  I'd be happy to show you some pricing if you'd like to order water bottles within those quantities
Gui, theChatProductBottles:Font, S16, w700
Gui, theChatProductBottles:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatProductBottles:Font, S14, w700
Gui, theChatProductBottles:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#bottles
Gui, theChatProductBottles:Font, underline S10, w700
Gui, theChatProductBottles:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatProductBottles:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatProductBottles:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Bottles - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatProduct:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatProductsCanadaBlanks:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatProductCanadaBlanks:+AlwaysOnTop
Gui, theChatProductCanadaBlanks:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatProductCanadaBlanks:Color, FFFFFF
Gui, theChatProductCanadaBlanks:Font, S12, w700
Gui, theChatProductCanadaBlanks:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatProduct, Back to Product
Gui, theChatProductCanadaBlanks:Font, S18, w700
Gui, theChatProductCanadaBlanks:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Canada Blanks
Gui, theChatProductCanadaBlanks:Font, S8, w700
Gui, theChatProductCanadaBlanks:Add, Text, center x12 y+10 w170, We are located in the United States, but have a specific selection of products available for our Canadian customers. If you use the link below, you'll be able to check out the products that we can use with your custom design.http://www.customink.com/categories/canada-products/64
Gui, theChatProductCanadaBlanks:Font, S16, w700
Gui, theChatProductCanadaBlanks:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatProductCanadaBlanks:Font, S14, w700
Gui, theChatProductCanadaBlanks:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#canadablanks
Gui, theChatProductCanadaBlanks:Font, underline S10, w700
Gui, theChatProductCanadaBlanks:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatProductCanadaBlanks:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatProductCanadaBlanks:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Canada Blanks - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatProduct:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatProductsCups:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatProductCups:+AlwaysOnTop
Gui, theChatProductCups:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatProductCups:Color, FFFFFF
Gui, theChatProductCups:Font, S12, w700
Gui, theChatProductCups:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatProduct, Back to Product
Gui, theChatProductCups:Font, S18, w700
Gui, theChatProductCups:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Cups
Gui, theChatProductCups:Font, S8, w700
Gui, theChatProductCups:Add, Text, center x12 y+10 w170, Currently, the minimum to order cups ranges between 72 and 100, depending on the type. Printing on cups is very labor intensive, and having a higher minimum allows us to give your order the attention it deserves. I'm happy to show you some pricing if you'd like to order cups within those quantities!
Gui, theChatProductCups:Font, S16, w700
Gui, theChatProductCups:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatProductCups:Font, S14, w700
Gui, theChatProductCups:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#cups
Gui, theChatProductCups:Font, underline S10, w700
Gui, theChatProductCups:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatProductCups:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatProductCups:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Cups - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatProduct:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatProductsGlasses:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatProductGlasses:+AlwaysOnTop
Gui, theChatProductGlasses:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatProductGlasses:Color, FFFFFF
Gui, theChatProductGlasses:Font, S12, w700
Gui, theChatProductGlasses:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatProduct, Back to Product
Gui, theChatProductGlasses:Font, S18, w700
Gui, theChatProductGlasses:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Glasses
Gui, theChatProductGlasses:Font, S8, w700
Gui, theChatProductGlasses:Add, Text, center x12 y+10 w170, Currently, the minimum to order glasses is 72. Printing and shipping glassware is very labor intensive, and having a higher minimum allows us to give your order the attention it deserves. I'm happy to show you some pricing if you’re interested in glassware!
Gui, theChatProductGlasses:Font, S16, w700
Gui, theChatProductGlasses:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatProductGlasses:Font, S14, w700
Gui, theChatProductGlasses:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#glasses
Gui, theChatProductGlasses:Font, underline S10, w700
Gui, theChatProductGlasses:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatProductGlasses:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatProductGlasses:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Glasses - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatProduct:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatProductsKoozies:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatProductKoozies:+AlwaysOnTop
Gui, theChatProductKoozies:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatProductKoozies:Color, FFFFFF
Gui, theChatProductKoozies:Font, S12, w700
Gui, theChatProductKoozies:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatProduct, Back to Product
Gui, theChatProductKoozies:Font, S18, w700
Gui, theChatProductKoozies:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Koozies
Gui, theChatProductKoozies:Font, S8, w700
Gui, theChatProductKoozies:Add, Text, center x12 y+10 w170, Currently, the minimum to order koozies ranges between 50 and 100, depending on the style of koozie. I'm happy to help you with some pricing if you'd like to order koozies!
Gui, theChatProductKoozies:Font, S16, w700
Gui, theChatProductKoozies:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatProductKoozies:Font, S14, w700
Gui, theChatProductKoozies:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#koozies
Gui, theChatProductKoozies:Font, underline S10, w700
Gui, theChatProductKoozies:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatProductKoozies:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatProductKoozies:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Koozies - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatProduct:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatProductsMagnets:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatProductMagnets:+AlwaysOnTop
Gui, theChatProductMagnets:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatProductMagnets:Color, FFFFFF
Gui, theChatProductMagnets:Font, S12, w700
Gui, theChatProductMagnets:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatProduct, Back to Product
Gui, theChatProductMagnets:Font, S18, w700
Gui, theChatProductMagnets:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Magnets
Gui, theChatProductMagnets:Font, S8, w700
Gui, theChatProductMagnets:Add, Text, center x12 y+10 w170, Currently, the minimum to order magnets is 100. Printing on magnets is very labor intensive, and having a higher minimum allows us to give your order the attention it deserves.  I'm happy to show you some pricing if you'd like to order at least 100!
Gui, theChatProductMagnets:Font, S16, w700
Gui, theChatProductMagnets:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatProductMagnets:Font, S14, w700
Gui, theChatProductMagnets:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#magnets
Gui, theChatProductMagnets:Font, underline S10, w700
Gui, theChatProductMagnets:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatProductMagnets:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatProductMagnets:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Magnets - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatProduct:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatProductsMousepads:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatProductMousepads:+AlwaysOnTop
Gui, theChatProductMousepads:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatProductMousepads:Color, FFFFFF
Gui, theChatProductMousepads:Font, S12, w700
Gui, theChatProductMousepads:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatProduct, Back to Product
Gui, theChatProductMousepads:Font, S18, w700
Gui, theChatProductMousepads:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Mousepads
Gui, theChatProductMousepads:Font, S8, w700
Gui, theChatProductMousepads:Add, Text, center x12 y+10 w170, Currently, the minimum to order mouse pads is 50. Printing on mouse pads is very labor intensive, and having a higher minimum allows us to give your order the attention it deserves.  I'm happy to show you some pricing if you'd like to order at least 50!
Gui, theChatProductMousepads:Font, S16, w700
Gui, theChatProductMousepads:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatProductMousepads:Font, S14, w700
Gui, theChatProductMousepads:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#mousepads
Gui, theChatProductMousepads:Font, underline S10, w700
Gui, theChatProductMousepads:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatProductMousepads:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatProductMousepads:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Mousepads - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatProduct:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatProductsMugs:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatProductMugs:+AlwaysOnTop
Gui, theChatProductMugs:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatProductMugs:Color, FFFFFF
Gui, theChatProductMugs:Font, S12, w700
Gui, theChatProductMugs:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatProduct, Back to Product
Gui, theChatProductMugs:Font, S18, w700
Gui, theChatProductMugs:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Mugs
Gui, theChatProductMugs:Font, S8, w700
Gui, theChatProductMugs:Add, Text, center x12 y+10 w170, Currently, the minimum to order mugs is 72. Printing and shipping mugs is very labor intensive, and having a higher minimum allows us to give your order the attention it deserves. I'm happy to show you some pricing if you'd like to order mugs!
Gui, theChatProductMugs:Font, S16, w700
Gui, theChatProductMugs:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatProductMugs:Font, S14, w700
Gui, theChatProductMugs:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#mugs
Gui, theChatProductMugs:Font, underline S10, w700
Gui, theChatProductMugs:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatProductMugs:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatProductMugs:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Mugs - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatProduct:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatProductsPaper:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatProductPaper:+AlwaysOnTop
Gui, theChatProductPaper:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatProductPaper:Color, FFFFFF
Gui, theChatProductPaper:Font, S12, w700
Gui, theChatProductPaper:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatProduct, Back to Product
Gui, theChatProductPaper:Font, S18, w700
Gui, theChatProductPaper:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Paper
Gui, theChatProductPaper:Font, S8, w700
Gui, theChatProductPaper:Add, Text, center x12 y+10 w170, Currently, the minimum to order paper products is 500. Printing on paper is very labor intensive, and having a higher minimum allows us to give your order the attention it deserves.  I'm happy to show you some pricing if you'd like to order at least 500!
Gui, theChatProductPaper:Font, S16, w700
Gui, theChatProductPaper:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatProductPaper:Font, S14, w700
Gui, theChatProductPaper:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#paper
Gui, theChatProductPaper:Font, underline S10, w700
Gui, theChatProductPaper:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatProductPaper:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatProductPaper:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Paper - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatProduct:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatProductsPens:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatProductPens:+AlwaysOnTop
Gui, theChatProductPens:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatProductPens:Color, FFFFFF
Gui, theChatProductPens:Font, S12, w700
Gui, theChatProductPens:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatProduct, Back to Product
Gui, theChatProductPens:Font, S18, w700
Gui, theChatProductPens:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Pens
Gui, theChatProductPens:Font, S8, w700
Gui, theChatProductPens:Add, Text, center x12 y+10 w170, Currently, the minimum to order pens ranges between 50 and 300, depending on the type. Printing on pens is very intricate, and having a higher minimum allows us to give your order the attention it deserves. I'm happy to show you some pricing if you'd like to order within those quantities!
Gui, theChatProductPens:Font, S16, w700
Gui, theChatProductPens:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatProductPens:Font, S14, w700
Gui, theChatProductPens:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#pens
Gui, theChatProductPens:Font, underline S10, w700
Gui, theChatProductPens:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatProductPens:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatProductPens:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Pens - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatProduct:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatProductsSample:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatProductSample:+AlwaysOnTop
Gui, theChatProductSample:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatProductSample:Color, FFFFFF
Gui, theChatProductSample:Font, S12, w700
Gui, theChatProductSample:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatProduct, Back to Product
Gui, theChatProductSample:Font, S16, w700
Gui, theChatProductSample:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Sample
Gui, theChatProductSample:Font, S8, w700
Gui, theChatProductSample:Add, Text, center x12 y+10 w170, If you would like, I would be happy to get you set up with a blank sample of the items that you're considering! This would allow you to check out the fit and feel before you place your printed order with us! We offer these blank samples at a low cost and can have them delivered to you within a week with our free shipping, would that work for you?
Gui, theChatProductSample:Font, S16, w700
Gui, theChatProductSample:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatProductSample:Font, S14, w700
Gui, theChatProductSample:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#sample
Gui, theChatProductSample:Font, underline S10, w700
Gui, theChatProductSample:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatProductSample:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatProductSample:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Sample - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatProduct:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatProductsStickers:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatProductStickers:+AlwaysOnTop
Gui, theChatProductStickers:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatProductStickers:Color, FFFFFF
Gui, theChatProductStickers:Font, S12, w700
Gui, theChatProductStickers:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatProduct, Back to Product
Gui, theChatProductStickers:Font, S18, w700
Gui, theChatProductStickers:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Stickers
Gui, theChatProductStickers:Font, S8, w700
Gui, theChatProductStickers:Add, Text, center x12 y+10 w170, Currently, the minimum to order stickers is 250. The reasoning behind it is, the set up process is pretty extensive, and having a higher minimum allows us to give your order the attention it deserves. I'd be happy to show you some pricing if you'd like to order at least 250!
Gui, theChatProductStickers:Font, S16, w700
Gui, theChatProductStickers:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatProductStickers:Font, S14, w700
Gui, theChatProductStickers:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#stickers
Gui, theChatProductStickers:Font, underline S10, w700
Gui, theChatProductStickers:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatProductStickers:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatProductStickers:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Stickers - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatProduct:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatQuote:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatQuote:+AlwaysOnTop
Gui, theChatQuote:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatQuote:Color, FFFFFF
Gui, theChatQuote:Font, S12, w700
Gui, theChatQuote:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChat, Back to Chat
Gui, theChatQuote:Font, underline S14, w700
Gui, theChatQuote:Add, Text, center ym-10 x12 y+8 w180 h30 0x200 cBlue gChatQuoteAP v_AP, Additional Piece
Gui, theChatQuote:Add, Text, center ym-10 x12 y+8 w180 h30 0x200 cBlue gChatQuoteBudget v_Budget, Budget
Gui, theChatQuote:Add, Text, center ym-10 x12 y+8 w180 h30 0x200 cBlue gChatQuoteHighPrice v_HighPrice, High Price
Gui, theChatQuote:Add, Text, center ym-10 x12 y+8 w180 h30 0x200 cBlue gChatQuotePriceHelp v_PriceHelp, Price Help
Gui, theChatQuote:Add, Text, center ym-10 x12 y+8 w180 h30 0x200 cBlue gChatQuotePriceQuote1 v_PriceQuote1, Price Quote 1
Gui, theChatQuote:Add, Text, center ym-10 x12 y+8 w180 h30 0x200 cBlue gChatQuotePriceQuote2 v_PriceQuote2, Price Quote 2
Gui, theChatQuote:Add, Text, center ym-10 x12 y+8 w180 h30 0x200 cBlue gChatQuotePriceQuote3 v_PriceQuote3, Price Quote 3
Gui, theChatQuote:Add, Text, center ym-10 x12 y+8 w180 h30 0x200 cBlue gChatQuotePriceQuote4 v_PriceQuote4, Price Quote 4
Gui, theChatQuote:Add, Text, center ym-10 x12 y+8 w180 h30 0x200 cBlue gChatQuotePriceQuote5 v_PriceQuote5, Price Quote 5
Gui, theChatQuote:Add, Text, center ym-10 x12 y+8 w180 h30 0x200 cBlue gChatQuoteQuoteBulk v_QuoteBulk, Quote Bulk
Gui, theChatQuote:Add, Text, center ym-10 x12 y+8 w180 h30 0x200 cBlue gChatQuoteQuoteOnly v_QuoteOnly, Quote Only
Gui, theChatQuote:Add, Text, center ym-10 x12 y+8 w180 h30 0x200 cBlue gChatQuoteQuoteSingles v_QuoteSingles, Quote Singles
Gui, theChatQuote:Add, Text, center ym-10 x12 y+8 w180 h30 0x200 cBlue gChatQuoteQuoteSpec v_QuoteSpec, Quote Spec
Gui, theChatQuote:Add, Text, center ym-10 x12 y+8 w180 h30 0x200 cBlue gChatQuoteQuote v_Quote, Quote?
Gui, theChatQuote:Add, Text, center ym-10 x12 y+8 w180 h30 0x200 cBlue gChatQuoteSleevePrice v_SleevePrice, Sleeve Price
Gui, theChatQuote:Font, underline S10, w700
Gui, theChatQuote:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatQuote:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatQuote:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Quote - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChat:destroy
Gui, theChatQuoteAP:destroy
Gui, theChatQuoteHighPrice:destroy
Gui, theChatQuotePriceHelp:destroy
Gui, theChatQuotePriceQuote1:destroy
Gui, theChatQuotePriceQuote2:destroy
Gui, theChatQuotePriceQuote3:destroy
Gui, theChatQuotePriceQuote4:destroy
Gui, theChatQuotePriceQuote5:destroy
Gui, theChatQuoteQuoteBulk:destroy
Gui, theChatQuoteQuoteSingles:destroy
Gui, theChatQuoteSleevePrice:destroy
Gui, theChatQuoteBudget:destroy
Gui, theChatQuoteQuoteOnly:destroy
Gui, theChatQuoteQuoteSpec:destroy
Gui, theChatQuoteQuote:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatQuoteAP:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatQuoteAP:+AlwaysOnTop
Gui, theChatQuoteAP:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatQuoteAP:Color, FFFFFF
Gui, theChatQuoteAP:Font, S12, w700
Gui, theChatQuoteAP:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatQuote, Back to Quote
Gui, theChatQuoteAP:Font, S18, w700
Gui, theChatQuoteAP:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Additional Piece
Gui, theChatQuoteAP:Font, S8, w700
Gui, theChatQuoteAP:Add, Text, center x12 y+10 w170, I can definitely help you out! We have a special type of order just for this situation. Here's how it works, you can order the same design and same shirt style at the original per piece price you paid (unless you'd like to change it). There is a flat setup fee to cover the cost of printing, but you can order up to five pieces for this special offer.
Gui, theChatQuoteAP:Font, S16, w700
Gui, theChatQuoteAP:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatQuoteAP:Font, S14, w700
Gui, theChatQuoteAP:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#ap
Gui, theChatQuoteAP:Font, underline S10, w700
Gui, theChatQuoteAP:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatQuoteAP:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatQuoteAP:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Additional Piece - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatQuote:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatQuoteBudget:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatQuoteBudget:+AlwaysOnTop
Gui, theChatQuoteBudget:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatQuoteBudget:Color, FFFFFF
Gui, theChatQuoteBudget:Font, S12, w700
Gui, theChatQuoteBudget:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatQuote, Back to Quote
Gui, theChatQuoteBudget:Font, S18, w700
Gui, theChatQuoteBudget:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Budget
Gui, theChatQuoteBudget:Font, S8, w700
Gui, theChatQuoteBudget:Add, Text, center x12 y+10 w170, Do these prices work within your budget?  If not, please let me know and I can start working on a quote that works better for you. If you have any other questions along the way, feel free to reply to this email or call me directly.  Once I hear back, we'll be able to take the next steps in making your design come to life.  I've included all of my contact information below. Thanks again for choosing CustomInk. I look forward to hearing from you!
Gui, theChatQuoteBudget:Font, S16, w700
Gui, theChatQuoteBudget:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatQuoteBudget:Font, S14, w700
Gui, theChatQuoteBudget:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#budget
Gui, theChatQuoteBudget:Font, underline S10, w700
Gui, theChatQuoteBudget:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatQuoteBudget:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatQuoteBudget:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Budget - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatQuote:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatQuoteHighPrice:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatQuoteHighPrice:+AlwaysOnTop
Gui, theChatQuoteHighPrice:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatQuoteHighPrice:Color, FFFFFF
Gui, theChatQuoteHighPrice:Font, S12, w700
Gui, theChatQuoteHighPrice:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatQuote, Back to Quote
Gui, theChatQuoteHighPrice:Font, S18, w700
Gui, theChatQuoteHighPrice:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, High Price
Gui, theChatQuoteHighPrice:Font, S8, w700
Gui, theChatQuoteHighPrice:Add, Text, center x12 y+10 w170, I'm sorry that you felt that our pricing was a little expensive! There are many features that can change the cost of your order. If you’re interested, let me know and we can review your order together to give you a better idea of where your price came from
Gui, theChatQuoteHighPrice:Font, S16, w700
Gui, theChatQuoteHighPrice:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatQuoteHighPrice:Font, S14, w700
Gui, theChatQuoteHighPrice:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#highprice
Gui, theChatQuoteHighPrice:Font, underline S10, w700
Gui, theChatQuoteHighPrice:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatQuoteHighPrice:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatQuoteHighPrice:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, High Price - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatQuote:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatQuotePriceHelp:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatQuotePriceHelp:+AlwaysOnTop
Gui, theChatQuotePriceHelp:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatQuotePriceHelp:Color, FFFFFF
Gui, theChatQuotePriceHelp:Font, S12, w700
Gui, theChatQuotePriceHelp:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatQuote, Back to Quote
Gui, theChatQuotePriceHelp:Font, S18, w700
Gui, theChatQuotePriceHelp:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Price Help
Gui, theChatQuotePriceHelp:Font, S8, w700
Gui, theChatQuotePriceHelp:Add, Text, center x12 y+10 w170, I'll be happy to help you find a more budget-friendly option for your design! Is there a specific budget that you have in mind?
Gui, theChatQuotePriceHelp:Font, S16, w700
Gui, theChatQuotePriceHelp:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatQuotePriceHelp:Font, S14, w700
Gui, theChatQuotePriceHelp:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#pricehelp
Gui, theChatQuotePriceHelp:Font, underline S10, w700
Gui, theChatQuotePriceHelp:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatQuotePriceHelp:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatQuotePriceHelp:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Price Help - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatQuote:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatQuotePriceQuote1:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatQuotePriceQuote1:+AlwaysOnTop
Gui, theChatQuotePriceQuote1:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatQuotePriceQuote1:Color, FFFFFF
Gui, theChatQuotePriceQuote1:Font, S12, w700
Gui, theChatQuotePriceQuote1:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatQuote, Back to Quote
Gui, theChatQuotePriceQuote1:Font, S18, w700
Gui, theChatQuotePriceQuote1:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Price Quote 1
Gui, theChatQuotePriceQuote1:Font, S8, w700
Gui, theChatQuotePriceQuote1:Add, Text, center x12 y+10 w170, I'm happy to go over pricing with you! Have you already saved your design in our Design Lab? If not, that's ok too. I just need to know what areas of the product we're printing on and the number of colors on each of those areas.
Gui, theChatQuotePriceQuote1:Font, S16, w700
Gui, theChatQuotePriceQuote1:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatQuotePriceQuote1:Font, S14, w700
Gui, theChatQuotePriceQuote1:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#pq1
Gui, theChatQuotePriceQuote1:Font, underline S10, w700
Gui, theChatQuotePriceQuote1:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatQuotePriceQuote1:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatQuotePriceQuote1:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Price Quote 1 - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatQuote:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatQuotePriceQuote2:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatQuotePriceQuote2:+AlwaysOnTop
Gui, theChatQuotePriceQuote2:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatQuotePriceQuote2:Color, FFFFFF
Gui, theChatQuotePriceQuote2:Font, S12, w700
Gui, theChatQuotePriceQuote2:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatQuote, Back to Quote
Gui, theChatQuotePriceQuote2:Font, S18, w700
Gui, theChatQuotePriceQuote2:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Price Quote 2
Gui, theChatQuotePriceQuote2:Font, S8, w700
Gui, theChatQuotePriceQuote2:Add, Text, center x12 y+10 w170, Thank you for going over your design with me!  In terms of the product itself, did you have a style, brand, or even a color in mind? We have a wide variety of products on the site (and more than just t-shirts).
Gui, theChatQuotePriceQuote2:Font, S16, w700
Gui, theChatQuotePriceQuote2:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatQuotePriceQuote2:Font, S14, w700
Gui, theChatQuotePriceQuote2:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#pq2
Gui, theChatQuotePriceQuote2:Font, underline S10, w700
Gui, theChatQuotePriceQuote2:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatQuotePriceQuote2:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatQuotePriceQuote2:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Price Quote 2 - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatQuote:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatQuotePriceQuote3:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatQuotePriceQuote3:+AlwaysOnTop
Gui, theChatQuotePriceQuote3:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatQuotePriceQuote3:Color, FFFFFF
Gui, theChatQuotePriceQuote3:Font, S12, w700
Gui, theChatQuotePriceQuote3:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatQuote, Back to Quote
Gui, theChatQuotePriceQuote3:Font, S18, w700
Gui, theChatQuotePriceQuote3:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Price Quote 3
Gui, theChatQuotePriceQuote3:Font, S8, w700
Gui, theChatQuotePriceQuote3:Add, Text, center x12 y+10 w170, What do you think are the smallest and largest size shirts you'll need to order? Do you know how many shirts you would need overall?
Gui, theChatQuotePriceQuote3:Font, S16, w700
Gui, theChatQuotePriceQuote3:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatQuotePriceQuote3:Font, S14, w700
Gui, theChatQuotePriceQuote3:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#pq3
Gui, theChatQuotePriceQuote3:Font, underline S10, w700
Gui, theChatQuotePriceQuote3:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatQuotePriceQuote3:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatQuotePriceQuote3:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Price Quote 3 - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatQuote:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatQuotePriceQuote4:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatQuotePriceQuote4:+AlwaysOnTop
Gui, theChatQuotePriceQuote4:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatQuotePriceQuote4:Color, FFFFFF
Gui, theChatQuotePriceQuote4:Font, S12, w700
Gui, theChatQuotePriceQuote4:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatQuote, Back to Quote
Gui, theChatQuotePriceQuote4:Font, S18, w700
Gui, theChatQuotePriceQuote4:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Price Quote 4
Gui, theChatQuotePriceQuote4:Font, S8, w700
Gui, theChatQuotePriceQuote4:Add, Text, center x12 y+10 w170, Awesome, I'm almost set up with your all-inclusive quote. We do offer guaranteed free, two-week delivery. Would that work for you or would you like to see pricing with our faster delivery options?
Gui, theChatQuotePriceQuote4:Font, S16, w700
Gui, theChatQuotePriceQuote4:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatQuotePriceQuote4:Font, S14, w700
Gui, theChatQuotePriceQuote4:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#pq4
Gui, theChatQuotePriceQuote4:Font, underline S10, w700
Gui, theChatQuotePriceQuote4:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatQuotePriceQuote4:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatQuotePriceQuote4:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Price Quote 4 - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatQuote:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatQuotePriceQuote5:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatQuotePriceQuote5:+AlwaysOnTop
Gui, theChatQuotePriceQuote5:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatQuotePriceQuote5:Color, FFFFFF
Gui, theChatQuotePriceQuote5:Font, S12, w700
Gui, theChatQuotePriceQuote5:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatQuote, Back to Quote
Gui, theChatQuotePriceQuote5:Font, S18, w700
Gui, theChatQuotePriceQuote5:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Price Quote 5
Gui, theChatQuotePriceQuote5:Font, S8, w700
Gui, theChatQuotePriceQuote5:Add, Text, center x12 y+10 w170, Great! I’ll have your quote for you in just a couple of minutes. If you need anything in the meantime, I’ll still be here for you. I can also email this quote to you if you’d like?
Gui, theChatQuotePriceQuote5:Font, S16, w700
Gui, theChatQuotePriceQuote5:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatQuotePriceQuote5:Font, S14, w700
Gui, theChatQuotePriceQuote5:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#pq5
Gui, theChatQuotePriceQuote5:Font, underline S10, w700
Gui, theChatQuotePriceQuote5:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatQuotePriceQuote5:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatQuotePriceQuote5:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Price Quote 5 - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatQuote:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatQuoteQuoteBulk:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatQuoteQuoteBulk:+AlwaysOnTop
Gui, theChatQuoteQuoteBulk:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatQuoteQuoteBulk:Color, FFFFFF
Gui, theChatQuoteQuoteBulk:Font, S12, w700
Gui, theChatQuoteQuoteBulk:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatQuote, Back to Quote
Gui, theChatQuoteQuoteBulk:Font, S18, w700
Gui, theChatQuoteQuoteBulk:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Quote Bulk
Gui, theChatQuoteQuoteBulk:Font, S8, w700
Gui, theChatQuoteQuoteBulk:Add, Text, center x12 y+10 w170, After copying the quote, using this hotkey will properly format the qutoe (excluding sizes ex: S-XL must still be applied, if necessary) and add bulk value adds.
Gui, theChatQuoteQuoteBulk:Font, S16, w700
Gui, theChatQuoteQuoteBulk:Add, Text, center ym-10 x12 y+15 w180 h30 0x200 cRed, How to Use:
Gui, theChatQuoteQuoteBulk:Font, S14, w700
Gui, theChatQuoteQuoteBulk:Add, Text, center ym-10 x12 y+15 w180 0x200,#quotebulk
Gui, theChatQuoteQuoteBulk:Add, Text, center ym-10 x12 y+5 w180 0x200,or
Gui, theChatQuoteQuoteBulk:Add, Text, center ym-10 x12 y+5 w180 0x200,#bulkquote
Gui, theChatQuoteQuoteBulk:Font, underline S10, w700
Gui, theChatQuoteQuoteBulk:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatQuoteQuoteBulk:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatQuoteQuoteBulk:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Quote Bulk - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatQuote:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatQuoteQuoteOnly:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatQuoteQuoteOnly:+AlwaysOnTop
Gui, theChatQuoteQuoteOnly:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatQuoteQuoteOnly:Color, FFFFFF
Gui, theChatQuoteQuoteOnly:Font, S12, w700
Gui, theChatQuoteQuoteOnly:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatQuote, Back to Quote
Gui, theChatQuoteQuoteOnly:Font, S18, w700
Gui, theChatQuoteQuoteOnly:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Quote Only
Gui, theChatQuoteQuoteOnly:Font, S8, w700
Gui, theChatQuoteQuoteOnly:Add, Text, center x12 y+10 w170, After copying the quote, using this hotkey will properly format the quote (excluding sizes ex: S-XL must still be applied, if necessary) without adding any value adds.
Gui, theChatQuoteQuoteOnly:Font, S16, w700
Gui, theChatQuoteQuoteOnly:Add, Text, center ym-10 x12 y+15 w180 h30 0x200 cRed, How to Use:
Gui, theChatQuoteQuoteOnly:Font, S14, w700
Gui, theChatQuoteQuoteOnly:Add, Text, center ym-10 x12 y+15 w180 0x200,#quoteonly
Gui, theChatQuoteQuoteOnly:Add, Text, center ym-10 x12 y+5 w180 0x200,or
Gui, theChatQuoteQuoteOnly:Add, Text, center ym-10 x12 y+5 w180 0x200,#onlyquote
Gui, theChatQuoteQuoteOnly:Font, underline S10, w700
Gui, theChatQuoteQuoteOnly:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatQuoteQuoteOnly:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatQuoteQuoteOnly:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Quote Only - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatQuote:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatQuoteQuoteSingles:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatQuoteQuoteSingles:+AlwaysOnTop
Gui, theChatQuoteQuoteSingles:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatQuoteQuoteSingles:Color, FFFFFF
Gui, theChatQuoteQuoteSingles:Font, S12, w700
Gui, theChatQuoteQuoteSingles:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatQuote, Back to Quote
Gui, theChatQuoteQuoteSingles:Font, S18, w700
Gui, theChatQuoteQuoteSingles:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Quote Singles
Gui, theChatQuoteQuoteSingles:Font, S8, w700
Gui, theChatQuoteQuoteSingles:Add, Text, center x12 y+10 w170, After copying this quote, using this hotkey will properly format the quote (excluding sizes ex: S-XL must still be applied, if necessary) and add singles value adds.
Gui, theChatQuoteQuoteSingles:Font, S16, w700
Gui, theChatQuoteQuoteSingles:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatQuoteQuoteSingles:Font, S12, w700
Gui, theChatQuoteQuoteSingles:Add, Text, center ym-10 x12 y+15 w180 0x200,#quotesingles
Gui, theChatQuoteQuoteSingles:Add, Text, center ym-10 x12 y+5 w180 0x200,or
Gui, theChatQuoteQuoteSingles:Add, Text, center ym-10 x12 y+5 w180 0x200,#singlesquote
Gui, theChatQuoteQuoteSingles:Font, underline S10, w700
Gui, theChatQuoteQuoteSingles:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatQuoteQuoteSingles:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatQuoteQuoteSingles:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Quote Singles - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatQuote:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatQuoteQuoteSpec:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatQuoteQuoteSpec:+AlwaysOnTop
Gui, theChatQuoteQuoteSpec:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatQuoteQuoteSpec:Color, FFFFFF
Gui, theChatQuoteQuoteSpec:Font, S12, w700
Gui, theChatQuoteQuoteSpec:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatQuote, Back to Quote
Gui, theChatQuoteQuoteSpec:Font, S18, w700
Gui, theChatQuoteQuoteSpec:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Quote Spec
Gui, theChatQuoteQuoteSpec:Font, S8, w700
Gui, theChatQuoteQuoteSpec:Add, Text, center x12 y+10 w170, After copying this quote, using this hotkey will properly format the quote (excluding sizes ex: S-XL must still be applied, if necessary) and add specialty value adds.
Gui, theChatQuoteQuoteSpec:Font, S16, w700
Gui, theChatQuoteQuoteSpec:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatQuoteQuoteSpec:Font, S12, w700
Gui, theChatQuoteQuoteSpec:Add, Text, center ym-10 x12 y+15 w180 0x200,#quotespec
Gui, theChatQuoteQuoteSpec:Add, Text, center ym-10 x12 y+5 w180 0x200,or
Gui, theChatQuoteQuoteSpec:Add, Text, center ym-10 x12 y+5 w180 0x200,#specquote
Gui, theChatQuoteQuoteSpec:Font, underline S10, w700
Gui, theChatQuoteQuoteSpec:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatQuoteQuoteSpec:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatQuoteQuoteSpec:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Quote Spec - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatQuote:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatQuoteQuote:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatQuoteQuote:+AlwaysOnTop
Gui, theChatQuoteQuote:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatQuoteQuote:Color, FFFFFF
Gui, theChatQuoteQuote:Font, S12, w700
Gui, theChatQuoteQuote:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatQuote, Back to Quote
Gui, theChatQuoteQuote:Font, S18, w700
Gui, theChatQuoteQuote:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Quote?
Gui, theChatQuoteQuote:Font, S8, w700
Gui, theChatQuoteQuote:Add, Text, center x12 y+10 w170, If you'd like, I can show you some pricing for your custom design. I'd be happy to email it to you, as well!
Gui, theChatQuoteQuote:Font, S16, w700
Gui, theChatQuoteQuote:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatQuoteQuote:Font, S12, w700
Gui, theChatQuoteQuote:Add, Text, center ym-10 x12 y+15 w180 0x200,#quote?
Gui, theChatQuoteQuote:Font, underline S10, w700
Gui, theChatQuoteQuote:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatQuoteQuote:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatQuoteQuote:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Quote? - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatQuote:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatQuoteSleevePrice:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatQuoteSleevePrice:+AlwaysOnTop
Gui, theChatQuoteSleevePrice:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatQuoteSleevePrice:Color, FFFFFF
Gui, theChatQuoteSleevePrice:Font, S12, w700
Gui, theChatQuoteSleevePrice:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatQuote, Back to Quote
Gui, theChatQuoteSleevePrice:Font, S18, w700
Gui, theChatQuoteSleevePrice:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Sleeve Price
Gui, theChatQuoteSleevePrice:Font, S8, w700
Gui, theChatQuoteSleevePrice:Add, Text, center x12 y+10 w170, I can definitely get you pricing on a sleeve print! I have just a couple of quick questions for you that will help me with the quote. Which sleeve would you like to have your design on?
Gui, theChatQuoteSleevePrice:Font, S16, w700
Gui, theChatQuoteSleevePrice:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatQuoteSleevePrice:Font, S14, w700
Gui, theChatQuoteSleevePrice:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#sleeveprice
Gui, theChatQuoteSleevePrice:Font, underline S10, w700
Gui, theChatQuoteSleevePrice:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatQuoteSleevePrice:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatQuoteSleevePrice:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Sleeve Price - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatQuote:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatShipping:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatShipping:+AlwaysOnTop
Gui, theChatShipping:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatShipping:Color, FFFFFF
Gui, theChatShipping:Font, S12, w700
Gui, theChatShipping:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChat, Back to Chat
Gui, theChatShipping:Font, underline S14, w700
Gui, theChatShipping:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatShippingAllShipping v_AllShipping, All Shipping
Gui, theChatShipping:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatShippingDD v_DD, Due Date
Gui, theChatShipping:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatShippingLogistics v_Logistics, Logistics
Gui, theChatShipping:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatShippingInternational v_International, International
Gui, theChatShipping:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatShippingRush v_Rush, Rush
Gui, theChatShipping:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatShippingStandard v_Standard, Standard
Gui, theChatShipping:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatShippingSuperRush v_SuperRush, Super Rush
Gui, theChatShipping:Font, underline S10, w700
Gui, theChatShipping:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatShipping:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatShipping:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Shipping - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChat:destroy
Gui, theChatShippingAllShipping:destroy
Gui, theChatShippingDD:destroy
Gui, theChatShippingLogistics:destroy
Gui, theChatShippingInternational:destroy
Gui, theChatShippingRush:destroy
Gui, theChatShippingStandard:destroy
Gui, theChatShippingSuperRush:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatShippingAllShipping:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatShippingAllShipping:+AlwaysOnTop
Gui, theChatShippingAllShipping:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatShippingAllShipping:Color, FFFFFF
Gui, theChatShippingAllShipping:Font, S12, w700
Gui, theChatShippingAllShipping:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatShipping, Back to Shipping
Gui, theChatShippingAllShipping:Font, S18, w700
Gui, theChatShippingAllShipping:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, All Shipping
Gui, theChatShippingAllShipping:Font, S8, w700
Gui, theChatShippingAllShipping:Add, Text, center x12 y+10 w170, I can definitely help with a breakdown of our delivery options! We offer free, standard two-week shipping for every order, with rush options available if you need it sooner.  Rush delivery guarantees your order arrives within 6 to 8 days, for an additional 10`% of your order total. Super Rush delivery guarantees your order arrives in 5 or fewer days, for an additional 25`% of your order total.
Gui, theChatShippingAllShipping:Font, S16, w700
Gui, theChatShippingAllShipping:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatShippingAllShipping:Font, S14, w700
Gui, theChatShippingAllShipping:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#allshipping
Gui, theChatShippingAllShipping:Font, underline S10, w700
Gui, theChatShippingAllShipping:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatShippingAllShipping:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatShippingAllShipping:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, All Shipping - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatShipping:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatShippingDD:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatShippingDD:+AlwaysOnTop
Gui, theChatShippingDD:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatShippingDD:Color, FFFFFF
Gui, theChatShippingDD:Font, S12, w700
Gui, theChatShippingDD:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatShipping, Back to Shipping
Gui, theChatShippingDD:Font, S18, w700
Gui, theChatShippingDD:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Due Date
Gui, theChatShippingDD:Font, S8, w700
Gui, theChatShippingDD:Add, Text, center x12 y+10 w170, On what date were you looking to have your order arrive? We have a couple of options that begin with our free, standard 14-day delivery. This timeframe includes everything that happens once you place the order, including production. We also have rush delivery options available if you need your order sooner.
Gui, theChatShippingDD:Font, S16, w700
Gui, theChatShippingDD:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatShippingDD:Font, S14, w700
Gui, theChatShippingDD:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#dd
Gui, theChatShippingDD:Font, underline S10, w700
Gui, theChatShippingDD:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatShippingDD:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatShippingDD:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Due Date - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatShipping:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatShippingLogistics:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatShippingLogistics:+AlwaysOnTop
Gui, theChatShippingLogistics:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatShippingLogistics:Color, FFFFFF
Gui, theChatShippingLogistics:Font, S12, w700
Gui, theChatShippingLogistics:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatShipping, Back to Shipping
Gui, theChatShippingLogistics:Font, S18, w700
Gui, theChatShippingLogistics:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Logistics
Gui, theChatShippingLogistics:Font, S8, w700
Gui, theChatShippingLogistics:Add, Text, center x12 y+10 w170, I'll need to check with my team to see if we can guarantee delivery of your order by that date. This can take a few minutes, so I just wanted to let you know that if you need anything while I'm checking, I'll still be here with you!
Gui, theChatShippingLogistics:Font, S16, w700
Gui, theChatShippingLogistics:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatShippingLogistics:Font, S14, w700
Gui, theChatShippingLogistics:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#logistics
Gui, theChatShippingLogistics:Font, underline S10, w700
Gui, theChatShippingLogistics:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatShippingLogistics:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatShippingLogistics:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Logistics - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatShipping:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatShippingInternational:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatShippingInternational:+AlwaysOnTop
Gui, theChatShippingInternational:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatShippingInternational:Color, FFFFFF
Gui, theChatShippingInternational:Font, S12, w700
Gui, theChatShippingInternational:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatShipping, Back to Shipping
Gui, theChatShippingInternational:Font, S18, w700
Gui, theChatShippingInternational:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, International
Gui, theChatShippingInternational:Font, S8, w700
Gui, theChatShippingInternational:Add, Text, center x12 y+10 w170, At this time, we only ship internationally to Canada, or if the address is a US Army Post Office (APO), Fleet Post Office (FPO), or Diplomatic Post Office (DPO). 
Gui, theChatShippingInternational:Font, S16, w700
Gui, theChatShippingInternational:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatShippingInternational:Font, S14, w700
Gui, theChatShippingInternational:Add, Text, center ym-10 x12 y+15 w180 0x200,#international
Gui, theChatShippingInternational:Add, Text, center ym-10 x12 y+5 w180 0x200,or
Gui, theChatShippingInternational:Add, Text, center ym-10 x12 y+5 w180 0x200,#worldwide
Gui, theChatShippingInternational:Font, underline S10, w700
Gui, theChatShippingInternational:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatShippingInternational:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatShippingInternational:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, International - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatShipping:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatShippingQuickTurn:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatShippingQuickTurn:+AlwaysOnTop
Gui, theChatShippingQuickTurn:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatShippingQuickTurn:Color, FFFFFF
Gui, theChatShippingQuickTurn:Font, S12, w700
Gui, theChatShippingQuickTurn:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatShipping, Back to Shipping
Gui, theChatShippingQuickTurn:Font, S18, w700
Gui, theChatShippingQuickTurn:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Quick Turn
Gui, theChatShippingQuickTurn:Font, S8, w700
Gui, theChatShippingQuickTurn:Add, Text, center x12 y+10 w170, Our Quicker Turn option guarantees your order is delivered within 9-11 days, with an additional cost of 5`% of your order total. 
Gui, theChatShippingQuickTurn:Font, S16, w700
Gui, theChatShippingQuickTurn:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatShippingQuickTurn:Font, S14, w700
Gui, theChatShippingQuickTurn:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#qt
Gui, theChatShippingQuickTurn:Font, underline S10, w700
Gui, theChatShippingQuickTurn:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatShippingQuickTurn:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatShippingQuickTurn:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Quick Turn - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatShipping:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatShippingRush:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatShippingRush:+AlwaysOnTop
Gui, theChatShippingRush:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatShippingRush:Color, FFFFFF
Gui, theChatShippingRush:Font, S12, w700
Gui, theChatShippingRush:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatShipping, Back to Shipping
Gui, theChatShippingRush:Font, S18, w700
Gui, theChatShippingRush:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Rush
Gui, theChatShippingRush:Font, S8, w700
Gui, theChatShippingRush:Add, Text, center x12 y+10 w170, Choosing Rush delivery guarantees your custom order is delivered within 6-8 days, for an additional cost of 10`% of your order total.
Gui, theChatShippingRush:Font, S16, w700
Gui, theChatShippingRush:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatShippingRush:Font, S14, w700
Gui, theChatShippingRush:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#rush
Gui, theChatShippingRush:Font, underline S10, w700
Gui, theChatShippingRush:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatShippingRush:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatShippingRush:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Rush - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatShipping:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatShippingStandard:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatShippingStandard:+AlwaysOnTop
Gui, theChatShippingStandard:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatShippingStandard:Color, FFFFFF
Gui, theChatShippingStandard:Font, S12, w700
Gui, theChatShippingStandard:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatShipping, Back to Shipping
Gui, theChatShippingStandard:Font, S18, w700
Gui, theChatShippingStandard:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Standard
Gui, theChatShippingStandard:Font, S8, w700
Gui, theChatShippingStandard:Add, Text, center x12 y+10 w170, With our free, standard delivery, your package is guaranteed to deliver within two weeks from when you pay.
Gui, theChatShippingStandard:Font, S16, w700
Gui, theChatShippingStandard:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatShippingStandard:Font, S14, w700
Gui, theChatShippingStandard:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#standard
Gui, theChatShippingStandard:Font, underline S10, w700
Gui, theChatShippingStandard:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatShippingStandard:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatShippingStandard:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Standard - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatShipping:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatShippingSuperRush:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatShippingSuperRush:+AlwaysOnTop
Gui, theChatShippingSuperRush:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatShippingSuperRush:Color, FFFFFF
Gui, theChatShippingSuperRush:Font, S12, w700
Gui, theChatShippingSuperRush:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatShipping, Back to Shipping
Gui, theChatShippingSuperRush:Font, S18, w700
Gui, theChatShippingSuperRush:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Super Rush
Gui, theChatShippingSuperRush:Font, S8, w700
Gui, theChatShippingSuperRush:Add, Text, center x12 y+10 w170, Our fastest delivery option is Super Rush, where we guarantee delivery within 5 days. This service is available for an additional cost of 25`% of your order total.
Gui, theChatShippingSuperRush:Font, S16, w700
Gui, theChatShippingSuperRush:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatShippingSuperRush:Font, S14, w700
Gui, theChatShippingSuperRush:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#sr
Gui, theChatShippingSuperRush:Font, underline S10, w700
Gui, theChatShippingSuperRush:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatShippingSuperRush:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatShippingSuperRush:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Super Rush - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatShipping:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatSingles:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatSingles:+AlwaysOnTop
Gui, theChatSingles:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatSingles:Color, FFFFFF
Gui, theChatSingles:Font, S12, w700
Gui, theChatSingles:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChat, Back to Chat
Gui, theChatSingles:Font, underline S14, w700
Gui, theChatSingles:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatSinglesCanadaSingles v_CanadaSingles, Canada Singles
Gui, theChatSingles:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gChatSinglesNoMinimum v_NoMinimum, No Minimum
Gui, theChatSingles:Font, underline S10, w700
Gui, theChatSingles:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatSingles:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatSingles:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Singles - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChat:destroy
Gui, theChatSinglesCanadaSingles:destroy
Gui, theChatSinglesNoMinimum:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatSinglesCanadaSingles:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatSinglesCanadaSingles:+AlwaysOnTop
Gui, theChatSinglesCanadaSingles:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatSinglesCanadaSingles:Color, FFFFFF
Gui, theChatSinglesCanadaSingles:Font, S12, w700
Gui, theChatSinglesCanadaSingles:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatSingles, Back to Singles
Gui, theChatSinglesCanadaSingles:Font, S18, w700
Gui, theChatSinglesCanadaSingles:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Canada Singles
Gui, theChatSinglesCanadaSingles:Font, S8, w700
Gui, theChatSinglesCanadaSingles:Add, Text, center x12 y+10 w170,  I'm really sorry, currently we aren't able to deliver fewer than six items with a single custom design to our customers in Canada. We can print your custom design on different styles of like items, so it equals six total, if that would work better for you! I can even help you get that set up and go over the different options that are available!
Gui, theChatSinglesCanadaSingles:Font, S16, w700
Gui, theChatSinglesCanadaSingles:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatSinglesCanadaSingles:Font, S14, w700
Gui, theChatSinglesCanadaSingles:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#canadasingles
Gui, theChatSinglesCanadaSingles:Font, underline S10, w700
Gui, theChatSinglesCanadaSingles:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatSinglesCanadaSingles:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatSinglesCanadaSingles:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Canada Singles - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatSingles:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

ChatSinglesNoMinimum:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, theChatSinglesNoMinimum:+AlwaysOnTop
Gui, theChatSinglesNoMinimum:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, theChatSinglesNoMinimum:Color, FFFFFF
Gui, theChatSinglesNoMinimum:Font, S12, w700
Gui, theChatSinglesNoMinimum:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gChatSingles, Back to Singles
Gui, theChatSinglesNoMinimum:Font, S18, w700
Gui, theChatSinglesNoMinimum:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, No Minimum
Gui, theChatSinglesNoMinimum:Font, S8, w700
Gui, theChatSinglesNoMinimum:Add, Text, center x12 y+10 w170, We have a selection of shirts available without a minimum, so you can print your custom design on as few as just one! Click here to check out those shirts and can choose any color shirt under the "Color choices for any size order" category.
Gui, theChatSinglesNoMinimum:Font, S16, w700
Gui, theChatSinglesNoMinimum:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, theChatSinglesNoMinimum:Font, S14, w700
Gui, theChatSinglesNoMinimum:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#minimum
Gui, theChatSinglesNoMinimum:Font, underline S10, w700
Gui, theChatSinglesNoMinimum:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, theChatSinglesNoMinimum:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, theChatSinglesNoMinimum:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, No Minimum - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, theChatSingles:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

Pidgin:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, thePidgin:+AlwaysOnTop
Gui, thePidgin:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, thePidgin:Color, FFFFFF
Gui, thePidgin:Font, underline S14, w700
Gui, thePidgin:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gMenu, Back to Menu
Gui, thePidgin:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gPidginCallForYou v_CaallForYou, Call For You
if ((skill = 1) || (skill = 5))
{
Gui, thePidgin:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cBlue gPidginChatForYou v_ChatForYou, Chat For You
}
Gui, thePidgin:Font, underline S10, w700
Gui, thePidgin:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, thePidgin:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, thePidgin:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Pidgin - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theIntro:destroy
Gui, theMenu:destroy
Gui, theChat:destroy
Gui, thePidginCallForYou:destroy
Gui, thePidginChatForYou:destroy
Gui, thePidginEmailForYou:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

PidginCallForYou:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, thePidginCallForYou:+AlwaysOnTop
Gui, thePidginCallForYou:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, thePidginCallForYou:Color, FFFFFF
Gui, thePidginCallForYou:Font, S12, w700
Gui, thePidginCallForYou:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gPidgin, Back to Pidgin
Gui, thePidginCallForYou:Font, S18, w700
Gui, thePidginCallForYou:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Call For You
Gui, thePidginCallForYou:Font, S8, w700
Gui, thePidginCallForYou:Add, Text, center x12 y+10 w170, Hey there! I've got *copied email address* on the line asking to speak with you. Are you available to take the call?
Gui, thePidginCallForYou:Font, S16, w700
Gui, thePidginCallForYou:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, thePidginCallForYou:Font, S14, w700
Gui, thePidginCallForYou:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#callforyou
Gui, thePidginCallForYou:Font, underline S10, w700
Gui, thePidginCallForYou:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, thePidginCallForYou:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, thePidginCallForYou:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Call For You - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, thePidgin:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

PidginChatForyou:
WinGetPos, Xpos, Ypos
height = 800
GuiWidth = 206

WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,


Gui, thePidginChatForYou:+AlwaysOnTop
Gui, thePidginChatForYou:Add, Picture, w180 h-1 gMenu, %A_ScriptDir%\images\ahk_manual.jpg
Gui, thePidginChatForYou:Color, FFFFFF
Gui, thePidginChatForYou:Font, S12, w700
Gui, thePidginChatForYou:Add, Text, center ym-10 x12 y109 w180 h50 0x200 cBlue gPidgin, Back to Pidgin
Gui, thePidginChatForYou:Font, S18, w700
Gui, thePidginChatForYou:Add, Text, center ym-10 x12 y+10 w180 h50 0x200 cRed, Chat For You
Gui, thePidginChatForYou:Font, S8, w700
Gui, thePidginChatForYou:Add, Text, center x12 y+10 w170, Hey there! I've got *customer email address* in chat asking to speak with you. Are you available to take the chat?
Gui, thePidginChatForYou:Font, S16, w700
Gui, thePidginChatForYou:Add, Text, center ym-10 x12 y+10 w180 h30 0x200 cRed, How to Use:
Gui, thePidginChatForYou:Font, S14, w700
Gui, thePidginChatForYou:Add, Text, center ym-10 x12 y+10 w180 h50 0x200,#chatforyou
Gui, thePidginChatForYou:Font, underline S10, w700
Gui, thePidginChatForYou:Add, Text, center ym-10 x20 y749 w80 h20 0x200 cBlue gLink5 v_Link5, Top Hotkeys
Gui, thePidginChatForYou:Add, Text, center ym-10 x110 y749 w80 h20 0x200 cBlue gLink6 v_Link6, Feedback
Gui, thePidginChatForYou:Show, x%Xpos% y%Ypos% h%height% w%GuiWidth%, Chat For You - AHK

; If visiting the menu from any of these GUIs, we're going to close that GUI so we don't have more than 1 opened.

Gui, theMenu:destroy
Gui, thePidgin:destroy
Gui, theQL:destroy
Gui, help:destroy
Gui, MultiLabel:destroy
Return

Link5:
if (skill = 1)
{
direction = https://inkernet.customink.com/display/ss/Auto+Hotkeys+Manual#AutoHotkeysManual-flextop10
}
else if (skill = 2)
{
direction = https://inkernet.customink.com/display/ss/Auto+Hotkeys+Manual#AutoHotkeysManual-advancedtop10
}
else if (skill = 3)
{
direction = https://inkernet.customink.com/display/ss/Auto+Hotkeys+Manuals#AutoHotkeysManual-servicetop10
}
else if (skill = 4)
{
direction = https://inkernet.customink.com/display/ss/Auto+Hotkeys+Manuals#AutoHotkeysManual-corephonetop10
}
else if (skill = 6)
{
direction = https://inkernet.customink.com/display/ss/Auto+Hotkeys+Manual#AutoHotkeysManual-corephonetop10
}
else
{
direction = https://inkernet.customink.com/display/ss/Auto+Hotkeys+Manual
}
Run, %BrowExe% %direction%
Gui, theQL:destroy
Gui, theQL1:destroy
Gui, theAcct:destroy
Gui, theBooster:destroy
Gui, theClipart:destroy
Gui, theCollege:destroy
Gui, theContent:destroy
Gui, theDesignLab:destroy
Gui, theHotkeyList:destroy
Gui, theHCPTool:destroy
Gui, theLAChat:destroy
Gui, theOffsite:destroy
Gui, theProductCatalog:destroy
Gui, theProductDescription:destroy
Gui, theSchedule:destroy
Gui, theSetup:destroy
Gui, theSinglesCatalog:destroy
Gui, theSpecialty:destroy
Gui, theSuperQuoter:destroy
Gui, theDesignTemplates:destroy
Gui, theUPSTool:destroy
Gui, theWiki:destroy
Gui, theWorkday:destroy
Gui, theEmailContentBands:destroy
Gui, theEmailContent:destroy
Gui, theEmail:destroy
Gui, theEmailContentCelebs:destroy
Gui, theEmailContentCollegeNo:destroy
Gui, theEmailContentCollegeYes:destroy
Gui, theEmailContentContent:destroy
Gui, theEmailContentDisney:destroy
Gui, theEmailContentGreek:destroy
Gui, theEmailContentOffensive:destroy
Gui, theEmailContentSports:destroy
Gui, theEmailContentVideoGames:destroy
Gui, theEmailContentWatermark:destroy
Gui, theEmailDesign:destroy
Gui, theEmailDesign2:destroy
Gui, theEmailDesignBranding:destroy
Gui, theEmailDesignColorMax:destroy 
Gui, theEmailDesignCombineColors:destroy
Gui, theEmailDesignCombineStyles:destroy
Gui, theEmailDesignCreativeServices:destroy
Gui, theEmailDesignCreativeServices1:destroy
Gui, theEmailDesignCreativeServices2:destroy
Gui, theEmailDesignDesignHelp:destroy
Gui, theEmailDesignDesigning:destroy
Gui, theEmailDesignDesignLink:destroy
Gui, theEmailDesignDesignSaved:destroy
Gui, theEmailDesignCombineDesigns:destroy
Gui, theEmailDesignDesignTeam:destroy
Gui, theEmailDesignDPI:destroy
Gui, theEmailDesignDPIBulk:destroy
Gui, theEmailDesignDPIBulk1:destroy
Gui, theEmailDesignDPISingles:destroy
Gui, theEmailDesignEmbroidery:destroy
Gui, theEmailDesignFiletypes:destroy
Gui, theEmailDesignInkChange:destroy
Gui, theEmailDesignPers:destroy
Gui, theEmailDesignPMS:destroy
Gui, theEmailDesignPMSDigital:destroy
Gui, theEmailDesignPPS:destroy
Gui, theEmailDesignRedraw:destroy
Gui, theEmailDesignRetrieve:destroy
Gui, theEmailDesignRotate:destroy
Gui, theEmailDesignSample:destroy
Gui, theEmailDesignSleeveHelp:destroy
Gui, theEmailDesignSpVsDig:destroy
Gui, theEmailDesignSubtleBlank:destroy
Gui, theEmailDesignSubtleInk:destroy
Gui, theEmailDesignUploadHelp:destroy
Gui, theEmailDesignUploadWhite:destroy
Gui, theEmailDesignVSS:destroy
Gui, theEmailDiscount:destroy
Gui, theEmailDiscountBooster:destroy
Gui, theEmailDiscountCharity:destroy
Gui, theEmailDiscountDiscount:destroy
Gui, theEmailDiscountPear:destroy
Gui, theEmailGeneral:destroy
Gui, theEmailGeneralByeOrder:destroy
Gui, theEmailGeneralClose:destroy
Gui, theEmailGeneralFollowUp:destroy
Gui, theEmailGeneralFollowUpOrder:destroy
Gui, theEmailGeneralFollowUpDesign:destroy
Gui, theEmailGeneralHeyDesign:destroy
Gui, theEmailGeneralHeyPricing:destroy
Gui, theEmailGeneralPerksBulk:destroy
Gui, theEmailGeneralPerksSingles:destroy
Gui, theEmailGeneralCR:destroy
Gui, theEmailFollowUpFix:destroy
Gui, theEmailGeneralMe:destroy
Gui, theEmailGeneralOOO:destroy
Gui, theEmailGroupGOF:destroy
Gui, theEmailGroupGOFCancel:destroy
Gui, theEmailGroupGOFDesign:destroy
Gui, theEmailGroupGOFPrice:destroy
Gui, theEmailGroupGOFSetup:destroy
Gui, theEmailPostOrderCheckInfo:destroy
Gui, theEmailPostOrderDelivered:destroy
Gui, theEmailPostOrderOrderDone:destroy
Gui, theEmailPostOrderOrderDoneLink:destroy
Gui, theEmailPostOrderPEML:destroy
Gui, theEmailPostOrderPreship:destroy
Gui, theEmailPostOrderPOInfo:destroy
Gui, theEmailPostOrderTracking:destroy
Gui, theEmailPreOrder:destroy
Gui, theEmailPreOrderVoucherCode:destroy
Gui, theEmailProblem:destroy
Gui, theEmailProblemProblemFull:destroy
Gui, theEmailProblemProblemPhoto:destroy
Gui, theEmailProblemProblemReturn:destroy
Gui, theEmailProblemProblemVoucher:destroy
Gui, theEmailProduct:destroy
Gui, theEmailProductBottles:destroy
Gui, theEmailProductCups:destroy
Gui, theEmailProductGlasses:destroy
Gui, theEmailProductKoozies:destroy
Gui, theEmailProductMagnets:destroy
Gui, theEmailProductMousepads:destroy
Gui, theEmailProductMugs:destroy
Gui, theEmailProductPaper:destroy
Gui, theEmailProductPens:destroy
Gui, theEmailProductsSamples:destroy
Gui, theEmailProductStickers:destroy
Gui, theEmailQuote:destroy
Gui, theEmailQuoteAP:destroy
Gui, theEmailQuotePriceHelp:destroy
Gui, theEmailQuoteQuoteBulk:destroy
Gui, theEmailQuoteQuoteSingles:destroy
Gui, theEmailQuoteSleevePrice:destroy
Gui, theEmailQuoteBudget:destroy
Gui, theEmailQuoteQuoteOnly:destroy
Gui, theEmailQuoteQuoteSpec:destroy
Gui, theEmailShipping:destroy
Gui, theEmailShippingAllShipping:destroy
Gui, theEmailShippingDD:destroy
Gui, theEmailShippingInternational:destroy
Gui, theEmailShippingQuickTurn:destroy
Gui, theEmailShippingRush:destroy
Gui, theEmailShippingStandard:destroy
Gui, theEmailShippingSuperRush:destroy
Gui, theEmailSinglesCanadaSingles:destroy
Gui, theEmailSinglesNoMinimum:destroy
Gui, theEmailSinglesNoMinimum:
Gui, theChatContent:destroy
Gui, theChat:destroy
Gui, theChatContentBands:destroy
Gui, theChatContentCelebs:destroy
Gui, theChatContentCollege:destroy
Gui, theChatContentDisney:destroy
Gui, theChatContentGreek:destroy
Gui, theChatContentOffensive:destroy
Gui, theChatContentSports:destroy
Gui, theChatContentVideoGames:destroy
Gui, theChatContentWatermark:destroy
Gui, theChatContentContent:destroy
Gui, theChatContentCollegeYes:destroy
Gui, theChatContentCollegeNo:destroy
Gui, theChatDesign:destroy
Gui, theChatDesign2:destroy
Gui, theChatDesignCombineColors:destroy
Gui, theChatDesignCombineStyles:destroy
Gui, theChatDesignDesignHelp:destroy
Gui, theChatDesignDesignLink:destroy
Gui, theChatDesignDesignSaved:destroy
Gui, theChatDesignDesignTeam:destroy
Gui, theChatDesignRetrieve:destroy
Gui, theChatDesignDPI:destroy
Gui, theChatDesignDPI1:destroy
Gui, theChatDesignDPIBulk:destroy
Gui, theChatDesignDPIBulk1:destroy
Gui, theChatDesignDPISingles:destroy
Gui, theChatDesignUploadEmbroidery:destroy
Gui, theChatDesignFiletypes:destroy
Gui, theChatDesignInkChange:destroy
Gui, theChatDesignPMS:destroy
Gui, theChatDesignPMSDigital:destroy
Gui, theChatDesignPPS:destroy
Gui, theChatDesignRedraw:destroy
Gui, theChatDesignRotate:destroy
Gui, theChatDesignSample:destroy
Gui, theChatDesignSleeveHelp:destroy
Gui, theChatDesignSubtleBlank:destroy
Gui, theChatDesignSubtleInk:destroy
Gui, theChatDesignUploadWhite:destroy
Gui, theChatDesignVSS:destroy
Gui, theChatDesignBranding:destroy
Gui, theChatDesignColorMax:destroy
Gui, theChatDesignDesigning:destroy
Gui, theChatDesignPers:destroy
Gui, theChatDesignSpVsDig:destroy
Gui, theChatDiscountBooster:destroy
Gui, theChatDiscountCharity:destroy
Gui, theChatDiscountDiscount:destroy
Gui, theChatDiscountPear:destroy
Gui, theChatDiscountPriceHelp:destroy
Gui, theChatGeneral:destroy
Gui, theChatGeneral1:destroy
Gui, theChatGeneralByeOrder:destroy
Gui, theChatGeneralChecking:destroy
Gui, theChatGeneralClose:destroy
Gui, theChatGeneralCust:destroy
Gui, theChatGeneralDesigning:destroy
Gui, theChatGeneralFollowUp:destroy
Gui, theChatGeneralFollowUpOrder:destroy
Gui, theChatGeneralFollowUpDesign:destroy
Gui, theChatGeneralHelp:destroy
Gui, theChatGeneralHeyDesign:destroy
Gui, theChatGeneralHeyPricing:destroy
Gui, theChatGeneralPerksBulk:destroy
Gui, theChatGeneralPerksSingles:destroy
Gui, theChatGeneralQuote:destroy
Gui, theChatGeneralCR:destroy
Gui, theChatFollowUpFix:destroy
Gui, theChatGeneralMe:destroy
Gui, theChatGeneralOOO:destroy
Gui, theChatGroup:destroy
Gui, theChatGroupGOF:destroy
Gui, theChatGroupGOFCancel:destroy
Gui, theChatGroupGOFDesign:destroy
Gui, theChatGroupGOFPrice:destroy
Gui, theChatGroupGOFSetup:destroy
Gui, theChatLiveEngage:destroy
Gui, theChatLiveEngageByeSurvey:destroy
Gui, theChatLiveEngageDiscounts:destroy
Gui, theChatLiveEngageEmail:destroy
Gui, theChatLiveEngageGreetingWName:destroy
Gui, theChatLiveEngageGreetingWOName:destroy
Gui, theChatLiveEngageInternational:destroy
Gui, theChatLiveEngageLostYouWName:destroy
Gui, theChatLiveEngageLostYouWOName:destroy
Gui, theChatLiveEngageMilitary:destroy
Gui, theChatLiveEngageNoCommWName:destroy
Gui, theChatLiveEngageNoCommWOName:destroy
Gui, theChatLiveEngageSimpleIntroName:destroy
Gui, theChatPostOrderCancelOrder:destroy
Gui, theChatPostOrderCheckInfo:destroy
Gui, theChatPostOrderDelivered:destroy
Gui, theChatPostOrderOrderDone:destroy
Gui, theChatPostOrderOrderDoneLink:destroy
Gui, theChatPostOrderPEML:destroy
Gui, theChatPostOrderPOInfo:destroy
Gui, theChatPostOrderTracking:destroy
Gui, theChatPreOrder:destroy
Gui, theChatPreOrderPreAddress:destroy
Gui, theChatPreOrderPreConfirm:destroy
Gui, theChatPreOrderPreContact:destroy
Gui, theChatPreOrderPreShipping:destroy
Gui, theChatPreOrderPreSingles:destroy
Gui, theChatPreOrderVoucherCode:destroy
Gui, theChatProblem:destroy
Gui, theChatProblemConfirmFix:destroy
Gui, theChatProblemCrookedPhoto:destroy
Gui, theChatProblemCrookedReport:destroy
Gui, theChatProblemGhosting:destroy
Gui, theChatProblemPartial:destroy
Gui, theChatProblemProblemFull:destroy
Gui, theChatProblemProblemHelp:destroy
Gui, theChatProblemProblemPhoto:destroy
Gui, theChatProblemProblemReturn:destroy
Gui, theChatProblemProblemReview:destroy
Gui, theChatProblemProblemSizing:destroy
Gui, theChatProblemProblemTones:destroy
Gui, theChatProblemSwapPackage:destroy
Gui, theChatProblemProblemVoucher:destroy
Gui, theChatProduct:destroy
Gui, theChatProductBottles:destroy
Gui, theChatProductCups:destroy
Gui, theChatProductGlasses:destroy
Gui, theChatProductKoozies:destroy
Gui, theChatProductMagnets:destroy
Gui, theChatProductMousepads:destroy
Gui, theChatProductMugs:destroy
Gui, theChatProductPaper:destroy
Gui, theChatProductPens:destroy
Gui, theChatProductSample:destroy
Gui, theChatProductStickers:destroy
Gui, theChatQuoteAP:destroy
Gui, theChatQuoteHighPrice:destroy
Gui, theChatQuotePriceHelp:destroy
Gui, theChatQuotePriceQuote1:destroy
Gui, theChatQuotePriceQuote2:destroy
Gui, theChatQuotePriceQuote3:destroy
Gui, theChatQuotePriceQuote4:destroy
Gui, theChatQuotePriceQuote5:destroy
Gui, theChatQuoteQuoteBulk:destroy
Gui, theChatQuoteQuoteSingles:destroy
Gui, theChatQuoteSleevePrice:destroy
Gui, theChatQuoteBudget:destroy
Gui, theChatQuoteQuoteOnly:destroy
Gui, theChatQuoteQuoteSpec:destroy
Gui, theChatQuoteQuote:destroy
Gui, theChatShippingAllShipping:destroy
Gui, theChatShippingDD:destroy
Gui, theChatShippingLogistics:destroy
Gui, theChatShippingInternational:destroy
Gui, theChatShippingQuickTurn:destroy
Gui, theChatShippingRush:destroy
Gui, theChatShippingStandard:destroy
Gui, theChatShippingSuperRush:destroy
Gui, theChatSinglesCanadaSingles:destroy
Gui, theChatSinglesNoMinimum:destroy
Gui, thePidgin:destroy
Gui, thePidginCallForYou:destroy
Gui, thePidginChatForYou:destroy
Gui, thePidginEmailForYou:destroy

Gui, theChatDesignVSS:destroy
Return

Link6:
direction = http://goo.gl/forms/KJL6994N0q
Run, %BrowExe% %direction%

Gui, theQL:destroy
Gui, theQL1:destroy
Gui, theAcct:destroy
Gui, theBooster:destroy
Gui, theClipart:destroy
Gui, theCollege:destroy
Gui, theContent:destroy
Gui, theDesignLab:destroy
Gui, theHotkeyList:destroy
Gui, theHCPTool:destroy
Gui, theLAChat:destroy
Gui, theOffsite:destroy
Gui, theProductCatalog:destroy
Gui, theProductDescription:destroy
Gui, theSchedule:destroy
Gui, theSetup:destroy
Gui, theSinglesCatalog:destroy
Gui, theSpecialty:destroy
Gui, theSuperQuoter:destroy
Gui, theDesignTemplates:destroy
Gui, theUPSTool:destroy
Gui, theWiki:destroy
Gui, theWorkday:destroy
Gui, theEmailContentBands:destroy
Gui, theEmailContent:destroy
Gui, theEmail:destroy
Gui, theEmailContentCelebs:destroy
Gui, theEmailContentCollegeNo:destroy
Gui, theEmailContentCollegeYes:destroy
Gui, theEmailContentContent:destroy
Gui, theEmailContentDisney:destroy
Gui, theEmailContentGreek:destroy
Gui, theEmailContentOffensive:destroy
Gui, theEmailContentSports:destroy
Gui, theEmailContentVideoGames:destroy
Gui, theEmailContentWatermark:destroy
Gui, theEmailDesign:destroy
Gui, theEmailDesign2:destroy
Gui, theEmailDesignBranding:destroy
Gui, theEmailDesignColorMax:destroy 
Gui, theEmailDesignCombineColors:destroy
Gui, theEmailDesignCombineStyles:destroy
Gui, theEmailDesignCreativeServices:destroy
Gui, theEmailDesignCreativeServices1:destroy
Gui, theEmailDesignCreativeServices2:destroy
Gui, theEmailDesignDesignHelp:destroy
Gui, theEmailDesignDesigning:destroy
Gui, theEmailDesignDesignLink:destroy
Gui, theEmailDesignDesignSaved:destroy
Gui, theEmailDesignCombineDesigns:destroy
Gui, theEmailDesignDesignTeam:destroy
Gui, theEmailDesignDPI:destroy
Gui, theEmailDesignDPIBulk:destroy
Gui, theEmailDesignDPIBulk1:destroy
Gui, theEmailDesignDPISingles:destroy
Gui, theEmailDesignEmbroidery:destroy
Gui, theEmailDesignFiletypes:destroy
Gui, theEmailDesignInkChange:destroy
Gui, theEmailDesignPers:destroy
Gui, theEmailDesignPMS:destroy
Gui, theEmailDesignPMSDigital:destroy
Gui, theEmailDesignPPS:destroy
Gui, theEmailDesignRedraw:destroy
Gui, theEmailDesignRetrieve:destroy
Gui, theEmailDesignRotate:destroy
Gui, theEmailDesignSample:destroy
Gui, theEmailDesignSleeveHelp:destroy
Gui, theEmailDesignSpVsDig:destroy
Gui, theEmailDesignSubtleBlank:destroy
Gui, theEmailDesignSubtleInk:destroy
Gui, theEmailDesignUploadHelp:destroy
Gui, theEmailDesignUploadWhite:destroy
Gui, theEmailDesignVSS:destroy
Gui, theEmailDiscount:destroy
Gui, theEmailDiscountBooster:destroy
Gui, theEmailDiscountCharity:destroy
Gui, theEmailDiscountDiscount:destroy
Gui, theEmailDiscountPear:destroy
Gui, theEmailGeneral:destroy
Gui, theEmailGeneralByeOrder:destroy
Gui, theEmailGeneralClose:destroy
Gui, theEmailGeneralFollowUp:destroy
Gui, theEmailGeneralFollowUpOrder:destroy
Gui, theEmailGeneralFollowUpDesign:destroy
Gui, theEmailGeneralHeyDesign:destroy
Gui, theEmailGeneralHeyPricing:destroy
Gui, theEmailGeneralPerksBulk:destroy
Gui, theEmailGeneralPerksSingles:destroy
Gui, theEmailGeneralCR:destroy
Gui, theEmailFollowUpFix:destroy
Gui, theEmailGeneralMe:destroy
Gui, theEmailGeneralOOO:destroy
Gui, theEmailGroupGOF:destroy
Gui, theEmailGroupGOFCancel:destroy
Gui, theEmailGroupGOFDesign:destroy
Gui, theEmailGroupGOFPrice:destroy
Gui, theEmailGroupGOFSetup:destroy
Gui, theEmailPostOrderCheckInfo:destroy
Gui, theEmailPostOrderDelivered:destroy
Gui, theEmailPostOrderOrderDone:destroy
Gui, theEmailPostOrderOrderDoneLink:destroy
Gui, theEmailPostOrderPEML:destroy
Gui, theEmailPostOrderPreship:destroy
Gui, theEmailPostOrderPOInfo:destroy
Gui, theEmailPostOrderTracking:destroy
Gui, theEmailPreOrder:destroy
Gui, theEmailPreOrderVoucherCode:destroy
Gui, theEmailProblem:destroy
Gui, theEmailProblemProblemFull:destroy
Gui, theEmailProblemProblemPhoto:destroy
Gui, theEmailProblemProblemReturn:destroy
Gui, theEmailProblemProblemVoucher:destroy
Gui, theEmailProblemConfirmFix:destroy
Gui, theEmailProblemCrookedPhoto:destroy
Gui, theEmailProblemCrookedReport:destroy
Gui, theEmailProblemGhosting:destroy
Gui, theEmailProblemPartial:destroy
Gui, theEmailProblemProblemSizing:destroy
Gui, theEmailProblemProblemTones:destroy
Gui, theEmailProblemSwapPackage:destroy
Gui, theEmailProduct:destroy
Gui, theEmailProductBottles:destroy
Gui, theEmailProductCups:destroy
Gui, theEmailProductGlasses:destroy
Gui, theEmailProductKoozies:destroy
Gui, theEmailProductMagnets:destroy
Gui, theEmailProductMousepads:destroy
Gui, theEmailProductMugs:destroy
Gui, theEmailProductPaper:destroy
Gui, theEmailProductPens:destroy
Gui, theEmailProductsSamples:destroy
Gui, theEmailProductStickers:destroy
Gui, theEmailQuote:destroy
Gui, theEmailQuoteAP:destroy
Gui, theEmailQuotePriceHelp:destroy
Gui, theEmailQuoteQuoteBulk:destroy
Gui, theEmailQuoteQuoteSingles:destroy
Gui, theEmailQuoteSleevePrice:destroy
Gui, theEmailQuoteBudget:destroy
Gui, theEmailQuoteQuoteOnly:destroy
Gui, theEmailQuoteQuoteSpec:destroy
Gui, theEmailShipping:destroy
Gui, theEmailShippingAllShipping:destroy
Gui, theEmailShippingDD:destroy
Gui, theEmailShippingInternational:destroy
Gui, theEmailShippingQuickTurn:destroy
Gui, theEmailShippingRush:destroy
Gui, theEmailShippingStandard:destroy
Gui, theEmailShippingSuperRush:destroy
Gui, theEmailSinglesCanadaSingles:destroy
Gui, theEmailSinglesNoMinimum:destroy
Gui, theEmailSinglesNoMinimum:
Gui, theChatContent:destroy
Gui, theChat:destroy
Gui, theChatContentBands:destroy
Gui, theChatContentCelebs:destroy
Gui, theChatContentCollege:destroy
Gui, theChatContentDisney:destroy
Gui, theChatContentGreek:destroy
Gui, theChatContentOffensive:destroy
Gui, theChatContentSports:destroy
Gui, theChatContentVideoGames:destroy
Gui, theChatContentWatermark:destroy
Gui, theChatDesign:destroy
Gui, theChatDesign2:destroy
Gui, theChatDesignCombineColors:destroy
Gui, theChatDesignCombineStyles:destroy
Gui, theChatDesignDesignHelp:destroy
Gui, theChatDesignDesignLink:destroy
Gui, theChatDesignDesignSaved:destroy
Gui, theChatDesignDesignTeam:destroy
Gui, theChatDesignRetrieve:destroy
Gui, theChatDesignDPI:destroy
Gui, theChatDesignDPI1:destroy
Gui, theChatDesignDPIBulk:destroy
Gui, theChatDesignDPIBulk1:destroy
Gui, theChatDesignDPISingles:destroy
Gui, theChatDesignUploadEmbroidery:destroy
Gui, theChatDesignFiletypes:destroy
Gui, theChatDesignInkChange:destroy
Gui, theChatDesignPMS:destroy
Gui, theChatDesignPMSDigital:destroy
Gui, theChatDesignPPS:destroy
Gui, theChatDesignRedraw:destroy
Gui, theChatDesignRotate:destroy
Gui, theChatDesignSample:destroy
Gui, theChatDesignSleeveHelp:destroy
Gui, theChatDesignSubtleBlank:destroy
Gui, theChatDesignSubtleInk:destroy
Gui, theChatDesignUploadWhite:destroy
Gui, theChatDesignVSS:destroy
Gui, theChatDiscountBooster:destroy
Gui, theChatDiscountCharity:destroy
Gui, theChatDiscountDiscount:destroy
Gui, theChatDiscountPear:destroy
Gui, theChatDiscountPriceHelp:destroy
Gui, theChatGeneral:destroy
Gui, theChatGeneral1:destroy
Gui, theChatGeneralByeOrder:destroy
Gui, theChatGeneralChecking:destroy
Gui, theChatGeneralClose:destroy
Gui, theChatGeneralCust:destroy
Gui, theChatGeneralDesigning:destroy
Gui, theChatGeneralFollowUp:destroy
Gui, theChatGeneralFollowUpOrder:destroy
Gui, theChatGeneralFollowUpDesign:destroy
Gui, theChatGeneralHelp:destroy
Gui, theChatGeneralHeyDesign:destroy
Gui, theChatGeneralHeyPricing:destroy
Gui, theChatGeneralPerksBulk:destroy
Gui, theChatGeneralPerksSingles:destroy
Gui, theChatGeneralQuote:destroy
Gui, theChatGeneralQuote:destroy
Gui, theChatGeneralCR:destroy
Gui, theChatFollowUpFix:destroy
Gui, theChatGeneralMe:destroy
Gui, theChatGeneralEmail:destroy
Gui, theChatGroup:destroy
Gui, theChatGroupGOF:destroy
Gui, theChatGroupGOFCancel:destroy
Gui, theChatGroupGOFDesign:destroy
Gui, theChatGroupGOFPrice:destroy
Gui, theChatGroupGOFSetup:destroy
Gui, theChatLiveEngage:destroy
Gui, theChatLiveEngageByeSurvey:destroy
Gui, theChatLiveEngageDiscounts:destroy
Gui, theChatLiveEngageEmail:destroy
Gui, theChatLiveEngageGreetingWName:destroy
Gui, theChatLiveEngageGreetingWOName:destroy
Gui, theChatLiveEngageInternational:destroy
Gui, theChatLiveEngageLostYouWName:destroy
Gui, theChatLiveEngageLostYouWOName:destroy
Gui, theChatLiveEngageMilitary:destroy
Gui, theChatLiveEngageNoCommWName:destroy
Gui, theChatLiveEngageNoCommWOName:destroy
Gui, theChatLiveEngageSimpleIntroName:destroy
Gui, theChatPostOrderCancelOrder:destroy
Gui, theChatPostOrderCheckInfo:destroy
Gui, theChatPostOrderDelivered:destroy
Gui, theChatPostOrderOrderDone:destroy
Gui, theChatPostOrderOrderDoneLink:destroy
Gui, theChatPostOrderPEML:destroy
Gui, theChatPostOrderPOInfo:destroy
Gui, theChatPostOrderTracking:destroy
Gui, theChatPreOrder:destroy
Gui, theChatPreOrderPreAddress:destroy
Gui, theChatPreOrderPreConfirm:destroy
Gui, theChatPreOrderPreContact:destroy
Gui, theChatPreOrderPreShipping:destroy
Gui, theChatPreOrderPreSingles:destroy
Gui, theChatPreOrderVoucherCode:destroy
Gui, theChatProblem:destroy
Gui, theChatProblemConfirmFix:destroy
Gui, theChatProblemCrookedPhoto:destroy
Gui, theChatProblemCrookedReport:destroy
Gui, theChatProblemGhosting:destroy
Gui, theChatProblemPartial:destroy
Gui, theChatProblemProblemFull:destroy
Gui, theChatProblemProblemHelp:destroy
Gui, theChatProblemProblemPhoto:destroy
Gui, theChatProblemProblemReturn:destroy
Gui, theChatProblemProblemReview:destroy
Gui, theChatProblemProblemSizing:destroy
Gui, theChatProblemProblemTones:destroy
Gui, theChatProblemSwapPackage:destroy
Gui, theChatProblemProblemVoucher:destroy
Gui, theChatProduct:destroy
Gui, theChatProductBottles:destroy
Gui, theChatProductCups:destroy
Gui, theChatProductGlasses:destroy
Gui, theChatProductKoozies:destroy
Gui, theChatProductMagnets:destroy
Gui, theChatProductMousepads:destroy
Gui, theChatProductMugs:destroy
Gui, theChatProductPaper:destroy
Gui, theChatProductPens:destroy
Gui, theChatProductSample:destroy
Gui, theChatProductStickers:destroy
Gui, theChatQuoteAP:destroy
Gui, theChatQuoteHighPrice:destroy
Gui, theChatQuotePriceHelp:destroy
Gui, theChatQuotePriceQuote1:destroy
Gui, theChatQuotePriceQuote2:destroy
Gui, theChatQuotePriceQuote3:destroy
Gui, theChatQuotePriceQuote4:destroy
Gui, theChatQuotePriceQuote5:destroy
Gui, theChatQuoteQuoteBulk:destroy
Gui, theChatQuoteQuoteSingles:destroy
Gui, theChatQuoteSleevePrice:destroy
Gui, theChatQuoteBudget:destroy
Gui, theChatQuoteQuoteOnly:destroy
Gui, theChatQuoteQuoteSpec:destroy
Gui, theChatQuoteQuote:destroy
Gui, theChatShippingAllShipping:destroy
Gui, theChatShippingDD:destroy
Gui, theChatShippingLogistics:destroy
Gui, theChatShippingInternational:destroy
Gui, theChatShippingQuickTurn:destroy
Gui, theChatShippingRush:destroy
Gui, theChatShippingStandard:destroy
Gui, theChatShippingSuperRush:destroy
Gui, theChatSinglesCanadaSingles:destroy
Gui, theChatSinglesNoMinimum:destroy
Gui, thePidgin:destroy
Gui, thePidginCallForYou:destroy
Gui, thePidginChatForYou:destroy
Gui, thePidginEmailForYou:destroy

Gui, theChatDesignVSS:destroy
Return

GuiClose:
  ExitApp
  Return
  
  
theIntroGuiClose:
ExitApp
Return
  
theQLGuiClose:
ExitApp
Return

theQL1GuiClose:
ExitApp
Return

theAcctGuiClose:
ExitApp
Return

theBoosterGuiClose:
ExitApp
Return

theClipartGuiClose:
ExitApp
Return

theCollegeGuiClose:
ExitApp
Return

theContentGuiClose:
ExitApp
Return

theDesignLabGuiClose:
ExitApp
Return

theHotkeyListGuiClose:
ExitApp
Return

theHCPToolGuiClose:
ExitApp
Return

theLAChatGuiClose:
ExitApp
Return

theOffsiteGuiClose:
ExitApp
Return

theProductDescriptionGuiClose:
ExitApp
Return

theProductCatalogGuiClose:
ExitApp
Return

theScheduleGuiClose:
ExitApp
Return

theSetupGuiClose:
ExitApp
Return

theSinglesCatalogGuiClose:
ExitApp
Return

theSpecialtyGuiClose:
ExitApp
Return

theSuperQuoterGuiClose:
ExitApp
Return

theDesignTemplatesGuiClose:
ExitApp
Return

theUPSToolGuiClose:
ExitApp
Return

theWikiGuiClose:
ExitApp
Return

theWorkdayGuiClose:
ExitApp
Return

theEmailContentBandsGuiClose:
ExitApp
Return

theEmailContentGuiClose:
ExitApp
Return

theEmailGuiClose:
ExitApp
Return

theEmailContentCelebsGuiClose:
ExitApp
Return

theEmailContentCollegeGuiClose:
ExitApp
Return

theEmailContentDisneyGuiClose:
ExitApp
Return

theEmailContentGreekGuiClose:
ExitApp
Return

theEmailContentOffensiveGuiClose:
ExitApp
Return

theEmailContentSportsGuiClose:
ExitApp
Return

theEmailContentVideoGamesGuiClose:
ExitApp
Return

theEmailContentWatermarkGuiClose:
ExitApp
Return

theEmailDesignGuiClose:
ExitApp
Return

theEmailDesign2GuiClose:
ExitApp
Return

theEmailDesignBrandingGuiClose:
ExitApp
Return

theEmailDesignColorMaxGuiClose:
ExitApp
Return

theEmailDesignCombineColorsGuiClose:
ExitApp
Return

theEmailDesignDesigningGuiClose:
ExitApp
Return

theEmailDesignDesignSavedGuiClose:
ExitApp
Return

theEmailDesignPersGuiClose:
ExitApp
Return

theEmailDesignRetrieveGuiClose:
ExitApp
Return

theEmailDesignCombineStylesGuiClose:
ExitApp
Return

theEmailDesignCreativeServicesGuiClose:
ExitApp
Return

theEmailDesignCreativeServices1GuiClose:
ExitApp
Return

theEmailDesignCreativeServices2GuiClose:
ExitApp
Return

theEmailDesignDesignHelpGuiClose:
ExitApp
Return

theEmailDesignDesignLinkGuiClose:
ExitApp
Return

theEmailDesignCombineDesignsGuiClose:
ExitApp
Return

theEmailDesignDesignTeamGuiClose:
ExitApp
Return

theEmailDesignDPIGuiClose:
ExitApp
Return

theEmailDesignDPIBulkGuiClose:
ExitApp
Return

theEmailDesignDPIBulk1GuiClose:
ExitApp
Return

theEmailDesignDPISinglesGuiClose:
ExitApp
Return

theEmailDesignEmbroideryGuiClose:
ExitApp
Return

theEmailDesignFiletypesGuiClose:
ExitApp
Return

theEmailDesignInkChangeGuiClose:
ExitApp
Return

theEmailDesignPMSGuiClose:
ExitApp
Return

theEmailDesignPMSDigitalGuiClose:
ExitApp
Return

theEmailDesignPPSGuiClose:
ExitApp
Return

theEmailDesignRedrawGuiClose:
ExitApp
Return

theEmailDesignRotateGuiClose:
ExitApp
Return

theEmailDesignSampleGuiClose:
ExitApp
Return

theEmailDesignSleeveHelpGuiClose:
ExitApp
Return

theEmailDesignSubtleBlankGuiClose:
ExitApp
Return

theEmailDesignSubtleInkGuiClose:
ExitApp
Return

theEmailDesignUploadHelpGuiClose:
ExitApp
Return

theEmailDesignUploadWhiteGuiClose:
ExitApp
Return

theEmailDesignVSSGuiClose:
ExitApp
Return

theEmailDiscountGuiClose:
ExitApp
Return

theEmailDiscountBoosterGuiClose:
ExitApp
Return

theEmailDiscountCharityGuiClose:
ExitApp
Return

theEmailDiscountDiscountGuiClose:
ExitApp
Return

theEmailDiscountPearGuiClose:
ExitApp
Return

theEmailDiscountPriceHelpGuiClose:
ExitApp
Return

theEmailGeneralGuiClose:
ExitApp
Return

theEmailGeneralByeOrderGuiClose:
ExitApp
Return

theEmailGeneralCloseGuiClose:
ExitApp
Return

theEmailGeneralFollowUpGuiClose:
ExitApp
Return

theEmailGeneralFollowUpOrderGuiClose:
ExitApp
Return

theEmailGeneralFollowUpDesignGuiClose:
ExitApp
Return

theEmailGeneralHeyDesignGuiClose:
ExitApp
Return

theEmailGeneralHeyPricingGuiClose:
ExitApp
Return

theEmailGeneralPerksBulkGuiClose:
ExitApp
Return

theEmailGeneralPerksSinglesGuiClose:
ExitApp
Return

theEmailGeneralCRGuiClose:
ExitApp
Return

theEmailFollowUpFixGuiClose:
ExitApp
Return

theEmailGeneralMeGuiClose:
ExitApp
Return

theEmailGeneralOOOGuiClose:
ExitApp
Return

theEmailGroupGOFGuiClose:
ExitApp
Return

theEmailGroupGOFCancelGuiClose:
ExitApp
Return

theEmailGroupGOFDesignGuiClose:
ExitApp
Return

theEmailGroupGOFPriceGuiClose:
ExitApp
Return

theEmailGroupGOFSetupGuiClose:
ExitApp
Return

theEmailPostOrderCheckInfoGuiClose:
ExitApp
Return

theEmailPostOrderDeliveredGuiClose:
ExitApp
Return

theEmailPostOrderOrderDoneGuiClose:
ExitApp
Return

theEmailPostOrderPEMLGuiClose:
ExitApp
Return

theEmailPostOrderPreshipGuiClose:
ExitApp
Return

theEmailPostOrderPOInfoGuiClose:
ExitApp
Return

theEmailPostOrderTrackingGuiClose:
ExitApp
Return

theEmailPostOrderOrderDoneLinkGuiClose:
ExitApp
Return

theEmailPreOrderGuiClose:
ExitApp
Return

theEmailPreOrderVoucherCodeGuiClose:
ExitApp
Return


theEmailProblemGuiClose:
ExitApp
Return

theEmailProblemProblemFullGuiClose:
ExitApp
Return

theEmailProblemProblemPhotoGuiClose:
ExitApp
Return

theEmailProblemProblemReturnGuiClose:
ExitApp
Return

theEmailProblemProblemVoucherGuiClose:
ExitApp
Return

theEmailProblemConfirmFixGuiClose:
ExitApp
Return

theEmailProblemCrookedPhotoGuiClose:
ExitApp
Return

theEmailProblemCrookedReportGuiClose:
ExitApp
Return

theEmailProblemGhostingGuiClose:
ExitApp
Return

theEmailProblemPartialGuiClose:
ExitApp
Return

theEmailProblemProblemSizingGuiClose:
ExitApp
Return

theEmailProblemProblemTonesGuiClose:
ExitApp
Return

theEmailProblemSwapPackageGuiClose:
ExitApp
Return

theEmailProductGuiClose:
ExitApp
Return

theEmailProductBottlesGuiClose:
ExitApp
Return

theEmailProductCupsGuiClose:
ExitApp
Return

theEmailProductGlassesGuiClose:
ExitApp
Return

theEmailProductKooziesGuiClose:
ExitApp
Return

theEmailProductMagnetsGuiClose:
ExitApp
Return

theEmailProductMousepadsGuiClose:
ExitApp
Return

theEmailProductMugsGuiClose:
ExitApp
Return

theEmailProductPaperGuiClose:
ExitApp
Return

theEmailProductPensGuiClose:
ExitApp
Return

theEmailProductsSamplesGuiClose:
ExitApp
Return

theEmailProductStickersGuiClose:
ExitApp
Return

theEmailQuoteGuiClose:
ExitApp
Return

theEmailQuoteAPGuiClose:
ExitApp
Return

theEmailQuotePriceHelpGuiClose:
ExitApp
Return

theEmailQuoteQuoteBulkGuiClose:
ExitApp
Return

theEmailQuoteQuoteSinglesGuiClose:
ExitApp
Return

theEmailQuoteSleevePriceGuiClose:
ExitApp
Return

theEmailQuoteBudgetGuiClose:
ExitApp
Return

theEmailQuoteQuoteOnlyGuiClose:
ExitApp
Return

theEmailQuoteQuoteSpecGuiClose:
ExitApp
Return

theEmailShippingGuiClose:
ExitApp
Return

theEmailShippingAllShippingGuiClose:
ExitApp
Return

theEmailShippingDDGuiClose:
ExitApp
Return

theEmailShippingInternationalGuiClose:
ExitApp
Return

theEmailShippingQuickTurnGuiClose:
ExitApp
Return

theEmailShippingRushGuiClose:
ExitApp
Return

theEmailShippingStandardGuiClose:
ExitApp
Return

theEmailShippingSuperRushGuiClose:
ExitApp
Return

theEmailSinglesCanadaSinglesGuiClose:
ExitApp
Return

theEmailSinglesNoMinimumGuiClose:
ExitApp
Return

theEmailSinglesGuiClose:
ExitApp
Return

theChatContentGuiClose:
ExitApp
Return

theChatGuiClose:
ExitApp
Return

theChatContentBandsGuiClose:
ExitApp
Return

theChatContentCelebsGuiClose:
ExitApp
Return

theChatContentCollegeGuiClose:
ExitApp
Return

theChatContentDisneyGuiClose:
ExitApp
Return

theChatContentGreekGuiClose:
ExitApp
Return

theChatContentOffensiveGuiClose:
ExitApp
Return

theChatContentSportsGuiClose:
ExitApp
Return

theChatContentVideoGamesGuiClose:
ExitApp
Return

theChatContentWatermarkGuiClose:
ExitApp
Return

theChatContentContentGuiClose:
ExitApp
Return

theChatContentCollegeYesGuiClose:
ExitApp
Return

theChatContentCollegeNoGuiClose:
ExitApp
Return

theChatDesignGuiClose:
ExitApp
Return

theChatDesign2GuiClose:
ExitApp
Return

theChatDesignCombineColorsGuiClose:
ExitApp
Return

theChatDesignCombineStylesGuiClose:
ExitApp
Return

theChatDesignDesignHelpGuiClose:
ExitApp
Return

theChatDesignDesignLinkGuiClose:
ExitApp
Return

theChatDesignDesignSavedGuiClose:
ExitApp
Return

theChatDesignDesignTeamGuiClose:
ExitApp
Return

theChatDesignRetrieveGuiClose:
ExitApp
Return

theChatDesignDPIGuiClose:
ExitApp
Return

theChatDesignDPI1GuiClose:
ExitApp
Return

theChatDesignDPIBulkGuiClose:
ExitApp
Return

theChatDesignDPIBulk1GuiClose:
ExitApp
Return

theChatDesignDPISinglesGuiClose:
ExitApp
Return

theChatDesignUploadEmbroideryGuiClose:
ExitApp
Return

theChatDesignFiletypesGuiClose:
ExitApp
Return

theChatDesignInkChangeGuiClose:
ExitApp
Return

theChatDesignPMSGuiClose:
ExitApp
Return

theChatDesignPMSDigitalGuiClose:
ExitApp
Return

theChatDesignPPSGuiClose:
ExitApp
Return

theChatDesignRedrawGuiClose:
ExitApp
Return

theChatDesignRotateGuiClose:
ExitApp
Return

theChatDesignSampleGuiClose:
ExitApp
Return

theChatDesignSleeveHelpGuiClose:
ExitApp
Return

theChatDesignSubtleBlankGuiClose:
ExitApp
Return

theChatDesignSubtleInkGuiClose:
ExitApp
Return

theChatDesignUploadWhiteGuiClose:
ExitApp
Return

theChatDesignVSSGuiClose:
ExitApp
Return

theChatDesignBrandingGuiClose:
ExitApp
Return

theChatDesignColorMaxGuiClose:
ExitApp
Return

theChatDesignDesigningGuiClose:
ExitApp
Return

theChatDesignPersGuiClose:
ExitApp
Return

theChatDesignSpVsDigGuiClose:
ExitApp
Return

theChatDiscountBoosterGuiClose:
ExitApp
Return

theChatDiscountCharityGuiClose:
ExitApp
Return

theChatDiscountDiscountGuiClose:
ExitApp
Return

theChatDiscountPearGuiClose:
ExitApp
Return

theChatDiscountPriceHelpGuiClose:
ExitApp
Return

theChatGeneralGuiClose:
ExitApp
Return

theChatGeneral1GuiClose:
ExitApp
Return

theChatGeneralByeOrderGuiClose:
ExitApp
Return

theChatGeneralCheckingGuiClose:
ExitApp
Return

theChatGeneralCloseGuiClose:
ExitApp
Return

theChatGeneralCustGuiClose:
ExitApp
Return

theChatGeneralDesigningGuiClose:
ExitApp
Return

theChatGeneralFollowUpGuiClose:
ExitApp
Return

theChatGeneralFollowUpOrderGuiClose:
ExitApp
Return

theChatGeneralFollowUpDesignGuiClose:
ExitApp
Return

theChatGeneralHelpGuiClose:
ExitApp
Return

theChatGeneralHeyDesignGuiClose:
ExitApp
Return

theChatGeneralHeyPricingGuiClose:
ExitApp
Return

theChatGeneralPerksBulkGuiClose:
ExitApp
Return

theChatGeneralPerksSinglesGuiClose:
ExitApp
Return

theChatGeneralQuoteGuiClose:
ExitApp
Return

theChatGeneralCRGuiClose:
ExitApp
Return

theChatFollowUpFixGuiClose:
ExitApp
Return

theChatGeneralMeGuiClose:
ExitApp
Return

theChatGeneralEmailGuiClose:
ExitApp
Return

theChatGeneralOOOGuiClose:
ExitApp
Return

theChatGroupGuiClose:
ExitApp
Return

theChatGroupGOFGuiClose:
ExitApp
Return

theChatGroupGOFCancelGuiClose:
ExitApp
Return

theChatGroupGOFDesignGuiClose:
ExitApp
Return

theChatGroupGOFPriceGuiClose:
ExitApp
Return

theChatGroupGOFSetupGuiClose:
ExitApp
Return

theChatLiveEngageGuiClose:
ExitApp
Return

theChatLiveEngageByeSurveyGuiClose:
ExitApp
Return

theChatLiveEngageDiscountsGuiClose:
ExitApp
Return

theChatLiveEngageEmailGuiClose:
ExitApp
Return

theChatLiveEngageGreetingWNameGuiClose:
ExitApp
Return

theChatLiveEngageGreetingWONameGuiClose:
ExitApp
Return

theChatLiveEngageInternationalGuiClose:
ExitApp
Return

theChatLiveEngageLostYouWNameGuiClose:
ExitApp
Return

theChatLiveEngageLostYouWONameGuiClose:
ExitApp
Return

theChatLiveEngageMilitaryGuiClose:
ExitApp
Return

theChatLiveEngageNoCommWNameGuiClose:
ExitApp
Return

theChatLiveEngageNoCommWONameGuiClose:
ExitApp
Return

theChatLiveEngageSimpleIntroNameGuiClose:
ExitApp
Return

theChatPostOrderCancelOrderGuiClose:
ExitApp
Return

theChatPostOrderCheckInfoGuiClose:
ExitApp
Return

theChatPostOrderDeliveredGuiClose:
ExitApp
Return

theChatPostOrderOrderDoneGuiClose:
ExitApp
Return

theChatPostOrderPEMLGuiClose:
ExitApp
Return

theChatPostOrderPOInfoGuiClose:
ExitApp
Return

theChatPostOrderTrackingGuiClose:
ExitApp
Return

theChatPostOrderOrderDoneLinkGuiClose:
ExitApp
Return

theChatPreOrderGuiClose:
ExitApp
Return

theChatPreOrderPreAddressGuiClose:
ExitApp
Return

theChatPreOrderPreConfirmGuiClose:
ExitApp
Return

theChatPreOrderPreContactGuiClose:
ExitApp
Return

theChatPreOrderPreShippingGuiClose:
ExitApp
Return

theChatPreOrderPreSinglesGuiClose:
ExitApp
Return

theChatPreOrderVoucherCodeGuiClose:
ExitApp
Return

theChatProblemGuiClose:
ExitApp
Return

theChatProblemConfirmFixGuiClose:
ExitApp
Return

theChatProblemCrookedPhotoGuiClose:
ExitApp
Return

theChatProblemCrookedReportGuiClose:
ExitApp
Return

theChatProblemGhostingGuiClose:
ExitApp
Return

theChatProblemPartialGuiClose:
ExitApp
Return

theChatProblemProblemFullGuiClose:
ExitApp
Return

theChatProblemProblemHelpGuiClose:
ExitApp
Return

theChatProblemProblemPhotoGuiClose:
ExitApp
Return

theChatProblemProblemReturnGuiClose:
ExitApp
Return

theChatProblemProblemReviewGuiClose:
ExitApp
Return

theChatProblemProblemSizingGuiClose:
ExitApp
Return

theChatProblemProblemTonesGuiClose:
ExitApp
Return

theChatProblemSwapPackageGuiClose:
ExitApp
Return

theChatProblemProblemVoucherGuiClose:
ExitApp
Return

theChatProductGuiClose:
ExitApp
Return

theChatProductBottlesGuiClose:
ExitApp
Return

theChatProductCupsGuiClose:
ExitApp
Return

theChatProductGlassesGuiClose:
ExitApp
Return

theChatProductKooziesGuiClose:
ExitApp
Return

theChatProductMagnetsGuiClose:
ExitApp
Return

theChatProductMousepadsGuiClose:
ExitApp
Return

theChatProductMugsGuiClose:
ExitApp
Return

theChatProductPaperGuiClose:
ExitApp
Return

theChatProductPensGuiClose:
ExitApp
Return

theChatProductSampleGuiClose:
ExitApp
Return

theChatProductStickersGuiClose:
ExitApp
Return

theChatQuoteGuiClose:
ExitApp
Return

theChatQuoteAPGuiClose:
ExitApp
Return

theChatQuoteHighPriceGuiClose:
ExitApp
Return

theChatQuotePriceHelpGuiClose:
ExitApp
Return

theChatQuotePriceQuote1GuiClose:
ExitApp
Return

theChatQuotePriceQuote2GuiClose:
ExitApp
Return

theChatQuotePriceQuote3GuiClose:
ExitApp
Return

theChatQuotePriceQuote4GuiClose:
ExitApp
Return

theChatQuotePriceQuote5GuiClose:
ExitApp
Return

theChatQuoteQuoteBulkGuiClose:
ExitApp
Return

theChatQuoteQuoteSinglesGuiClose:
ExitApp
Return

theChatQuoteSleevePriceGuiClose:
ExitApp
Return

theChatQuoteBudgetGuiClose:
ExitApp
Return

theChatQuoteQuoteOnlyGuiClose:
ExitApp
Return

theChatQuoteQuoteSpecGuiClose:
ExitApp
Return

theChatQuoteQuoteGuiClose:
ExitApp
Return

theChatShippingAllShippingGuiClose:
ExitApp
Return

theChatShippingLogisticsGuiClose:
ExitApp
Return

theChatShippingInternationalGuiClose:
ExitApp
Return

theChatShippingDDGuiClose:
ExitApp
Return

theChatShippingRushGuiClose:
ExitApp
Return

theChatShippingStandardGuiClose:
ExitApp
Return

theChatShippingSuperRushGuiClose:
ExitApp
Return

theChatSinglesGuiClose:
ExitApp
Return

theChatSinglesCanadaSinglesGuiClose:
ExitApp


theChatSinglesNoMinimumGuiClose:
ExitApp


thePidginGuiClose:
ExitApp


thePidginCallForYouGuiClose:
ExitApp


thePidginChatForYouGuiClose:
ExitApp

thePidginEmailForYouGuiClose:
ExitApp


