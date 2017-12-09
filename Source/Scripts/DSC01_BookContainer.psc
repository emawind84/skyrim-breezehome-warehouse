Scriptname DSC01_BookContainer extends DSC01_FurnitureReference

Event OnLoad()
    parent.OnLoad()  ; call the OnLoad on DSC01_FurnitureReference!
    Log("OnLoad fired")
    CheckStatus()
EndEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
    CheckStatus()
EndEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
    CheckStatus()
EndEvent

Function CheckStatus()
    int iBookCount = (self as PlayerBookShelfContainerScript).CurrentBookAmount
    Log("Current book amount " + iBookCount)
    self.Locked = iBookCount > 0

    ; change marker locked
    DSC01_FurnitureMarker marker = objref.GetLinkedRef(DSC01_FurnitureMarkerKeyword) as DSC01_FurnitureMarker
    If marker
        marker.SetLocked(self.Locked)
    EndIf

EndFunction