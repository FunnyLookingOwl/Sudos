extends Control

func _input(event):
	if event.is_action_pressed("Enter"):
		get_tree().change_scene_to_file("res://Scenes/GameManager.scn")
	elif event.is_action_pressed("Exit"):
		ExitGame()

func ExitGame():
	get_tree().quit()
