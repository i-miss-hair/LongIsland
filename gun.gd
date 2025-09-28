class_name Gun extends Sprite2D

const BULLET: PackedScene = preload("res://bullet.tscn")

var fire_rate: float = 0.05
var ammo_size_max: int = 32
var ammo_size: int = ammo_size_max

#reference
@onready var _fire: AudioStreamPlayer2D = $Fire
@onready var _fire_rate: Timer = $FireRate

func ready(x) -> void:
	await get_tree().create_timer(x).timeout

func reload() -> void:
	ready(10)
	ammo_size = ammo_size_max

func shoot() -> void:
	print(ammo_size)
	if !_fire_rate.is_stopped():
		return
		
	if ammo_size <= 0:
		reload()
		
	var inst: Bullet = BULLET.instantiate()
	var start_pos: Vector2 = global_position
	var direction: Vector2 = start_pos.direction_to(get_global_mouse_position())
	get_tree().current_scene.add_child(inst)
	inst.start(start_pos, direction)
	_fire_rate.start(fire_rate + randf_range(fire_rate, 0.001))
	_fire.play()
	ammo_size -= 1
	
		
