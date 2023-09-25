extends Area2D

@export var speed = 400
var screen_size
var direction = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var pos = get_position()
	pos.y += direction * speed * delta
	set_position(pos)


func reverse_direction():
	direction = -direction
