extends Area2D

signal hit(area)

@export var speed = 600
@export var damage = 1
var screen_size
var rng = RandomNumberGenerator.new()
var direction


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	direction = Vector2(rng.randf_range(-0.5, 0.5), 1.0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var pos = get_position()
	direction.normalized()
	pos += direction * speed * delta
	
	if pos.x < 0 or pos.x > screen_size.x:
		direction.x = -direction.x
	
	if pos.y < 0 or pos.y > screen_size.y:
		direction.y = -direction.y
	
	set_position(pos)


func hit_paddle(x):
	direction.x = x
	direction.y = -direction.y


func _on_area_entered(area):
	hit.emit(area)
