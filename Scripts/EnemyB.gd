extends CharacterBody2D

var velocidade = 200  # Velocidade do inimigo B

func _process(delta):
	# Movimento vertical do inimigo
	position.y += velocidade * delta

	# Quando sair da tela, removê-lo
	if position.y > 600:
		queue_free()
