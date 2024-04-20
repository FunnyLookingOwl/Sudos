extends CharacterBody2D


const SPEED = 5000.0
const JUMP_VELOCITY = -250.0


@export var can_shoot : bool = true
@export var lifes : int = 3
@export var web_shoot : PackedScene

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

## Physics update like movement
func _physics_process(delta):
	Move(delta)

## Logic updates like UI
func _process(_delta):
	if lifes <= 0:
		get_tree().change_scene_to_file("res://Scenes/MainMenu.scn")
		
	#OS.get_ticks_msec()
	## ---===---IMPORTANT---===---
	## Use "%1.1f" % float - to precise number to 0.x place.
	$Camera2D/UI/Background/Box/Left/Lifes.text = "Lifes: " + str(lifes)
	$Camera2D/UI/Background/Box/Left/ShootTimer.text = "Shoot: " + str("%1.1f" % $ShootTimer.time_left)
	$Camera2D/UI/Background/Box/Right/Score.text = "Score: " + str(DataContainer.score)
	#$Camera2D/UI/Background/Box/Right/TimeElapsed.text = "Time: " + str("%1.1f" % $ShootTimer.time_left)
	
func _input(event):
	if event.is_action_pressed("Shoot") and can_shoot == true:
		var shoot = web_shoot.instantiate()
		owner.add_child(shoot)
		shoot.transform = $Shooter.global_transform
		$ShootTimer.start()
		can_shoot = false
		await get_tree().create_timer(3).timeout
		can_shoot = true

func Move(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("MoveLeft", "MoveRight")
	
	var tween = create_tween()
	tween.tween_property($Camera2D, "position", Vector2(clampf(direction * 25, -25, 25), -10), 1.0)
	if direction == -1:
		$Sprite2D.flip_h = true
		DataContainer.is_player_flipped = true
		$Shooter.position = Vector2(-10, -4)
	elif direction == 1:
		$Sprite2D.flip_h = false
		DataContainer.is_player_flipped = false
		$Shooter.position = Vector2(10, -4)
	if direction:
		velocity.x = direction * SPEED * delta
		$AnimationPlayer.play("walk")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()

func OnHit(damage):
	lifes = lifes - damage

