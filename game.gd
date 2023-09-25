extends Node

const MAX_BOUNCE_ANGLE = PI / 4

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_hit(area):
	var name = area.get_name()
	var node_path = NodePath(name)
	
	if name == "Ball":
		var ball_pos = area.get_position()
		var player_pos = $Player.get_position()
		
		var relative_intersection = player_pos - ball_pos
		
		var x = -relative_intersection.normalized().x * MAX_BOUNCE_ANGLE
		
		print(relative_intersection)
		
		get_node(node_path).hit_paddle(x)
