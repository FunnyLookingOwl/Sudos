extends CharacterBody2D

@export var speed : float = 150.0
@export var damage : int = 1
var is_going_left : bool = false

func _ready():
	if DataContainer.is_player_flipped == true:
		is_going_left = true
	elif DataContainer.is_player_flipped == false:
		is_going_left = false

func _process(delta):
	if is_going_left == true:
		position += -transform.x * speed * delta
	elif is_going_left == false:
		position += transform.x * speed * delta
	await get_tree().create_timer(1.0).timeout
	queue_free()

func _on_BodyDetector_BodyEntered(body):
	if body.is_in_group("Enemy"):
		body.OnHit(damage)
		self.queue_free()
