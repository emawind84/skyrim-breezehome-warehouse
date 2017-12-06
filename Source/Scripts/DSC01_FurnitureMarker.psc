Scriptname DSC01_FurnitureMarker extends DSC01_FurnitureReference

FormList Property FurnitureList Auto

Function RegisterFurniture(DSC01_FurnitureReference akReference)
    If FurnitureList
        FurnitureList.AddForm(akReference)
        SetLocked()  ; check the furniture locked flag and lock myself if required
        Log("Registered furniture " + akReference)
    EndIf
EndFunction

Function SetLocked(bool abLock=false)
    bool bLocked = false

    If FurnitureList
        int iIndex = FurnitureList.GetSize()
        while iIndex
            iIndex -= 1
            DSC01_FurnitureReference kReference = FurnitureList.GetAt(iIndex) as DSC01_FurnitureReference
            bLocked = bLocked || kReference.Locked
        EndWhile
    EndIf

    If bLocked
        self.Locked = TRUE
    Else
        self.Locked = abLock
    EndIf
    Log("Marker locked " + self.Locked)
EndFunction
