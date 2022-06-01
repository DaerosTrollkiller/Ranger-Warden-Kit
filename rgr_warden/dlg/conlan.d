EXTEND_BOTTOM DCONLAN 0
    IF ~OR(6)
	  Global("DTKNeedlerRefill","MYAREA",0)
	  PartyHasItem("dtkwdxb1")~ THEN REPLY @6034 DO ~SetGlobal("DTKNeedlerRefill","MYAREA",1)~ GOTO DTKNeedlerFix 	
  IF ~Global("DTKNeedlerRefill","MYAREA",0)
	  PartyHasItem("dtkwdxb2")~ THEN REPLY @6034 DO ~SetGlobal("DTKNeedlerRefill","MYAREA",1)~ GOTO DTKNeedlerFix
  IF ~Global("DTKNeedlerRefill","MYAREA",0)
	  PartyHasItem("dtkwdxb1")
	  PartyHasItem("dtkwdxb2")~ THEN REPLY @6034 DO ~SetGlobal("DTKNeedlerRefill","MYAREA",1)~ GOTO DTKNeedlerFix
  IF ~Global("DTKNeedlerRefill","MYAREA",1)
	  PartyHasItem("dtkwdxb1")~ THEN REPLY @6040 GOTO DTKNeedlerFix3 	
  IF ~Global("DTKNeedlerRefill","MYAREA",1)
	  PartyHasItem("dtkwdxb2")~ THEN REPLY @6040 GOTO DTKNeedlerFix3
  IF ~Global("DTKNeedlerRefill","MYAREA",1)
	  PartyHasItem("dtkwdxb1")
	  PartyHasItem("dtkwdxb2")~ THEN REPLY @6040 GOTO DTKNeedlerFix3
END

EXTEND_BOTTOM DCONLAN 1
    IF ~OR(6)
	  Global("DTKNeedlerRefill","MYAREA",0)
	  PartyHasItem("dtkwdxb1")~ THEN REPLY @6034 DO ~SetGlobal("DTKNeedlerRefill","MYAREA",1)~ GOTO DTKNeedlerFix 	
  IF ~Global("DTKNeedlerRefill","MYAREA",0)
	  PartyHasItem("dtkwdxb2")~ THEN REPLY @6034 DO ~SetGlobal("DTKNeedlerRefill","MYAREA",1)~ GOTO DTKNeedlerFix
  IF ~Global("DTKNeedlerRefill","MYAREA",0)
	  PartyHasItem("dtkwdxb1")
	  PartyHasItem("dtkwdxb2")~ THEN REPLY @6034 DO ~SetGlobal("DTKNeedlerRefill","MYAREA",1)~ GOTO DTKNeedlerFix
  IF ~Global("DTKNeedlerRefill","MYAREA",1)
	  PartyHasItem("dtkwdxb1")~ THEN REPLY @6040 GOTO DTKNeedlerFix3 	
  IF ~Global("DTKNeedlerRefill","MYAREA",1)
	  PartyHasItem("dtkwdxb2")~ THEN REPLY @6040 GOTO DTKNeedlerFix3
  IF ~Global("DTKNeedlerRefill","MYAREA",1)
	  PartyHasItem("dtkwdxb1")
	  PartyHasItem("dtkwdxb2")~ THEN REPLY @6040 GOTO DTKNeedlerFix3
END

APPEND DCONLAN
  IF ~~ THEN BEGIN DTKNeedlerFix SAY @6035
	IF ~~ THEN GOTO DTKNeedlerFix2
  END
  
  IF ~~ THEN BEGIN DTKNeedlerFix2 SAY @6036
    IF ~~ THEN REPLY @6037 GOTO DTKNeedlerFix3
  END
    

  IF ~~ THEN BEGIN DTKNeedlerFix3 SAY @6038
    IF ~PartyGoldLT(5000)~ THEN REPLY #40458 GOTO 37
    IF ~OR(3)
		PartyHasItem("dtkwdxb1")
		PartyGoldGT(4999)~ THEN REPLY @6039 DO ~TakePartyGold(5000)
                                                 TakePartyItemNum("dtkwdxb1",1)
                                                 DestroyItem("dtkwdxb1")
                                                 DestroyGold(5000)
												 SetGlobal("DTKNeedlerRefill","MYAREA",2)
												 SetGlobalTimer("DTKNeedlerRefillTimer","MYAREA",FOUR_DAYS)~ GOTO DTKCONLANJOB1
	IF ~PartyHasItem("dtkwdxb2")
		PartyGoldGT(4999)~ THEN REPLY @6039 DO ~TakePartyGold(5000)
                                                 TakePartyItemNum("dtkwdxb2",1)
                                                 DestroyItem("dtkwdxb2")
                                                 DestroyGold(5000)
												 SetGlobal("DTKNeedlerRefill","MYAREA",2)
												 SetGlobalTimer("DTKNeedlerRefillTimer","MYAREA",FOUR_DAYS)~ GOTO DTKCONLANJOB1
	IF ~PartyHasItem("dtkwdxb1")
		PartyHasItem("dtkwdxb2")
		PartyGoldGT(4999)~ THEN REPLY @6039 DO ~TakePartyGold(5000)
                                                 TakePartyItemNum("dtkwdxb2",1)
                                                 DestroyItem("dtkwdxb2")
                                                 DestroyGold(5000)
												 SetGlobal("DTKNeedlerRefill","MYAREA",2)
												 SetGlobalTimer("DTKNeedlerRefillTimer","MYAREA",FOUR_DAYS)~ GOTO DTKCONLANJOB1

    IF ~~ THEN REPLY #40450 GOTO 38
  END
  
  IF ~~ THEN BEGIN DTKCONLANJOB1 SAY @6041
  IF ~~ THEN GOTO 44
  END
  
  IF ~Global("DTKNeedlerRefill","MYAREA",2)
	GlobalTimerExpired("DTKNeedlerRefillTimer","MYAREA")
	Global("Kuldahar_Murder","GLOBAL",0)
	OR(2)
	!GlobalGT("Sheemish_Escape","GLOBAL",1)
	!Global("Conlan_Thanked","GLOBAL",0)~ THEN BEGIN DTKNeedlerFixxed1 
  SAY @6042
  IF ~~ THEN GOTO DTKNeedlerFixxed2
  END

IF ~~ THEN BEGIN DTKNeedlerFixxed2
  SAY @6043
  IF ~~ THEN DO ~SetGlobal("DTKNeedlerRefill","MYAREA",1)
GiveItemCreate("dtkwdxb1",LastTalkedToBy,80,0,0)~ GOTO 44
END
   
END