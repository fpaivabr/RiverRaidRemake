# scripts/Obstacle.gd
extends Node2D

var velocidade = 100

# Movimentação automática dos obstáculos para baixo
func _process(delta):
	position.y += velocidade * delta

	# Destrói o obstáculo quando sair da tela
	if position.y > 600:  # Ajuste de acordo com o tamanho da sua tela
		queue_free()
