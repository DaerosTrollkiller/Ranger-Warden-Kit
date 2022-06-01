EXTEND_BOTTOM WSMITH01 13
  IF ~PartyHasItem("dtkwdar2")~ THEN GOTO NewItem 	//Forest Stalker's Bramblecoat +5
END
  
APPEND WSMITH01
  IF ~~ THEN BEGIN NewItem SAY @6016
    IF ~!PartyHasItem("dtkamfg")~ THEN GOTO NewItem2
    IF ~PartyHasItem("dtkamfg")~ THEN GOTO NewItem3
  END

  IF ~~ THEN BEGIN NewItem2 SAY @6017
    IF ~~ THEN GOTO NoThanks
  END
  
  IF ~~ THEN BEGIN NewItem3 SAY @6018
    IF ~PartyGoldLT(8000)~ THEN REPLY #67011 GOTO NoThanks
    IF ~PartyGoldGT(7999)~ THEN REPLY #67012 DO ~SetGlobal("DTKItems","ar0334",2)
                                                 SetGlobal("ForgeStuff","GLOBAL",1)
                                                 TakePartyGold(8000)
                                                 TakePartyItemNum("dtkwdar2",1)
                                                 TakePartyItemNum("dtkamfg",1)
                                                 DestroyItem("dtkwdar2")
                                                 DestroyItem("dtkamfg")
                                                 DestroyGold(8000)~ GOTO 56
    IF ~~ THEN REPLY #67013 GOTO NoThanks
  END
  
  IF ~~ THEN BEGIN NoThanks SAY @6019
   COPY_TRANS WSMITH01 13
  END
END