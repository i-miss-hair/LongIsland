class_name Bullet extends CharacterBody2D

const SPEED: int = 250
const DAMAGE: int = 1
const SHELL_CASING: PackedScene = preload("res://bullet_shell.tscn")

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
	
	var inst: Node = SHELL_CASING.instantiate()
	inst.start(start_pos)
	get_tree().current_scene.add_child(inst)
