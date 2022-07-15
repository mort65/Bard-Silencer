Scriptname zzzmrt_bardSilencer_PlayerScript extends ReferenceAlias 

Quest Property BardSongs Auto
Actor Property Player Auto
Keyword Property LocTypeInn Auto
GlobalVariable Property ShutupBard Auto

Event OnPlayerLoadGsame()
	If (ShutupBard.GetValueInt() == 1)
		RegisterForSingleUpdate(3.0)
	EndIf
EndEvent

Event OnInit()
	If (ShutupBard.GetValueInt() == 1)
		RegisterForSingleUpdate(3.0)
	EndIf
EndEvent

Event OnUpdate()
	Location PlayerLoc = Player.GetCurrentLocation()
	If (PlayerLoc != None && PlayerLoc.HasKeyword(LocTypeInn))
		(BardSongs as BardSongsScript).StopAllSongs()
		RegisterForSingleUpdate(3.0)
	EndIf
EndEvent

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	If (ShutupBard.GetValueInt() == 1)
		If (akNewLoc != None && akNewLoc.HasKeyword(LocTypeInn))
			(BardSongs as BardSongsScript).StopAllSongs()
			RegisterForSingleUpdate(3.0)
		EndIf
	EndIf
EndEvent