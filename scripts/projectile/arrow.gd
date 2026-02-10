extends Sprite2D

@onready var particle_effects: CPUParticles2D = $Effects

var speed: float = 200

func p_shot(starting_pos: Vector2, target: Object) -> void:
	print(starting_pos, target)

func _process(delta: float) -> void:
	position += transform.x  * speed * delta
	particle_effects.position += transform.x * speed * delta
