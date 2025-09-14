extends CharacterBody2D

const SPEED = 90
const BULLET: PackedScene = preload("res://bullet.tscn")


# Główna funkcja wywoływana w każdej klatce fizyki (60 razy na sekundę domyślnie).
func _physics_process(delta: float) -> void:
	velocity = Math.get_four_direction_vector(true) * SPEED
	move_and_slide()
	
	if Input.is_action_pressed("left_click_pressed"):
		var inst: Bullet = BULLET.instantiate()
		var start_pos: Vector2 = global_position
		var direction: Vector2 = start_pos.direction_to(get_global_mouse_position())
		get_owner().add_child(inst)
		inst.start(start_pos, direction)
#Xchucjcucjjc
