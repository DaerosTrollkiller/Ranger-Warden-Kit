ALTER_TRANS KNIGHT
BEGIN 1 
END
BEGIN 0
END
BEGIN
"ACTION" ~TakePartyItem("MISC82")  // Ancient Armor
SetGlobal("bd_knight_quest","GLOBAL",1)
AddexperienceParty(1500)
EraseJournalEntry(27213)  // Ghostly Knights in Firewine Some odd ghostly knights in the Firewine ruins said something about not being able to leave until "all are one." Perhaps one of their number went missing ages ago?
ActionOverride("Knight1",DestroySelf())
ActionOverride("Knight2",DestroySelf())
ActionOverride("Knight3",DestroySelf())
ActionOverride("Knight4",DestroySelf())
ActionOverride("Knight5",DestroySelf())
ActionOverride("Knight6",DestroySelf())
"SOLVED_JOURNAL" ~@6000~
END

REPLACE_SAY KNIGHT 1 @8001



