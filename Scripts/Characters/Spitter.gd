extends CharacterBody2D

@export var hp : int = 36
@export var damage : int = 2
@export var speed : float = 0.3
@export var change_direction : String = "right"
var amount = 18 # Amount of points (score) given to player
var gravity
var can_attack : bool = false

func _ready():
	$AnimationPlayer.play("idle")
	can_attack = true

func _process(_delta):
	Attack()
	if hp <= 0:
		DataContainer.score = DataContainer.score + amount
		self.queue_free()
		var occluder = get_node_or_null("../../Lights/Occluders/LightOccluder2D5")
		occluder.queue_free()
		var tile_map = get_node_or_null("../../TileMap2")
		tile_map.queue_free()
		## REMEMBER TO FIX THIS ISSUE! TRY TO PUT SOME DIFFERENT LAYER - MAYBE BY NAME AND NOT 
		## NUMBER, OR TRY NUMBER 24 OR 32
		#tile_map./set_collision_layer_value = 32

func _on_PlayerDetector_BodyEntered(body):
	if body.is_in_group("Player"):
		print("I'm detected!")
		body.OnHit(damage)

func OnHit(damage):
	hp = hp - damage

func Attack():
	if can_attack == true:
		var target = get_parent().get_node("Sudo")
		if target.position.x + 30 > self.position.x:
			$AnimationPlayer.play("attack_right")
		elif target.position.x - 30 < self.position.x:
			$AnimationPlayer.play("attack_left")
		elif target.position.x == clamp(self.position.x, target.posiotion.x - 10, target.position.x + 10):
			$AnimationPlayer.play("idle")
		can_attack = false
		await get_tree().create_timer(1.8).timeout
		can_attack = true
