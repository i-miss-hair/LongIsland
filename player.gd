extends CharacterBody2D

@export var speed: float = 300

func _physics_process(delta: float) -> void:
	#--- RUCH ---
	var direction = Vector2.ZERO
	
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
	
	velocity = direction.normalized() * speed
	move_and_slide()
	
	#--- ROTACJA W STRONĘ MYSZY---
	
	var mouse_pos = get_global_mouse_position()
	var to_mouse = mouse_pos - global_position
	rotation = to_mouse.angle()
