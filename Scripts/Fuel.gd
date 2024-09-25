# scripts/Fuel.gd
extends RigidBody2D

var velocidade = 100

# Movimentação automática
func _ready():
	linear_velocity = Vector2(0, velocidade)

# Função de colisão
func _on_Fuel_body_entered(body):
	if body is CharacterBody2D:
		body.reabastecer(30)  # Reabastece o jogador em 30 unidades
		queue_free()  # Remove o Fuel após ser coletado
