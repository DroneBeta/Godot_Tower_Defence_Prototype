class_name Building
extends Area2D

var data: BuildingData = BuildingData.new()
var closest_object: Object
var all_objects: Dictionary[String, Node2D] # change string into an int ID later on

func _ready() -> void:
	area_entered.connect(enemie_in_range)
	area_exited.connect(enemie_out_of_range)

func enemie_in_range(body: Area2D) -> void:
	closest_object = body
	all_objects[body.name]=body
	print(closest_object, all_objects)

func enemie_out_of_range(body: Area2D) -> void:
	pass
