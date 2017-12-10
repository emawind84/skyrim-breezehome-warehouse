Scriptname DSC02_LightsUpQuest Extends Quest

Event OnInit()
    RegisterForSingleUpdate(2)
EndEvent

Event OnUpdate()
    bool bCompleted = TRUE
    bCompleted = bCompleted && IsObjectiveCompleted(10)
    bCompleted = bCompleted && IsObjectiveCompleted(20)
    bCompleted = bCompleted && IsObjectiveCompleted(30)
    bCompleted = bCompleted && IsObjectiveCompleted(40)
    bCompleted = bCompleted && IsObjectiveCompleted(50)

    If bCompleted
        SetStage(20)
        GoToState("Done")
    EndIf

    RegisterForSingleUpdate(1)
EndEvent

State Done
EndState