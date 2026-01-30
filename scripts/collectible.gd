extends Area2D

var rotation_speed = 2.0
var move_speed = 100.0
var move_range = 50.0
var start_y = 0.0
var time_offset = 0.0

@onready var sprite = $Sprite2D

func _ready():
	add_to_group("collectibles")
	start_y = position.y
	time_offset = randf() * TAU  # 随机初始相位

func _process(delta):
	rotation += rotation_speed * delta
	
	# 持续上下浮动
	time_offset += delta * move_speed * 0.01
	position.y = start_y + sin(time_offset) * move_range
