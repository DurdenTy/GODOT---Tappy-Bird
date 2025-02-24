extends Node2D

class_name Pipes

@onready var scored_sound = $ScoredSound
@onready var von = $VisibleOnScreenNotifier2D


# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.on_plane_died.connect(on_plane_died)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= GameManager.SCROLL_SPEED * delta
	check_out_screen()

func on_plane_died():
	set_process(false)
	

func check_out_screen():
	if von.global_position.x < get_viewport_rect().position.x:
		queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited():
	pass


func _on_body_entered(body: Node2D):
	if body is Tappy:
		if body.has_method("die"):
			body.die()


func _on_laser_body_entered(body):
	if body is Tappy:
		scored_sound.play()
		ScoreManager.increment_score()
