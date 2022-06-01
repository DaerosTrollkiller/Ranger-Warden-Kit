// extend cespenar's generic item search with cromwell's items
EXTEND_BOTTOM BOTSMITH 4
  IF ~PartyHasItem("dtkwdar1")~ THEN GOTO DTKNewItemCespy // Forest Stalker's Bramblecoat +4
END

APPEND BOTSMITH              

  IF ~~ THEN BEGIN DTKNewItemCespy SAY @6020
    IF ~!PartyHasItem("dtkdbark")~ THEN GOTO DTKNewItemCespy1
	IF ~!PartyHasItem("dtkbark")~ THEN GOTO DTKNewItemCespy1
	IF ~PartyHasItem("dtkdbark")~ THEN GOTO DTKNewItemCespy2
	IF ~PartyHasItem("dtkbark")~ THEN GOTO DTKNewItemCespy3
  END
  
  IF ~~ THEN BEGIN DTKNewItemCespy1 SAY @6021
    COPY_TRANS BOTSMITH 4
  END

IF ~~ THEN BEGIN DTKNewItemCespy2 SAY @6022
		IF ~~ THEN REPLY @6025 DO ~TakePartyItemNum("dtkdbark",1)
		DestroyItem("dtkdbark")~ GOTO DTKNewItemCespy_stall
		END

  IF ~~ THEN BEGIN DTKNewItemCespy3 SAY @6023
    IF ~PartyGoldLT(5000)~ THEN REPLY #66908 GOTO 10
    IF ~PartyGoldGT(4999)~ THEN REPLY #66909 DO ~SetGlobal("DTKForgeItemCespy","GLOBAL",1)
                                                 TakePartyGold(5000)
                                                 TakePartyItemNum("dtkwdar1",1)
                                                 DestroyItem("dtkwdar1")
                                                 TakePartyItemNum("dtkbark",1)
                                                 DestroyItem("dtkbark")
                                                 DestroyGold(5000)~ GOTO 11
    IF ~~ THEN REPLY #66910 GOTO DTKNewItemCespy_stall
  END

  IF ~~ THEN BEGIN DTKNewItemCespy_stall SAY @6024
    COPY_TRANS BOTSMITH 4
  END

END                                            
