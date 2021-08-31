#SingleInstance Force
#NoTrayIcon
INI=%A_scriptdir%\settings.ini
SetBatchLines, -1
T = %A_Now% 

T -= 1970,s

CLogDir=%A_scriptdir%\old

IfNotExist, %CLogDir%
FileCreateDir, %CLogDir%

IfNotExist, %A_ScriptDir%\text_files
FileCreateDir, %A_ScriptDir%\text_files

PleasantNotify("Auto Hotkeys Update Started", "", 430, 65, "vc hc", 3)

; AHK files filename\google drive ID\file size

AHKList = browser_check.ahk\0B9uii6LI7D0LckdUMnpWQUJpb28\2,colortest.ahk\0B9uii6LI7D0LUWNyc2x2RWduVTg\1,description.ahk\0B9uii6LI7D0LVzFIeGtLSWdyXzQ\695,gen_comp_list.ahk\0B9uii6LI7D0LRVhmaE9QQzhtVFE\28,service.ahk\1IUslOvPXXXACZ24kcp3wDnJZgLfhIMcY\134,manual.ahk\0B9uii6LI7D0LSWVVQzJCNW5QYjg\693,master.ahk\0B9uii6LI7D0LVVBjUHJGel83bkk\141,monitor.ahk\1E9siLlmwK5SyyQpqM8N1bIKT-vfUY0gw\1,repTimer.ahk\0B9uii6LI7D0LMEVHYjlVX1o4bnM\16,setup.ahk\0B9uii6LI7D0LdUVnQkV0LXJhOUU\197,service.ahk\1IUslOvPXXXACZ24kcp3wDnJZgLfhIMcY\134,spellaid-settings.ini\0B9uii6LI7D0LY1Jfb3NjQTM4MXc\1,spellaid.ahk\0B9uii6LI7D0Ld1phU3dTWE1TY1E\70,updater.ahk\0B9uii6LI7D0LcVBSQUt5MG9MSTg\17,zip_checker.ahk\0B9uii6LI7D0LSVMwMkVQLWM3RVk\16,zipChecker.ini\1aJAdrAWWDeHNg0bWXVoV-09Cr1LmI7vl\6

; images  filename\google drive ID

imagesList = 1.png\0B9uii6LI7D0LYndpN1dwU3g3anM,2.png\0B9uii6LI7D0LTXJYMXRmNUxxUkE,3.png\0B9uii6LI7D0LWFo4V3lIYnN0dms,4.png\0B9uii6LI7D0LQUM1dVF4LWlCdGc,5.png\0B9uii6LI7D0LckFIa0pHc0NqYXM,10_off.jpg\1ed_fuclePh4R8kGm_B98wDD1jwN7sA_Q,10_on.jpg\1l-Jqz1OKcRCPVQh-MLyxmjn03jCHC0Vc,20_off.jpg\1vZSK426ilMDIcirwtsVcm7bHEAayfO_f,20_on.jpg\1MrbmyhmbVgrUwgb6QgeDK0rhWrk27GEh,30_off.jpg\1DIf7T6XrOxt1d9x6qsKTakHt7mEdiq8M,30_on.jpg\1SbERXsYuQgEt7_rm29ut83e4zxnqm8q6,40_off.jpg\1Y8ykwyGMwHarD1YqPhbkcEOJRVBqNCoT,40_on.jpg\13r5rkUCMi-FA_rnrpPpob5NJJRHS56bR,50_off.jpg\1iU9tnJddWnkOSgvTm1jWurabB8OCGC5z,50_on.jpg\1Mk4FzpfnFlRjkKPm1HlBJUbvrZzhiZmB,488548344.psd\1lTQhJzR3SuPmMWlHGnTGaweE7PfL-OJs,ahk_manual.jpg\0B9uii6LI7D0LTDhXbFpXWDN5YVE,bg1.jpg\1L-p6hRCWVprNgjGVNvZzIgvnZdB2UT0P,bg2.jpg\1uxYxEzZU3hYvLRDIthuclDzf8adSjVdv,bg3.jpg\14kelK8JJHyWHau_AhrcyTbEow5BDj127,calculator.jpg\14cuIJmP7aKFqxlcBuPJ3bub-3E2Bdv-a,copytodyo.jpg\1bi7yaJ7zcmd-B-RNH2dVjzxjZp0A6gxG,custom_hotkeys.jpg\0B9uii6LI7D0LVzA0QTlDclNZQ00,delete.jpg\0B9uii6LI7D0LSU1QNUtWdHhQaUk,delivery.jpg\0B9uii6LI7D0LWW9IUFFZU2FnME0,dps.jpg\1Rz8RshuXnur3ZF40vkrjDQLlvzaOrRUh,exit.jpg\0B9uii6LI7D0LZWIwWTZ4T2JIU28,ExitToBlanksWizard.jpg\14B1UwXlMBUpHrPm0EzMpKGml98yKx_bn,ExitToWizard.jpg\1vVqGaGwjut69duEhzCq5nQRTk8yJSusc,gallery.jpg\1oioHZ0cXt4NxEzpz1SStsw66-5pGwTRb,go_back.jpg\0B9uii6LI7D0LVTNzQlBtaVp0eGM,logo.jpg\1JnBaW9ea7FPqtIS_F2JMYAwb91p2F8fZ,logo.png\1_ErbgQd4FJzsovEGi6frnhBtrbt9cxdp,magenta1.jpg\1Yo9BvNaRmoA9LDm0bQ9c4Kr_dE5UxrHP,menu.jpg\1H2Q3TKcVsjADXjvK8_YBL1MlOH2-eD3j,navy1.jpg\1sRrOYauH9r3GnrRCUViumXqgXnzU4Wbw,new.jpg\0B9uii6LI7D0LRjZtdnpUQXpsWmM,next.jpg\0B9uii6LI7D0LRnV0anM1NDFDQXM,off.jpg\0B9uii6LI7D0LYzFOQzhXM3FyQUU,on.jpg\0B9uii6LI7D0LMEpRdDluNTdSSlU,onoroff.jpg\0B9uii6LI7D0LaTlyMkRIUUplanc,other_off.jpg\1qyo8yphQBQ64cm1fwhsmIpeZoRtJLVoU,paste.jpg\1YYZZLpneP5b548lI6eloqv0NDLb6m2tY,paste.png\1x2VLUcLVUaA9J9OOCgr3Bq4fZRv_vUUY,paste1.jpg\1gdze75DAhAfJy9kdWjgSfPTnkM4WRUwy,PR-percentage-by-order.jpg\16wL2YKjoxE6ENHyUPeZ-4hAR2rYQXqGt,problem_reporting.jpg\1nIMcRyAI-GlpWjM7ktVmtB45WT01Xd4Z,purple.jpg\1m9gjBfauXJrZtc-p9wsctxIBGSHCHcyA,restore_default.jpg\0B9uii6LI7D0LenNzNXBrWm11U0U,return.jpg\1wuYXWS4U4c9nwUc9S-3Qjr8yHpyXTwX9,returnschat.jpg\1chkeiXBQjvFdJ_DvQXBSthdr1k48ftLu,save.jpg\0B9uii6LI7D0LNEpBbWZnQUFZQUk,settings.jpg\0B9uii6LI7D0LdGdnWjc0TWtBZjQ,spelling.jpg\0B9uii6LI7D0LM2FkWnZYNkpFQVU,spinner.gif\0B9uii6LI7D0LQ3lTRVVzOENfZ00,suggest.jpg\0B9uii6LI7D0La0w0SjZXQlhrMXM,swap_packages (1).png\1CXC7moqkAxy-VMjriUipiG2UxlQ5sLHA,swap_packages.png\1Yh0Pc4OP2kZQtBL_w5xMO4DGZ_T-2vew,swapped_packages.jpg\1v2Dw-ucdSxBdTkn90Joy00Kuvbaa88GI,test_image.jpg\1DcwypO-SHMBi0ceArH2bozwh595bjEHb,update.jpg\0B9uii6LI7D0LcXMzRjRnNGNJNk0,UPS_address_missing.jpg\18Cfs27WV2mCOOY8jYQmeUhEg1XNj4nvx,UPS_addy_1.jpg\1UbHERej8sz7cScD6jELMQRGBwE9Ybpp2,UPS_addy_2.jpg\1A5aknWzQucRCjGp_hquVsS-X9Ijn8NE_,UPS_addy_type.jpg\1em_xp9nmyYTsBMMgl6stGEqNXisPrDB0,UPS_all_old.jpg\1h8ZNmlhDi8mW69MkH3LObtG0zJRrGa1c,UPS_all.jpg\17zQX4B2U159byweV5xPBoV3KoqlM-N8F,UPS_begin_message.jpg\1R4IWyTZNrhKfyvRrhoAOFTl4y2EGr-eQ,UPS_campusship_connected.jpg\1ABNhKLo9usdRaHu9_V6gArVZdPW1f0oO,UPS_campusship_error.jpg\138jZ6W8NHWWbyob0XcyXajK3U3EiPQDH,UPS_city_missing.jpg\148zl78DyR9VZWtT59KizYCucbHy4mh4o,UPS_city.jpg\19yThHULuJkhxzMR27sZDyenjqMJ4xESp,UPS_customer_info_1.jpg\1P68xJI5rSrD83iwRuZvKkWFNF7T9I8YI,UPS_customer_info.jpg\13eQOrnMbWLNrWe-7BRArQfhkccE91EnZ,UPS_customer_name_missing.jpg\1yxqaWR-AGOu5QFyBhAz6d6IRa7GeG0UR,UPS_different_city_zip.jpg\1Gk3uCCP_4W8pLCxZxVnA36_nT_QZU5Ce,UPS_elabel_error.jpg\1_iX05i6TvpyeH8CMqdVtnbfR0y7PyUqJ,UPS_exit.jpg\1VjPYciujlcMUdbgPiAO14n1AszBxu96p,UPS_fields_complete.jpg\1C4UKSm9gj27K3Tl8XS_T5JTjKRS1nV-M,UPS_fields_incomplete.jpg\1I_VZG0bZAPdNROOTAZ5_VtMxyny7q5yH,UPS_IE_launch_error.jpg\1R8rFUGlfJI6r0N8icDqSz1dDQSsmX70f,UPS_label_created.jpg\157vUhOhstvxUPYzgh8SQIWqUqh8TJDpg,UPS_merch.jpg\1s-LazrA8-_x8Z8rMA4AB-DdOBMrRsWjq,UPS_merchandise_missing.jpg\1cS1lvO4HZc7mv0puFWrXlF8ss71X_HO7,UPS_ML.jpg\1zy6yT35IJ7Mdot-RQr5xxxwNtwYs2CLc,UPS_MP.jpg\1vTkCao2VIQl3Q9StNUdwNz2KCW-h6eWs,UPS_name.jpg\1EPZBULQUdDY32jypYdnJ2CklsbLgETNR,UPS_name.psd\1Tuqcu1qtbefhR9S2XSiOq90oWf6Y6-7d,UPS_number_of_packages_titl.jpg\1ajKcfh5WAaw0CPIc-5I2L4KsmYcImy4M,UPS_order_number_missing.jpg\1YsT9wMBrrn18FZ06GtLsEbPdXRVGgsMH,UPS_order_number.jpg\1lTj_9xPFDShwFefCtUD_6CkXSqxx4XdZ,UPS_package_info_1.jpg\174Ht8aobIfJ66Gcw2FG6CjqyuoOHfLda,UPS_package_info.jpg\1IsyhJ4L4IGRm51egB-GLMEz0GBcwQKhR,UPS_paste.jpg\1JpT5xvOCh9Tklq0M_Ri0daERvba6vtqK,UPS_PC_1of1.jpg\1A2TPeg93LgPlt8fMK0ipCebV5gOH7HgI,UPS_PC_1of2.jpg\1GStl3nOLF_zf2roLxV0vQ65JyKI4MSss,UPS_PC_1of3.jpg\1VepoL2EJJox4KMo4jpx9qFw-V80rRsni,UPS_PC_1of4.jpg\1qAQx3e5hYJzIyHhQU66zWaXyO9RK6jg6,UPS_PC_1of5.jpg\1p21KOIfh9d_hg2do3najpnWSiUKYdRwo,UPS_PC_2of5.jpg\1KuoZujYvzwhAiUCpgI-TaSxbI8MmYXyO,UPS_PC_3of5.jpg\1k8g3ecOEYmE9iIJJIbBaLl0G5OpKD1wW,UPS_PC_4of5.jpg\1U5msE2inTu4y-UkA9wEEy1HSnG5X7zn5,UPS_phone.jpg\1YRKLJ2GqSNa3v3qUooKhSijVE64N6YKu,UPS_return_cville.jpg\1Q4PvNb-MylL0Sk_0NedESblg1EqmPDSt,UPS_return_error.jpg\1rX8W5ukDzfcdVE7hhY1ArcgwD6tbuWNN,UPS_return_info.jpg\1Z2daG94agjDdWYLCFXSu4VF_DeU-A_xv,UPS_return_reno.jpg\1FKKmBur5bWckb5QVMMbnwyU6kmyaI9Em,UPS_service.jpg\1OhhA01c7xmHuGPzGSK7pElXVVNvsvDTN,UPS_SL.jpg\1ppm6wYcHa8xzW0VD7nL32uN_mzEua-VY,UPS_SP.jpg\1UKcIo26HEehY5orf8sD8YDlBhcjREIZq,UPS_start_return.jpg\1yAuS0y0vnJoVSpMU6iJsCwdAHhYe_oUP,UPS_status.jpg\14dt_Ad5kg6my5vBJMTLdLqFBxM4GMaly,UPS_tracking_label.jpg\1cmcMHoxwkQN_nlK9NZMBiLKHjgVNEJNL,UPS_tracking_pickup.jpg\18fBANgae6xQ9vqWrP0CYHPbmifrtXBDw,UPS_weight_exceeded.jpg\1tQuLSFkK15nlpEEZcUHRVHnDCIIU_4Ku,UPS_weight_missing.jpg\1E_AK5Yc0Kg3ovpuVP9Ti-eM6sLRkxeL-,UPS_weight.jpg\1vKFS97rZRcyATFVAnt-CCunbdyYpD1sY,UPS_weight1.jpg\1aNh3NH1XK1khYcgF8L8pYgm_5xf4i5yz,UPS_weight2.jpg\1c92fQMxjl2QB3zwQoYN74M-WB8qiTd3D,UPS_weight3.jpg\1UtQmoNWicl_1MSdjuUN00cn1AvjLjdqd,UPS_weight4.jpg\1waEoXKcMlTsH0xq9xvZoujM8V4H6e1wd,UPS_weight5.jpg\1EeMeB-stwWDTrMgSBSxDmHimrs55ws59,UPS_zipcode_missing.jpg\1ycAJmhs4dThGp8vvMeGIBqjrsFb7dd75,UPS_zipcode_not_found_msg.jpg\16Ewk1OWWcpn7qg16MElUIug09QuUMnuC,UPS_zipcode_not_found.jpg\1tqll45PeSaecffOyzTYMrugByRvEHk-t,UPS_zipcode.jpg\11IvxPZxrW_6q98xOH--xnOalvitkkPsa


; images\swap filename\google drive ID

swapImagesList = address_line_1_error.jpg\1eO4da4uUNaEpASZUqpX6Ox068gKLVIQh,address_line_1.jpg\1QLhMGDOLJzvNrkooCGxiEXNvoGrdU8Qg,address_line_2_error.jpg\1LMWRo7sqJUMskhSPOGXknKwf_QBZ-4BW,address_line_2.jpg\1J7j9gLwWgTkM7KS7u6cln_gd6qwh7G4N,address_type.jpg\1aSF2_oVrn_-SBdbcUGsS_HETNCfBCOmW,back.jpg\16C4GdR173TEx8vrc8e-1cfghvztfgQI2,city_error.jpg\1zw3TNmVNoRlD6cpvP28xAUo0RoL3e8Nl,city.jpg\1Qce9MJU7wPo1IJD2c_i8PCk6ITrCKPTn,continue.jpg\1iMMwuzftVMXUHeEm93IfQu-x2LMekQAy,customer_A_details.jpg\1ClK7zry5izOy0lbA8dzyNoSFJdhpQBYr,customer_B_details.jpg\1bmaz7NaA_i6rdFwGIHEPPyUiFPXCWyK7,customer_contacted_off.jpg\1GJTgPzFEKAgpPdB5ULsHKUiazAh5hCR5,customer_contacted_on.jpg\1CBwXmqO493UYbAkStaR27XFPVliN2Io9,customer_contacted.jpg\1RDxOFioVlnpkS7zc1NSxYr7YZ0uA8UUr,delivery_method_needed.jpg\1FhXhlYj79MEfpYqjcbCCYVbVUt6uIQwc,email_off.jpg\1Jwrh--vGKK7x5G9AhDAu7C7FbcBVrPSU,email_on.jpg\15b2jA3Be5FEiccSrG-j9HAZb6114SlN6,email.jpg\1jj4BJYBizFYgdGr19aFWP_UGLBq3MrPg,event_date_error.jpg\1TgJ532Nr1ookwPSaJQ2rjWqkJ5LObJnr,event_date.jpg\1RCPvdsfqGDdV7bl5KSh4XC8JidLXXzPM,header_1.jpg\1xjMJKjMnFXEeLyP6ZWKKLfsOi5xkYB1s,header_2.jpg\1E_cCffYJjk7ezHuVCKvByhqmc221ah2w,horz_spacer.jpg\1T4ZybxfXt4ogPRlDNVEsbYhkYnK1RY9a,initial_contact.jpg\1npYFbykR4wyPNSc47FDu1z2XZiCs2akz,merchandise_description.jpg\1SiVPmzCcWmBYgwPTJlZQQKHXHXBmjJj5,merchandise_error.jpg\1anwRAg9dd6dgvhbOcOe0VLyAT4f1pLOg,name_error.jpg\1ujdNMCOdnxVoM5AtLnqfmf8Yh8zTwZZy,name.jpg\1Uwaz94mlpKs6jxGZFIKPuUkVSIiocsXg,number_of_packages.jpg\1CXC2KpBJd1S6aYToVd_phcxjqMDPj43L,order_number_placed_error.jpg\1_vYO1_HpmKZ9NlSZRX5wpzxtG6RFvslm,order_number_placed.jpg\1LTXEtmgKNG3LIs10N1g6ZpNPdTJw4RM4,order_number_received.jpg\1K4H81nG5PdXzhPulxN0fUAk04EH3mA1a,phone_off.jpg\1KkWHWIB0Pe3fQXLp2egZLFw2gaS6lMut,phone_on.jpg\1F3Vme36ZkWooGmZUuJcefqCeJh1BX5lx,phone.jpg\1bjs8K10oOuBWt1wNZkb4AKQ2LgN0iCct,processing.jpg\1QleoQk5GRNBchKSXWK7znZNtwQkDpbf1,service_type.jpg\1wXVoSI3hjMdLZZMmP7oCznFnalspVziv,side_address.jpg\1qeX-z2U1k3Kec-tz2VpIqO22JCtR9rhX,spacer_1.jpg\1kTXqYWyxAMdMqiUtu3pf8huLSKbAGTgk,vertical_spacer.jpg\1-SgDU6glnWWBqIpBmHI-Nl5idgdMMipR,weight_1_error.jpg\1EHXJ-QLUwASeTRVZ5D8XFzAUztX0YmMB,weight_1.jpg\1tR93wfu0GkT-WrS3iA9OYANXo76kJv-5,weight_2_error.jpg\1j8YAvXiDX3usq-FoWAuuoA3Kmo1e0HeD,weight_2.jpg\14QvNBoTJjzvqzBY-_EPIFPB0AfALtii6,weight_3_error.jpg\1-Rj1ifz1nY4aD99qfmk6BBLzO_MBVGWw,weight_3.jpg\1L8DxsIDO6H0VyvOxVQldi8gdzihJtV84,weight_4_error.jpg\1lhlmCtwRSWEfyhmRFHFyVhJRPEd8_rXf,weight_4.jpg\15drXwuEbWr3xxqknVQW9gC4dyPb201RM,weight_5_error.jpg\1OT9wo-PmxfRkWUWNOidgYmNFk8WPDFXV,weight_5.jpg\1cF3c-Dh0M3h4JsXSFfH86tN5IlIMEoHZ,zip_code_error.jpg\1RhsIT5fgDsbWxtYMY3lGI5c28Qe4U9iK,zip_code.jpg\1PO2gl931E9XhkhGY8s-P8lCOkpfuXcE2


; Begin download AHK files.
; Because of intermittent issues with the file not being downloaded correctly, we're checking the intended file size against the actual downloaded file size. If it is not accurate, we will try 5 more times before moving on.

Loop, parse, AHKList, `,
{
	Loop, parse, A_LoopField, \
	{
	
		if (A_Index = 1)
		AHKfilename := A_LoopField
		else if (A_Index = 2)
		GoogleID := A_LoopField
		else if (A_Index = 3)
		{
		AHKfilesize := A_LoopField
		
		closingFile = %AHKfilename% ; Terminate this script if it's currently running
		
		IfWinExist, i)%closingFile%.* ahk_class AutoHotkey
		{
		WinClose
		WinWaitClose, i)%closingFile%.* ahk_class AutoHotkey, , 2
		}
		
		try
		UrlDownloadToFile, https://drive.google.com/uc?export=download&id=%GoogleID%, %A_Desktop%\BHK\%AHKfilename% ; Download new file version
		
		FileGetSize, thisFileSize, %AHKfilename%, K
		if (thisFileSize != %AHKfilesize%)
		{
			Loop, 5
			{
			UrlDownloadToFile, https://drive.google.com/uc?export=download&id=%GoogleID%, %A_Desktop%\BHK\%AHKfilename% ; Download new file version
			
			FileGetSize, thisFileSize, %AHKfilename%, K
			
			if (thisFileSize = %AHKfilesize%)
			break
			
			}
		}
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
		{
		imageFileName := A_LoopField
		ifExist, %A_ScriptDir%\images\%imageFileName%
		break 2		
		}
		else if (A_Index = 2)
		{
		GoogleID := A_LoopField
		
		Try
		URLDownloadToFile, https://drive.google.com/uc?export=download&id=%GoogleID%, %A_Desktop%\BHK\images\%imageFileName% ; Download Image
		}
	}
}

; Begin download images\swap
; Not necessary to check the file size of these files.

Loop, parse, swapImagesList, `,
{

	Loop, parse, A_LoopField, \
	{
	
		if (A_Index = 1)
		{
		imageFileName := A_LoopField
		ifExist, %A_ScriptDir%\images\swap\%imageFileName%
		break 2		
		}
		else if (A_Index = 2)
		{
		GoogleID := A_LoopField
		
		Try
		URLDownloadToFile, https://drive.google.com/uc?export=download&id=%GoogleID%, %A_Desktop%\BHK\images\swap\%imageFileName% ; Download Image
		}
	}
}


  PleasantNotify("Auto Hotkeys Update Complete", "", 460, 65, "vc hc", 3)
 sleep 3000
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
		






