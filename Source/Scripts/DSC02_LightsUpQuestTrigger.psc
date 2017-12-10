Scriptname DSC02_LightsUpQuestTrigger extends ReferenceAlias  

Quest Property DSC02_LightsUpQuest Auto

Event OnTriggerEnter(ObjectReference akActionRef)
    If akActionRef == Game.GetPlayer() ; This condition ensures that only the player will trigger this code
        Log("Player entered the quest trigger")
        Log("Starting the quest")
        
        DSC02_LightsUpQuest.Start()
        DSC02_LightsUpQuest.SetObjectiveDisplayed(10)
        DSC02_LightsUpQuest.SetStage(10)
        utility.wait(1)  ; give some time to the quest to start
        
        ;RegisterForSingleUpdate(2)
    EndIf
EndEvent

Function Log(String msg, String modname="DSC02")
    Debug.Trace("[" + modname + "] " + self + " " + msg)
EndFunction