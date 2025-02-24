extends CharacterBody2D

class_name Tappy

const GRAVITY: float = 1000.0 
const FLY_IMPULSE: float = -350.0
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var animation_player = $AnimationPlayer
@onready var audio_stream_player = $AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass



func _physics_process(delta):
	velocity.y += GRAVITY * delta
	fly()
	move_and_slide()
	
	if is_on_floor():
		die()

func fly():
	if Input.is_action_just_pressed("fly"):
		velocity.y = FLY_IMPULSE
		animation_player.play("fly")
		
func die():
	animated_sprite_2d.pause()
	set_physics_process(false)
	audio_stream_player.stop()
	SignalManager.on_plane_died.emit()
