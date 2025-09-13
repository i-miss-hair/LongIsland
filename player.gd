extends CharacterBody2D

const SPEED = 90

func get_four_direction_vector (diagonal_allowed: bool) -> Vector2:
	var velocity: Vector2 = Vector2.ZERO
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	elif Input.is_action_just_pressed("ui_right"):
		velocity.x += 1
	
	if diagonal_allowed or is_zero_approx(velocity.x):
		if Input.is_action_just_pressed("ui_up"):
			velocity.y -= 1
		elif Input.is_action_pressed("ui_down"):
			velocity.y += 1
	return velocity

func _physics_process(delta: float) -> void:
	var movement: Vector2 = get_four_direction_vector(true)
	if movement:
		velocity = movement * SPEED
	
	move_and_slide()
