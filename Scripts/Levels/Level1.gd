extends Node2D
##
##
##
## ----====----LEVEL 1----====----
##
##
##
## Here is code that should be copied/pasted in every level. It simply changes the 
## values of 'level' in singleton script.
func _on_FinishLine_BodyEntered(body):
	if body.is_in_group("Player") == true:
		DataContainer.finished_levels["level1"] = true
		print("Level1_finished")
		get_tree().change_scene_to_file("res://Scenes/GameManager.scn")

func _input(event):
	if event.is_action_pressed("Exit"):
		get_tree().change_scene_to_file("res://Scenes/MainMenu.scn")

