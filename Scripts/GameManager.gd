extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if DataContainer.finished_levels["level1"] == false:
		print("Level1")
		get_tree().change_scene_to_file(DataContainer.levels["level1"])
	elif DataContainer.finished_levels["level1"] == true and DataContainer.finished_levels["level2"] == false:
		print("Level2")
		get_tree().change_scene_to_file(DataContainer.levels["level2"])
	elif DataContainer.finished_levels["level2"] == true and DataContainer.finished_levels["level3"] == false:
		print("Level3")
		get_tree().change_scene_to_file(DataContainer.levels["level3"])
	elif DataContainer.finished_levels["level3"] == true and DataContainer.finished_levels["level1"] == true:
		print("Reset")
		DataContainer.ProgressReset()
		get_tree().change_scene_to_file("res://Scenes/MainMenu.scn")

func _input(event):
	if event.is_action_pressed("Exit"):
		get_tree().change_scene_to_file("res://Scenes/MainMenu.scn")
