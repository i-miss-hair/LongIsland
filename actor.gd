class_name Actor extends CharacterBody2D

const SPEED = 90
var hp: int = 1

@onready var _sprite: Sprite2D = $Sprite2D
@onready var _gun: Gun = $Gun

func heal_hurt(n: int) -> void:
	hp += n
	if hp <=0:
		queue_free()
