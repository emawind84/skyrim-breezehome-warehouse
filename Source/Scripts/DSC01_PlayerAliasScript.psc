Scriptname DSC01_PlayerAliasScript extends ReferenceAlias

DSC01_WarehouseMainQuest Property QuestScript Auto

Event OnPlayerLoadGame()
    QuestScript.Maintenance()
EndEvent