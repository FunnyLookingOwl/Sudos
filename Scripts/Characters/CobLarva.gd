extends CharacterBody2D

@export var hp : int = 3
@export var damage : int = 2
@export var speed : float = 0.3
@export var change_direction : String = "right"
var amount = 4 # Amount of points (score) given to player
var gravity

func _ready():
	gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
	$AnimationPlayer.play("move")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	if change_direction == "right":
		$Sprite2D.flip_h = false
		$PlayerDetector/CollisionShape2D.position = Vector2(-7, -3)
		move_local_x(-1 * speed)
	if change_direction == "left":
		$Sprite2D.flip_h = true
		$PlayerDetector/CollisionShape2D.position = Vector2(7, -3)
		move_local_x(1 * speed)

func _process(_delta):
	if hp <= 0:
		DataContainer.score = DataContainer.score + amount
		self.queue_free()

func _on_PlayerDetector_BodyEntered(body):
	if body.is_in_group("Player"):
		body.OnHit(damage)

func OnHit(damage):
	hp = hp - damage
