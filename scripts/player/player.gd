extends Node2D

signal start_build(pos: Vector2)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		var pos = event.position
		start_build.emit(pos)
