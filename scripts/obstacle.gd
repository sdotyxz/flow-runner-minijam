extends Area2D

var rotation_speed = 0.0

@onready var sprite = $Sprite2D

func _ready():
	add_to_group("obstacles")

func _process(delta):
	rotation += rotation_speed * delta
