extends Control

@onready var score_label = $ScoreLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.on_score_update.connect(scored)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func scored():
	score_label.text = str(ScoreManager.get_score())
