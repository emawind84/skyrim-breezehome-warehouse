Scriptname DSC02_Q1_50 extends ReferenceAlias  
{Fifth objective of warehouse lights up quest}

Event OnActivate(ObjectReference akActionRef)
    If akActionRef == Game.GetPlayer() ; This condition ensures that only the player will trigger this code
        GetOwningQuest().SetObjectiveCompleted(50)
    EndIf
EndEvent