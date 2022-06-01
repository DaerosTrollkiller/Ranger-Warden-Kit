EXTEND_BOTTOM WSMITH01 13  //Needler +3 Recharge
  IF ~OR(3)
	  PartyHasItem("dtkwdxb1")~ THEN GOTO NewItem 	
  IF ~PartyHasItem("dtkwdxb2")~ THEN GOTO NewItem
  IF ~PartyHasItem("dtkwdxb1")
	  PartyHasItem("dtkwdxb2")~ THEN GOTO NewItem
END
  
APPEND WSMITH01
  IF ~~ THEN BEGIN NewItem SAY @6030
    IF ~OR(3)
		PartyHasItem("dtkwdxb1")~ THEN GOTO NewItem2
	IF ~PartyHasItem("dtkwdxb2")~ THEN GOTO NewItem3
	IF ~PartyHasItem("dtkwdxb1")
		PartyHasItem("dtkwdxb2")~ THEN GOTO NewItem3
  END
  
  IF ~~ THEN BEGIN NewItem2 SAY @6031
    IF ~PartyGoldLT(10000)~ THEN REPLY #67011 GOTO NoThanks
    IF ~PartyGoldGT(9999)~ THEN REPLY #67012 DO ~SetGlobal("DTKItems","ar0334",3)
                                                 SetGlobal("ForgeStuff","GLOBAL",1)
                                                 TakePartyGold(10000)
                                                 TakePartyItemNum("dtkwdxb1",1)
                                                 DestroyItem("dtkwdxb1")
                                                 DestroyGold(10000)~ GOTO 56
    IF ~~ THEN REPLY #67013 GOTO NoThanks
  END
  
    IF ~~ THEN BEGIN NewItem3 SAY @6031
    IF ~PartyGoldLT(10000)~ THEN REPLY #67011 GOTO NoThanks
    IF ~PartyGoldGT(9999)~ THEN REPLY #67012 DO ~SetGlobal("DTKItems","ar0334",3)
                                                 SetGlobal("ForgeStuff","GLOBAL",1)
                                                 TakePartyGold(10000)
                                                 TakePartyItemNum("dtkwdxb2",1)
                                                 DestroyItem("dtkwdxb2")
                                                 DestroyGold(10000)~ GOTO 56
    IF ~~ THEN REPLY #67013 GOTO NoThanks
  END
  
  IF ~~ THEN BEGIN NoThanks SAY @6019
   COPY_TRANS WSMITH01 13
  END
END