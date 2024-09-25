extends Control

var velocidade = 100

func _process(delta):
	position.y += velocidade * delta

	if position.y > 600:  # Quando o fundo sair da tela, reseta a posição
		position.y = 0
