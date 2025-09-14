class_name Bullet extends CharacterBody2D

const SPEED: int = 180

# Główna funkcja wywoływana w każdej klatce fizyki (60 razy na sekundę domyślnie).
func _physics_process(delta: float) -> void:
	move_and_slide()
	
func start(start_pos: Vector2, direction: Vector2) -> void:
	global_position = start_pos
	velocity = direction * SPEED
