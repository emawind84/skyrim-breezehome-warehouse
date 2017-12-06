Scriptname DSC01_FurnitureQuestTrigger extends ReferenceAlias

DSC01_FurnitureQuest Property QuestScript Auto
Book Property DSC01_FurnitureCatalogBook Auto
ObjectReference Property DSC_WarehouseFurnitureBookMarker01 Auto
Actor Property PlayerREF Auto

Event OnTriggerEnter(ObjectReference akActionRef)
    If akActionRef == PlayerREF ; This condition ensures that only the player will trigger this code
        Log("Player entered the quest trigger")
        Log("Starting the quest")
        
        QuestScript.Start()
        If (QuestScript.SetStage(10))
            Log("Setting quest to stage 10")
        EndIf

        utility.wait(1)  ; give some time to the quest to start
        ReferenceAlias bookAlias = QuestScript.FurnitureCatalogBook
        Log("Quest stage " + QuestScript.GetStage() + " done " + QuestScript.IsStageDone(QuestScript.GetCurrentStageID()) + " running " + QuestScript.IsRunning())
        Log("Book ref " + bookAlias.GetReference())
        Log("catalog in player inventory " + PlayerREF.GetItemCount(DSC01_FurnitureCatalogBook))

        ; if the book ReferenceAlias object doesn't have an ObjectReference attached
        ; place a new ObjectReference at the book marker
        ; attach the new reference to the alias
        If (!bookAlias.GetReference())
            ObjectReference bookRef = DSC_WarehouseFurnitureBookMarker01.PlaceAtMe(DSC01_FurnitureCatalogBook, 1)
            bookAlias.ForceRefTo(bookRef)
            Log("Created new furniture catalog " + bookRef)
        EndIf

        RegisterForSingleUpdate(2)
    EndIf
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
    If akActionRef == PlayerREF ; This condition ensures that only the player will trigger this code
        Log("Player leaved the quest trigger")
        Log("Stopping the quest")
        
        QuestScript.Stop()
        QuestScript.Reset()
        utility.wait(1)  ; give some time to the quest to stop

        ; remove the book from the player inventory
        PlayerREF.RemoveItem(DSC01_FurnitureCatalogBook, PlayerREF.GetItemCount(DSC01_FurnitureCatalogBook))

        UnregisterForUpdate()  ; safe option just in case
    EndIf
EndEvent

Event OnUpdate()
    ;RegisterForSingleUpdate(2)
EndEvent

Function Log(String msg, String modname="DSC")
    Debug.Trace("[" + modname + "] " + self + " " + msg)
EndFunction