extends Area2D

var rotation_speed = 2.0
var bob_offset = 0.0
var bob_speed = 3.0
var bob_amount = 5.0

@onready var sprite = $Sprite2D
@onready var glow = $Glow

func _ready():
	add_to_group("collectibles")
	bob_offset = randf() * TAU

func _process(delta):
	# 旋转
	rotation += rotation_speed * delta
	
	# 上下浮动
	bob_offset += bob_speed * delta
	position.y += sin(bob_offset) * 0.3
	
	# 发光效果
	var glow_pulse = 0.5 + sin(Time.get_ticks_msec() / 200.0) * 0.5
	glow.modulate.a = glow_pulse
	
	# 颜色彩虹变化
	var hue = fmod(Time.get_ticks_msec() / 1000.0, 1.0)
	sprite.modulate = Color.from_hsv(hue, 0.8, 1.0)
