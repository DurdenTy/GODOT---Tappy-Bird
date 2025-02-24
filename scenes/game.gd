extends Node2D


@onready var spawn_u = $SpawnU
@onready var spawn_l = $SpawnL
@onready var spawn_timer = $SpawnTimer
@onready var pipes_holder = $PipesHolder
const PIPES = preload("res://scenes/pipes/pipes.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	ScoreManager.set_score(0)
	SignalManager.on_plane_died.connect(_on_plane_died)
	spawn_pipes()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func spawn_pipes():
	var new_pipe: Pipes = PIPES.instantiate()
	var yp: float = randf_range(spawn_u.position.y, spawn_l.position.y)
	new_pipe.position = Vector2(spawn_l.position.x, yp)
	pipes_holder.add_child(new_pipe)


func _on_spawn_timer_timeout():
	spawn_pipes()


func _on_plane_died():
	spawn_timer.stop()
	
