extends Area2D

var initial_speed: float
var time: float = 0.0
var throw_angle: float

var initial_pos: Vector2
var throw_dir: Vector2

var z_axis = 0.0
var is_launch: bool = false

@export var fast_v: float = 10
@export var lobing_v: float = 40

func _ready() -> void:
	var client_node = get_parent()
	client_node.p_shot.connect(receiving_data)

func _physics_process(delta: float) -> void:
	time += delta * fast_v
	
	if is_launch:
		z_axis = initial_speed * sin(deg_to_rad(throw_angle)) * time - 0.5 * (gravity / 100) * pow(time, 2)
		if z_axis > 0:
			$Effects.position.y = -z_axis
			var x_axis: float = initial_speed * cos(deg_to_rad(throw_angle)) * time
			global_position = initial_pos + throw_dir * x_axis


func receiving_data(starting_pos: Vector2, target: Object) -> void:
	if not is_launch:
		launch_projectile(starting_pos, starting_pos.direction_to(target.global_position), starting_pos.distance_to(target.global_position), lobing_v)

func launch_projectile(i_pos: Vector2, direction: Vector2, d_distance: float, d_angle: float):
	initial_pos = i_pos
	throw_dir = direction.normalized()
	
	throw_angle = d_angle
	initial_speed = pow(d_distance * (gravity / 100) / sin(2 * deg_to_rad(d_angle)), 0.5)
	
	global_position = initial_pos
	time = 0.0
	
	z_axis = 0
	is_launch = true
	
