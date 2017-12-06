Scriptname DSC01_WeaponRackTrigger extends DSC01_FurnitureReference

;Keyword Property DSC01_FurnitureMarkerKeyword Auto
Keyword Property WRackActivator Auto

Event OnLoad()
    parent.OnLoad()  ; call the OnLoad on DSC01_FurnitureReference!
    Log("OnLoad fired")
    CheckStatus()
EndEvent

auto State WaitingForReference
    Event OnTriggerEnter(objectReference triggerRef)
        CheckStatus()
    EndEvent

    Event OnTriggerLeave(ObjectReference triggerRef)
        CheckStatus()
    EndEvent
EndState

Function CheckStatus()
    Bool status = FALSE
    ObjectReference objref = self
    Log("TriggerObjectCount " + objref.GetTriggerObjectCount())
    if objref.GetTriggerObjectCount() > 0
        status = TRUE
    EndIf

    ; change rack activator locked
    ObjectReference activatorRef = objref.GetLinkedRef(WRackActivator)
    If activatorRef && activatorRef as DSC01_FurnitureReference
        (activatorRef as DSC01_FurnitureReference).Locked = status
        Log("Activator locked " + (activatorRef as DSC01_FurnitureReference).Locked)
    EndIf

    ; change self locked
    If objref as DSC01_FurnitureReference
        (objref as DSC01_FurnitureReference).Locked = status
    EndIf

    ; change marker locked
    DSC01_FurnitureMarker marker = objref.GetLinkedRef(DSC01_FurnitureMarkerKeyword) as DSC01_FurnitureMarker
    If marker
        marker.SetLocked(status)
    EndIf

EndFunction

Function Log(String msg, String modname="DSC")
    Debug.Trace("[" + modname + "] " + self + " " + msg)
EndFunction