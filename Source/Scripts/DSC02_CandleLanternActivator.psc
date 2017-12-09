Scriptname DSC02_CandleLanternActivator extends ReferenceAlias

ObjectReference Property SourceLight Auto
ReferenceAlias Property ActivatorAlias Auto
ObjectReference[] Property OtherObjList Auto

Event OnActivate(ObjectReference akActionRef)
    If akActionRef == Game.GetPlayer() ; This condition ensures that only the player will trigger this code
        ToggleObj(SourceLight)
        ToggleListObj(OtherObjList)
        self.GetRef().Disable()
        ActivatorAlias.GetRef().Enable()
    EndIf
EndEvent

Function ToggleObj(ObjectReference obj)
    If (obj.IsDisabled())
        obj.Enable()
    Else
        obj.Disable()
    EndIf
EndFunction

Function ToggleListObj(ObjectReference[] objList)
    int i = 0
    While i < objList.Length
        If !ToggleObj(objList[i])
            return
        EndIf
        i += 1
    EndWhile
EndFunction