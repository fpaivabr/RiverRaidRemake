extends Control

var velocidade = 100
var screen_height = 600

func _process(delta):
	# Move o background para baixo
	position.y += velocidade * delta

	# Reposiciona o background para o topo assim que sair da tela
	if position.y >= screen_height:
		position.y = 0
