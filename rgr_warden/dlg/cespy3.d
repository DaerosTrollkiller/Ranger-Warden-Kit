EXTEND_BOTTOM BOTSMITH 4
  IF ~OR(3)
	  PartyHasItem("dtkwdxb1")~ THEN GOTO DTKNewItemCespy 	
  IF ~PartyHasItem("dtkwdxb2")~ THEN GOTO DTKNewItemCespy
  IF ~PartyHasItem("dtkwdxb1")
	  PartyHasItem("dtkwdxb2")~ THEN GOTO DTKNewItemCespy  // Neelder +3 (recharge)
END

APPEND BOTSMITH              

  IF ~~ THEN BEGIN DTKNewItemCespy SAY @6032
    IF ~OR(3)
		PartyHasItem("dtkwdxb1")~ THEN GOTO DTKNewItemCespy2
	IF ~PartyHasItem("dtkwdxb2")~ THEN GOTO DTKNewItemCespy3
	IF ~PartyHasItem("dtkwdxb1")
		PartyHasItem("dtkwdxb2")~ THEN GOTO DTKNewItemCespy3
  END


  IF ~~ THEN BEGIN DTKNewItemCespy2 SAY @6033
    IF ~PartyGoldLT(10000)~ THEN REPLY #66908 GOTO 10
    IF ~PartyGoldGT(9999)~ THEN REPLY #66909 DO ~SetGlobal("DTKForgeItemCespy","GLOBAL",3)
                                                 TakePartyGold(10000)
                                                 TakePartyItemNum("dtkwdxb1",1)
                                                 DestroyItem("dtkwdxb1")
                                                 DestroyGold(10000)~ GOTO 11
    IF ~~ THEN REPLY #66910 GOTO DTKNewItemCespy_stall
  END
  
  IF ~~ THEN BEGIN DTKNewItemCespy3 SAY @6033
    IF ~PartyGoldLT(10000)~ THEN REPLY #66908 GOTO 10
    IF ~PartyGoldGT(9999)~ THEN REPLY #66909 DO ~SetGlobal("DTKForgeItemCespy","GLOBAL",3)
                                                 TakePartyGold(10000)
                                                 TakePartyItemNum("dtkwdxb2",1)
                                                 DestroyItem("dtkwdxb2")
                                                 DestroyGold(10000)~ GOTO 11
    IF ~~ THEN REPLY #66910 GOTO DTKNewItemCespy_stall
  END

  IF ~~ THEN BEGIN DTKNewItemCespy_stall SAY @6029
    COPY_TRANS BOTSMITH 4
  END

END                                            
