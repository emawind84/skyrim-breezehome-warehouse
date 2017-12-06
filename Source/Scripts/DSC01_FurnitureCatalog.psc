Scriptname DSC01_FurnitureCatalog extends ReferenceAlias

Actor Property PlayerREF Auto
Message[] Property DSC_WarehouseFurnitureCatalogMenus Auto
Message Property DSC01_FurnitureNotEmpty Auto

ObjectReference Property DSC_WarehouseFurnitureRack01 Auto
ObjectReference[] Property DSC_WarehouseFurnitureRack01A  Auto
ObjectReference Property DSC_WarehouseFurnitureTable01 Auto
ObjectReference Property DSC_WarehouseFurnitureBookShelf01 Auto
ObjectReference Property DSC_WarehouseFurnitureBookShelf02 Auto
ObjectReference Property DSC_WarehouseFurnitureLongTable01 Auto
ObjectReference Property DSC_WarehouseFurnitureMannequin01 Auto
ObjectReference Property DSC_WarehouseFurnitureBookMarker01 Auto
ObjectReference Property DSC_WarehouseFurniturePlaque01 Auto
ObjectReference[] Property DSC_WarehouseFurniturePlaque01A  Auto

int FURNITURE_PER_MENU = 5

Event OnLoad()
    Log("Loading Warehouse Furniture Catalog")
    Validate(DSC_WarehouseFurnitureBookShelf01)
    Validate(DSC_WarehouseFurnitureBookShelf02)
    Validate(DSC_WarehouseFurnitureLongTable01)
    Validate(DSC_WarehouseFurnitureMannequin01)
    GoToState("Waiting")
EndEvent

Event OnReset()
    GoToState("Waiting")
EndEvent

auto State Waiting

    Event OnRead()
        Log("OnRead fired on " + self)
        RegisterForSingleUpdate(0)
    EndEvent

    Event OnUpdate()
        Log("OnUpdate fired on " + self)
        ChooseFurniture()
    EndEvent

EndState

State Error
EndState

;State Done
;EndState

Function ChooseFurniture(int menu=0, int choice=0)
    choice = DSC_WarehouseFurnitureCatalogMenus[menu].Show()
    choice += menu * FURNITURE_PER_MENU

    If choice == 0 ; done

    ElseIf choice == 1  ; rack01
        ToggleObj(DSC_WarehouseFurnitureRack01) && ToggleListObj(DSC_WarehouseFurnitureRack01A)

    ElseIf choice == 2  ; long table
        ToggleObj(DSC_WarehouseFurnitureLongTable01)

    ElseIf choice == 3  ; bookshelf left
        ToggleObj(DSC_WarehouseFurnitureBookShelf01)

    ElseIf choice == 4  ; next
        ChooseFurniture(1)

    ElseIf choice == 5  ; previous
        ChooseFurniture(0)
    ElseIf choice == 6
        ToggleObj(DSC_WarehouseFurnitureBookShelf02)

    ElseIf choice == 7
        ToggleObj(DSC_WarehouseFurnitureTable01)

    ElseIf choice == 8
        ToggleObj(DSC_WarehouseFurnitureMannequin01)

    ElseIf choice == 9  ; next
        ChooseFurniture(2)

    ElseIf choice == 10 ; previous
        ChooseFurniture(1)

    ElseIf choice == 11 ; 
        ToggleObj(DSC_WarehouseFurniturePlaque01) && ToggleListObj(DSC_WarehouseFurniturePlaque01A)

    ElseIf choice == 12 ; 
        ; empty

    ElseIf choice == 13 ;
        ; empty

    ElseIf choice == 14 ; done

    EndIf
    Log("Furniture selected " + choice)
EndFunction

Bool Function ToggleObj(ObjectReference obj)
    ObjectReference linkedRef = obj.GetLinkedRef()
    ;Log("Linked reference " + linkedRef)

    If (obj as DSC01_FurnitureReference)
        DSC01_FurnitureReference fmarker = obj as DSC01_FurnitureReference 
        Log("Furniture " + obj + " Locked " + fmarker.Locked)
        If fmarker.Locked == TRUE
            ;Debug.MessageBox("You should remove your belonging first.")
            DSC01_FurnitureNotEmpty.Show()
            return FALSE
        EndIf
    EndIf

    If (obj.IsDisabled())
        obj.Enable()
    Else
        obj.Disable()
    EndIf

    return TRUE
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

Function Log(String msg, String modname="DSC")
    Debug.Trace("[" + modname + "] " + self + " " + msg)
EndFunction

Function Validate(Form ref)
    If !ref
        Debug.MessageBox("DSC Warehouse has some problems...")
        Debug.Trace("Null Reference Found!", 2)
        GoToState("Error")
    EndIf
EndFunction