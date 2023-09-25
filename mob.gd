extends Node2D

class_name Mob

@export var speed = 20
@export var min_x = 0
@export var max_x = 1080
@export var initial_y = 0
@export var health = 1
var screen_size


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var y = speed * delta
	set_position(Vector2(get_position().x, get_position().y + y))


func take_damage(damage):
	health -= damage
	
	if health < 1:
		queue_free()
