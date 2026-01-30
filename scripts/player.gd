extends Area2D

signal collected
signal hit

var flow_size = 1.0
var trail_positions = []
var max_trail_length = 20
var base_color = Color(0.2, 0.8, 1.0)
var glow_intensity = 0.0

@onready var sprite = $Sprite2D
@onready var glow = $Glow
@onready var particles = $Particles2D

func _ready():
	# 连接碰撞信号 - 使用 area_entered 因为障碍物和收集物都是 Area2D
	area_entered.connect(_on_area_entered)
	reset_flow()

func _process(delta):
	# 流动效果 - 大小脉动
	flow_size = 1.0 + sin(Time.get_ticks_msec() / 200.0) * 0.1
	scale = Vector2(flow_size, flow_size)

	# 颜色变化
	var hue = fmod(Time.get_ticks_msec() / 5000.0, 1.0)
	sprite.modulate = Color.from_hsv(hue, 0.7, 1.0)

	# 发光强度
	glow.modulate.a = 0.3 + sin(Time.get_ticks_msec() / 300.0) * 0.2
	particles.amount_ratio = 0.5 + sin(Time.get_ticks_msec() / 400.0) * 0.5

func update_flow_trail():
	# 记录轨迹位置
	trail_positions.push_front(global_position)
	if trail_positions.size() > max_trail_length:
		trail_positions.pop_back()

func reset_flow():
	flow_size = 1.0
	trail_positions.clear()
	scale = Vector2.ONE

func _on_hit():
	emit_signal("hit")
	play_hit_effect()

func _on_area_entered(area):
	if area.is_in_group("obstacles"):
		_on_hit()
	elif area.is_in_group("collectibles"):
		emit_signal("collected")
		area.queue_free()
		play_collect_effect()

func play_hit_effect():
	# 撞击效果
	var tween = create_tween()
	tween.tween_property(self, "modulate", Color.RED, 0.1)
	tween.tween_property(self, "modulate", base_color, 0.3)
	scale = Vector2(1.5, 1.5)
	var tween2 = create_tween()
	tween2.tween_property(self, "scale", Vector2.ONE, 0.3)

func play_collect_effect():
	# 收集效果
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(1.3, 1.3), 0.1)
	tween.tween_property(self, "scale", Vector2.ONE, 0.2)
	particles.amount_ratio = 1.0
	await get_tree().create_timer(0.2).timeout
	particles.amount_ratio = 0.5
