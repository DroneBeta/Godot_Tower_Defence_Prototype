extends Node2D

var data: BuildingData = BuildingData.new()

func _ready() -> void:
	data.name = "Debug Tower"
	data.dmg = Vector2i(5, 20)
	data.attackType = Vector3(1, 0, 0)
	data.rangeRadius = 30
	data.attackSpeed = 1.0
	
	get_child(0).scale = data.widthHeight
	get_child(1).get_child(0).shape.radius = data.rangeRadius * 16
	get_child(2).get_child(0).shape.size = get_child(2).get_child(0).shape.size * data.widthHeight
