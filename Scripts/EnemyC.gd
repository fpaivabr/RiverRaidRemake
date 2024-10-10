extends CharacterBody2D

var velocidade = 100
var direcao = 1  # Direção do movimento: 1 para a direita, -1 para a esquerda

func _process(delta):
	# Movimento de "ping-pong" do Boss após 60 segundos
	position.x += velocidade * direcao * delta
	
	# Troca de direção quando atingir os limites da tela
	if position.x < 250 or position.x > 550:
		direcao *= -1
