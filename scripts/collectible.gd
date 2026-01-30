extends Area2D

var rotation_speed = 2.0

@onready var sprite = $Sprite2D

func _ready():
	add_to_group("collectibles")

func _process(delta):
	rotation += rotation_speed * delta
