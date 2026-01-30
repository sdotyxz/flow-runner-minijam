extends Area2D

signal hit

var rotation_speed = 0.0

@onready var sprite = $Sprite2D

func _ready():
    add_to_group("obstacles")

func _process(delta):
    # 旋转
    rotation += rotation_speed * delta

func _on_area_entered(area):
    emit_signal("hit")
    queue_free()
