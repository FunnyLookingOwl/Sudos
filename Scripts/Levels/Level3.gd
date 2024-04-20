extends Node2D

##
##
##
## ----====----LEVEL 3----====----
##
##
##

func _on_FinishLine_BodyEntered(body):
	if body.is_in_group("Player") == true:
		print("Level3_finished")
		DataContainer.finished_levels["level3"] = true
		get_tree().change_scene_to_file("res://Scenes/GameManager.scn")
#
#func _process(delta):
#	if get_tree().get_nodes_in_group("Enemy") == null:
#		$TileMap2.set_deferred("disabled", true)
#		$TileMap2.queue_free()
