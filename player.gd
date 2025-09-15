class_name Player extends Actor

# Główna funkcja wywoływana w każdej klatce fizyki (60 razy na sekundę domyślnie).
func _physics_process(delta: float) -> void:
	velocity = Math.get_four_direction_vector(true) * SPEED
	move_and_slide()
	
	if Input.is_action_pressed("left_click_pressed"):
		_gun.shoot()
