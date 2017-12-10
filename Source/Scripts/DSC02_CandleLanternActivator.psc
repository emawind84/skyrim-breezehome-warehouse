Scriptname DSC02_CandleLanternActivator extends ReferenceAlias

ReferenceAlias Property SourceLight Auto
ReferenceAlias Property ActivatorAlias Auto
ObjectReference[] Property OtherObjList Auto

Event OnActivate(ObjectReference akActionRef)
    If akActionRef == Game.GetPlayer() ; This condition ensures that only the player will trigger this code
        SourceLight.GetRef() && ToggleObj(SourceLight.GetRef())
        OtherObjList && ToggleListObj(OtherObjList)
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

Function Log(String msg, String modname="DSC02")
    Debug.Trace("[" + modname + "] " + self + " " + msg)
EndFunction