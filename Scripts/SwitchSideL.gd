extends Node

func _on_BodyEntered(body):
	if body.is_in_group("Enemy"):
		body.change_direction = "left"
