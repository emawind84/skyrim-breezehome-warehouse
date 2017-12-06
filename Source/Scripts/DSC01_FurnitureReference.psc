Scriptname DSC01_FurnitureReference extends ObjectReference  

Keyword Property DSC01_FurnitureMarkerKeyword Auto

Bool Property Locked = FALSE Auto

Event OnLoad()
    parent.OnLoad()
    Log("OnLoad fired")
    DSC01_FurnitureMarker marker = self.GetLinkedRef(DSC01_FurnitureMarkerKeyword) as DSC01_FurnitureMarker
    If marker
        marker.RegisterFurniture(self)
    EndIf
EndEvent

Function Log(String msg, String modname="DSC")
    Debug.Trace("[" + modname + "] " + self + " " + msg)
EndFunction
