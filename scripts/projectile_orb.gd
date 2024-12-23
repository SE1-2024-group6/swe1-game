extends "res://scripts/base_orb.gd"

var direction = Vector2(1.0, 0.0)
var speed = 1000.0
var collidable = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position = position + speed * direction * delta

func _on_area_entered(area: Area2D) -> void:
	if area.get_parent().has_method("Collide") and collidable:
		area.get_parent().Collide(number)
	collidable = false
	queue_free()
