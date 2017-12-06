Scriptname DSC01_PlayerHouseMannequin extends ReferenceAlias

Keyword Property DSC01_FurnitureMarkerKeyword Auto

EVENT OnLoad()
    Log("OnLoad fired")
    CheckStatus()
EndEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
    Log("OnItemAdded fired")
    Log(akBaseItem)
    Log("Items in inventory " + self.GetRef().GetItemCount(akBaseItem))
    CheckStatus()
EndEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
    Log("OnItemRemoved fired")
    Log("Items in inventory " + self.GetRef().GetItemCount(akBaseItem))
    CheckStatus()
EndEvent

Event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)
    Log("OnObjectUnequipped fired")
    Log("Items in inventory " + self.GetRef().GetItemCount(akBaseObject))
    CheckStatus()
EndEvent

Function CheckStatus()
    Log("Mannequin checking status")
EndFunction

Function Log(String msg, String modname="DSC")
    Debug.Trace("[" + modname + "] " + self + " " + msg)
EndFunction