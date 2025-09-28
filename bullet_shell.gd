class_name ShellCasing extends Sprite2D

func start(start_pos: Vector2) -> void:
	global_position = start_pos
	rotation_degrees = randf_range(0, 360)
