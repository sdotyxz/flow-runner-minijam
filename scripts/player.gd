extends Area2D

signal collected
signal hit

var base_color = Color(0.2, 0.8, 1.0)

@onready var sprite = $Sprite2D

func _ready():
	area_entered.connect(_on_area_entered)

func _process(delta):
	# 颜色变化
	var hue = fmod(Time.get_ticks_msec() / 5000.0, 1.0)
	sprite.modulate = Color.from_hsv(hue, 0.7, 1.0)

func _on_area_entered(area):
	if area.is_in_group("obstacles"):
		_on_hit()
		area.queue_free()
	elif area.is_in_group("collectibles"):
		emit_signal("collected")
		area.queue_free()
		play_collect_effect()

func _on_hit():
	emit_signal("hit")
	play_hit_effect()

func play_hit_effect():
	# 撞击效果 - 变红然后恢复
	var tween = create_tween()
	tween.tween_property(self, "modulate", Color.RED, 0.1)
	tween.tween_property(self, "modulate", base_color, 0.3)
	scale = Vector2(1.5, 1.5)
	var tween2 = create_tween()
	tween2.tween_property(self, "scale", Vector2.ONE, 0.3)

func play_collect_effect():
	# 收集效果 - 变大然后恢复
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(1.3, 1.3), 0.1)
	tween.tween_property(self, "scale", Vector2.ONE, 0.2)

func update_flow_trail():
	pass

func reset_flow():
	pass
