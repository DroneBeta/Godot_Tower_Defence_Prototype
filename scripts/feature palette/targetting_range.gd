class_name TargettingRange
extends Area2D

var all_objects: Dictionary[String, Object] # change string into an int ID later on
var start_shooting: bool = false

var shoot_timer : Timer
const PROJECTILE = preload("res://scenes/projectiles/arrow.tscn")
signal p_shot(starting_pos: Vector2, target: Object)

func _ready() -> void:
	area_entered.connect(enemy_in_range)
	area_exited.connect(enemy_out_of_range)
	
	shoot_timer = Timer.new()
	shoot_timer.wait_time = 1.0
	shoot_timer.one_shot = true
	add_child(shoot_timer)
	shoot_timer.timeout.connect(shoot_timeout)

func enemy_in_range(body: Area2D) -> void:
	all_objects[body.name]=body
	if not start_shooting:
		start_shooting = true
		shoot_enemy()

func enemy_out_of_range(body: Area2D) -> void: # CHECK IF THIS SIGNAL IS EMITED WHEN AN ENEMY DIES
	all_objects.erase(body)
	if all_objects.is_empty():
		start_shooting = false

func find_closest_enemy() -> Object:
	var closest_object: Object = null
	var closest_object_distance: float = 0.0
	for n in all_objects.values():
		var n_distance = global_position.distance_to(n.global_position)
		if closest_object_distance == 0.0 or n_distance < closest_object_distance:
			closest_object = n
			closest_object_distance = n_distance
	return closest_object

func shoot_enemy() -> void:
	if start_shooting:
		shoot_timer.start()
		var p_instance = PROJECTILE.instantiate()
		get_tree().root.add_child(p_instance) # NEED HELP
		p_shot.connect(p_instance)
		p_shot.emit(global_position, find_closest_enemy())

func shoot_timeout() -> void:
	shoot_enemy()
