EXTEND_BOTTOM WSMITH01 13
IF ~PartyHasItem("dtkwdar1")~ THEN GOTO NewItem 	//Forest Stalker's Bramblecoat +3 upgrade to +4
END

APPEND WSMITH01
IF ~~ THEN BEGIN NewItem SAY @6005
IF ~!PartyHasItem("dtkdbark")~ THEN GOTO NewItem1
IF ~!PartyHasItem("dtkbark")~ THEN GOTO NewItem1
IF ~PartyHasItem("dtkdbark")~ THEN GOTO NewItem2
IF ~PartyHasItem("dtkbark")~ THEN GOTO NewItem3
END

IF ~~ THEN BEGIN NewItem1 SAY @6006
IF ~~ THEN GOTO NoThanks
END

IF ~~ THEN BEGIN NewItem2 SAY @6007
		IF ~~ THEN REPLY @6014 DO ~TakePartyItemNum("dtkdbark",1)
		DestroyItem("dtkdbark")
		DisplayStringHead(Myself,@6008)~ GOTO NoThanks
		END
		
IF ~~ THEN BEGIN NewItem3 SAY @6009
    IF ~PartyGoldLT(5000)~ THEN REPLY #67011 GOTO NoThanks
    IF ~PartyGoldGT(4999)~ THEN REPLY #67012 DO ~SetGlobal("DTKItems","ar0334",1)
                                                 SetGlobal("ForgeStuff","GLOBAL",1)
                                                 TakePartyGold(5000)
                                                 TakePartyItemNum("dtkwdar1",1)
                                                 TakePartyItemNum("dtkbark",1)
                                                 DestroyItem("dtkwdar1")
                                                 DestroyItem("dtkbark")
                                                 DestroyGold(5000)~ GOTO 56
    IF ~~ THEN REPLY #67013 GOTO NoThanks
  END

IF ~~ THEN BEGIN NoThanks SAY @6013
COPY_TRANS WSMITH01 13
END
END