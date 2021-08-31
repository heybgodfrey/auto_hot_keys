; UPS Zip Checker Tool
; Last Updated 11/18/15
; Author: Bryan Godfrey
; Autohotkey Version v1.1.22.07
; Download Autohotkey: http://ahkscript.org/
; This script is currently functional.
; 
; This tool works in conjunction with theups.ahk to check for the correct loginname based on the zip code and
; retrieve the correct state based on that zip code.
; ============================================================================================================== ;


; Cannot check a number beginning with 0, stripping the beginning 0 for the purposes of comparison in code below. 

StringLeft, midLoc, ZipCode, 1
if midLoc = "0"
{

StringTrimLeft, location, midLoc, 1

}
else
{
location := ZipCode
}

; If the location is not a digit, we're stopping the rep to have them double check their entry.

If location is not digit
{
MsgBox, 0,, The zip code you've copied is not correct.
return
}

; Start checking through each zip code range. Not including APO/DPO/FPO zip codes as we wouldn't do a return from those areas anyways.
; All ranges verified on the USPS website.

If location between 99501 and 99950 ; Alaska
{

loginname = sales_service
global theState = 2
}
Else If location between 35004 and 36925 ; Alabama
{

loginname = sales_service
global theState = 1
}
Else If location between 71601 and 72959 ; Arkansas
{
loginname = sales_service
global theState = 4
}
Else If location between 75502 and 75502 ; Arkansas (Texarkana)
{
loginname = sales_service
global theState = 4
}
Else If location between 85001 and 86556 ; Arizona
{
loginname = sales_service
global theState = 3
}
Else If location between 90001 and 96162 ; California
{
loginname = sales_service
global theState = 5
}
Else If location between 80001 and 81658 ; Colorado
{
loginname = sales_service
global theState = 6
}
Else If location between 6001 and 6389 ; Connecticut
{
loginname = sales_service
global theState = 7
}
Else If location between 6401 and 6928 ; Connecticut 
{
loginname = sales_service
global theState = 7
}
Else If location between 20001 and 20013 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else If location between 20015 and 20020 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else If location between 20022 and 20024 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else If location between 20026 and 20027 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else if location = 20030 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else If location between 20032 and 20033 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else If location between 20035 and 20054 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else If location between 20055 and 20078 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else If location between 20080 and 20082 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else if location = 20088 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else If location between 20090 and 20091 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else If location between 20097 and 20098 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else If location between 20201 and 20208 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else If location between 20210 and 20224 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else If location between 20226 and 20230 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else If location between 20232 and 20233 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else if location = 20235 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else If location between 20237 and 20242 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else If location between 20244 and 20245 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else If location between 20250 and 20251 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else if location = 20254 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else If location between 20260 and 20262 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else If location between 20265 and 20266 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else if location = 20268 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else if location = 20270 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else if location = 20277 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else if location = 20289 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else if location = 20299 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else if location = 20301 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else if location = 20303 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else If location between 20306 and 20307 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else if location = 20310 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else if location = 20314 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else If location between 20317 and 20319 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else if location = 20330 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else if location = 20340 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else if location = 20350 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else if location = 20355 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else if location = 20370 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else If location between 20372 and 20376 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else if location = 20380 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else If location between 20388 and 20395 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else if location = 20398 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else If location between 20401 and 20429 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else if location = 20431 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else If location between 20433 and 20437 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else If location between 20439 and 20442 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else if location = 20444 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else if location = 20447 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else if location = 20451 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else if location = 20453 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else if location = 20456 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else if location = 20460 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else if location = 20463 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else If location between 20468 and 20470 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else if location = 20472 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else If location between 20500 and 20511 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else if location = 20515 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else If location between 20520 and 20544 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else If location between 20546 and 20549 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else If location between 20551 and 20555 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else If location between 20557 and 20560 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else If location between 20565 and 20566 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else If location between 20570 and 20573 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else If location between 20575 and 20581 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else If location between 20585 and 20586 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else If location between 20590 and 20591 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else If location between 20593 and 20594 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else if location = 20597 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else if location = 20599 ; District of Columbia
{
loginname = sales_service
global theState = 9
}
Else If location between 19701 and 19980 ; Delaware
{
loginname = sales_service
global theState = 8
}
Else If location between 32004 and 34997 ; Florida
{
loginname = sales_service
global theState = 10
}
Else If location between 30001 and 31999 ; Georgia
{
loginname = sales_service
global theState = 11
}
Else If location between 39901 and 39901 ; Georgia (Atlanta)
{
loginname = sales_service
global theState = 11
}
Else If location between 96701 and 96898 ; Hawaii
{
loginname = sales_service
global theState = 12
}
Else If location between 50001 and 52809 ; Iowa
{
loginname = sales_service
global theState = 16
}
Else If location between 68119 and 68120 ; Iowa (Omaha)
{
loginname = sales_service
global theState = 16
}
Else If location between 83201 and 83876 ; Idaho
{
loginname = sales_service
global theState = 13
}
Else If location between 60001 and 62999 ; Illinois
{
loginname = sales_service
global theState = 14
}
Else If location between 46001 and 47997 ; Indiana
{
loginname = sales_service
global theState = 15
}
Else If location between 66002 and 67954 ; Kansas
{
loginname = sales_service
global theState = 17
}
Else If location between 40003 and 42788 ; Kentucky
{
loginname = sales_service
global theState = 18
}
Else If location between 70001 and 71232 ; Louisiana
{
loginname = sales_service
global theState = 19
}
Else If location between 71234 and 71497 ; Louisiana
{
loginname = sales_service
global theState = 19
}
Else If location between 1001 and 2791 ; Massachusetts
{
loginname = sales_service
global theState = 22
}
Else If location between 5501 and 5544 ; Massachusetts (Andover)
{
loginname = sales_service
global theState = 22
}
Else If location between 20331 and 20331 ; Maryland
{
loginname = sales_service
global theState = 21
}
Else If location between 20335 and 20797 ; Maryland
{
loginname = sales_service
global theState = 21
}
Else If location between 20812 and 21930 ; Maryland
{
loginname = sales_service
global theState = 21
}
Else If location between 3901 and 4992 ; Maine
{
loginname = sales_service
global theState = 20
}
Else If location between 48001 and 49971 ; Michigan
{
loginname = sales_service
global theState = 23
}
Else If location between 55001 and 56763 ; Minnesota
{
loginname = sales_service
global theState = 24
}
Else If location between 55001 and 56763 ; Missouri
{
loginname = sales_service
global theState = 26
}
Else If location between 38601 and 39776 ; Mississippi
{
loginname = sales_service
global theState = 25
}
Else If location between 71233 and 71233 ; Mississippi
{
loginname = sales_service
global theState = 25
}
Else If location between 59001 and 59937 ; Montana
{
loginname = sales_service
global theState = 27
}
Else If location between 27006 and 28909 ; North Carolina
{
loginname = sales_service
global theState = 34
}
Else If location between 58001 and 58856 ; North Dakota
{
loginname = sales_service
global theState = 35
}
Else If location between 68001 and 68118 ; Nebraska
{
loginname = sales_service
global theState = 28
}
Else If location between 68122 and 69367 ; Nebraska
{
loginname = sales_service
global theState = 28
}
Else If location between 3031 and 3897 ; New Hampshire
{
loginname = sales_service
global theState = 30
}
Else If location between 7001 and 8989 ; New Jersey
{
loginname = sales_service
global theState = 31
}
Else If location between 87001 and 88441 ; New Mexico
{
loginname = sales_service
global theState = 32
}
Else If location between 88901 and 89883 ; Nevada
{
loginname = sales_service
global theState = 29
}
Else If location between 6390 and 6390 ; New York (Fishers Is)
{
loginname = sales_service
global theState = 33
}
Else If location between 10001 and 14975 ; New York 
{
loginname = sales_service
global theState = 33
}
Else If location between 43001 and 45999 ; Ohio
{
loginname = sales_service
global theState = 36
}
Else If location between 73001 and 73199 ; Oklahoma
{
loginname = sales_service
global theState = 37
}
Else If location between 73401 and 74966 ; Oklahoma
{
loginname = sales_service
global theState = 37
}
Else If location between 97001 and 97920 ; Oregon
{
loginname = sales_service
global theState = 38
}
Else If location between 15001 and 19640 ; Pennsylvania
{
loginname = sales_service
global theState = 39
}
Else If location between 2801 and 2940 ; Rhode Island
{
loginname = sales_service
global theState = 40
}
Else If location between 29001 and 29948 ; South Carolina
{
loginname = sales_service
global theState = 41
}
Else If location between 57001 and 57799 ; South Dakota
{
loginname = sales_service
global theState = 42
}
Else If location between 37010 and 38589 ; Tennessee
{
loginname = sales_service
global theState = 43
}
Else If location between 73301 and 73301 ; Texas (Austin)
{
loginname = sales_service
global theState = 44
}
Else If location between 75001 and 75501 ; Texas
{
loginname = sales_service
global theState = 44
}
Else If location between 75503 and 79999 ; Texas
{
loginname = sales_service
global theState = 44
}
Else If location between 88510 and 88589 ; Texas (El Paso)
{
loginname = sales_service
global theState = 44
}
Else If location between 84001 and 84784 ; Utah
{
loginname = sales_service
global theState = 45
}
Else If location between 20040 and 20167 ; Virginia
{
loginname = sales_service
global theState = 47
}
Else If location between 22001 and 24658 ; Virginia
{
loginname = sales_service
global theState = 47
}
Else If location between 5001 and 5495 ; Vermont
{
loginname = sales_service
global theState = 46
}
Else If location between 2801 and 2940 ; Rhode Island
{
loginname = sales_service
global theState = 40
}
Else If location between 5601 and 5907 ; Vermont
{
loginname = sales_service
global theState = 46
}
Else If location between 98001 and 99403 ; Washington
{
loginname = sales_service
global theState = 48
}
Else If location between 53001 and 54990 ; Wisconsin
{
loginname = sales_service
global theState = 50
}
Else If location between 24701 and 26886 ; West Virginia
{
loginname = sales_service
global theState = 49
}
Else If location between 82001 and 83128 ; Wyoming
{
loginname = sales_service
global theState = 51
}
Else
{

}

