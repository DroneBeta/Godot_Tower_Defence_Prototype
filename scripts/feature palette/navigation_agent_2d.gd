extends NavigationAgent2D

var movement_speed: float = 64.0
var target: Node2D = null

@onready var client_node: Node2D = get_parent()
@onready var objects: Node2D = client_node.get_parent() # ALL CLIENT_NODE MUST BE UNDER OBJECTS
@onready var ground_tiles: = $"../../../TileLayers/GroundLayer" # must find a better alternative to just hard coding location

func _ready() -> void:
	call_deferred("pathfindg_setup")

func _physics_process(delta: float) -> void:
	if target:
		target_position = target.global_position
	else:
		find_target()
	
	if is_navigation_finished():
		return
	
	var current_pos = client_node.global_position
	var target_path = get_next_path_position()
	client_node.position += current_pos.direction_to(target_path) * movement_speed * delta * get_tile_data("speedIndex")

func find_target() -> void:
	var potential_targets = objects.get_tree().get_nodes_in_group("ally")
	
	if !potential_targets.is_empty():
		var new_target = potential_targets[0] # 0 identifies which ally
		target = new_target

func get_tile_data(custom_data_name: StringName) -> Variant:
	if not ground_tiles:
		return null
	
	var cell: Vector2i = ground_tiles.local_to_map(client_node.position)
	var data: TileData = ground_tiles.get_cell_tile_data(cell)
	if data:
		var tile_data = data.get_custom_data(custom_data_name) 
		return tile_data
	return null

func pathfinding_setup() -> void:
	await get_tree().physics_frame
	if target:
		target_position = target.global_position
