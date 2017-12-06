Scriptname DSC01_FurnitureQuest extends Quest

ReferenceAlias Property FurnitureCatalogBook Auto
ReferenceAlias Property Mannequin01 Auto
ReferenceAlias Property Mannequin02 Auto
ReferenceAlias Property Mannequin03 Auto

Event OnInit()
    RegisterForSingleUpdate(2)
EndEvent

Event OnUpdate()
    ;RegisterForSingleUpdate(2)
EndEvent