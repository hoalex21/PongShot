extends Node

const MAX_BOUNCE_ANGLE = PI / 6

@export var ufo_mob : PackedScene


# Called when the node enters the scene tree for the first time.
func _ready():
	$MobTimer.start()
	set_process(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func spawn_mob(mob_scene):
	var mob = mob_scene.instantiate()
	var mob_position = Vector2(randf_range(mob.min_x, mob.max_x), mob.initial_y)
	mob.set_position(mob_position)
	add_child(mob)


func _on_player_hit(area):
	var area_name = area.get_name()
	var node_path = NodePath(area_name)
	var node = get_node(node_path)
	
	if node is Ball:
		var ball_pos = area.get_position()
		var player_pos = $Player.get_position()
		
		var relative_intersection = player_pos - ball_pos
		
		var x = -relative_intersection.normalized().x * MAX_BOUNCE_ANGLE
		
		get_node(node_path).hit_paddle(x)


func _on_ball_hit(area):
	var area_name = area.get_name()
	var node_path = NodePath(area_name)
	var node = get_node(node_path)
	
	if node is Mob:
		node.take_damage($Ball.damage)


func _on_mob_timer_timeout():
	spawn_mob(ufo_mob)
