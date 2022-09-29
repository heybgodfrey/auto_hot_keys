#SingleInstance force
#Include %A_ScriptDir%
INI=%A_scriptdir%\settings.ini

DetectHiddenWindows, On
SetTitleMatchMode, 2
SetTitleMatchMode, Slow

SetKeyDelay, 0

startuplocation = C:\Users\%A_UserName%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\

Menu, Tray, NoStandard ; remove standard Menu items
Menu, Tray, Add ,,
Menu, Tray, Add , Refresh AutoHotkeys, Refresh
Menu, Tray, Add ,,
Menu, Tray, Add , Close AutoHotkeys, CloseAHK
Menu, Tray, Add ,,
Menu, Tray, Add , Update AutoHotkeys, UpdateAHK
Menu, Tray, Add ,,
Menu, Tray, Add , AHK Search Tool, WikiTool
Menu, Tray, Add ,,
Menu, Tray, Add , Helpdesk, Helpdesk



Try
{
IfNotExist, %startuplocation%master - Shortcut.lnk
FileCreateShortcut, C:\Users\%A_UserName%\Desktop\AHK\master.ahk, %startuplocation%master - Shortcut.lnk
}

IfWinNotExist, %A_scriptdir%\usercreated.ahk 
{
    if (skill != "ERROR") || (showName != "ERROR") || (showNick != "ERROR") || (showEmail != "ERROR")
    Run, %A_ScriptDir%\userCreated.ahk, ,UseErrorLevel
}
Return

Refresh:
Msgbox, 4132, Are you sure you want to refresh AutoHotkeys?, Clicking Yes will refresh AutoHotkeys. If you do not want to refresh AutoHotkeys, click No to cancel.
ifMsgbox No
Return
else
Reload, %A_ScriptDir%\master.ahk
Return


WikiTool:
Run, https://inkernet.customink.com/pages/viewpage.action?pageId=1283427021
Return

Helpdesk:
Run, https://customink.zendesk.com/hc/en-us
Return

CloseAHK:
Msgbox, 4132, Are you sure you want to close AutoHotkeys?, Clicking Yes will close AutoHotkeys. You will need to relaunch AutoHotkeys before you can continue using them again.`r`n`r`nIf you do not want to close, click No to cancel.

ifMsgbox No
Return
else
{
IfWinExist, %A_ScriptDir%\setup.ahk
WinKill, %A_ScriptDir%\setup.ahk

IfWinExist, %A_ScriptDir%\service.ahk
WinKill, %A_ScriptDir%\service.ahk

IfWinExist, %A_ScriptDir%\monitor.ahk
WinKill, %A_ScriptDir%\monitor.ahk

IfWinExist, %A_ScriptDir%\usercreated.ahk
WinKill, %A_ScriptDir%\usercreated.ahk

IfWinExist, %A_ScriptDir%\manual.ahk
WinKill, %A_ScriptDir%\manual.ahk

IfWinExist, %A_ScriptDir%\repTimer.ahk
{
WinKill, %A_ScriptDir%\repTimer.ahk
	Loop
	{
	ifWinNotExist, ahk_exe iexplore.exe
	break
	else
	Process, Close, iexplore.exe
	}
}

ExitApp
}
Return


UpdateAHK:
Msgbox, 4132, Are you sure you want to update AutoHotkeys?, Clicking Yes will update AutoHotkeys. If you do not want to update AutoHotkeys, click No to cancel.
ifMsgbox No
Return
else
Run, https://drive.google.com/file/d/1wlqM03FdwIxr1XGu1v6i7qLc8C530wXx/view?usp=sharing
Traytip, Download File/Launch File to Begin Update
Return

/*
end of breadcrumb function, beginning of keyboard shortcuts
*/


 

;AHK SEARCH 
$F12::
Run, https://inkernet.customink.com/pages/viewpage.action?pageId=1283427021
return

;AHK SUBMIT HOTKEY FORM
$F11::
Run, https://docs.google.com/forms/d/e/1FAIpQLSeeYaPYiGvy19ijCVKNQOHCs7B-rZPrIInMrtDrA6uAIYhTFQ/viewform
return

;HELPDESK
$F10::
Run, https://customink.zendesk.com/hc/en-us
return

;AHK SETUP
$F9::
run, %A_ScriptDir%\setup.ahk,, UseErrorLevel
return


;Circuit Feedback
<#F::
>#F::
run, https://circuit.in.customink.com
return

;Condeco
<#C::
>#C::
run, https://customink.condecosoftware.com/EnterpriseLite/#/app/dashboard
return

;Design Lab
!D::
run, https://www.customink.com/ndx/#/ad/gate
return

;Embassy
!E::
run, https://www.customink.com/admin/sales/
return

;Five9 Viewer
!V::
run, https://five9stats.out.customink.com/sales
return

;Help Center
!H::
run, https://www.customink.com/help_center
return

;Spreadsheet Importer Tool
!I::
run, https://order-fulfillment-service.out.customink.com/fulfillment_imports/new
return

;Individual Shipping Template 3.0
!T::
run, https://docs.google.com/spreadsheets/d/1uDpLeai4TuKgOUX_RqAh_rm0vxuFR3TUmCNus9V6Cu0/copy
return

;Internal Catalog auto opt-in
!C::
run, https://www.customink.com/products/internal
return

;Licensing Tool (Greek, University)
!U::
run, https://sites.google.com/customink.com/licensing-tool-operations/home
return

;Logo Use Tool
!L::
run, https://sites.google.com/customink.com/logo-usage-tool/home
return

;Operations Point Chat
!O::
run, https://order-chat.in.customink.com/home
return

;Products Page
!P::
run, https://www.customink.com/products/
return

;Retail Brands T&C Tool
!R::
run, https://inkernet.customink.com/pages/viewpage.action?pageId=1247189986
return

;Sales Schedule
<#S::
>#S::
run, https://docs.google.com/spreadsheets/d/1OZxdFtYPn6G-JuITHxjPDsj1994AISzbH4_Nwp_l4a0/edit#gid=475821428
return

;Singles (No Minimum) Products
!S::
run, https://www.customink.com/products/categories/no-minimum/96
return

;Super Quoter
!Q::
run, https://www.customink.com/admin/quotes
return

;Sales Wiki
!W::
run, https://inkernet.customink.com/pages/viewpage.action?pageId=24347654
return

;Workday
<#W::
>#W::
run, http://workday.customink.com/
return




 



/*
end of keyboard shortcuts
*/

/*
beginning of AHK
*/



::#3m::
copied := Clipboard
clipboard=
(
We have a special type of film you can use for your design that we call our "3M reflective film". The film is mainly used to reflect vehicle headlights for safety reasons, but it can also be used to add a reflective look to your design in general!  

Since this film is only available through special pricing, you'd need to contact us to price and place your order for you. Does this sound like a decoration method that you'd be interested in using for your design?
)
clipwait
send ^v
sleep 333
clipboard := copied
return

::#wow::
copied := Clipboard
clipboard=
(
Thank you for providing your feedback! I'm so glad you had a WOW experience. We'd love for you to join our Ink of the Week!

For a chance to win a $100 voucher, submit a group photo highlighting your new swag and be sure to check out other groups who have entered by following this link:

http://customink.com/photos/new

We look forward to helping you with your next order!
)
clipwait
send ^v
sleep 333
clipboard := copied
return

::#ap::
copied := Clipboard
clipboard=
(
If you're looking to reorder your design but need less than 6 items, we offer a special type of order called an Additional Piece order. With this type of order, we'll match the per item price from your previous order, and can apply that pricing up to 5 items total in your new order. There will also a $20 setup charge added to the cost since we're bypassing the 6 item minimum. This setup fee will ensure that these additional items print identically to the items from your original order.

Would you like me to help get that order placed for you now?
)
clipwait
send ^v
sleep 333
clipboard := copied
return



::#turn::
copied := Clipboard
clipboard=
(
For our delivery options we offer:

- Free Standard delivery: 14 days after payment is received for your order

- Quicker Turn delivery: 9 - 11 days after payment is received for your order

- Rush delivery: 6 - 8 days after payment is received for your order

- Super Rush delivery: 3 business days after payment is received for your order
)
clipwait
send ^v
sleep 333
clipboard := copied
return



::#turncost::
copied := Clipboard
clipboard=
(
For our delivery options we offer:

- Free Standard delivery (12 - 14 days)

- Quicker Turn delivery with 5`% added to the order total (9 - 11 days)

- Rush delivery with 10`% added to the order total (6 - 8 days)

- Super Rush delivery with 25`% added to the order total (3 business days)

`*these `% apply to Bulk orders. No Minimum orders are priced at a flat $9.95 (or 10`% Rush), and a flat $15.95 (or 25`% Super Rush) - whichever amount is higher.
)
clipwait
send ^v
sleep 333
clipboard := copied
return




::#awrquestion::
::#awrquestions::
copied := Clipboard
clipboard=
(
1. What is the intended use for the artwork? 

2. What file type would you like your artwork in?

3. If the artwork is released, we ask that you do not use it to print with one of our competitors, is that okay?
)
clipwait
send ^v
sleep 333
clipboard := copied
return



::#awr::
copied := Clipboard
clipboard=
(
If you're looking to receive a copy of any print ready art file from your order, we'll need to submit an Art Release request with our art team.

For some added context - the reason for this is that some of the fonts and designs that are used in our Design Lab are licensed through partners we work with, and are not able to be released to our customers. If no licensed designs or fonts are found, we'll be able to release the print ready file as is. Otherwise, we'll only be able to release the non-licensed elements.

If you'd like I can put in that request for you now?
)
clipwait
send ^v
sleep 333
clipboard := copied
return

::#partner::
copied := Clipboard
clipboard=
(
I'd be happy to connect you to our Help Center where you can look through the different types of Partnerships that we offer, and submit an official inquiry. This page will cover Vendor, Licensing, Artwork, Affiliate Partnerships and more. There's even a spot to submit a General inquiry if you don't fall within any of these categories.

Click this link below to read more about it:
http://www.customink.com/about/partners
)
clipwait
send ^v
sleep 333
clipboard := copied
return


::#holiday::
copied := Clipboard
clipboard=
(
Currently we don't offer unique deals or promotions for the holidays. Instead, we make sure to curate our pricing, perks, products and print services to cover a wide range of budget needs year round! I'm also here to work with you to find the best options for your order needs when you're ready to move forward with pricing.

You can also take advantage of a small voucher we offer each month, which can be found directly on our website here: www.customink.com/voucher
)
clipwait
send ^v
sleep 333
clipboard := copied
return


::#bulkquote::
copied := Clipboard
clipboard=
(
======================
%copied%
======================
**Extended sizes are available in select styles at an additional cost. (Not all products are available in the same size range).

Your Custom Ink order comes with:

*Free artistic adjustments to alignment, art, or text for the best look possible
*Free proof email on most orders
*Free shipping with a guaranteed delivery date
*A quality and money-back guarantee
======================
)
clipwait
send ^v
sleep 333
clipboard := copied
return

::#canada::
copied := Clipboard
clipboard=
(
We have an entire section of products that are available for delivery in Canada, as long as you're ordering in a bulk quantity of 6 or more. We print and ship these items directly in Canada, so you won't be charged any duties or taxes at checkout.

If you'd like to see all of the products we offer that are available in Canada click on this link below:

https://www.customink.com/products/canada-products/64
)
clipwait
send ^v
sleep 333
clipboard := copied
return

::#jobs::
copied := Clipboard
clipboard=
(
If you're interested in looking through Career opportunities at Custom Ink, you can always check our job postings directly on our website here: https://www.customink.com/about/jobs
)
clipwait
send ^v
sleep 333
clipboard := copied
return


::#bulkperks::
copied := Clipboard
clipboard=
(
Your Custom Ink order comes with:

*Free artistic adjustments to alignment, art, or text for the best look possible
*Free proof email on most orders
*Free shipping with a guaranteed delivery date
*A quality and money-back guarantee
)
clipwait
send ^v
sleep 333
clipboard := copied
return



::#script::
::#transcript::
copied := Clipboard
clipboard=
(
You can click the three dots at the top and choose "Print Transcript", which will bring up the printer ready page where you can copy or save the transcript.
)
clipwait
send ^v
sleep 333
clipboard := copied
return

::#chatclose::
copied := Clipboard
clipboard=
(
I wanted to let you know that we're closing soon, and while I have a few minutes left to help you out tonight, I'd love to try and move forward to finish up any needs that you have.
 
Otherwise I could follow up with you by email and we can continue where we left off tomorrow? Or, I can put in a request to have one of our phone team members call you tomorrow instead. 

What would work best for you?
)
clipwait
send ^v
sleep 333
clipboard := copied
return

::#collegeno::
copied := Clipboard
clipboard=
(
Your design includes collegiate marks from a University that we aren't currently licensed with. Universities require a licensing agreement with a vendor in order to print their names, mascots and other college related content. If you'd like to print your design as is, I recommend going back to the University's licensing department to find out which vendor they use to print their marks.
)
clipwait
send ^v
sleep 333
clipboard := copied
return



::#content::
copied := Clipboard
clipboard=
(
Once an order is placed, all designs go through our review team to ensure we do not print any protected material without permission. If we have questions regarding your order, our team will be in contact with you to help find the best way to adjust your design.
)
clipwait
send ^v
sleep 333
clipboard := copied
return

::#contentstand::
copied := Clipboard
clipboard=
(
Custom Ink believes in the power of custom apparel and accessories to bring groups and communities together. We want to help our customers create products with designs that are meaningful and unifying, while also recognizing our customers have diverse viewpoints and perspectives, which are reflected in the designs they create.

We use the following standards to balance our customers' own goals and freedom of expression with the potential impact on others and the general public. We take our role as an expression platform seriously and strive to fulfill it responsibly.

Click this link to read more about our Community Principles in detail: https://www.customink.com/help_center/content-standards
)
clipwait
send ^v
sleep 333
clipboard := copied
return


::#covid::
copied := Clipboard
clipboard=
(
We're committed to providing a safe experience for our team members, for our customers, and for our communities. We're taking COVID-19 very seriously, and we are doing everything that we can to minimize the risks to individual and public health. We are and will continue to monitor and follow federal and state safety guidelines.
)
clipwait
send ^v
sleep 333
clipboard := copied
return


::#account::
copied := Clipboard
clipboard=
(
As soon as you save a design under your email address an account will be set up for you. You won't be prompted to create a password until you set up a Group Order Form or Fundraiser, or need to log into "Your Account" from our homepage. 

You can create a password at any time from "Your Account", by clicking "Sign up" at the bottom of the Login screen.
)
clipwait
send ^v
sleep 333
clipboard := copied
return


::#designemail::
copied := Clipboard
clipboard=
(
Thank you for sending in your email!

Here's the information that I'll need to create your design:

1. Do you already have a product/product color in mind from our Products selection here?
https://www.customink.com/products

2. How many items are you thinking of ordering? Do you already have sizes?

3. Any additional design information (pictures, text, colors) you'd like incorporated onto your product? If you have any artwork files please attach those and send them over as well.

4. Is there a specific date you need your order by?

5. What is a delivery zip code you would be delivering to?

Please reply back to this email when you're ready to move forward. Once I hear back from you, I can provide you with a design mock-up and a price quote. If everything looks good, I can help place your order for you and send over a secure payment link to complete payment.

Thanks again for choosing Custom Ink. I look forward to hearing from you soon!
)
clipwait
send ^v
sleep 333
clipboard := copied
return


::#cs::
copied := Clipboard
clipboard=
(
We offer a service that allows you to take advantage of our Design Services team, a special team of graphic artists that can help bring your design ideas to life! There are two options to choose from based on the complexity of your design. If you're ready we can begin discussing which option you think would work best for your design needs?

You can also read more about our Design Services here: https://www.customink.com/ink/customcreations
)
clipwait
send ^v
sleep 333
clipboard := copied
return



::#csemail::
copied := Clipboard
clipboard=
(
Our Design Services team is a special team of graphic artists that can help bring your design ideas to life! Whether you're starting out with an idea, concept drawings, or designs saved in our Design Lab, using our extensive artwork and font library, or working within a budget large or small, the Custom Ink art team is here to partner with you to create an amazing design you can be proud of.

To get your request submitted, I'll need to get some more information from you to understand exactly what it is that you're looking for. The more details that you're able to provide, the more the art team will have to work with!


1. Your deadline - we recommend having at least 2 weeks to work with

2. Your shipping zip code and budget (if any)

3. Desired product and color, as well as order quantity. Please indicate smallest and largest sizes for apparel

4. Describe in detail what you'd like your design to look like: Imagery you have in mind, the artistic style you'd like, colors you'd like included (or not), and text you'd like to accompany the design

5. Send us design inspiration images or examples of what you'd like if you have them!

6. Your phone number in case we need to reach you for any additional details

Once I receive your answers to these questions, all we'll need to do is collect payment and submit the request. From there the art team can get started working on your design!

You can take a look at our interactive Design Lookbook here: https://indd.adobe.com/view/fdff8a80-cd44-4fe9-a565-27d464285dc8
)
clipwait
send ^v
sleep 333
clipboard := copied
return



::#csquestions::
copied := Clipboard
clipboard=
(
Here is the information that I'll need to get your Custom Design request started:

1. Your deadline - we recommend having at least 2 weeks to work with

2. Your shipping zip code and budget (if any)

3. Desired product and color, as well as order quantity. Please indicate smallest and largest sizes for apparel

4. Describe in detail what you'd like your design to look like: imagery you have in mind, the artistic style you'd like, colors you'd like included (or not), and text you'd like to accompany the design

5. Send us design inspiration images or examples of what you'd like if you have them!

6. Your phone number in case we need to reach you for any additional details
)
clipwait
send ^v
sleep 333
clipboard := copied
return

::#guarantee::
copied := Clipboard
clipboard=
(
Customized goods are generally not accompanied by guarantees, but we're committed to changing that. We deliver high-quality products - products that look just like what you created on our site, and we do so on time.

If the custom products you receive differ materially from what you created at CustomInk.com, if the goods are otherwise flawed, or if your order arrives later than promised, then you may return the custom goods for a full refund; within 15 days of receiving your custom order. All we ask is that you notify Custom Ink before returning any goods to ensure that your return is handled quickly and accurately.
)
clipwait
send ^v
sleep 333
clipboard := copied
return

::#delay::
copied := Clipboard
clipboard=
(
I apologize for the delayed response. We're a bit backed up with our emails and are working to respond to our customers as soon as we can. If you have a time sensitive matter, please consider giving us a call at 1-800-293-4232 or contacting us on live chat for immediate assistance.  If you'd prefer to keep working through email, I'm happy to help take care of anything that you need!
)
clipwait
send ^v
sleep 333
clipboard := copied
return


::#deleteact::
copied := Clipboard
clipboard=
(
Currently we don't offer the option to completely delete your account in our system. Your designs can be deleted individually as long as they haven't been used for an Order, Group Order Form, or Fundraiser. To delete your designs, go to our homepage (customink.com), and under "Your Account" choose "Your Designs" from the menu. At the top right corner of each design a trash can icon will be highlighted if the design is able to be deleted. Clicking that icon will delete your design.
)
clipwait
send ^v
sleep 333
clipboard := copied
return


::#discon::
copied := Clipboard
clipboard=
(
It looks like the current product that you've chosen has been discontinued, I apologize. The good news is, we offer a wide variety of options in our product selection. If you'd like, I can take a look at what we have available and see if I'm able to find you something similar?
)
clipwait
send ^v
sleep 333
clipboard := copied
return



::#address::
copied := Clipboard
clipboard=
(
Custom Ink
2910 District Ave 3rd Floor
Fairfax, VA 22031
)
clipwait
send ^v
sleep 333
clipboard := copied
return



::#disney::
copied := Clipboard
clipboard=
(
Disney has some very specific requirements that we have to follow in order to print designs that reference their Park and Cruise names, as well as some other details that need to be included. Here's a list of those below:

- Park or Cruise names must be their complete names (i.e. Walt Disney World vs Disneyworld)

- If a Park or Cruise name is used, it needs to be personalized with a group or family name, including a preposition (i.e. Smith family vacation at Disneyland)

- We're unable to print any official Disney Characters, or Character names, or any images that could be similar to those (i.e. 3 circles that represent Mickey Mouse ears)

- The Disney "font" cannot be used to print the Park or Cruise names

With that being said, we print many different Disney themed designs each year. I'd be happy to help create you a design that is Disney inspired if you'd like?
)
clipwait
send ^v
sleep 333
clipboard := copied
return

::#donate::
copied := Clipboard
clipboard=
(
We receive a high number of donation requests each day and we do our best to review each one. I'd be happy to send your request to our Community Outreach Team and see if we can help in any way. If we're able to someone will reach out to you and let you know. Would you like me to get that request submitted for you now?
)
clipwait
send ^v
sleep 333
clipboard := copied
return


::#embsimple::
copied := Clipboard
clipboard=
(
When working with embroidery, a lot of times it's going to be necessary to adjust and simplify the artwork in order to capture the design perfectly using thread. This means that we need to potentially remove the smaller details, size up the design slightly, swap out for embroidery friendly fonts, and really focus on the main elements that highlight the artwork's overall look and feel.
)
clipwait
send ^v
sleep 333
clipboard := copied
return

::#gof::
copied := Clipboard
clipboard=
(
We offer a Group Order Form that allows you to coordinate with your group to place an online order. You can customize it with different shipping options, select how it handles payment, offer complementary products, easily view your group's activity, and much more. It's completely free to set up and use, and is a great way to keep your group order organized.
)
clipwait
send ^v
sleep 333
clipboard := copied
return



::#extendhood::
::#extendedhood::
copied := Clipboard
clipboard=
(
Add:
$3 more for XXL
$4 more for XXXL
etc. to the per item cost for extended sizes
)
clipwait
send ^v
sleep 333
clipboard := copied
return



::#extendshirt::
::#extendedshirt::
copied := Clipboard
clipboard=
(
Add:
$2.50 more for XXL
$3.50 more for XXXL
etc. to the per item cost for extended sizes
)
clipwait
send ^v
sleep 333
clipboard := copied
return



::#filetype::
::#filetypes::
copied := Clipboard
clipboard=
(
Currently you're able to upload these types of files in our Design Lab:

JPG, JPEG, PNG, GIF, BMP, PDF, AI, PSD, EPS
)
clipwait
send ^v
sleep 333
clipboard := copied
return



::#discount::
copied := Clipboard
clipboard=
(
We don't currently offer a flat discount. Instead, we're always here to help review your order details, and make recommendations or changes to find something that aligns more with the budget that you're looking to stay within.

We also have a $5 off voucher for orders reaching a $100 total that we offer to our customers each month. You can find that voucher at: customink.com/voucher
)
clipwait
send ^v
sleep 333
clipboard := copied
return



::#foil::
copied := Clipboard
clipboard=
(
We have a special type of film you can use for your design called a "Foil Transfer", which we offer in 7 awesome colors.

Since Foil is an option that's only available through our special pricing, you'll need to contact us to work up that pricing and place your bulk order for you. There are some limitations to the product types and fabrics that Foil can be applied on, which I can go over with you now if you'd like?
)
clipwait
send ^v
sleep 333
clipboard := copied
return



::#fund::
copied := Clipboard
clipboard=
(
We offer an amazing community platform called Custom Ink Fundraising that allows you to raise money and awareness for your cause by selling custom apparel that you design in our Design Lab! It's completely free to launch, and as long as you reach your individual print minimum to cover the order cost, your Fundraiser will successfully ship at the end of your Campaign. There's no limit to how much money you can raise!

- You can read more about it here on our Fundraising page:
https://www.customink.com/fundraising

- We also offer a very helpful Fundraising FAQ in our Help Center: https://www.customink.com/ink/fundraising/frequently-asked-questions
)
clipwait
send ^v
sleep 333
clipboard := copied
return



::#fundtransone::
copied := Clipboard
clipboard=
(
We actually have a dedicated team of Fundraising Advisors who work with all of our Fundraising customers. I'll send you to them now, and they'll be able to assist you with this quickly! One moment please.
)
clipwait
send ^v
sleep 333
clipboard := copied
return



::#fundtranstwo::
copied := Clipboard
clipboard=
(
We actually have a dedicated team of Fundraising Advisors who work with all of our Fundraising customers. It looks like they are currently unavailable in our chat system, but if you'd like I can get you the number to call them now, or if you'd prefer a call back within a business day or two I can submit that request instead?
)
clipwait
send ^v
sleep 333
clipboard := copied
return



::#glitter::
copied := Clipboard
clipboard=
(
We have a special type of ink called Glitter Ink that we offer in a Gold or Silver color, or as a Crystalina glitter overlay on top of all other standard ink colors.

Since Glitter Ink is an option that's only available through our special pricing, you'll need to contact us to work up that pricing and place your bulk order for you. There are some limitations to the product types and fabrics that Glitter Ink can print on, which I can go over with you now if you'd like?
)
clipwait
send ^v
sleep 333
clipboard := copied
return



::#glow::
copied := Clipboard
clipboard=
(
We offer Glow in the Dark ink as a special type of ink available for bulk orders.

The ink itself will appear "off-white" in the light, "off-white" with a green tint in the dark, and begin to glow after the light particles charge. Since Glow in the Dark ink is an option that's only available through our special pricing, you'll need to contact us to work up that pricing and place your order for you.
)
clipwait
send ^v
sleep 333
clipboard := copied
return



::#gofdesign::
copied := Clipboard
clipboard=
(
If you've already collected payment in the Group Order Form, or making adjustments will affect the pricing, we're not able to make changes to the design for you before the full order is placed. Instead, we ask that you save a new design in your account with the changes, and then contact us when you're ready to place your order. Once we get that order placed, we'll be able to swap out that design for you. 

Or, if you're not able to save a new design in your account, when we place your order we can also just leave very clear notes to our art team about any changes that you'd need.
)
clipwait
send ^v
sleep 333
clipboard := copied
return



::#goalchange::
::#changegoal::
copied := Clipboard
clipboard=
(
We can change the Group Order Form Goal, however since payment has been collected based on your original Goal, there's most likely going to be a balance owed or additional credit remaining when the order is placed.

Here's the reason why. Lowering the Goal from its original number will cause each item's cost to increase. Since the lower cost was collected on each item in the order form already, there will be a balance owed for each of those items at checkout which you as the Organizer will need to cover. Alternatively, increasing the Goal from the original amount will cause a decrease in each item's cost, ultimately resulting in a credit or refund.

Based on this information, would you like me to adjust your Goal?
)
clipwait
send ^v
sleep 333
clipboard := copied
return



::#gofgoal::
copied := Clipboard
clipboard=
(
When you setup your Group Order Form it will ask you to enter a Goal. This Goal determines how many items you expect to collect, and also sets the per item price if you choose to collect payment.

When payment is collected, if you exceed your Goal any additional funds will go back to you (the Organizer) in a refund check; as long as it reaches $20 or more. If $20 isn't reached, those additional funds can be used towards goods and services at the time you're placing your order. Please keep in mind - we're not able to keep the additional funds as a "credit" in your account. 

If payment is collected and you do not reach your Goal there will be an open balance which you (the Organizer) will need to cover to complete full payment for the order. You're also welcome to cancel the order form at that time if you'd prefer.
)
clipwait
send ^v
sleep 333
clipboard := copied
return



::#gofink::
copied := Clipboard
clipboard=
(
While our Group Order Form's not currently set up to display various design colors within the same form, we do have some options that can help:

1. We can set up the order form with just one of the design colors on display. Then when you're ready to complete the order, contact us and we can leave detailed notes explaining which products receive which design color and get the order placed for you. 

2. We can set up a separate order form for each version of the design color, so your participants can see the designs in the colors they would print. If we go with this option you'll need to provide links to each order form for your group, so they can add or purchase their item in the correct one. You'll also need to contact us when you're ready to place the order forms so we can combine them back into a single order for you. 

Which of these options would you like to go with?
)
clipwait
send ^v
sleep 333
clipboard := copied
return



::#gofhcp::
copied := Clipboard
clipboard=
(
When the Group Order Form was originally set up, the Goal amount defaulted to the quantity minimum required to place an order on a high color design. Since the order form is set up to collect payment with individual shipping, there's no way to lower that Goal below the minimum or adjust the color count of the design in the form itself.

In this unique case, there are only 2 options that we can move forward with. You would need at least 48 items collected in the Group Order Form to place it, or we would have to cancel the Group Order Form and refund each participant. Once that is canceled, a new Group Order Form can be set up to accommodate the changes needed to fulfill the group order.

Which of these options do you think would work best for you?
)
clipwait
send ^v
sleep 333
clipboard := copied
return



::#goftrick::
copied := Clipboard
clipboard=
(
The Group Order Form is limited to most print locations available in the Design Lab, and can only be set up on a Standard delivery turnaround. We do however have a way to create a cost "mark up" on each item, to reflect the extra cost required for more unique print and shipping needs. We can achieve this by setting the Goal lower than your original Goal amount.

With that lowered Goal, the additional cost "mark up" required will be added to each item in the order form itself. Please remember, to have no remaining balance left at the time we place your order, you must meet or exceed your original Goal and not the lowered Goal that was set to mark up the cost.
)
clipwait
send ^v
sleep 333
clipboard := copied
return



::#goftransfer::
copied := Clipboard
clipboard=
(
I can definitely transfer your Group Order Form to a different account. To do this, the new account will need to have a password set up. If you can provide the email address, I can confirm if there has been a password set up now. It's important to note, after the Group Order Form is transferred, the original order form link will be voided and a new order form link will be created.
)
clipwait
send ^v
sleep 333
clipboard := copied
return



::#gofpers::
copied := Clipboard
clipboard=
(
Adding personalized names and numbers to your product is something that we offer when using the Group Order Form, but there are some limitations to be aware of. The order can only ship to one location vs individual locations, and there can only be one style and color of a product displayed in the Group Order Form itself.

If you'd like more than one style and product color for your order, a Group Order Form will need to be set up for each one that you'd like to offer. When the order is ready to be placed, contact us again and we'll combine all of your Group Order Forms together into a single order.
)
clipwait
send ^v
sleep 333
clipboard := copied
return



::#tones::
::#halftones::
copied := Clipboard
clipboard=
(
Halftone printing is a one-color process that uses a series of dots varying in size or spacing, which we combine together to form a gradient of that color. Those gradients then help to form the final image!

Here's a link from our Help Center that shows an example of halftone printing: https://www.customink.com/help_center/what-is-halftone-printing
)
clipwait
send ^v
sleep 333
clipboard := copied
return



::#hcpmin::
copied := Clipboard
clipboard=
(
I noticed that your design has 5 or more ink colors in it. Anything that has this number of ink colors in the design is what we call a "High Color Print". Not all of the products we offer are able to print high color designs due to how they're set up in production.

If you'd like to stay on the current product, you'll need to either increase the amount of items you're ordering to at least 48, or you'll need to lower the amount of ink colors in the design to 4 or less. 

If you'd like to keep the design as is but use a different product, we have a selection of products that are setup for high color/photo quality digital printing in our "No Minimum" product offering. Here's the link to those items if you'd like to look through them: 

https://www.customink.com/products/categories/no-minimum/96
)
clipwait
send ^v
sleep 333
clipboard := copied
return



::#hood::
copied := Clipboard
clipboard=
(
Currently the Design Lab isn't set up to show a mockup design on the hood, but it is an available print location that we offer.

If you'd like to add a design to the hood we ask that you add it to the front of the hoodie for now. This will act as a placeholder. Then, when you're ready for pricing or to get your order placed, you'll want to contact us to do that for you. That way we can leave order notes explaining all of the specific print areas that you need.

Finally, a few days after payment our art team will send you a Picture Proof email. This is where you'll see your design on all of the print areas you've requested, including the hood location.

)
clipwait
send ^v
sleep 333
clipboard := copied
return



::#iscost::
copied := Clipboard
clipboard=
(
The cost for individual shipping is a flat $6.95 per US location, and $16.95 per International location. You're able to ship as many items to each location for this flat shipping rate.
)
clipwait
send ^v
sleep 333
clipboard := copied
return



::#isturn::
copied := Clipboard
clipboard=
(
Because the items will be individually shipped, we're not able to guarantee a delivery date for these types of orders. Generally our individual shipping takes between 2 to 4 weeks, depending on where each item is being shipped to.
)
clipwait
send ^v
sleep 333
clipboard := copied
return



::#islimit::
copied := Clipboard
clipboard=
(
When individually shipping your items there are some limitations that determine what can be done within the order itself. For example, we can't include personalized names or numbers in the order. We also can't provide any expedited shipping options.

There may be some other limitations when shipping items individually more specific to your current order, and if you'd like I can go over those with you as well. 
)
clipwait
send ^v
sleep 333
clipboard := copied
return



::#infobulk::
copied := Clipboard
clipboard=
(
After you complete payment for your order you'll receive a confirmation email. Please add service@customInk.com to your email contacts to make sure that it doesn't land in your spam folder.

For most bulk orders, our art team will send a Final Picture Proof email that will allow you to review the print ready artwork, sizes, and other order details. This proof may or may not require your approval prior to printing the order, so please keep an eye out for its arrival.
)
clipwait
send ^v
sleep 333
clipboard := copied
return



::#infosingles::
copied := Clipboard
clipboard=
(
After you complete payment for your order you'll receive a confirmation email. Please add service@customInk.com to your email contacts to make sure that it doesn't land in your spam folder.
)
clipwait
send ^v
sleep 333
clipboard := copied
return

::#accountemail::
copied := Clipboard
clipboard=
(
Looking through your account, I didn't see that any designs were saved using this email address. If you have another email address that you're saving your designs under, please reply back with that information. That way, I'll be able to locate your designs, and link both of the accounts together.

After that, I can help with any order needs that you have.

Thank you again for contacting Custom Ink, I'm looking forward to assisting you!
)
clipwait
send ^v
sleep 333
clipboard := copied
return



::#checkinfo::
copied := Clipboard
clipboard=
(
When sending your check payment please use standard mail and send it to this address:

Customink LLC
PO BOX 719439
Philadelphia, PA 19171-9439
Attn: Accounts Receivable

Make sure that the check includes the following information:

- Payable to Custom Ink
- Drawn on a US issuing bank and payable in US Dollars
- A valid nine-digit bank routing number (ABA number) and account number
- Required signatures
- Custom Ink order number (added to the memo section of the check)
)
clipwait
send ^v
sleep 333
clipboard := copied
return



::#inkchange::
copied := Clipboard
clipboard=
(
We offer a service called an Ink Change that allows you to change the ink colors of your design to print on selected products in your order. The cost for an ink change is $20 each time the color changes, per print location (front/back/sleeve etc). However, you will receive one free ink change with every $400 reached in your order total.
)
clipwait
send ^v
sleep 333
clipboard := copied
return



::#intercheck::
copied := Clipboard
clipboard=
(
Here's how to get to International checkout from the Design Lab:

Click Order Options (or Add to Cart) - Add your sizes and click Continue - Choose Outside the US or Canada (which may be bypassed if the system recognizes your IP address and redirects you to the international page) - Click Buy Now (price quote screen) - Continue (save your design screen) - You will arrive at the International checkout page.
)
clipwait
send ^v
sleep 333
clipboard := copied
return

::#interinfo::
copied := Clipboard
clipboard=
(
1. We must always have an accurate phone number for the recipient of the package. If the phone number isn't accurate, the package will most likely be held up at Customs and eventually be returned to sender.

2. It's very important that the recipient's shipping address is accurate, and matches the exact format that the international Post Office uses when delivering packages to that address.

3. Duties and taxes will not be charged when placing your order with us. All custom charges will be the responsibility of the package's recipient when it arrives at their local international Post Office or delivery location.

If you know the countries you'd like to ship an order to, you're welcome to list those out here. I can check to see if they're on our approved list for International locations for delivery.
)
clipwait
send ^v
sleep 333
clipboard := copied
return

::#inter::
copied := Clipboard
clipboard=
(
We offer the ability to ship orders internationally to most countries around the world. These types of shipments can take anywhere to a month or more to deliver to their final destination depending on the specific location they're going to. When shipping internationally there are a few key details to be aware of, and some information that's required before we can place the order. If you'd like I can go over that with you now?
)
clipwait
send ^v
sleep 333
clipboard := copied
return



::#kit::
copied := Clipboard
clipboard=
(
We offer a service called "kitting" that allows you to combine multiple items together to deliver inside of one package, instead of each item delivering in its own packaging separately. Taking advantage of our "kit" process creates an awesome and unique experience for your group when they receive their products!

There's special pricing for kitted items, and a few limitations that go along with our kitting service. Would you like me to go over that pricing and those details with you now?
)
clipwait
send ^v
sleep 333
clipboard := copied
return



::#kitlimit::
copied := Clipboard
clipboard=
(
- Kitted items generally deliver on a 3 to 4 week turnaround, but can take longer depending on our current order volume.

- A guaranteed delivery date cannot be offered for the kits. 

- Each kit within an order must contain all of the products offered.

- If shipping Internationally, the package's recipient will be responsible for any charges once it arrives at the International Post Office or its final delivery location.
)
clipwait
send ^v
sleep 333
clipboard := copied
return



::#kitprice::
copied := Clipboard
clipboard=
(
Here's a general breakdown of how we price our kitting service. These costs will be added on top of the cost for the product and print:

- $0.60 will be added per item in each kit, and a $0.48 cost will be added per kit (box)

- Shipping will be a flat $12 added per box for Domestic addresses, and $16.95 added per box for International addresses
)
clipwait
send ^v
sleep 333
clipboard := copied
return


::#lowres::
copied := Clipboard
clipboard=
(
I noticed that the artwork file you've uploaded is below the minimum resolution requirement we need to print a high quality design. We always want to ensure we're using the highest resolution artwork possible when we print your order. Do you happen to have another higher resolution artwork file that you can send us? 

If not, let me know and we can discuss other options for a redesign or redraw.
)
clipwait
send ^v
sleep 333
clipboard := copied
return


::#metallic::
copied := Clipboard
clipboard=
(
We offer both Silver and Gold Metallic ink as special inks we can use for your design, as long as you're placing an order of 6 or more items. This type of special ink come at no extra cost. To print with Metallic ink, we recommend having us place your order for you so we can leave notes about which color you'd like to use.
)
clipwait
send ^v
sleep 333
clipboard := copied
return

::#mixmatch::
copied := Clipboard
clipboard=
(
You can combine different product styles, colors, and sizes together as long as the design and print method is the same, and the design fits on all products in the order.
)
clipwait
send ^v
sleep 333
clipboard := copied
return



::#multi::
copied := Clipboard
clipboard=
(
We offer a service called a "Multiple Location Print" that allows you to pay for a second design screen. By using this service, the designs are guaranteed to print at the exact location they're placed on the product, regardless of the sizes in your order. These separate screens allow each design to print at the same distance from the hem or seam, instead of a varying distance as the product becomes wider or longer.
)
clipwait
send ^v
sleep 333
clipboard := copied
return



::#neon::
copied := Clipboard
clipboard=
(
We have a special type of ink called Neon Ink that we offer in 7 different colors.

The Neon Ink will appear much brighter and more vibrant than stock ink colors, and can really make your design stand out! The pricing for this special ink adds $20 to the order cost, and you'll receive one free Neon Ink each time you reach $400 in your order total. There are some limitations to the product types and fabrics that Neon ink can print on, which I can go over with you now if you'd like?
)
clipwait
send ^v
sleep 333
clipboard := copied
return



::#nomin::
copied := Clipboard
clipboard=
(
We have a selection of products that are available without having to meet a minimum quantity for your order. 

Click on this link below to take a look at what we have to offer. Make sure that "ordering fewer than 6?" is selected to see what product colors are available.

https://www.customink.com/products/categories/no-minimum/96 
)
clipwait
send ^v
sleep 333
clipboard := copied
return



::#notvoucher::
copied := Clipboard
clipboard=
(
It doesn't look like the voucher code that you provided is valid. Generally, vouchers offered on coupon sites or from other sources will have already expired, or were not valid voucher codes issued from Custom Ink. Any voucher that we offer will come from our Marketing team through emails and catalogs, a personal referral, or will be offered on our website directly.
)
clipwait
send ^v
sleep 333
clipboard := copied
return

::#offsite::
copied := Clipboard
clipboard=
(
We're able to source some products that are not currently offered on our website as long as they're available through our supplier network. If you'd like me to check for a product's availability, I'll need to ask you a few questions to see if I'm able to locate what you're looking for.

Would you like me to ask those questions now?
)
clipwait
send ^v
sleep 333
clipboard := copied
return

::#offsitequestion::
::#offsitequestions::
copied := Clipboard
clipboard=
(
1. What is the brand name of the product that you're looking for?

2. Do you happen to have the product's style number?

3. What color or colors of the product would you be interested in?

4. What would be the range of sizes that you'd need?
)
clipwait
send ^v
sleep 333
clipboard := copied
return

::#offsitetemp::
copied := Clipboard
clipboard=
(
a Color:
b Style:
c Supplier:
d BC:
e Stock:
f Substitute:
g Margin:
h Confirmed by LA:
i Link:
)
clipwait
send ^v
sleep 333
clipboard := copied
return

::#onlinestore::
::#onlinestores::
copied := Clipboard
clipboard=
(
We have an Online Store Platform that helps you feature and offer your custom gear directly on your own online storefront! An Online Store is a great way for your teams and your community to show their pride, and purchase customized products that you've curated specifically for their needs.

Custom Ink handles everything from the set-up and design, to payment, fulfillment, and distribution. We'll also handle customer service for your customers. This means that anyone who buys from the store deals directly with us for everything from order placement and payment, to changes and returns.

If you're looking to learn more please fill out this form below and one of our team members will reach out soon!

https://docs.google.com/forms/d/e/1FAIpQLSesXx2zO0uwFIj15rg0ghRn7RgyYV_wC_lDqpr-G3_4v1-Q8g/viewform 
)
clipwait
send ^v
sleep 333
clipboard := copied
return

::#stock::
::#oos::
copied := Clipboard
clipboard=
(
We've been experiencing out of stock issues lately due to industry-wide manufacturing delays created by increasing supply chain interruptions. While our stock levels have improved, we're still seeing gaps in the availability of some of our products.

Currently we aren't able to set an ETA for when a specific product will be back in stock, however we have taken steps to help mitigate the interruption to our customers as much as possible. One of those steps is an automation of stock updates directly on our website soon after the product becomes available. We recommend visiting the website periodically to check for stock improvements, or allowing us to find you a close alternative instead.

Would you like me to check for a possible alternative now?
)
clipwait
send ^v
sleep 333
clipboard := copied
return

::#orderinfo::
copied := Clipboard
clipboard=
(
Here's the information I'll need from you to place your order:

- Your Contact name/Phone number
- Shipping name/Phone number
- Shipping address (including any apt #, suite, building # etc)
- Is this a business or residential address?
- If it's a business, what is the business name?
- How did you hear about Custom Ink?
)
clipwait
send ^v
sleep 333
clipboard := copied
return

::#otherleg::
copied := Clipboard
clipboard=
(	
Currently the Design Lab isn't set up to show a mockup design on the other leg, but it is an available print location that we offer.

If you'd like to print a design on the other leg, add it to the leg that's available for now. This will act as a placeholder. Then, when you're ready for pricing or to get your order placed, you'll want to contact us to do that for you. That way we can leave order notes explaining all of the specific print areas that you need.

Finally, a few days after payment our art team will send you a Picture Proof email. This is where you'll see your design on all of the print areas you've requested, including the other leg.
)
clipwait
send ^v
sleep 333
clipboard := copied
return

::#constraint::
::#constraints::
copied := Clipboard
clipboard=
(
I noticed after reviewing your design that the design size won't fit on all of the product sizes for your order. We have a few options that we can move forward with, depending on what you think would best work for your needs:

1. We can scale the design down to fit on the smallest product size, printing that same scaled down version on all other products as well.

2. We also offer a paid service that allows you to create a resized version of your design along with the original, that will print proportionally to fit on any range of product sizes you choose. We call this our Various Sized Screen service.

Would you like to scale down your design for all products, or learn more about the pricing for the Various Sized Screens?
)
clipwait
send ^v
sleep 333
clipboard := copied
return

::#pad::
copied := Clipboard
clipboard=
(
Any sizes marked as "PAD" are just extra items that we send to our printing facility at no extra cost to you. We add these in just in case something comes up during the printing process, like imperfections in the product for example. This allows us to quickly replace those items and keep your order on track for delivery.
)
clipwait
send ^v
sleep 333
clipboard := copied
return

::#multipers::
copied := Clipboard
clipboard=
(
The Design Lab doesn't support adding personalized names and numbers on more than one style or product color. If you'd like to personalize multiple items, we ask that you provide us with a list of each item receiving personalization, and what names/numbers will go on those specifically.

You'll want to make sure and contact us to place your order, so we'll be able to add the names/numbers to each item for you according to your list.
)
clipwait
send ^v
sleep 333
clipboard := copied
return


::#perscost::
copied := Clipboard
clipboard=
(
Below is the additional cost to add any name or 2 digit number to a product:

Name - Add $5.50 to the per item cost
Number - Add $3.50 to the per item cost
)
clipwait
send ^v
sleep 333
clipboard := copied
return


::#store::
::#stores::
copied := Clipboard
clipboard=
(
We have a number of store locations around the US, where we work with our customers in many different ways. When visiting a store, you can receive one on one design support, get help setting up a Group order or Fundraiser, and much more! We also house a variety of our products at each location for you to touch and feel, and find the perfect product for your occasion.

Click this link to see if there's a store location near you to book an appointment, we'd love to see you! - https://www.customink.com/ink/stores
)
clipwait
send ^v
sleep 333
clipboard := copied
return

::#inkmatch::
copied := Clipboard
clipboard=
(
We're able to match a lot of unique ink colors that aren't offered as default colors in our Design Lab. In order to match these colors accurately, we would need the exact "Pantone color number". If you don't have that, our art team can also just match the color of the original design using the closest Pantone color they have available.

The cost for color matching is $20 per color, and you'll receive one free match for every $400 reached in your order total.
)
clipwait
send ^v
sleep 333
clipboard := copied
return

::#poemail::
copied := Clipboard
clipboard=
(
Thank you so much for sending this over!

I've forwarded your PO to our Billing department for them to review. Once verified, we'll begin production and the scheduled delivery date will be confirmed.

If you have any other questions along the way, I'm here to help with anything that you would need! 

Thank you again for choosing Custom Ink.
)
clipwait
send ^v
sleep 333
clipboard := copied
return


::#poly::
copied := Clipboard
clipboard=
(
We have a service we call "Polybagging" that instructs the Printer to individually wrap your products in a clear plastic bag. While the bags themselves won't be labeled, they are folded in a way to display the product tag visible from the outside of the bag if possible. The cost for polybagging adds $0.50/item.
)
clipwait
send ^v
sleep 333
clipboard := copied
return

::#pps::
copied := Clipboard
clipboard=
(
We offer a type of printed sample called a "Pre-Production Sample" that we can add when placing your order. The Pre-Production Sample is a printed sample that we ship out to you quickly, after your digital proof is approved and before the remaining order moves to print. The cost for a Pre-Production Sample is $100, and you may qualify for a free sample based on your order quantity.
)
clipwait
send ^v
sleep 333
clipboard := copied
return

::#spam::
copied := Clipboard
clipboard=
(
I can help you with your custom apparel or design questions. What questions do you have for me today in regards to custom apparel?
)
clipwait
send ^v
sleep 333
clipboard := copied
return

::#increase::
copied := Clipboard
clipboard=
(
We've recently implemented a price change to our products and services, which might result in a higher cost showing now than a quote or price that you've received previously. With these types of changes, we're always happy to honor any lower price that you've been offered, and long as it was offered in the last 30 days.
)
clipwait
send ^v
sleep 333
clipboard := copied
return

::#pricing::
copied := Clipboard
clipboard=
(
Our standard order pricing is based on:

 - The product or products in the order
 - The design itself (how many colors? decoration areas?)
 - Sizes and quantities
 - When you need the order by (free delivery or expedited)
 - Delivery zip code
)
clipwait
send ^v
sleep 333
clipboard := copied
return

::#personal::
copied := Clipboard
clipboard=
(
We're not able to print on any products that we do not source directly from our supplier. The main reason for this is that the products we offer have all undergone rigorous testing, ensuring that the print and product quality holds up to our 100`% money back guarantee.

With this being the case, would you like me to try and find a product we offer that's similar to the product that you're asking about?
)
clipwait
send ^v
sleep 333
clipboard := copied
return

::#poinfo::
copied := Clipboard
clipboard=
(
Here's the information that we'll need you to fill out on your Purchase Order before we can submit it to our Billing department:

 - purchase order number and date
 - your Custom Ink order number
 - billing contact name (first/last)
 - billing email address (to email invoice after delivery/questions about payment)
 - billing address
 - total $ amount
 - authorized signature/s
)
clipwait
send ^v
sleep 333
clipboard := copied
return


::#qrcode::
copied := Clipboard
clipboard=
(
We're able to print a QR code on the vast majority of products that we offer. In order to ensure the QR can be scanned after print, there are some guidelines that we'll need to follow. The design portion must be filled in solid, it needs to contrast well against the product color, and the QR code itself can't be smaller than 2`" x 2`" or larger than 8`" x 8`".
)
clipwait
send ^v
sleep 333
clipboard := copied
return


::#taxfollow::
copied := Clipboard
clipboard=
(
I've forward your tax exemption information to our Billing department. As soon as it's been validated, we'll be able to exempt the tax charged to your order. If payment has already been completed, we'll credit the tax back to the payment method used for the purchase.

Please feel free to reply with any additional questions or needs, and I'd be happy to help get those taken care of as well.

Have a great day and thank you for choosing Custom Ink!
)
clipwait
send ^v
sleep 333
clipboard := copied
return


::#redraw::
::#redrawn::
copied := Clipboard
clipboard=
(
You'll qualify for a free Perk that offers you design assistance from our expert art team after you've placed and paid for your bulk order. The art team can help change the design colors, adjust small elements of its shape, and even simplify the artwork overall if needed!

If this is something that interests you, you'll need to contact us to place your order for you so we can leave all necessary artwork notes to the team. As an additional benefit, anytime we redraw your design our art team will send you a Picture Proof email showing the final print ready version before it moves into production.
)
clipwait
send ^v
sleep 333
clipboard := copied
return


::#refemail::
copied := Clipboard
clipboard=
(
I wanted to email you more information about our referral program. This program allows you to refer anyone that you believe Custom Ink would be a perfect fit for.

Once you refer them, they'll be provided with a 10`% off voucher that they can use towards their first time ordering with us; up to a $100 discount. You can refer as many people as you'd like!

Also, each time someone you refer to the site places an order and it ships, we'll add a $20 credit to your account towards any future orders (up to $300 a year).

Here's the link to your own landing page with the information:

%copied%

You'll receive an email confirmation with the new total amount and your voucher code each time that you earn a credit.

- Please be sure to review the Terms of Service via your URL above to learn more about how it all works.

Let me know what I can do for you further, and thank you again for choosing Custom Ink!
)
clipwait
send ^v
sleep 333
clipboard := copied
return


::#reset::
copied := Clipboard
clipboard=
(
Here are the instructions to reset your password:

1. Click on this link (or go to "Your Account" from our Homepage).

https://www.customink.com/profiles/users/sign_in

2. If it shows that you're already logged in: Go to "Account Settings" - "Change Password", and then reset your password there.

3. If it prompts you to log in: Enter your email address and click "Continue With Email", and on the next page click "Forgot Password".
)
clipwait
send ^v
sleep 333
clipboard := copied
return


::#rtq::
copied := Clipboard
clipboard=
(
I'm going to have to step away from my computer. In order to make sure you receive the help you need quickly, I'll be connecting you with the next available team member who can take over where we've left off. I've made sure to include detailed notes as to what we've talked about, so you won't have to repeat any information to them.
)
clipwait
send ^v
sleep 333
clipboard := copied
return

::#reverse::
copied := Clipboard
clipboard=
(
Currently the Design Lab isn't set up to show a mockup design on the reversible side of a Jersey, but it is an available print location that we offer.

If you'd like to add a design to the reversible side we ask that you add it to the outside of the Jersey for now. This will act as a placeholder. Then, when you're ready for pricing or to get your order placed, you'll want to contact us to do that for you. That way we can leave order notes explaining all of the specific print areas that you need.

Finally, a few days after payment our art team will send you a Picture Proof email. This is where you'll see your design on all of the print areas you've requested, including the reversible side of the Jersey.
)
clipwait
send ^v
sleep 333
clipboard := copied
return

::#chest::
copied := Clipboard
clipboard=
(
Currently the Design Lab isn't set up to show a mockup design on the right chest, but it is an available print location that we offer.

If you'd like to add a design to the right chest we ask that you add it to the left chest for now, or to the back of the product if you'd prefer. This will act as a placeholder. Then, when you're ready for pricing or to get your order placed, you'll want to contact us to do that for you. That way we can leave order notes explaining all of the specific print areas that you need.

Finally, a few days after payment our art team will send you a Picture Proof email. This is where you'll see your design on all of the print areas you've requested, including the right chest location.
)
clipwait
send ^v
sleep 333
clipboard := copied
return

::#roemail::
copied := Clipboard
clipboard=
(
Thank you for sending in your request. I would love to help you place your reorder!

Here's what I'll need to send you a price quote:

1.
2.

Please reply with this information and I can get back to you with your final pricing. If approved I can then help place your order for you via email, sending a secure payment link to complete payment when you're ready.

Thank you again for choosing Custom Ink!
)
clipwait
send ^v
sleep 333
clipboard := copied
return


::#roughquote::
copied := Clipboard
clipboard=
(
Here's the information that I'll need to provide you with a quote:

- What product from our Product's page would you like pricing on? Click this link to see our selection: https://www.customink.com/products/

- What product colors would you like?
- How many were you looking to order (or what sizes do you need)?
- Will you be printing on the front/back/sleeve etc?
- How many colors will your design be for each print location?
- What is the delivery zip code?
- Will our Free 14 day delivery work for you, or would you like to pay to expedite the delivery?
)
clipwait
send ^v
sleep 333
clipboard := copied
return

::#satransfer::
copied := Clipboard
clipboard=
(
We actually have a team dedicated to helping with orders in progress. Let me get you over to them so that they can better assist with your needs. Just a moment please.
)
clipwait
send ^v
sleep 333
clipboard := copied
return

::#samesome::
copied := Clipboard
clipboard=
(
We have the ability to remove a print location from just some of the items in your order. Pricing for this request will depend on how many of those items will not be receiving the design. If it's 5 or less, we'll price them together for a larger bulk discount. If it's 6 or more, we'll price them as separate quantities and then add a `"Shared Design'" discount to the order.

Which of the items in your order were you looking to remove a print location from?
)
clipwait
send ^v
sleep 333
clipboard := copied
return

::#sample::
::#samples::
copied := Clipboard
clipboard=
(
We offer two types of samples:

1. Blank sample - This is a sample of an item without a design printed on it, that will allow you to get familiar with the fit, color, and feel of a product. It comes at a low cost, and can deliver on a free 10 day turnaround. 

2. Printed sample - This is a "Pre-Production" sample that you can add to your bulk order at the time it's being placed and paid for. The pre-production sample process allows us to send a single, fully printed item to you ahead of time for you to see in person before we send the rest of the order. The cost for this sample is $100, and you might possibly qualify for one free depending on your order quantity.
)
clipwait
send ^v
sleep 333
clipboard := copied
return

::#servicetransone::
copied := Clipboard
clipboard=
(
I'm so sorry to hear about the issue with your order. We actually have a special team that works with all order issues after they deliver. I'll transfer you to them now, and they'll be able to work with you to find a quick resolution! One moment please.
)
clipwait
send ^v
sleep 333
clipboard := copied
return

::#sideleg::
copied := Clipboard
clipboard=
(
Currently the Design Lab isn't set up to show a mockup design on the side of the leg, but it is an available print location that we offer.

If you'd like to add a design to the side of the leg we ask that you add it to the front for now. This will act as a placeholder. Then, when you're ready for pricing or to get your order placed, you'll want to contact us to do that for you. That way we can leave order notes explaining all of the specific print areas that you need.

Finally, a few days after payment our art team will send you a Picture Proof email. This is where you'll see your design on all of the print areas you've requested, including the side leg location.
)
clipwait
send ^v
sleep 333
clipboard := copied
return

::#sideshirt::
copied := Clipboard
clipboard=
(
Currently the Design Lab isn't set up to show a mockup design on the side of the shirt, but it is an available print location that we offer.

If you'd like to add a design to the side of the shirt we ask that you add it to the front for now. This will act as a placeholder. Then, when you're ready for pricing or to get your order placed, you'll want to contact us to do that for you. That way we can leave order notes explaining all of the specific print areas that you need.

Finally, a few days after payment our art team will send you a Picture Proof email. This is where you'll see your design on all of the print areas you've requested, including the side shirt location.
)
clipwait
send ^v
sleep 333
clipboard := copied
return

::#singlesperks::
copied := Clipboard
clipboard=
(
Your Custom Ink order comes with: 

*Free artistic adjustments to alignment, art, or text for the best look possible
*Free shipping with a guaranteed delivery date
*A quality and money-back guarantee
)
clipwait
send ^v
sleep 333
clipboard := copied
return

::#singlesquote::
copied := Clipboard
clipboard=
(
 ======================
%copied% 
 =======================
**Extended sizes are available in select styles at an additional cost. (Not all products are available in the same size range).

 Your Custom Ink order comes with:

 *Free artistic adjustments to alignment, art, or text for the best look possible
 *Free shipping with a guaranteed delivery date
 *A quality and money-back guarantee
======================
)
clipwait
send ^v
sleep 333
clipboard := copied
return

::#sleeve::
copied := Clipboard
clipboard=
(
Currently the Design Lab isn't set up to show a mockup design on the sleeve, but it is an available print location that we offer.

If you'd like to add a design to the sleeve we ask that you add it to the front for now. This will act as a placeholder. Then, when you're ready for pricing or to get your order placed, you'll want to contact us to do that for you. That way we can leave order notes explaining all of the specific print areas that you need.

Finally, a few days after payment our art team will send you a Picture Proof email. This is where you'll see your design on all of the print areas you've requested, including the sleeve location.
)
clipwait
send ^v
sleep 333
clipboard := copied
return

::#font::
::#specialfont::
copied := Clipboard
clipboard=
(
Our Design Lab isn't set up to accept custom fonts, but we do have a few different options to make sure that your requested font prints as your final design:

1. If you have the font file, you can email it over to Service@customink.com for our art team to use when setting up the order for print. You'll need to contact us to place the order for you, so we can provide the art team the file and request that your custom font be used in your design.

2. If you don't have the actual font file, we'll still need to place the order for you, but instead we'll leave notes to our art team asking them to use a font they have available, matching closely to the custom font you're looking to print.
)
clipwait
send ^v
sleep 333
clipboard := copied
return


::#sponsor::
copied := Clipboard
clipboard=
(
We don't currently offer a sponsorship program. Instead,  a number of our customers will actually go the route of Custom Ink Fundraising!

By opening a Fundraiser, you're actually allowing your community to sponsor you through product purchase and donations, with no cost to you up front. There's no limit to how much money you can raise! Plus, as an added benefit if your community or group purchases an item, they're getting an amazing product along with sponsoring you with their support.

Would you like me to link you to our Fundraising page to read more about it?
)
clipwait
send ^v
sleep 333
clipboard := copied
return


::#linkbulk::
copied := Clipboard
clipboard=
(
Below you'll find a secure payment link to complete payment for your order.

%copied%

After you complete payment you'll receive a confirmation email. Please add service@customInk.com to your email contacts to make sure that it doesn't land in your spam folder.

For most bulk orders, our art team will send you a Final Picture Proof email, which will allow you to review the print ready artwork, sizes, and other order details. This proof may or may not require your approval prior to printing the order, so please keep an eye out for its arrival.
)
clipwait
send ^v
sleep 333
clipboard := copied
return

::#linksingles::
copied := Clipboard
clipboard=
(
Below you'll find a secure payment link to complete payment for your order.

%copied%

After you complete payment you'll receive a confirmation email. Please add service@customInk.com to your email contacts to make sure that it doesn't land in your spam folder.
)
clipwait
send ^v
sleep 333
clipboard := copied
return

::#subblank::
copied := Clipboard
clipboard=
(
I noticed after reviewing your design that the ink color looks to be a bit subtle against the product color, and generally we don't recommend printing subtle elements. Is that intentional, or would you like to discuss options to have that ink color contrast more?
)
clipwait
send ^v
sleep 333
clipboard := copied
return

::#subink::
copied := Clipboard
clipboard=
(
I noticed after reviewing your design the ink colors look to be a bit subtle against one another, and generally we don't recommend printing subtle elements. Is that intentional, or would you like to discuss options to have those ink colors contrast more?
)
clipwait
send ^v
sleep 333
clipboard := copied
return

::#prevention::
copied := Clipboard
clipboard=
(
We take your comments very seriously. Please contact 911 or the National Suicide Prevention Lifeline (1-800-273-8255) for immediate assistance. In addition, we would like to provide you a resource where you can seek professional help beyond our abilities. Please click the following link for additional information regarding your concern. https://suicidepreventionlifeline.org
)
clipwait
send ^v
sleep 333
clipboard := copied
return


::#notax::
copied := Clipboard
clipboard=
(
I don't see that we have your Organization's tax exemption on file, but there are a few options we can move forward with to get your order placed:

1. We can place your order as pending payment now, and you can send us your tax exemption information to process afterwards. Once approved, usually the next business day, we'll remove the tax from the order total and email you a secure payment link to complete payment.

2. We can place your order paying for tax now, and have you send in your tax exemption for us to process. Once approved, usually the next business day, we'll credit the tax back to the payment method that was used to complete payment for the order. Choosing this option will start the delivery schedule today.

Which of these two do you think would work best for your needs?
)
clipwait
send ^v
sleep 333
clipboard := copied
return



::#trap::
copied := Clipboard
clipboard=
(
 	
I noticed after reviewing your design that the design size won't fit on all of the products in your order. This is due to some unique product stitching, which makes the available width area of a design smaller as it gets closer to the collar. We have a few options that we can move forward with, depending on what you think would best suit your needs:

1. We can print the design size as is, moving it further down the chest of the product where the print area gets wider.

2. We can scale the design size down smaller for all products, and print it at its current location.

3. You can pay for a service to create an additional screen that will allow you to print more than one design size for your order.

Which option do you think would work best for your needs?
)
clipwait
send ^v
sleep 333
clipboard := copied
return



::#uninote::
copied := Clipboard
clipboard=
(
Name of Customer:
Email:
Quantity Ordered:
Student Organization/Academic Department:
Number of Group Members:
Faculty Advisor:
Are these for a fundraiser:
Intended use for the order:
Paid w/ University funds?
Event Date, if applicable:
)
clipwait
send ^v
sleep 333
clipboard := copied
return



::#uniquest::
copied := Clipboard
clipboard=
(
Here is a list of questions that the University requires us to ask in order to submit your design for their review:

1. Are you currently affiliated with a university group or department? If so, please provide the name of this organization/department or your affiliation with the university:

2. If you are part of a student organization, please let us know the total number of members:

3. If your organization has an advisor or department head, please provide their name and email address:

4. Will these be sold as a fundraiser?

5. What is the intended use of your order? (selling? giving away? to whom? for a specific event?):

6. Is the order being paid for by University funds?

7. Do you have an event or specific date you need the items before?
)
clipwait
send ^v
sleep 333
clipboard := copied
return



::#cartvoucher::
::#vouchercart::
copied := Clipboard
clipboard=
(
The area to enter your voucher code will be located on the first screen you arrive at, after checking out from the Design Lab. You will see text that says `"Have a Voucher Code?`", which is found under the Tax and above the Order Total.
)
clipwait
send ^v
sleep 333
clipboard := copied
return



::#vss::
copied := Clipboard
clipboard=
(
When ordering various sizes or types of products (Toddler, Youth, Adult, Women's etc) in the same order, there are times the original design won't fit properly on each item. In these cases, we offer the ability to add additional screens to the order. Adding these screens will allow you to print your design at different sizes, which will ensure that it fits much more proportionately across all products.

You'll need to contact us when you're ready to place your order if you'd like to add additional screens, as they come with an additional cost. If you'd like I can go over that pricing with you now?
)
clipwait
send ^v
sleep 333
clipboard := copied
return



::#vsscost::
copied := Clipboard
clipboard=
(
The cost for the Various Sized Screen service is based on the color count of your design, and will be applied per design location (front/back/sleeve etc):

1 color = $25
2 color = $40
3 color = $55
4 color = $70
)
clipwait
send ^v
sleep 333
clipboard := copied
return


/*
end of AHK
*/
