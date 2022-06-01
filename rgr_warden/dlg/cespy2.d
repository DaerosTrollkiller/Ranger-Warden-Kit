// extend cespenar's generic item search with cromwell's items
EXTEND_BOTTOM BOTSMITH 4
  IF ~PartyHasItem("dtkwdar2")~ THEN GOTO DTKNewItemCespy // Forest Stalker's Bramblecoat +5
END

APPEND BOTSMITH              

  IF ~~ THEN BEGIN DTKNewItemCespy SAY @6026
    IF ~!PartyHasItem("dtkamfg")~ THEN GOTO need_DTKNewItemCespy
    IF ~PartyHasItem("dtkamfg")~ THEN GOTO DTKNewItemCespy_want
  END

  IF ~~ THEN BEGIN need_DTKNewItemCespy SAY @6027
    COPY_TRANS BOTSMITH 4
  END

  IF ~~ THEN BEGIN DTKNewItemCespy_want SAY @6028
    IF ~PartyGoldLT(8000)~ THEN REPLY #66908 GOTO 10
    IF ~PartyGoldGT(7999)~ THEN REPLY #66909 DO ~SetGlobal("DTKForgeItemCespy","GLOBAL",2)
                                                 TakePartyGold(8000)
                                                 TakePartyItemNum("dtkwdar2",1)
                                                 DestroyItem("dtkwdar2")
                                                 TakePartyItemNum("dtkamfg",1)
                                                 DestroyItem("dtkamfg")
                                                 DestroyGold(8000)~ GOTO 11
    IF ~~ THEN REPLY #66910 GOTO DTKNewItemCespy_stall
  END

  IF ~~ THEN BEGIN DTKNewItemCespy_stall SAY @6029
    COPY_TRANS BOTSMITH 4
  END

END                                            
