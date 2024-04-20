extends Node2D

##
##
##
## ----====----LEVEL 2----====----
##
##
##

func _on_FinishLine_BodyEntered(body):
	if body.is_in_group("Player") == true:
		print("Level2_finished")
		DataContainer.finished_levels["level2"] = true
		get_tree().change_scene_to_file("res://Scenes/GameManager.scn")

