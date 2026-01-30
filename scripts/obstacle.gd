extends Area2D

signal hit

var rotation_speed = 0.0
var wobble_offset = 0.0
var wobble_speed = 2.0

@onready var sprite = $Sprite2D

func _ready():
	add_to_group("obstacles")
	wobble_offset = randf() * TAU

func _process(delta):
	# 旋转
	rotation += rotation_speed * delta
	
	# 摇摆效果
	wobble_offset += wobble_speed * delta
	position.y += sin(wobble_offset) * 0.5
	
	# 颜色脉动
	var pulse = 0.7 + sin(Time.get_ticks_msec() / 300.0) * 0.3
	sprite.modulate = Color(0.8, 0.2, 0.2, pulse)

func _on_body_entered(body):
	if body.has_method("_on_hit"):
		body._on_hit()
	queue_free()
	elif body.is_in_group("player"):
		emit_signal("hit")
		queue_free()
