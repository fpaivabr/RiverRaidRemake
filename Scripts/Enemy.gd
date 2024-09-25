# scripts/Enemy.gd
extends CharacterBody2D

var velocidade = 150

func _process(delta):
	position.y += velocidade * delta

	if position.y > 600:  # Limite da tela
		queue_free()
