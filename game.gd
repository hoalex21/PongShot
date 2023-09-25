extends Node

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
		get_node(node_path).hit_paddle()
