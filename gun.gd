class_name Gun extends Sprite2D

const BULLET: PackedScene = preload("res://bullet.tscn")

var fire_rate: float = 0.3
var ammo_size_max: int = 12
var ammo_size: int = ammo_size_max
var reloading: bool = false #flaga czy trwa reload

#reference
@onready var _fire: AudioStreamPlayer2D = $Fire
@onready var _reload: AudioStreamPlayer2D = $Reload
@onready var _fire_rate: Timer = $FireRate

func reload() -> void:
		_reload.play()
		reloading = true
		await get_tree().create_timer(2.5).timeout
		ammo_size = ammo_size_max
		reloading = false
		print("Reload finished")

func shoot() -> void:
	print(ammo_size)
	
	if ammo_size <= 0:
		if !reloading:
			reload()
		return
	
	if !_fire_rate.is_stopped():
		return
		
	var inst: Bullet = BULLET.instantiate()
	var start_pos: Vector2 = global_position
	var direction: Vector2 = start_pos.direction_to(get_global_mouse_position())
	get_tree().current_scene.add_child(inst)
	inst.start(start_pos, direction)
	_fire_rate.start(fire_rate + randf_range(fire_rate, 0.001))
	_fire.play()
	ammo_size -= 1
	
		
