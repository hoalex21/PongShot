extends Area2D

signal hit(area)

@export var speed = 400
var screen_size


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var pos = get_position()
	
	if Input.is_action_pressed("move_left"):
		pos.x -= speed * delta
	if Input.is_action_pressed("move_right"):
		pos.x += speed * delta
	
	set_position(pos)
	position = position.clamp(Vector2(96, 1620), Vector2(984, 1620))


func _on_area_entered(area):
	hit.emit(area)
