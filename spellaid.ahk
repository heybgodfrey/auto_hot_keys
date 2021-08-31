#SingleInstance force
#NoTrayIcon
;Reading spell aid settings

INI=%A_scriptdir%\spellaid\settings.ini

SetKeyDelay, 0

IniRead, toggle01, %ini%, spellaid01, KEY1
IniRead, toggle02, %ini%, spellaid02, KEY1
IniRead, toggle03, %ini%, spellaid03, KEY1
IniRead, toggle04, %ini%, spellaid04, KEY1
IniRead, toggle05, %ini%, spellaid05, KEY1
IniRead, toggle06, %ini%, spellaid06, KEY1
IniRead, toggle07, %ini%, spellaid07, KEY1
IniRead, toggle08, %ini%, spellaid08, KEY1
IniRead, toggle09, %ini%, spellaid09, KEY1
IniRead, toggle10, %ini%, spellaid10, KEY1
IniRead, toggle11, %ini%, spellaid11, KEY1
IniRead, toggle12, %ini%, spellaid12, KEY1
IniRead, toggle13, %ini%, spellaid13, KEY1
IniRead, toggle14, %ini%, spellaid14, KEY1
IniRead, toggle15, %ini%, spellaid15, KEY1
IniRead, toggle16, %ini%, spellaid16, KEY1
IniRead, toggle17, %ini%, spellaid17, KEY1
IniRead, toggle18, %ini%, spellaid18, KEY1
IniRead, toggle19, %ini%, spellaid19, KEY1
IniRead, toggle20, %ini%, spellaid20, KEY1
IniRead, toggle21, %ini%, spellaid21, KEY1
IniRead, toggle22, %ini%, spellaid22, KEY1
IniRead, toggle23, %ini%, spellaid23, KEY1
IniRead, toggle24, %ini%, spellaid24, KEY1
IniRead, toggle25, %ini%, spellaid25, KEY1
IniRead, toggle26, %ini%, spellaid26, KEY1
IniRead, toggle27, %ini%, spellaid27, KEY1
IniRead, toggle28, %ini%, spellaid28, KEY1
IniRead, toggle29, %ini%, spellaid29, KEY1
IniRead, toggle30, %ini%, spellaid30, KEY1
IniRead, toggle31, %ini%, spellaid31, KEY1
IniRead, toggle31, %ini%, spellaid32, KEY1

; Evaluate what will be autocorrected.


; Begin I'm autocorrect
:*:i"m::
if (toggle01 = 1) 
{
Send, I'm{Space} 
Return
}
else
{
Send, im{Space} 
Return
}
:*:im ::
if (toggle01 = 1) 
{
send, I'm{Space} 
Return
}
else
{
Send, im{Space} 
Return
}


; Begin "inconvenience" autocorrect
:*:nconven::
if (toggle02 = 1)
{
Send, inconvenience{Space}
Return
}
else
{
Send, nconven
}
:*:iconveni::
if (toggle02 = 1)
{
Send, inconvenience{Space}
Return
}
else
{
Send, iconveni
Return
}
:*:inonveni::
if (toggle02 = 1)
{
Send, inconvenience{Space}
Return
}
else
{
Send, inonveni
}
:*:incnveni::
if (toggle02 = 1)
{
Send, inconvenience{Space}
Return
}
else
{
Send, incnveni
Return
}
:*:incoveni::
if (toggle02 = 1)
{
Send, inconvenience{Space}
Return
}
else
{
Send, incoveni
Return
}
:*:inconeni::
if (toggle02 = 1)
{
Send, inconvenience{Space}
Return
}
else
{
Send, inconeni{Space}
Return
}
:*:inconvei::
if (toggle02 = 1)
{
Send, inconvenience{Space}
Return
}
else
{
Send, incovei
Return
}
:*:inconven::
if (toggle02 = 1)
{
Send, inconvenience{Space}
Return
}
else
{
Send, inconven
Return
}
:*:inconvenie::
if (toggle02 = 1)
{
Send, inconvenience{Space}
Return
}
else
{
Send, inconvenie
Return
}
:*:inconveni::
if (toggle02 = 1)
{
Send, inconvenience{Space}
Return
}
else
{
Send, inconveni
Return
}
:*:inconeni::inconvenience
if (toggle02 = 1)
{
Send, inconvenience{Space}
Return
}
else
{
Send, inconeni
Return
}
:*:inconveni::
if (toggle02 = 1)
{
Send, inconvenience{Space}
Return
}
else
{
Send, inconveni
Return
}
:*:inconveni::
if (toggle02 = 1)
{
Send, inconvenience{Space}
Return
}
else
{
Send, inconveni
Return
}
:*:iinconveni::
if (toggle02 = 1)
{
Send, inconvenience{Space}
Return
}
else
{
Send, iinconveni
Return
}
:*:innconveni::
if (toggle02 = 1)
{
Send, inconvenience{Space}
Return
}
else
{
Send, innconveni
Return
}
:*:incconveni::
if (toggle02 = 1)
{
Send, inconvenience{Space}
Return
}
else
{
Send, incconveni
Return
}
:*:incoonveni::
if (toggle02 = 1)
{
Send, inconvenience{Space}
Return
}
else
{
Send, incoonveni
Return
}
:*:inconnveni::
if (toggle02 = 1)
{
Send, inconvenience{Space}
Return
}
else
{
Send, inconnveni
Return
}
:*:inconvveni::
if (toggle02 = 1)
{
Send, inconvenience{Space}
Return
}
else
{
Send, inconvveni
Return
}
:*:inconveeni::
if (toggle02 = 1)
{
Send, inconvenience{Space}
Return
}
else
{
Send, inconveeni
Return
}
:*:inconvenni::
if (toggle02 = 1)
{
Send, inconvenience{Space}
Return
}
else
{
Send, inconvenni
Return
}
:*:inconvenii::
if (toggle02 = 1)
{
Send, inconvenience{Space}
Return
}
else
{
Send, inconvenii
Return
}
:*:inconvenie::
if (toggle02 = 1)
{
Send, inconvenience{Space}
Return
}
else
{
Send, inconvenie
Return
}
:*:niconveni::
if (toggle02 = 1)
{
Send, inconvenience{Space}
Return
}
else
{
Send, niconveni
Return
}
:*:icnonveni::
if (toggle02 = 1)
{
Send, inconvenience{Space}
Return
}
else
{
Send, icnonveni
Return
}
:*:inocnveni::
if (toggle02 = 1)
{
Send, inconvenience{Space}
Return
}
else
{
Send, inocnveni
Return
}
:*:incovneni::
if (toggle02 = 1)
{
Send, inconvenience{Space}
Return
}
else
{
Send, incoveni
Return
}
:*:inconevni::
if (toggle02 = 1)
{
Send, inconvenience{Space}
Return
}
else
{
Send, inconevni
Return
}
:*:inconvnei::
if (toggle02 = 1)
{
Send, inconvenience{Space}
Return
}
else
{
Send, inconvnei
Return
}
:*:inconvei::
if (toggle02 = 1)
{
Send, inconvenience{Space}
Return
}
else
{
Send, inconvei
Return
}
:*:inconvene::
if (toggle02 = 1)
{
Send, inconvenience{Space}
Return
}
else
{
Send, inconvene
Return
}


; Begin "convenience" autocorrect
:*:conveine::
if (toggle03 = 1)
{
Send, convenience{Space}
Return
}
else
{
Send, conveine{Space}
Return
}
:*:convinenc::
if (toggle03 = 1)
{
Send, convenience{Space}
Return
}
else
{
Send, convinenc{Space}
Return
}
:*:onvenience::
if (toggle03 = 1)
{
Send, convenience{Space}
Return
}
else
{
Send, onvenience{Space}
Return
}
:*:cnvenience::
if (toggle03 = 1)
{
Send, convenience{Space}
Return
}
else
{
Send, cnvenience{Space}
Return
}
:*:covenience::
if (toggle03 = 1)
{
Send, convenience{Space}
Return
}
else
{
Send, covenience{Space}
Return
}
:*:conenience::
if (toggle03 = 1)
{
Send, convenience{Space}
Return
}
else
{
Send, conenience{Space}
Return
}
:*:convnience::
if (toggle03 = 1)
{
Send, convenience{Space}
Return
}
else
{
Send, convnience{Space}
Return
}
:*:conveience::
if (toggle03 = 1)
{
Send, convenience{Space}
Return
}
else
{
Send, conveience{Space}
Return
}
:*:convenence::
if (toggle03 = 1)
{
Send, convenience{Space}
Return
}
else
{
Send, convenence{Space}
Return
}
:*:convenince::
if (toggle03 = 1)
{
Send, convenience{Space}
Return
}
else
{
Send, convenince{Space}
Return
}

:*:conveniece::

if (toggle03 = 1)
{
Send, convenience{Space}
Return
}
else
{
Send, conveniece{Space}
Return
}

:*:conveniene::

if (toggle03 = 1)
{
Send, convenience{Space}
Return
}
else
{
Send, conveniene{Space}
Return
}

:*:cconvenience::

if (toggle03 = 1)
{
Send, convenience{Space}
Return
}
else
{
Send, cconvenience{Space}
Return
}

:*:coonvenience::

if (toggle03 = 1)
{
Send, convenience{Space}
Return
}
else
{
Send, coonvenience{Space}
Return
}

:*:connvenience::

if (toggle03 = 1)
{
Send, convenience{Space}
Return
}
else
{
Send, connvenience{Space}
Return
}

:*:convvenience::

if (toggle03 = 1)
{
Send, convenience{Space}
Return
}
else
{
Send, convvenience{Space}
Return
}

:*:conveenience::

if (toggle03 = 1)
{
Send, convenience{Space}
Return
}
else
{
Send, conveenience{Space}
Return
}

:*:convennience::

if (toggle03 = 1)
{
Send, convenience{Space}
Return
}
else
{
Send, convennience{Space}
Return
}

:*:conveniience::

if (toggle03 = 1)
{
Send, convenience{Space}
Return
}
else
{
Send, conveniience{Space}
Return
}

:*:convenieence::

if (toggle03 = 1)
{
Send, convenience{Space}
Return
}
else
{
Send, convenieence{Space}
Return
}

:*:conveniennce::

if (toggle03 = 1)
{
Send, convenience{Space}
Return
}
else
{
Send, conveniennce{Space}
Return
}

:*:conveniencce::

if (toggle03 = 1)
{
Send, convenience{Space}
Return
}
else
{
Send, conveniencce{Space}
Return
}

:*:conveniencee::

if (toggle03 = 1)
{
Send, convenience{Space}
Return
}
else
{
Send, conveniencee{Space}
Return
}

:*:ocnvenience::

if (toggle03 = 1)
{
Send, convenience{Space}
Return
}
else
{
Send, ocnvenience{Space}
Return
}

:*:cnovenience::

if (toggle03 = 1)
{
Send, convenience{Space}
Return
}
else
{
Send, cnovenience{Space}
Return
}

:*:covnenience::

if (toggle03 = 1)
{
Send, convenience{Space}
Return
}
else
{
Send, covnenience{Space}
Return
}

:*:conevnience::

if (toggle03 = 1)
{
Send, convenience{Space}
Return
}
else
{
Send, conevnience{Space}
Return
}

:*:convneience::

if (toggle03 = 1)
{
Send, convenience{Space}
Return
}
else
{
Send, convneience{Space}
Return
}

:*:conveinence::

if (toggle03 = 1)
{
Send, convenience{Space}
Return
}
else
{
Send, conveinence{Space}
Return
}

:*:conveneince::

if (toggle03 = 1)
{
Send, convenience{Space}
Return
}
else
{
Send, conveneince{Space}
Return
}

:*:conveninece::

if (toggle03 = 1)
{
Send, convenience{Space}
Return
}
else
{
Send, conveninece{Space}
Return
}

:*:conveniecne::

if (toggle03 = 1)
{
Send, convenience{Space}
Return
}
else
{
Send, conveniecne{Space}
Return
}

:*:convience::

if (toggle03 = 1)
{
Send, convenience{Space}
Return
}
else
{
Send, convience{Space}
Return
}

:*:convienence::

if (toggle03 = 1)
{
Send, convenience{Space}
Return
}
else
{
Send, convienence{Space}
Return
}


; Begin "doesn't" autocorrect
:*:doesnt::

if (toggle04 = 1)
{
Send, doesn't{Space}
Return
}
else
{
Send, doesnt{Space}
Return
}

:*:oesn't::

if (toggle04 = 1)
{
Send, doesn't{Space}
Return
}
else
{
Send, oesn't{Space}
Return
}

:*:oesnt::

if (toggle04 = 1)
{
Send, doesn't{Space}
Return
}
else
{
Send, oesnt{Space}
Return
}

:*:desn't::

if (toggle04 = 1)
{
Send, doesn't{Space}
Return
}
else
{
Send, desn't{Space}
Return
}

:*:dosn't::

if (toggle04 = 1)
{
Send, doesn't{Space}
Return
}
else
{
Send, dosn't{Space}
Return
}

:*:doen't::

if (toggle04 = 1)
{
Send, doesn't{Space}
Return
}
else
{
Send, doen't{Space}
Return
}

:*:does't::

if (toggle04 = 1)
{
Send, doesn't{Space}
Return
}
else
{
Send, does't{Space}
Return
}

:*:doesnt::

if (toggle04 = 1)
{
Send, doesn't{Space}
Return
}
else
{
Send, doesnt{Space}
Return
}

:*:ddoesn't::

if (toggle04 = 1)
{
Send, doesn't{Space}
Return
}
else
{
Send, ddoesn't{Space}
Return
}

:*:dooesn't::

if (toggle04 = 1)
{
Send, doesn't{Space}
Return
}
else
{
Send, dooesn't{Space}
Return
}

:*:doeesn't::

if (toggle04 = 1)
{
Send, doesn't{Space}
Return
}
else
{
Send, doeesn't{Space}
Return
}

:*:doessn't::

if (toggle04 = 1)
{
Send, doesn't{Space}
Return
}
else
{
Send, doessn't{Space}
Return
}

:*:doesnn't::

if (toggle04 = 1)
{
Send, doesn't{Space}
Return
}
else
{
Send, doesnn't{Space}
Return
}

:*:doesn''t::

if (toggle04 = 1)
{
Send, doesn't{Space}
Return
}
else
{
Send, doesn''t{Space}
Return
}

:*:doesn'tt::

if (toggle04 = 1)
{
Send, doesn't{Space}
Return
}
else
{
Send, doesn'tt{Space}
Return
}

:*:odesn't::

if (toggle04 = 1)
{
Send, doesn't{Space}
Return
}
else
{
Send, odesn't{Space}
Return
}

:*:deosn't::

if (toggle04 = 1)
{
Send, doesn't{Space}
Return
}
else
{
Send, deosn't{Space}
Return
}

:*:dosen't::

if (toggle04 = 1)
{
Send, doesn't{Space}
Return
}
else
{
Send, dosen't{Space}
Return
}

:*:doens't::

if (toggle04 = 1)
{
Send, doesn't{Space}
Return
}
else
{
Send, doens't{Space}
Return
}

:*:does'nt::

if (toggle04 = 1)
{
Send, doesn't{Space}
Return
}
else
{
Send, does'nt{Space}
Return
}



; Begin "don't" autocorrect
:*:dont::

if (toggle05 = 1)
{
Send, don't{Space}
Return
}
else
{
Send, dont{Space}
Return
}
:*:ddon't::

if (toggle05 = 1)
{
Send, don't{Space}
Return
}
else
{
Send, ddon't{Space}
Return
}
:*:ddont::

if (toggle05 = 1)
{
Send, don't{Space}
Return
}
else
{
Send, ddont{Space}
Return
}
:*:doont::

if (toggle05 = 1)
{
Send, don't{Space}
Return
}
else
{
Send, doont{Space}
Return
}
:*:doon't::

if (toggle05 = 1)
{
Send, don't{Space}
Return
}
else
{
Send, doon't{Space}
Return
}
:*:donnt::

if (toggle05 = 1)
{
Send, don't{Space}
Return
}
else
{
Send, donnt{Space}
Return
}
:*:donn't::

if (toggle05 = 1)
{
Send, don't{Space}
Return
}
else
{
Send, donn't{Space}
Return
}
:*:don''t::

if (toggle05 = 1)
{
Send, don't{Space}
Return
}
else
{
Send, don''t{Space}
Return
}
:*:don'tt::

if (toggle05 = 1)
{
Send, don't{Space}
Return
}
else
{
Send, don'tt{Space}
Return
}



; Begin "they're" autocorrect
:*:theyre::

if (toggle06 = 1)
{
Send, they're{Space}
Return
}
else
{
Send, theyre{Space}
Return
}
:*:hey're::

if (toggle06 = 1)
{
Send, they're{Space}
Return
}
else
{
Send, hey're{Space}
Return
}

:*:tey're::

if (toggle06 = 1)
{
Send, they're{Space}
Return
}
else
{
Send, tey're{Space}
Return
}

:*:thy're::

if (toggle06 = 1)
{
Send, they're{Space}
Return
}
else
{
Send, thy're{Space}
Return
}

:*:the're::

if (toggle06 = 1)
{
Send, they're{Space}
Return
}
else
{
Send, the're{Space}
Return
}

:*:they'e::

if (toggle06 = 1)
{
Send, they're{Space}
Return
}
else
{
Send, they'e{Space}
Return
}

:*:ttheyre::

if (toggle06 = 1)
{
Send, they're{Space}
Return
}
else
{
Send, ttheyre{Space}
Return
}

:*:tthey're::

if (toggle06 = 1)
{
Send, they're{Space}
Return
}
else
{
Send, tthey're{Space}
Return
}

:*:thheyre::

if (toggle06 = 1)
{
Send, they're{Space}
Return
}
else
{
Send, thheyre{Space}
Return
}

:*:thhey're::

if (toggle06 = 1)
{
Send, they're{Space}
Return
}
else
{
Send, thhey're{Space}
Return
}

:*:theeyre::

if (toggle06 = 1)
{
Send, they're{Space}
Return
}
else
{
Send, theeyre{Space}
Return
}

:*:theey're::

if (toggle06 = 1)
{
Send, they're{Space}
Return
}
else
{
Send, theey're{Space}
Return
}

:*:theyyre::

if (toggle06 = 1)
{
Send, they're{Space}
Return
}
else
{
Send, theyyre{Space}
Return
}

:*:theyy're::

if (toggle06 = 1)
{
Send, they're{Space}
Return
}
else
{
Send, theyy're{Space}
Return
}

:*:they''re::

if (toggle06 = 1)
{
Send, they're{Space}
Return
}
else
{
Send, they''re{Space}
Return
}

:*:theyrre::

if (toggle06 = 1)
{
Send, they're{Space}
Return
}
else
{
Send, theyrre{Space}
Return
}

:*:they'rre::

if (toggle06 = 1)
{
Send, they're{Space}
Return
}
else
{
Send, they'rre{Space}
Return
}


; Begin "t-shirt" autocorrect
:*:tshit::

if (toggle07 = 1)
{
Send, t-shirt{Space}
Return
}
else
{
Send, tshit{Space}
Return
}

:*:t-shit::

if (toggle07 = 1)
{
Send, t-shirt{Space}
Return
}
else
{
Send, t-shit{Space}
Return
}

:*:t-hirt::

if (toggle07 = 1)
{
Send, t-shirt{Space}
Return
}
else
{
Send, t-hirt{Space}
Return
}

:*:t-sirt::

if (toggle07 = 1)
{
Send, t-shirt{Space}
Return
}
else
{
Send, t-sirt{Space}
Return
}

:*:t-shrt::

if (toggle07 = 1)
{
Send, t-shirt{Space}
Return
}
else
{
Send, t-shrt{Space}
Return
}

:*:t-shit::

if (toggle07 = 1)
{
Send, t-shirt{Space}
Return
}
else
{
Send, t-shit{Space}
Return
}

:*:tt-shirt::

if (toggle07 = 1)
{
Send, t-shirt{Space}
Return
}
else
{
Send, tt-shirt{Space}
Return
}

:*:t--shirt::

if (toggle07 = 1)
{
Send, t-shirt{Space}
Return
}
else
{
Send, t--shirt{Space}
Return
}

:*:t-sshirt::

if (toggle07 = 1)
{
Send, t-shirt{Space}
Return
}
else
{
Send, t-sshirt{Space}
Return
}

:*:t-shhirt::

if (toggle07 = 1)
{
Send, t-shirt{Space}
Return
}
else
{
Send, t-shhirt{Space}
Return
}

:*:t-shiirt::

if (toggle07 = 1)
{
Send, t-shirt{Space}
Return
}
else
{
Send, t-shiirt{Space}
Return
}

:*:t-shirrt::

if (toggle07 = 1)
{
Send, t-shirt{Space}
Return
}
else
{
Send, t-shirrt{Space}
Return
}

:*:t-shirtt::

if (toggle07 = 1)
{
Send, t-shirt{Space}
Return
}
else
{
Send, t-shirtt{Space}
Return
}

:*:-tshirt::

if (toggle07 = 1)
{
Send, t-shirt{Space}
Return
}
else
{
Send, -tshirt{Space}
Return
}

:*:ts-hirt::

if (toggle07 = 1)
{
Send, t-shirt{Space}
Return
}
else
{
Send, ts-hirt{Space}
Return
}

:*:t-hsirt::

if (toggle07 = 1)
{
Send, t-shirt{Space}
Return
}
else
{
Send, t-hsirt{Space}
Return
}

:*:t-sihrt::

if (toggle07 = 1)
{
Send, t-shirt{Space}
Return
}
else
{
Send, t-sihrt{Space}
Return
}

:*:t-shrit::

if (toggle07 = 1)
{
Send, t-shirt{Space}
Return
}
else
{
Send, t-shrit{Space}
Return
}

:*:t-shitr::

if (toggle07 = 1)
{
Send, t-shirt{Space}
Return
}
else
{
Send, t-shitr{Space}
Return
}


; Begin "sweatshirt" autocorrect
:*:sweatshit::

if (toggle08 = 1)
{
Send, sweatshirt{Space}
Return
}
else
{
Send, sweatshit{Space}
Return
}

:*:weatshirt::

if (toggle08 = 1)
{
Send, sweatshirt{Space}
Return
}
else
{
Send, weatshirt{Space}
Return
}

:*:seatshirt::

if (toggle08 = 1)
{
Send, sweatshirt{Space}
Return
}
else
{
Send, seatshirt{Space}
Return
}

:*:swatshirt::

if (toggle08 = 1)
{
Send, sweatshirt{Space}
Return
}
else
{
Send, swatshirt{Space}
Return
}

:*:swetshirt::

if (toggle08 = 1)
{
Send, sweatshirt{Space}
Return
}
else
{
Send, swetshirt{Space}
Return
}

:*:sweashirt::

if (toggle08 = 1)
{
Send, sweatshirt{Space}
Return
}
else
{
Send, sweashirt{Space}
Return
}

:*:sweathirt::

if (toggle08 = 1)
{
Send, sweatshirt{Space}
Return
}
else
{
Send, sweathirt{Space}
Return
}

:*:sweatsirt::

if (toggle08 = 1)
{
Send, sweatshirt{Space}
Return
}
else
{
Send, sweatsirt{Space}
Return
}

:*:sweatshrt::

if (toggle08 = 1)
{
Send, sweatshirt{Space}
Return
}
else
{
Send, sweatshrt{Space}
Return
}



; Begin "guaranteed" autocorrect
:*:guaranted::

if (toggle09 = 1)
{
Send, guaranteed{Space}
Return
}
else
{
Send, guaranted{Space}
Return
}

:*:guranted::

if (toggle09 = 1)
{
Send, guaranteed{Space}
Return
}
else
{
Send, guranted{Space}
Return
}

:*:uaranteed::

if (toggle09 = 1)
{
Send, guaranteed{Space}
Return
}
else
{
Send, uaranteed{Space}
Return
}

:*:garanteed::

if (toggle09 = 1)
{
Send, guaranteed{Space}
Return
}
else
{
Send, garanteed{Space}
Return
}

:*:guranteed::

if (toggle09 = 1)
{
Send, guaranteed{Space}
Return
}
else
{
Send, guranteed{Space}
Return
}

:*:guaanteed::

if (toggle09 = 1)
{
Send, guaranteed{Space}
Return
}
else
{
Send, guaanteed{Space}
Return
}

:*:guarnteed::

if (toggle09 = 1)
{
Send, guaranteed{Space}
Return
}
else
{
Send, guarnteed{Space}
Return
}

:*:guarateed::

if (toggle09 = 1)
{
Send, guaranteed{Space}
Return
}
else
{
Send, guarateed{Space}
Return
}

:*:guaraneed::

if (toggle09 = 1)
{
Send, guaranteed{Space}
Return
}
else
{
Send, guaraneed{Space}
Return
}


; Begin "necessary" autocorrect
:*:necessry::

if (toggle10 = 1)
{
Send, necessary{Space}
Return
}
else
{
Send, necessry{Space}
Return
}

:*:necesary::

if (toggle10 = 1)
{
Send, necessary{Space}
Return
}
else
{
Send, necesary{Space}
Return
}

:*:ecessary::

if (toggle10 = 1)
{
Send, necessary{Space}
Return
}
else
{
Send, ecessary{Space}
Return
}

:*:ncessary::

if (toggle10 = 1)
{
Send, necessary{Space}
Return
}
else
{
Send, ncessary{Space}
Return
}

:*:neessary::

if (toggle10 = 1)
{
Send, necessary{Space}
Return
}
else
{
Send, neessary{Space}
Return
}

:*:necssary::

if (toggle10 = 1)
{
Send, necessary{Space}
Return
}
else
{
Send, necssary{Space}
Return
}

:*:necesary::

if (toggle10 = 1)
{
Send, necessary{Space}
Return
}
else
{
Send, necesary{Space}
Return
}

:*:necesary::

if (toggle10 = 1)
{
Send, necessary{Space}
Return
}
else
{
Send, necesary{Space}
Return
}

:*:necessry::

if (toggle10 = 1)
{
Send, necessary{Space}
Return
}
else
{
Send, necessry{Space}
Return
}

:*:necessay::

if (toggle10 = 1)
{
Send, necessary{Space}
Return
}
else
{
Send, necessay{Space}
Return
}

:*:nnecessary::

if (toggle10 = 1)
{
Send, necessary{Space}
Return
}
else
{
Send, nnecessary{Space}
Return
}

:*:neecessary::

if (toggle10 = 1)
{
Send, necessary{Space}
Return
}
else
{
Send, neecessary{Space}
Return
}

:*:neccessary::

if (toggle10 = 1)
{
Send, necessary{Space}
Return
}
else
{
Send, neccessary{Space}
Return
}

:*:neceessary::

if (toggle10 = 1)
{
Send, necessary{Space}
Return
}
else
{
Send, neceessary{Space}
Return
}

:*:necesssary::

if (toggle10 = 1)
{
Send, necessary{Space}
Return
}
else
{
Send, necesssary{Space}
Return
}

:*:necesssary::

if (toggle10 = 1)
{
Send, necessary{Space}
Return
}
else
{
Send, necesssary{Space}
Return
}

:*:necessaary::

if (toggle10 = 1)
{
Send, necessary{Space}
Return
}
else
{
Send, necessaary{Space}
Return
}

SetKeyDelay, 0
; Begin "Necessarily" autocorrect
:*:Necesarily::

if (toggle11 = 1)
{
Send, necessarily{Space}
Return
}
else
{
Send, necesarily{Space}
Return
}

:*:nesessarily::

if (toggle11 = 1)
{
Send, necessarily{Space}
Return
}
else
{
Send, nesessarily{Space}
Return
}

:*:Nesesarily::

if (toggle11 = 1)
{
Send, necessarily{Space}
Return
}
else
{
Send, nesesarily{Space}
Return
}

:*:ecessarily::

if (toggle11 = 1)
{
Send, necessarily{Space}
Return
}
else
{
Send, ecessarily{Space}
Return
}

:*:Ncessarily::

if (toggle11 = 1)
{
Send, necessarily{Space}
Return
}
else
{
Send, ncessarily{Space}
Return
}

:*:Neessarily::

if (toggle11 = 1)
{
Send, necessarily{Space}
Return
}
else
{
Send, neessarily{Space}
Return
}

:*:Necssarily::

if (toggle11 = 1)
{
Send, necessarily{Space}
Return
}
else
{
Send, necssarily{Space}
Return
}

:*:Necesarily::

if (toggle11 = 1)
{
Send, necessarily{Space}
Return
}
else
{
Send, necesarily{Space}
Return
}

:*:Necessrily::

if (toggle11 = 1)
{
Send, necessarily{Space}
Return
}
else
{
Send, necessrily{Space}
Return
}

:*:Necessaily::

if (toggle11 = 1)
{
Send, necessarily{Space}
Return
}
else
{
Send, necessaily{Space}
Return
}

:*:Necessarly::

if (toggle11 = 1)
{
Send, necessarily{Space}
Return
}
else
{
Send, necessarly{Space}
Return
}


; Begin "just" autocorrect
:*:jsut::

if (toggle12 = 1)
{
Send, just{Space}
Return
}
else
{
Send, jsut{Space}
Return
}

:*:juts::

if (toggle12 = 1)
{
Send, just{Space}
Return
}
else
{
Send, juts{Space}
Return
}

:*:ujst::

if (toggle12 = 1)
{
Send, just{Space}
Return
}
else
{
Send, ujst{Space}
Return
}

:*:justt::

if (toggle12 = 1)
{
Send, just{Space}
Return
}
else
{
Send, justt{Space}
Return
}

:*:jusst::

if (toggle12 = 1)
{
Send, just{Space}
Return
}
else
{
Send, jusst{Space}
Return
}


; Begin "available" autocorrect
:*:avilable::

if (toggle13 = 1)
{
Send, available{Space}
Return
}
else
{
Send, avilable{Space}
Return
}

:*:vailable::

if (toggle13 = 1)
{
Send, available{Space}
Return
}
else
{
Send, vailable{Space}
Return
}

:*:aailable::

if (toggle13 = 1)
{
Send, available{Space}
Return
}
else
{
Send, aailable{Space}
Return
}

:*:avilable::

if (toggle13 = 1)
{
Send, available{Space}
Return
}
else
{
Send, avilable{Space}
Return
}

:*:avalable::

if (toggle13 = 1)
{
Send, available{Space}
Return
}
else
{
Send, avalable{Space}
Return
}

:*:avaiable::

if (toggle13 = 1)
{
Send, available{Space}
Return
}
else
{
Send, avaiable{Space}
Return
}

:*:availble::

if (toggle13 = 1)
{
Send, available{Space}
Return
}
else
{
Send, availble{Space}
Return
}

:*:availale::

if (toggle13 = 1)
{
Send, available{Space}
Return
}
else
{
Send, availale{Space}
Return
}

:*:availabe::

if (toggle13 = 1)
{
Send, available{Space}
Return
}
else
{
Send, availabe{Space}
Return
}

:*:aavailable::

if (toggle13 = 1)
{
Send, available{Space}
Return
}
else
{
Send, aavailable{Space}
Return
}

:*:avvailable::

if (toggle13 = 1)
{
Send, available{Space}
Return
}
else
{
Send, avvailable{Space}
Return
}

:*:avaailable::

if (toggle13 = 1)
{
Send, available{Space}
Return
}
else
{
Send, avaailable{Space}
Return
}

:*:avaiilable::

if (toggle13 = 1)
{
Send, available{Space}
Return
}
else
{
Send, avaiilable{Space}
Return
}

:*:availlable::

if (toggle13 = 1)
{
Send, available{Space}
Return
}
else
{
Send, availlable{Space}
Return
}

:*:availaable::

if (toggle13 = 1)
{
Send, available{Space}
Return
}
else
{
Send, availaable{Space}
Return
}

:*:availabble::

if (toggle13 = 1)
{
Send, available{Space}
Return
}
else
{
Send, availabble{Space}
Return
}

:*:availablle::

if (toggle13 = 1)
{
Send, available{Space}
Return
}
else
{
Send, availablle{Space}
Return
}

:*:availablee::

if (toggle13 = 1)
{
Send, available{Space}
Return
}
else
{
Send, availablee{Space}
Return
}

:*:vaailable::

if (toggle13 = 1)
{
Send, available{Space}
Return
}
else
{
Send, vaailable{Space}
Return
}

:*:aavilable::

if (toggle13 = 1)
{
Send, available{Space}
Return
}
else
{
Send, aavilable{Space}
Return
}

:*:avialable::

if (toggle13 = 1)
{
Send, available{Space}
Return
}
else
{
Send, avialable{Space}
Return
}

:*:avaliable::

if (toggle13 = 1)
{
Send, available{Space}
Return
}
else
{
Send, avaliable{Space}
Return
}

:*:avaialble::

if (toggle13 = 1)
{
Send, available{Space}
Return
}
else
{
Send, avaialble{Space}
Return
}

:*:availbale::

if (toggle13 = 1)
{
Send, available{Space}
Return
}
else
{
Send, availbale{Space}
Return
}

:*:availalbe::

if (toggle13 = 1)
{
Send, available{Space}
Return
}
else
{
Send, availalbe{Space}
Return
}

; Begin "occasionally" autocorrect
:*:ocassionally::

if (toggle14 = 1)
{
Send, occasionally{Space}
Return
}
else
{
Send, ocassionally{Space}
Return
}

:*:occassionally::

if (toggle14 = 1)
{
Send, occasionally{Space}
Return
}
else
{
Send, occassionally{Space}
Return
}

:*:ccasionally::

if (toggle14 = 1)
{
Send, occasionally{Space}
Return
}
else
{
Send, ccasionally{Space}
Return
}

:*:ocasionally::

if (toggle14 = 1)
{
Send, occasionally{Space}
Return
}
else
{
Send, ocasionally{Space}
Return
}

:*:ocasionally::

if (toggle14 = 1)
{
Send, occasionally{Space}
Return
}
else
{
Send, ocasionally{Space}
Return
}

:*:occsionally::

if (toggle14 = 1)
{
Send, occasionally{Space}
Return
}
else
{
Send, occsionally{Space}
Return
}

:*:occaionally::

if (toggle14 = 1)
{
Send, occasionally{Space}
Return
}
else
{
Send, occaionally{Space}
Return
}

:*:occasonally::

if (toggle14 = 1)
{
Send, occasionally{Space}
Return
}
else
{
Send, occasonally{Space}
Return
}

:*:occasinally::

if (toggle14 = 1)
{
Send, occasionally{Space}
Return
}
else
{
Send, occasinally{Space}
Return
}

:*:occasioally::

if (toggle14 = 1)
{
Send, occasionally{Space}
Return
}
else
{
Send, occasioally{Space}
Return
}

:*:occasionlly::

if (toggle14 = 1)
{
Send, occasionally{Space}
Return
}
else
{
Send, occasionlly{Space}
Return
}

:*:occasionaly::

if (toggle14 = 1)
{
Send, occasionally{Space}
Return
}
else
{
Send, occasionaly{Space}
Return
}

:*:occasionaly::

if (toggle14 = 1)
{
Send, occasionally{Space}
Return
}
else
{
Send, occasionaly{Space}
Return
}

:*:ooccasionally::

if (toggle14 = 1)
{
Send, occasionally{Space}
Return
}
else
{
Send, ooccasionally{Space}
Return
}

:*:occcasionally::

if (toggle14 = 1)
{
Send, occasionally{Space}
Return
}
else
{
Send, occcasionally{Space}
Return
}

:*:occcasionally::

if (toggle14 = 1)
{
Send, occasionally{Space}
Return
}
else
{
Send, occcasionally{Space}
Return
}

:*:occaasionally::

if (toggle14 = 1)
{
Send, occasionally{Space}
Return
}
else
{
Send, occaasionally{Space}
Return
}

:*:occassionally::

if (toggle14 = 1)
{
Send, occasionally{Space}
Return
}
else
{
Send, occassionally{Space}
Return
}

:*:occasiionally::

if (toggle14 = 1)
{
Send, occasionally{Space}
Return
}
else
{
Send, occasiionally{Space}
Return
}

:*:occasioonally::

if (toggle14 = 1)
{
Send, occasionally{Space}
Return
}
else
{
Send, occasioonally{Space}
Return
}

:*:occasionnally::

if (toggle14 = 1)
{
Send, occasionally{Space}
Return
}
else
{
Send, occasionnally{Space}
Return
}

:*:occasionaally::

if (toggle14 = 1)
{
Send, occasionally{Space}
Return
}
else
{
Send, occasionaally{Space}
Return
}

:*:occasionallly::

if (toggle14 = 1)
{
Send, occasionally{Space}
Return
}
else
{
Send, occasionallly{Space}
Return
}

:*:occasionallly::

if (toggle14 = 1)
{
Send, occasionally{Space}
Return
}
else
{
Send, occasionallly{Space}
Return
}

:*:occasionallyy::

if (toggle14 = 1)
{
Send, occasionally{Space}
Return
}
else
{
Send, occasionallyy{Space}
Return
}

:*:cocasionally::

if (toggle14 = 1)
{
Send, occasionally{Space}
Return
}
else
{
Send, cocasionally{Space}
Return
}

:*:ocacsionally::

if (toggle14 = 1)
{
Send, occasionally{Space}
Return
}
else
{
Send, ocacsionally{Space}
Return
}

:*:occsaionally::

if (toggle14 = 1)
{
Send, occasionally{Space}
Return
}
else
{
Send, occsaionally{Space}
Return
}

:*:occaisonally::

if (toggle14 = 1)
{
Send, occasionally{Space}
Return
}
else
{
Send, occaisonally{Space}
Return
}

:*:occasoinally::

if (toggle14 = 1)
{
Send, occasionally{Space}
Return
}
else
{
Send, occasoinally{Space}
Return
}

:*:occasinoally::

if (toggle14 = 1)
{
Send, occasionally{Space}
Return
}
else
{
Send, occasinoally{Space}
Return
}

:*:occasioanlly::

if (toggle14 = 1)
{
Send, occasionally{Space}
Return
}
else
{
Send, occasioanlly{Space}
Return
}



; Begin "definitely" autocorrect
:*:definetly::

if (toggle15 = 1)
{
Send, definitely{Space}
Return
}
else
{
Send, definetly{Space}
Return
}

:*:definitly::

if (toggle15 = 1)
{
Send, definitely{Space}
Return
}
else
{
Send, definitly{Space}
Return
}

:*:efinitely::

if (toggle15 = 1)
{
Send, definitely{Space}
Return
}
else
{
Send, efinitely{Space}
Return
}

:*:dfinitely::

if (toggle15 = 1)
{
Send, definitely{Space}
Return
}
else
{
Send, dfinitely{Space}
Return
}

:*:deinitely::

if (toggle15 = 1)
{
Send, definitely{Space}
Return
}
else
{
Send, deinitely{Space}
Return
}

:*:defnitely::

if (toggle15 = 1)
{
Send, definitely{Space}
Return
}
else
{
Send, defnitely{Space}
Return
}

:*:defiitely::

if (toggle15 = 1)
{
Send, definitely{Space}
Return
}
else
{
Send, defiitely{Space}
Return
}

:*:defintely::

if (toggle15 = 1)
{
Send, definitely{Space}
Return
}
else
{
Send, defintely{Space}
Return
}

:*:definiely::

if (toggle15 = 1)
{
Send, definitely{Space}
Return
}
else
{
Send, definiely{Space}
Return
}

:*:definitly::

if (toggle15 = 1)
{
Send, definitely{Space}
Return
}
else
{
Send, definitly{Space}
Return
}

:*:definitey::

if (toggle15 = 1)
{
Send, definitely{Space}
Return
}
else
{
Send, definitey{Space}
Return
}

:*:ddefinitely::

if (toggle15 = 1)
{
Send, definitely{Space}
Return
}
else
{
Send, ddefinitely{Space}
Return
}

:*:deefinitely::

if (toggle15 = 1)
{
Send, definitely{Space}
Return
}
else
{
Send, deefinitely{Space}
Return
}

:*:deffinitely::

if (toggle15 = 1)
{
Send, definitely{Space}
Return
}
else
{
Send, deffinitely{Space}
Return
}

:*:defiinitely::

if (toggle15 = 1)
{
Send, definitely{Space}
Return
}
else
{
Send, defiinitely{Space}
Return
}

:*:definnitely::

if (toggle15 = 1)
{
Send, definitely{Space}
Return
}
else
{
Send, definnitely{Space}
Return
}

:*:definiitely::

if (toggle15 = 1)
{
Send, definitely{Space}
Return
}
else
{
Send, definiitely{Space}
Return
}

:*:definittely::

if (toggle15 = 1)
{
Send, definitely{Space}
Return
}
else
{
Send, definittely{Space}
Return
}

:*:definiteely::

if (toggle15 = 1)
{
Send, definitely{Space}
Return
}
else
{
Send, definiteely{Space}
Return
}

:*:definitelly::

if (toggle15 = 1)
{
Send, definitely{Space}
Return
}
else
{
Send, definitelly{Space}
Return
}

:*:definitelyy::

if (toggle15 = 1)
{
Send, definitely{Space}
Return
}
else
{
Send, definitelyy{Space}
Return
}

:*:edfinitely::

if (toggle15 = 1)
{
Send, definitely{Space}
Return
}
else
{
Send, edfinitely{Space}
Return
}

:*:dfeinitely::

if (toggle15 = 1)
{
Send, definitely{Space}
Return
}
else
{
Send, dfeinitely{Space}
Return
}

:*:deifnitely::

if (toggle15 = 1)
{
Send, definitely{Space}
Return
}
else
{
Send, deifnitely{Space}
Return
}

:*:defniitely::

if (toggle15 = 1)
{
Send, definitely{Space}
Return
}
else
{
Send, defniitely{Space}
Return
}

:*:defiintely::

if (toggle15 = 1)
{
Send, definitely{Space}
Return
}
else
{
Send, defiintely{Space}
Return
}

:*:defintiely::

if (toggle15 = 1)
{
Send, definitely{Space}
Return
}
else
{
Send, defintiely{Space}
Return
}

:*:definietly::

if (toggle15 = 1)
{
Send, definitely{Space}
Return
}
else
{
Send, definietly{Space}
Return
}

:*:definitley::

if (toggle15 = 1)
{
Send, definitely{Space}
Return
}
else
{
Send, definitley{Space}
Return
}


; Begin "tie-dye" autocorrect
:*:tye-dye::

if (toggle16 = 1)
{
Send, tie-dye{Space}
Return
}
else
{
Send, tye-dye{Space}
Return
}

:*:tyedye::

if (toggle16 = 1)
{
Send, tie-dye{Space}
Return
}
else
{
Send, tyedye{Space}
Return
}

:*:ie-dye::

if (toggle16 = 1)
{
Send, tie-dye{Space}
Return
}
else
{
Send, ie-dye{Space}
Return
}

:*:te-dye::

if (toggle16 = 1)
{
Send, tie-dye{Space}
Return
}
else
{
Send, te-dye{Space}
Return
}

:*:ti-dye::

if (toggle16 = 1)
{
Send, tie-dye{Space}
Return
}
else
{
Send, ti-dye{Space}
Return
}

:*:tie-ye::

if (toggle16 = 1)
{
Send, tie-dye{Space}
Return
}
else
{
Send, tie-ye{Space}
Return
}
:*:tie-de::

if (toggle16 = 1)
{
Send, tie-dye{Space}
Return
}
else
{
Send, tie-de{Space}
Return
}

:*:ttie-dye::

if (toggle16 = 1)
{
Send, tie-dye{Space}
Return
}
else
{
Send, ttie-dye{Space}
Return
}

:*:tiie-dye::

if (toggle16 = 1)
{
Send, tie-dye{Space}
Return
}
else
{
Send, tiie-dye{Space}
Return
}

:*:tiee-dye::

if (toggle16 = 1)
{
Send, tie-dye{Space}
Return
}
else
{
Send, tiee-dye{Space}
Return
}

:*:tie--dye::

if (toggle16 = 1)
{
Send, tie-dye{Space}
Return
}
else
{
Send, tie--dye{Space}
Return
}

:*:tie-ddye::

if (toggle16 = 1)
{
Send, tie-dye{Space}
Return
}
else
{
Send, tie-ddye{Space}
Return
}

:*:tie-dyye::

if (toggle16 = 1)
{
Send, tie-dye{Space}
Return
}
else
{
Send, tie-dyye{Space}
Return
}

:*:tie-dyee::

if (toggle16 = 1)
{
Send, tie-dye{Space}
Return
}
else
{
Send, tie-dyee{Space}
Return
}

:*:ite-dye::

if (toggle16 = 1)
{
Send, tie-dye{Space}
Return
}
else
{
Send, ite-dye{Space}
Return
}

:*:tei-dye::

if (toggle16 = 1)
{
Send, tie-dye{Space}
Return
}
else
{
Send, tei-dye{Space}
Return
}

:*:tie-dey::

if (toggle16 = 1)
{
Send, tie-dye{Space}
Return
}
else
{
Send, tie-dey{Space}
Return
}

:*:tie-yde::

if (toggle16 = 1)
{
Send, tie-dye{Space}
Return
}
else
{
Send, tie-yde{Space}
Return
}


; Begin "I" autocorrect
:*:i ::
if (toggle17 = 1)
{
Send, I{Space}
Return
}
else
{
Send, i{Space}
Return
}


; Begin "CustomInk" autocorrect

:*:custom-ink::

if (toggle18 = 1)
{
Send, CustomInk{Space}
Return
}
else
{
Send, custom-ink{Space}
Return
}

:*:ustomink::

if (toggle18 = 1)
{
Send, CustomInk{Space}
Return
}
else
{
Send, ustomink{Space}
Return
}

:*:cstomink::

if (toggle18 = 1)
{
Send, CustomInk{Space}
Return
}
else
{
Send, cstomink{Space}
Return
}

:*:cutomink::

if (toggle18 = 1)
{
Send, CustomInk{Space}
Return
}
else
{
Send, cutomink{Space}
Return
}

:*:cusomink::

if (toggle18 = 1)
{
Send, CustomInk{Space}
Return
}
else
{
Send, cusomink{Space}
Return
}

:*:custmink::

if (toggle18 = 1)
{
Send, CustomInk{Space}
Return
}
else
{
Send, custmink{Space}
Return
}

:*:custoink::

if (toggle18 = 1)
{
Send, CustomInk{Space}
Return
}
else
{
Send, custoink{Space}
Return
}

:*:customnk::

if (toggle18 = 1)
{
Send, CustomInk{Space}
Return
}
else
{
Send, customnk{Space}
Return
}

:*:customik::

if (toggle18 = 1)
{
Send, CustomInk{Space}
Return
}
else
{
Send, customik{Space}
Return
}

:*:ccustomink::

if (toggle18 = 1)
{
Send, CustomInk{Space}
Return
}
else
{
Send, ccustomink{Space}
Return
}

:*:cuustomink::

if (toggle18 = 1)
{
Send, CustomInk{Space}
Return
}
else
{
Send, cuustomink{Space}
Return
}


; Begin "congratulations" autocorrect

:*:congradulations::

if (toggle19 = 1)
{
Send, congratulations{Space}
Return
}
else
{
Send, congratulations{Space}
Return
}

:*:congrats::

if (toggle19 = 1)
{
Send, congratulations{Space}
Return
}
else
{
Send, congrats{Space}
Return
}

:*:ongratulations::

if (toggle19 = 1)
{
Send, congratulations{Space}
Return
}
else
{
Send, ongratulations{Space}
Return
}

:*:cngratulations::

if (toggle19 = 1)
{
Send, congratulations{Space}
Return
}
else
{
Send, cngratulations{Space}
Return
}

:*:cogratulations::

if (toggle19 = 1)
{
Send, congratulations{Space}
Return
}
else
{
Send, cogratulations{Space}
Return
}

:*:conratulations::

if (toggle19 = 1)
{
Send, congratulations{Space}
Return
}
else
{
Send, conratulations{Space}
Return
}

:*:congatulations::

if (toggle19 = 1)
{
Send, congratulations{Space}
Return
}
else
{
Send, congatulations{Space}
Return
}

:*:congrtulations::

if (toggle19 = 1)
{
Send, congratulations{Space}
Return
}
else
{
Send, congrtulations{Space}
Return
}

:*:congraulations::

if (toggle19 = 1)
{
Send, congratulations{Space}
Return
}
else
{
Send, congraulations{Space}
Return
}

:*:congratlations::

if (toggle19 = 1)
{
Send, congratulations{Space}
Return
}
else
{
Send, congratlations{Space}
Return
}

:*:congratuations::

if (toggle19 = 1)
{
Send, congratulations{Space}
Return
}
else
{
Send, congratuations{Space}
Return
}

:*:congratultions::

if (toggle19 = 1)
{
Send, congratulations{Space}
Return
}
else
{
Send, congratultions{Space}
Return
}

:*:congratulaions::

if (toggle19 = 1)
{
Send, congratulations{Space}
Return
}
else
{
Send, congratulaions{Space}
Return
}

:*:congratulatons::

if (toggle19 = 1)
{
Send, congratulations{Space}
Return
}
else
{
Send, congratulatons{Space}
Return
}

:*:congratulatins::

if (toggle19 = 1)
{
Send, congratulations{Space}
Return
}
else
{
Send, congratulatins{Space}
Return
}

:*:congratulatios::

if (toggle19 = 1)
{
Send, congratulations{Space}
Return
}
else
{
Send, congratulatios{Space}
Return
}

:*:congrratulations::

if (toggle19 = 1)
{
Send, congratulations{Space}
Return
}
else
{
Send, congrratulations{Space}
Return
}

:*:conngratulations::

if (toggle19 = 1)
{
Send, congratulations{Space}
Return
}
else
{
Send, conngratulations{Space}
Return
}


; Begin "retrieve" autocorrect

:*:etrieve::

if (toggle20 = 1)
{
Send, retrieve{Space}
Return
}
else
{
Send, etrieve{Space}
Return
}

:*:rtrieve::

if (toggle20 = 1)
{
Send, retrieve{Space}
Return
}
else
{
Send, rtrieve{Space}
Return
}

:*:rerieve::

if (toggle20 = 1)
{
Send, retrieve{Space}
Return
}
else
{
Send, rerieve{Space}
Return
}

:*:retieve::

if (toggle20 = 1)
{
Send, retrieve{Space}
Return
}
else
{
Send, retieve{Space}
Return
}

:*:retreve::

if (toggle20 = 1)
{
Send, retrieve{Space}
Return
}
else
{
Send, retreve{Space}
Return
}

:*:retrive::

if (toggle20 = 1)
{
Send, retrieve{Space}
Return
}
else
{
Send, retrive{Space}
Return
}

:*:rretrieve::

if (toggle20 = 1)
{
Send, retrieve{Space}
Return
}
else
{
Send, rretrieve{Space}
Return
}

:*:reetrieve::

if (toggle20 = 1)
{
Send, retrieve{Space}
Return
}
else
{
Send, reetrieve{Space}
Return
}

:*:rettrieve::

if (toggle20 = 1)
{
Send, retrieve{Space}
Return
}
else
{
Send, rettrieve{Space}
Return
}

:*:retrrieve::

if (toggle20 = 1)
{
Send, retrieve{Space}
Return
}
else
{
Send, retrrieve{Space}
Return
}

:*:retriieve::

if (toggle20 = 1)
{
Send, retrieve{Space}
Return
}
else
{
Send, retriieve{Space}
Return
}

:*:retrieeve::

if (toggle20 = 1)
{
Send, retrieve{Space}
Return
}
else
{
Send, retrieeve{Space}
Return
}

:*:retrievve::

if (toggle20 = 1)
{
Send, retrieve{Space}
Return
}
else
{
Send, retrievve{Space}
Return
}

:*:retrievee::

if (toggle20 = 1)
{
Send, retrieve{Space}
Return
}
else
{
Send, retrievee{Space}
Return
}

:*:ertrieve::

if (toggle20 = 1)
{
Send, retrieve{Space}
Return
}
else
{
Send, ertrieve{Space}
Return
}

:*:rterieve::

if (toggle20 = 1)
{
Send, retrieve{Space}
Return
}
else
{
Send, rterieve{Space}
Return
}

:*:rertieve::

if (toggle20 = 1)
{
Send, retrieve{Space}
Return
}
else
{
Send, rertieve{Space}
Return
}

:*:retireve::

if (toggle20 = 1)
{
Send, retrieve{Space}
Return
}
else
{
Send, retireve{Space}
Return
}

:*:retreive::

if (toggle20 = 1)
{
Send, retrieve{Space}
Return
}
else
{
Send, retreive{Space}
Return
}

:*:retrivee::

if (toggle20 = 1)
{
Send, retrieve{Space}
Return
}
else
{
Send, retrivee{Space}
Return
}

:*:retrieev::

if (toggle20 = 1)
{
Send, retrieve{Space}
Return
}
else
{
Send, retrieev{Space}
Return
}

:*:4etrieve::

if (toggle20 = 1)
{
Send, retrieve{Space}
Return
}
else
{
Send, 4etrieve{Space}
Return
}

:*:5etrieve::

if (toggle20 = 1)
{
Send, retrieve{Space}
Return
}
else
{
Send, 5etrieve{Space}
Return
}

:*:tetrieve::

if (toggle20 = 1)
{
Send, retrieve{Space}
Return
}
else
{
Send, tetrieve{Space}
Return
}

:*:getrieve::

if (toggle20 = 1)
{
Send, retrieve{Space}
Return
}
else
{
Send, getrieve{Space}
Return
}

:*:fetrieve::

if (toggle20 = 1)
{
Send, retrieve{Space}
Return
}
else
{
Send, fetrieve{Space}
Return
}

:*:detrieve::

if (toggle20 = 1)
{
Send, retrieve{Space}
Return
}
else
{
Send, detrieve{Space}
Return
}

:*:rwtrieve::

if (toggle20 = 1)
{
Send, retrieve{Space}
Return
}
else
{
Send, rwtrieve{Space}
Return
}

:*:r3trieve::

if (toggle20 = 1)
{
Send, retrieve{Space}
Return
}
else
{
Send, r3trieve{Space}
Return
}

:*:r4trieve::

if (toggle20 = 1)
{
Send, retrieve{Space}
Return
}
else
{
Send, r4trieve{Space}
Return
}


; Begin "achieve" autocorrect

:*:chieve::

if (toggle21 = 1)
{
Send, achieve{Space}
Return
}
else
{
Send, chieve{Space}
Return
}

:*:ahieve::

if (toggle21 = 1)
{
Send, achieve{Space}
Return
}
else
{
Send, ahieve{Space}
Return
}

:*:acieve::

if (toggle21 = 1)
{
Send, achieve{Space}
Return
}
else
{
Send, acieve{Space}
Return
}

:*:acheve::

if (toggle21 = 1)
{
Send, achieve{Space}
Return
}
else
{
Send, acheve{Space}
Return
}

:*:achive::

if (toggle21 = 1)
{
Send, achieve{Space}
Return
}
else
{
Send, achive{Space}
Return
}

:*:acchieve::

if (toggle21 = 1)
{
Send, achieve{Space}
Return
}
else
{
Send, acchieve{Space}
Return
}

:*:achhieve::

if (toggle21 = 1)
{
Send, achieve{Space}
Return
}
else
{
Send, achhieve{Space}
Return
}



; Begin "initially" autocorrect

:*:nitially::

if (toggle22 = 1)
{
Send, initially{Space}
Return
}
else
{
Send, nitially{Space}
Return
}

:*:iitially::

if (toggle22 = 1)
{
Send, initially{Space}
Return
}
else
{
Send, iitially{Space}
Return
}

:*:intially::

if (toggle22 = 1)
{
Send, initially{Space}
Return
}
else
{
Send, intially{Space}
Return
}

:*:iniially::

if (toggle22 = 1)
{
Send, initially{Space}
Return
}
else
{
Send, iniially{Space}
Return
}

:*:initally::

if (toggle22 = 1)
{
Send, initially{Space}
Return
}
else
{
Send, initally{Space}
Return
}

:*:initialy::

if (toggle22 = 1)
{
Send, initially{Space}
Return
}
else
{
Send, initialy{Space}
Return
}

:*:initialy::

if (toggle22 = 1)
{
Send, initially{Space}
Return
}
else
{
Send, initialy{Space}
Return
}

:*:iinitially::

if (toggle22 = 1)
{
Send, initially{Space}
Return
}
else
{
Send, iinitially{Space}
Return
}

:*:innitially::

if (toggle22 = 1)
{
Send, initially{Space}
Return
}
else
{
Send, innitially{Space}
Return
}

:*:iniitially::

if (toggle22 = 1)
{
Send, initially{Space}
Return
}
else
{
Send, iniitially{Space}
Return
}

:*:inittially::

if (toggle22 = 1)
{
Send, initially{Space}
Return
}
else
{
Send, inittially{Space}
Return
}

:*:initiially::

if (toggle22 = 1)
{
Send, initially{Space}
Return
}
else
{
Send, initiially{Space}
Return
}

:*:initiaally::

if (toggle22 = 1)
{
Send, initially{Space}
Return
}
else
{
Send, initiaally{Space}
Return
}

:*:initiallly::

if (toggle22 = 1)
{
Send, initially{Space}
Return
}
else
{
Send, initiallly{Space}
Return
}

:*:initiallly::

if (toggle22 = 1)
{
Send, initially{Space}
Return
}
else
{
Send, initiallly{Space}
Return
}

:*:initiallyy::

if (toggle22 = 1)
{
Send, initially{Space}
Return
}
else
{
Send, initiallyy{Space}
Return
}

:*:intiially::

if (toggle22 = 1)
{
Send, initially{Space}
Return
}
else
{
Send, intiially{Space}
Return
}

:*:iniitally::

if (toggle22 = 1)
{
Send, initially{Space}
Return
}
else
{
Send, iniitally{Space}
Return
}

:*:initailly::

if (toggle22 = 1)
{
Send, initially{Space}
Return
}
else
{
Send, initailly{Space}
Return
}

:*:initilaly::

if (toggle22 = 1)
{
Send, initially{Space}
Return
}
else
{
Send, initilaly{Space}
Return
}


; Begin "similar" autocorrect

:*:smilar::

if (toggle23 = 1)
{
Send, similar{Space}
Return
}
else
{
Send, smilar{Space}
Return
}

:*:simlar::

if (toggle23 = 1)
{
Send, similar{Space}
Return
}
else
{
Send, simlar{Space}
Return
}

:*:simiar::

if (toggle23 = 1)
{
Send, similar{Space}
Return
}
else
{
Send, simiar{Space}
Return
}

:*:ssimilar::

if (toggle23 = 1)
{
Send, similar{Space}
Return
}
else
{
Send, ssimilar{Space}
Return
}

:*:siimilar::

if (toggle23 = 1)
{
Send, similar{Space}
Return
}
else
{
Send, siimilar{Space}
Return
}

:*:simmilar::

if (toggle23 = 1)
{
Send, similar{Space}
Return
}
else
{
Send, simmilar{Space}
Return
}

:*:simiilar::

if (toggle23 = 1)
{
Send, similar{Space}
Return
}
else
{
Send, simiilar{Space}
Return
}

:*:simillar::

if (toggle23 = 1)
{
Send, similar{Space}
Return
}
else
{
Send, simillar{Space}
Return
}

:*:similaar::

if (toggle23 = 1)
{
Send, similar{Space}
Return
}
else
{
Send, similaar{Space}
Return
}

:*:similarr::

if (toggle23 = 1)
{
Send, similar{Space}
Return
}
else
{
Send, similarr{Space}
Return
}

:*:siimlar::

if (toggle23 = 1)
{
Send, similar{Space}
Return
}
else
{
Send, siimlar{Space}
Return
}

:*:simliar::

if (toggle23 = 1)
{
Send, similar{Space}
Return
}
else
{
Send, simliar{Space}
Return
}


; Begin "proportionate" autocorrect

:*:poportionate::

if (toggle24 = 1)
{
Send, proportionate{Space}
Return
}
else
{
Send, poportionate{Space}
Return
}

:*:prportionate::

if (toggle24 = 1)
{
Send, proportionate{Space}
Return
}
else
{
Send, prportionate{Space}
Return
}


:*:proortionate::

if (toggle24 = 1)
{
Send, proportionate{Space}
Return
}
else
{
Send, proortionate{Space}
Return
}


:*:proprtionate::

if (toggle24 = 1)
{
Send, proportionate{Space}
Return
}
else
{
Send, proprtionate{Space}
Return
}


:*:propotionate::

if (toggle24 = 1)
{
Send, proportionate{Space}
Return
}
else
{
Send, propotionate{Space}
Return
}


:*:proporionate::

if (toggle24 = 1)
{
Send, proportionate{Space}
Return
}
else
{
Send, proporionate{Space}
Return
}


:*:proportinate::

if (toggle24 = 1)
{
Send, proportionate{Space}
Return
}
else
{
Send, proportinate{Space}
Return
}


:*:proportioate::

if (toggle24 = 1)
{
Send, proportionate{Space}
Return
}
else
{
Send, proportioate{Space}
Return
}


:*:proportionte::

if (toggle24 = 1)
{
Send, proportionate{Space}
Return
}
else
{
Send, proportionte{Space}
Return
}


:*:proportionae::

if (toggle24 = 1)
{
Send, proportionate{Space}
Return
}
else
{
Send, proportionae{Space}
Return
}


:*:pproportionate::

if (toggle24 = 1)
{
Send, proportionate{Space}
Return
}
else
{
Send, pproportionate{Space}
Return
}


:*:prroportionate::

if (toggle24 = 1)
{
Send, proportionate{Space}
Return
}
else
{
Send, prroportionate{Space}
Return
}


:*:prooportionate::

if (toggle24 = 1)
{
Send, proportionate{Space}
Return
}
else
{
Send, prooportionate{Space}
Return
}


:*:propportionate::

if (toggle24 = 1)
{
Send, proportionate{Space}
Return
}
else
{
Send, propportionate{Space}
Return
}


:*:propoortionate::

if (toggle24 = 1)
{
Send, proportionate{Space}
Return
}
else
{
Send, propoortionate{Space}
Return
}


:*:proporrtionate::

if (toggle24 = 1)
{
Send, proportionate{Space}
Return
}
else
{
Send, proporrtionate{Space}
Return
}


:*:proporttionate::

if (toggle24 = 1)
{
Send, proportionate{Space}
Return
}
else
{
Send, proporttionate{Space}
Return
}


:*:proportiionate::

if (toggle24 = 1)
{
Send, proportionate{Space}
Return
}
else
{
Send, proportiionate{Space}
Return
}


:*:proportioonate::

if (toggle24 = 1)
{
Send, proportionate{Space}
Return
}
else
{
Send, proportioonate{Space}
Return
}


:*:proportionnate::

if (toggle24 = 1)
{
Send, proportionate{Space}
Return
}
else
{
Send, proportionnate{Space}
Return
}


:*:proportionaate::

if (toggle24 = 1)
{
Send, proportionate{Space}
Return
}
else
{
Send, proportionaate{Space}
Return
}


:*:proportionatte::

if (toggle24 = 1)
{
Send, proportionate{Space}
Return
}
else
{
Send, proportionatte{Space}
Return
}


:*:proportionatee::

if (toggle24 = 1)
{
Send, proportionate{Space}
Return
}
else
{
Send, proportionatee{Space}
Return
}


:*:porportionate::

if (toggle24 = 1)
{
Send, proportionate{Space}
Return
}
else
{
Send, porportionate{Space}
Return
}


:*:prpoortionate::

if (toggle24 = 1)
{
Send, proportionate{Space}
Return
}
else
{
Send, prpoortionate{Space}
Return
}


:*:prooprtionate::

if (toggle24 = 1)
{
Send, proportionate{Space}
Return
}
else
{
Send, prooprtionate{Space}
Return
}


:*:proprotionate::

if (toggle24 = 1)
{
Send, proportionate{Space}
Return
}
else
{
Send, proprotionate{Space}
Return
}


:*:propotrionate::

if (toggle24 = 1)
{
Send, proportionate{Space}
Return
}
else
{
Send, propotrionate{Space}
Return
}


:*:proporitonate::

if (toggle24 = 1)
{
Send, proportionate{Space}
Return
}
else
{
Send, proporitonate{Space}
Return
}


:*:proportoinate::

if (toggle24 = 1)
{
Send, proportionate{Space}
Return
}
else
{
Send, proportoinate{Space}
Return
}


:*:proportinoate::

if (toggle24 = 1)
{
Send, proportionate{Space}
Return
}
else
{
Send, proportinoate{Space}
Return
}


:*:proportioante::

if (toggle24 = 1)
{
Send, proportionate{Space}
Return
}
else
{
Send, proportioante{Space}
Return
}


:*:proportionaet::

if (toggle24 = 1)
{
Send, proportionate{Space}
Return
}
else
{
Send, proportionaet{Space}
Return
}

; Begin "techinique" autocorrect

:*:echnique::

if (toggle25 = 1)
{
Send, techinique{Space}
Return
}
else
{
Send, echnique{Space}
Return
}

:*:tchnique::

if (toggle25 = 1)
{
Send, techinique{Space}
Return
}
else
{
Send, tchnique{Space}
Return
}

:*:tehnique::

if (toggle25 = 1)
{
Send, techinique{Space}
Return
}
else
{
Send, tehnique{Space}
Return
}

:*:tecnique::

if (toggle25 = 1)
{
Send, techinique{Space}
Return
}
else
{
Send, tecnique{Space}
Return
}

:*:technque::

if (toggle25 = 1)
{
Send, techinique{Space}
Return
}
else
{
Send, technque{Space}
Return
}

:*:techniue::

if (toggle25 = 1)
{
Send, techinique{Space}
Return
}
else
{
Send, techniue{Space}
Return
}

:*:techniqe::

if (toggle25 = 1)
{
Send, techinique{Space}
Return
}
else
{
Send, techniqe{Space}
Return
}

:*:ttechnique::

if (toggle25 = 1)
{
Send, techinique{Space}
Return
}
else
{
Send, ttechnique{Space}
Return
}

:*:teechnique::

if (toggle25 = 1)
{
Send, techinique{Space}
Return
}
else
{
Send, teechnique{Space}
Return
}

:*:tecchnique::

if (toggle25 = 1)
{
Send, techinique{Space}
Return
}
else
{
Send, tecchnique{Space}
Return
}

:*:techhnique::

if (toggle25 = 1)
{
Send, techinique{Space}
Return
}
else
{
Send, techhnique{Space}
Return
}

:*:technnique::

if (toggle25 = 1)
{
Send, techinique{Space}
Return
}
else
{
Send, technnique{Space}
Return
}

:*:techniique::

if (toggle25 = 1)
{
Send, techinique{Space}
Return
}
else
{
Send, techniique{Space}
Return
}

:*:techniqque::

if (toggle25 = 1)
{
Send, techinique{Space}
Return
}
else
{
Send, techniqque{Space}
Return
}

:*:techniquue::

if (toggle25 = 1)
{
Send, techinique{Space}
Return
}
else
{
Send, techniquue{Space}
Return
}

:*:techniquee::

if (toggle25 = 1)
{
Send, techinique{Space}
Return
}
else
{
Send, techniquee{Space}
Return
}

:*:etchnique::

if (toggle25 = 1)
{
Send, techinique{Space}
Return
}
else
{
Send, etchnique{Space}
Return
}

:*:tcehnique::

if (toggle25 = 1)
{
Send, techinique{Space}
Return
}
else
{
Send, tcehnique{Space}
Return
}

:*:tecnhique::

if (toggle25 = 1)
{
Send, techinique{Space}
Return
}
else
{
Send, tecnhique{Space}
Return
}

:*:techinque::

if (toggle25 = 1)
{
Send, techinique{Space}
Return
}
else
{
Send, techinque{Space}
Return
}

:*:technqiue::

if (toggle25 = 1)
{
Send, techinique{Space}
Return
}
else
{
Send, technqiue{Space}
Return
}

:*:techniuqe::

if (toggle25 = 1)
{
Send, techinique{Space}
Return
}
else
{
Send, techniuqe{Space}
Return
}

:*:fechnique::

if (toggle25 = 1)
{
Send, techinique{Space}
Return
}
else
{
Send, fechnique{Space}
Return
}

:*:gechnique::

if (toggle25 = 1)
{
Send, techinique{Space}
Return
}
else
{
Send, gechnique{Space}
Return
}

:*:yechnique::

if (toggle25 = 1)
{
Send, techinique{Space}
Return
}
else
{
Send, yechnique{Space}
Return
}

:*:rechnique::

if (toggle25 = 1)
{
Send, techinique{Space}
Return
}
else
{
Send, rechnique{Space}
Return
}

:*:5echnique::

if (toggle25 = 1)
{
Send, techinique{Space}
Return
}
else
{
Send, 5echnique{Space}
Return
}

:*:6echnique::

if (toggle25 = 1)
{
Send, techinique{Space}
Return
}
else
{
Send, 6echnique{Space}
Return
}



; Begin "subtlety" autocorrect

:*:ubtlety::

if (toggle26 = 1)
{
Send, subtlety{Space}
Return
}
else
{
Send, ubtlety{Space}
Return
}

:*:sbtlety::

if (toggle26 = 1)
{
Send, subtlety{Space}
Return
}
else
{
Send, sbtlety{Space}
Return
}

:*:sutlety::

if (toggle26 = 1)
{
Send, subtlety{Space}
Return
}
else
{
Send, sutlety{Space}
Return
}

:*:sublety::

if (toggle26 = 1)
{
Send, subtlety{Space}
Return
}
else
{
Send, sublety{Space}
Return
}

:*:subtety::

if (toggle26 = 1)
{
Send, subtlety{Space}
Return
}
else
{
Send, subtety{Space}
Return
}

:*:subtlty::

if (toggle26 = 1)
{
Send, subtlety{Space}
Return
}
else
{
Send, toggle26{Space}
Return
}

:*:subtley::

if (toggle26 = 1)
{
Send, subtlety{Space}
Return
}
else
{
Send, subtley{Space}
Return
}

:*:ssubtlety::

if (toggle26 = 1)
{
Send, subtlety{Space}
Return
}
else
{
Send, ssubtlety{Space}
Return
}

:*:suubtlety::

if (toggle26 = 1)
{
Send, subtlety{Space}
Return
}
else
{
Send, suubtlety{Space}
Return
}

:*:subbtlety::

if (toggle26 = 1)
{
Send, subtlety{Space}
Return
}
else
{
Send, subbtlety{Space}
Return
}

:*:subttlety::

if (toggle26 = 1)
{
Send, subtlety{Space}
Return
}
else
{
Send, subttlety{Space}
Return
}

:*:subtllety::

if (toggle26 = 1)
{
Send, subtlety{Space}
Return
}
else
{
Send, subbtlety{Space}
Return
}

:*:subtleety::

if (toggle26 = 1)
{
Send, subtlety{Space}
Return
}
else
{
Send, subtleety{Space}
Return
}

:*:subtletty::

if (toggle26 = 1)
{
Send, subtlety{Space}
Return
}
else
{
Send, subtletty{Space}
Return
}

:*:subtletyy::

if (toggle26 = 1)
{
Send, subtlety{Space}
Return
}
else
{
Send, subtletyy{Space}
Return
}

:*:usbtlety::

if (toggle26 = 1)
{
Send, subtlety{Space}
Return
}
else
{
Send, usbtlety{Space}
Return
}

:*:sbutlety::

if (toggle26 = 1)
{
Send, subtlety{Space}
Return
}
else
{
Send, sbutlety{Space}
Return
}

:*:sutblety::

if (toggle26 = 1)
{
Send, subtlety{Space}
Return
}
else
{
Send, sutblety{Space}
Return
}

:*:subltety::

if (toggle26 = 1)
{
Send, subtlety{Space}
Return
}
else
{
Send, subltety{Space}
Return
}

:*:subtelty::

if (toggle26 = 1)
{
Send, subtlety{Space}
Return
}
else
{
Send, subtelty{Space}
Return
}

:*:subtltey::

if (toggle26 = 1)
{
Send, subtlety{Space}
Return
}
else
{
Send, subtltey{Space}
Return
}

:*:subtleyt::

if (toggle26 = 1)
{
Send, subtlety{Space}
Return
}
else
{
Send, subtleyt{Space}
Return
}

:*:aubtlety::

if (toggle26 = 1)
{
Send, subtlety{Space}
Return
}
else
{
Send, aubtlety{Space}
Return
}


; Begin "relevant" autocorrect

:*:elevant::

if (toggle27 = 1)
{
Send, relevant{Space}
Return
}
else
{
Send, elevant{Space}
Return
}

:*:rlevant::

if (toggle27 = 1)
{
Send, relevant{Space}
Return
}
else
{
Send, rlevant{Space}
Return
}

:*:reevant::

if (toggle27 = 1)
{
Send, relevant{Space}
Return
}
else
{
Send, reevant{Space}
Return
}

:*:relvant::

if (toggle27 = 1)
{
Send, relevant{Space}
Return
}
else
{
Send, relvant{Space}
Return
}

:*:releant::

if (toggle27 = 1)
{
Send, relevant{Space}
Return
}
else
{
Send, releant{Space}
Return
}

:*:relevnt::

if (toggle27 = 1)
{
Send, relevant{Space}
Return
}
else
{
Send, relevnt{Space}
Return
}

:*:relevat::

if (toggle27 = 1)
{
Send, relevant{Space}
Return
}
else
{
Send, relevat{Space}
Return
}

:*:rrelevant::

if (toggle27 = 1)
{
Send, relevant{Space}
Return
}
else
{
Send, rrelevant{Space}
Return
}

:*:reelevant::

if (toggle27 = 1)
{
Send, relevant{Space}
Return
}
else
{
Send, reelevant{Space}
Return
}

:*:rellevant::

if (toggle27 = 1)
{
Send, relevant{Space}
Return
}
else
{
Send, rellevant{Space}
Return
}

:*:releevant::

if (toggle27 = 1)
{
Send, relevant{Space}
Return
}
else
{
Send, releevant{Space}
Return
}

:*:relevvant::

if (toggle27 = 1)
{
Send, relevant{Space}
Return
}
else
{
Send, relevvant{Space}
Return
}

:*:relevaant::

if (toggle27 = 1)
{
Send, relevant{Space}
Return
}
else
{
Send, relevaant{Space}
Return
}

:*:relevannt::

if (toggle27 = 1)
{
Send, relevant{Space}
Return
}
else
{
Send, relevannt{Space}
Return
}

:*:relevantt::

if (toggle27 = 1)
{
Send, relevant{Space}
Return
}
else
{
Send, relevantt{Space}
Return
}

:*:erlevant::

if (toggle27 = 1)
{
Send, relevant{Space}
Return
}
else
{
Send, erlevant{Space}
Return
}

:*:rleevant::

if (toggle27 = 1)
{
Send, relevant{Space}
Return
}
else
{
Send, rleevant{Space}
Return
}

:*:reelvant::

if (toggle27 = 1)
{
Send, relevant{Space}
Return
}
else
{
Send, reelvant{Space}
Return
}

:*:relveant::

if (toggle27 = 1)
{
Send, relevant{Space}
Return
}
else
{
Send, relveant{Space}
Return
}

:*:releavnt::

if (toggle27 = 1)
{
Send, relevant{Space}
Return
}
else
{
Send, releavnt{Space}
Return
}

:*:relevnat::

if (toggle27 = 1)
{
Send, relevant{Space}
Return
}
else
{
Send, relevnat{Space}
Return
}

:*:relevatn::

if (toggle27 = 1)
{
Send, relevant{Space}
Return
}
else
{
Send, relevatn{Space}
Return
}


; Begin "receipt" autocorrect

:*:eceipt::

if (toggle28 = 1)
{
Send, receipt{Space}
Return
}
else
{
Send, eceipt{Space}
Return
}

:*:rceipt::

if (toggle28 = 1)
{
Send, receipt{Space}
Return
}
else
{
Send, rceipt{Space}
Return
}

:*:reeipt::

if (toggle28 = 1)
{
Send, receipt{Space}
Return
}
else
{
Send, reeipt{Space}
Return
}

:*:recipt::

if (toggle28 = 1)
{
Send, receipt{Space}
Return
}
else
{
Send, recipt{Space}
Return
}

:*:recept::

if (toggle28 = 1)
{
Send, receipt{Space}
Return
}
else
{
Send, recept{Space}
Return
}

:*:receit::

if (toggle28 = 1)
{
Send, receipt{Space}
Return
}
else
{
Send, receit{Space}
Return
}

:*:rreceipt::

if (toggle28 = 1)
{
Send, receipt{Space}
Return
}
else
{
Send, rreceipt{Space}
Return
}

:*:reeceipt::

if (toggle28 = 1)
{
Send, receipt{Space}
Return
}
else
{
Send, reeceipt{Space}
Return
}

:*:recceipt::

if (toggle28 = 1)
{
Send, receipt{Space}
Return
}
else
{
Send, recceipt{Space}
Return
}

:*:receeipt::

if (toggle28 = 1)
{
Send, receipt{Space}
Return
}
else
{
Send, receeipt{Space}
Return
}

:*:receiipt::

if (toggle28 = 1)
{
Send, receipt{Space}
Return
}
else
{
Send, receiipt{Space}
Return
}

:*:receippt::

if (toggle28 = 1)
{
Send, receipt{Space}
Return
}
else
{
Send, receippt{Space}
Return
}

:*:receiptt::

if (toggle28 = 1)
{
Send, receipt{Space}
Return
}
else
{
Send, receiptt{Space}
Return
}

:*:erceipt::

if (toggle28 = 1)
{
Send, receipt{Space}
Return
}
else
{
Send, erceipt{Space}
Return
}

:*:rceeipt::

if (toggle28 = 1)
{
Send, receipt{Space}
Return
}
else
{
Send, rceeipt{Space}
Return
}

:*:reecipt::

if (toggle28 = 1)
{
Send, receipt{Space}
Return
}
else
{
Send, reecipt{Space}
Return
}

:*:reciept::

if (toggle28 = 1)
{
Send, receipt{Space}
Return
}
else
{
Send, reciept{Space}
Return
}

:*:recepit::

if (toggle28 = 1)
{
Send, receipt{Space}
Return
}
else
{
Send, recepit{Space}
Return
}

:*:receitp::

if (toggle28 = 1)
{
Send, receipt{Space}
Return
}
else
{
Send, receitp{Space}
Return
}

:*:eeceipt::

if (toggle28 = 1)
{
Send, receipt{Space}
Return
}
else
{
Send, eeceipt{Space}
Return
}

:*:4eceipt::

if (toggle28 = 1)
{
Send, receipt{Space}
Return
}
else
{
Send, 4eceipt{Space}
Return
}

:*:5eceipt::

if (toggle28 = 1)
{
Send, receipt{Space}
Return
}
else
{
Send, 5eceipt{Space}
Return
}

:*:teceipt::

if (toggle28 = 1)
{
Send, receipt{Space}
Return
}
else
{
Send, teceipt{Space}
Return
}

:*:geceipt::

if (toggle28 = 1)
{
Send, receipt{Space}
Return
}
else
{
Send, geceipt{Space}
Return
}


; Begin "underneath" autocorrect

:*:nderneath::

if (toggle29 = 1)
{
Send, underneath{Space}
Return
}
else
{
Send, nderneath{Space}
Return
}


:*:uderneath::

if (toggle29 = 1)
{
Send, underneath{Space}
Return
}
else
{
Send, uderneath{Space}
Return
}

:*:unerneath::

if (toggle29 = 1)
{
Send, underneath{Space}
Return
}
else
{
Send, unerneath{Space}
Return
}

:*:undrneath::

if (toggle29 = 1)
{
Send, underneath{Space}
Return
}
else
{
Send, undrneath{Space}
Return
}

:*:undeneath::

if (toggle29 = 1)
{
Send, underneath{Space}
Return
}
else
{
Send, undeneath{Space}
Return
}

:*:undereath::

if (toggle29 = 1)
{
Send, underneath{Space}
Return
}
else
{
Send, undeneath{Space}
Return
}

:*:undernath::

if (toggle29 = 1)
{
Send, underneath{Space}
Return
}
else
{
Send, undernath{Space}
Return
}

:*:underneth::

if (toggle29 = 1)
{
Send, underneath{Space}
Return
}
else
{
Send, underneth{Space}
Return
}

:*:underneah::

if (toggle29 = 1)
{
Send, underneath{Space}
Return
}
else
{
Send, underneah{Space}
Return
}

:*:uunderneath::

if (toggle29 = 1)
{
Send, underneath{Space}
Return
}
else
{
Send, uunderneath{Space}
Return
}

:*:unnderneath::

if (toggle29 = 1)
{
Send, underneath{Space}
Return
}
else
{
Send, unnderneath{Space}
Return
}

:*:undderneath::

if (toggle29 = 1)
{
Send, underneath{Space}
Return
}
else
{
Send, undderneath{Space}
Return
}

:*:underrneath::

if (toggle29 = 1)
{
Send, underneath{Space}
Return
}
else
{
Send, underrneath{Space}
Return
}

:*:undeerneath::

if (toggle29 = 1)
{
Send, underneath{Space}
Return
}
else
{
Send, undeerneath{Space}
Return
}

:*:undernneath::

if (toggle29 = 1)
{
Send, underneath{Space}
Return
}
else
{
Send, undernneath{Space}
Return
}

:*:underneeath::

if (toggle29 = 1)
{
Send, underneath{Space}
Return
}
else
{
Send, underneeath{Space}
Return
}

:*:underneaath::

if (toggle29 = 1)
{
Send, underneath{Space}
Return
}
else
{
Send, underneaath{Space}
Return
}

:*:underneatth::

if (toggle29 = 1)
{
Send, underneath{Space}
Return
}
else
{
Send, underneatth{Space}
Return
}

:*:underneathh::

if (toggle29 = 1)
{
Send, underneath{Space}
Return
}
else
{
Send, underneathh{Space}
Return
}

:*:nuderneath::

if (toggle29 = 1)
{
Send, underneath{Space}
Return
}
else
{
Send, nuderneath{Space}
Return
}

:*:udnerneath::

if (toggle29 = 1)
{
Send, underneath{Space}
Return
}
else
{
Send, udnerneath{Space}
Return
}

:*:unedrneath::

if (toggle29 = 1)
{
Send, underneath{Space}
Return
}
else
{
Send, unedrneath{Space}
Return
}

:*:undreneath::

if (toggle29 = 1)
{
Send, underneath{Space}
Return
}
else
{
Send, undreneath{Space}
Return
}

:*:undenreath::

if (toggle29 = 1)
{
Send, underneath{Space}
Return
}
else
{
Send, undenreath{Space}
Return
}

:*:underenath::

if (toggle29 = 1)
{
Send, underneath{Space}
Return
}
else
{
Send, underenath{Space}
Return
}

:*:undernaeth::

if (toggle29 = 1)
{
Send, underneath{Space}
Return
}
else
{
Send, undernaeth{Space}
Return
}

:*:undernetah::

if (toggle29 = 1)
{
Send, underneath{Space}
Return
}
else
{
Send, undernetah{Space}
Return
}

:*:underneaht::

if (toggle29 = 1)
{
Send, underneath{Space}
Return
}
else
{
Send, underneaht{Space}
Return
}

:*:ynderneath::

if (toggle29 = 1)
{
Send, underneath{Space}
Return
}
else
{
Send, ynderneath{Space}
Return
}

:*:7nderneath::

if (toggle29 = 1)
{
Send, underneath{Space}
Return
}
else
{
Send, 7nderneath{Space}
Return
}

:*:8nderneath::

if (toggle29 = 1)
{
Send, underneath{Space}
Return
}
else
{
Send, 8nderneath{Space}
Return
}

:*:inderneath::

if (toggle29 = 1)
{
Send, underneath{Space}
Return
}
else
{
Send, inderneath{Space}
Return
}

:*:knderneath::

if (toggle29 = 1)
{
Send, underneath{Space}
Return
}
else
{
Send, knderneath{Space}
Return
}

:*:jnderneath::

if (toggle29 = 1)
{
Send, underneath{Space}
Return
}
else
{
Send, jnderneath{Space}
Return
}

:*:hnderneath::

if (toggle29 = 1)
{
Send, underneath{Space}
Return
}
else
{
Send, hnderneath{Space}
Return
}

:*:ou're::

if (toggle30 = 1)
{
Send, you're{Space}
Return
}
else
{
Send, ou're{Space}
Return
}

:*:yu're::

if (toggle30 = 1)
{
Send, you're{Space}
Return
}
else
{
Send, yu're{Space}
Return
}

:*:yo're::

if (toggle30 = 1)
{
Send, you're{Space}
Return
}
else
{
Send, yo're{Space}
Return
}

:*:youre::

if (toggle30 = 1)
{
Send, you're{Space}
Return
}
else
{
Send, youre{Space}
Return
}

:*:you'e::

if (toggle30 = 1)
{
Send, you're{Space}
Return
}
else
{
Send, you'e{Space}
Return
}

:*:shrt::

if (toggle31 = 1)
{
Send, shirt{Space}
Return
}
else
{
Send, shrt{Space}
Return
}

:*:navailable::

if (toggle32 = 1)
{
Send, unavailable{Space}
Return
}
else
{
Send, navailable{Space}
Return
}

:*:uavailable::

if (toggle32 = 1)
{
Send, unavailable{Space}
Return
}
else
{
Send, uavailable{Space}
Return
}

:*:unvailable::

if (toggle32 = 1)
{
Send, unavailable{Space}
Return
}
else
{
Send, unvailable{Space}
Return
}

:*:unaailable::

if (toggle32 = 1)
{
Send, unavailable{Space}
Return
}
else
{
Send, unaailable{Space}
Return
}

:*:unavilable::

if (toggle32 = 1)
{
Send, unavailable{Space}
Return
}
else
{
Send, unavilable{Space}
Return
}

:*:unavalable::

if (toggle32 = 1)
{
Send, unavailable{Space}
Return
}
else
{
Send, unavalable{Space}
Return
}

:*:unavaiable::

if (toggle32 = 1)
{
Send, unavailable{Space}
Return
}
else
{
Send, unavaiable{Space}
Return
}

:*:unavailble::

if (toggle32 = 1)
{
Send, unavailable{Space}
Return
}
else
{
Send, unavailble{Space}
Return
}

:*:unavailale::

if (toggle32 = 1)
{
Send, unavailable{Space}
Return
}
else
{
Send, unavailale{Space}
Return
}

:*:unavailabe::

if (toggle32 = 1)
{
Send, unavailable{Space}
Return
}
else
{
Send, unavailabe{Space}
Return
}

:*:unavailabl::

if (toggle32 = 1)
{
Send, unavailable{Space}
Return
}
else
{
Send, unavailabl{Space}
Return
}

:*:unavialble::

if (toggle32 = 1)
{
Send, unavailable{Space}
Return
}
else
{
Send, unavialble{Space}
Return
}


!^+J::
reload
Return