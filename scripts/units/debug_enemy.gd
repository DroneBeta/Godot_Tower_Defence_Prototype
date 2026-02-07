class_name Enemie
extends Area2D

var data: unitData

var health: float = 5000
var speed: int = 20

func _physics_process(delta: float) -> void:
	position.x += -speed * delta

func getsHit(dmgDealt: float):
	health = health - dmgDealt
	print(health)
