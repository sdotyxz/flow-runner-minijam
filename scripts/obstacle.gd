extends Area2D

var rotation_speed = 0.0

@onready var sprite = $Sprite2D

func _ready():
	add_to_group("obstacles")
	# 连接碰撞信号
	area_entered.connect(_on_area_entered)

func _process(delta):
	rotation += rotation_speed * delta

func _on_area_entered(area):
	# 只有碰撞到 Player 时才触发
	if area.has_method("_on_hit"):
		emit_signal("hit", self)
		queue_free()
