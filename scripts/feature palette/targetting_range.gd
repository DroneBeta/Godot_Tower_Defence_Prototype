class_name TargettingRange
extends Area2D

var closest_object: String
var all_objects: Dictionary[String, Object] # change string into an int ID later on

func _ready() -> void:
	area_entered.connect(enemy_in_range)
	area_exited.connect(enemy_out_of_range)

func enemy_in_range(body: Area2D) -> void:
	all_objects[body.name]=body

func enemy_out_of_range(body: Area2D) -> void:
	all_objects.erase(body)

func find_closest_enemie() -> void:
	var closest_object_distance: float = 0.0
	for n in all_objects.values():
		var n_distance = global_position.distance_to(n.global_position)
		if closest_object_distance == 0.0 or n_distance < closest_object_distance:
			closest_object = all_objects.find_key(n)
			closest_object_distance = n_distance

func shoot_enemie() -> void:
	pass
