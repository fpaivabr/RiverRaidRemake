extends Area2D

class_name obstaculo  # Definindo o nome da classe

@export var dano_obstaculo: int = 5

func _ready():
	# Configuração da área de colisão do obstáculo
	var collision_shape = CollisionShape2D.new()
	var shape = RectangleShape2D.new()
	shape.extents = Vector2(16, 16)  # Tamanho do obstáculo (ajuste conforme necessário)
	collision_shape.shape = shape
	add_child(collision_shape)

	# Configuração da área para detecção de colisões
	var area = Area2D.new()
	area.name = "ObstaculoArea"
	area.collision_layer = 0  # Camada de colisão do obstáculo (ajuste conforme necessário)
	area.collision_mask = 0   # Máscara de colisão do obstáculo (ajuste conforme necessário)
	area.monitoring = true    # Permite que a área detecte colisões
	add_child(area)

func _on_Area2D_area_entered(area):
	if area.is_in_group("ProjetilGrupo"):
		area.receber_dano(dano_obstaculo)
