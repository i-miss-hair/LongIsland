class_name Math extends Node

# Sprawdzamy wciśnięcie przycisków ruchu w osi X (lewo/prawo).
static func get_four_direction_vector (diagonal_allowed: bool) -> Vector2:
	var velocity: Vector2 = Vector2.ZERO
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	elif Input.is_action_pressed("ui_right"):
		velocity.x += 1
	
# Sprawdzamy wciśnięcie przycisków ruchu w osi Y (góra/dół).
	if diagonal_allowed or is_zero_approx(velocity.x):
		if Input.is_action_pressed("ui_up"):
			velocity.y -= 1
		elif Input.is_action_pressed("ui_down"):
			velocity.y += 1
	# Zwracamy obliczony wektor kierunku.
	return velocity
