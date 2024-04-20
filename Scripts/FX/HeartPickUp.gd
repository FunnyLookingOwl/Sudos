extends StaticBody2D


func _on_PlayerDetector_BodyEntered(body):
	if body.is_in_group("Player"):
		body.lifes += 1
		self.queue_free()
