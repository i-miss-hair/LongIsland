class_name Bullet extends CharacterBody2D

const SPEED: int = 180
const DAMAGE: int = 1

# Główna funkcja wywoływana w każdej klatce fizyki (60 razy na sekundę domyślnie).
func _physics_process(delta: float) -> void:
	move_and_slide()
	
	var collision: KinematicCollision2D = get_last_slide_collision()
	if collision:
		var collider: Object = collision.get_collider()
		collider.heal_hurt(-DAMAGE)
		queue_free()
	
func start(start_pos: Vector2, direction: Vector2) -> void:
	global_position = start_pos
	velocity = direction * SPEED
