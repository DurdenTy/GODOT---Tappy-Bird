extends Control

@onready var press_space = $PressSpace
@onready var game_over_message = $GameOverMessage
@onready var sound = $Sound
@onready var timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	SignalManager.on_plane_died.connect(on_plane_died)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Input.is_action_pressed("fly") and press_space.visible):
		GameManager.load_main_scene()

func on_plane_died():
	show()
	timer.start()
	sound.play()
	ScoreManager.save_high_score()

func _on_timer_timeout():
	game_over_message.hide()
	press_space.show()


