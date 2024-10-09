extends Node2D

@export var velocidade: float = 200.0
@export var dano: int = 20
@export var explosao_scene: PackedScene

var target_position: Vector2
var direction: Vector2

func _ready():
	target_position = get_node("/root/GlobalValues/Jogador").global_position
	direction = (target_position - global_position).normalized()

func _process(delta):
	global_position += direction * velocidade * delta

func _on_Area2D_area_entered(area):
	if area.is_in_group("Jogador"):
		area.receber_dano(dano)
		var explosion_instance = explosao_scene.instance()
		get_parent().add_child(explosion_instance)
		explosion_instance.global_position = global_position
		queue_free()
