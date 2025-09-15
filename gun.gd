class_name Gun extends Sprite2D

const BULLET: PackedScene = preload("res://bullet.tscn")

#reference
@onready var _fire_rate: Timer = $FireRate

func shoot() -> void:
	if !_fire_rate.is_stopped():
		return
	var inst: Bullet = BULLET.instantiate()
	var start_pos: Vector2 = global_position
	var direction: Vector2 = start_pos.direction_to(get_global_mouse_position())
	get_tree().current_scene.add_child(inst)
	inst.start(start_pos, direction)
	_fire_rate.start()
