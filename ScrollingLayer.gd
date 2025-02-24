extends ParallaxLayer

const IMG_W = 1920.0
const IMG_H = 1080.0

@onready var sprite_2d = $Sprite2D

@export var texture: Texture2D
@export var scrollScale: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	motion_scale.x = scrollScale
	var scale_f = get_viewport_rect().size.y / IMG_W
	sprite_2d.texture = texture
	sprite_2d.scale = Vector2(scale_f, scale_f)
	motion_mirroring.x = IMG_W * scale_f
	print("escala %f" % motion_mirroring.x)

