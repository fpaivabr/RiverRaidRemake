extends Control  

var background_height = 0
var velocidade = 100

func _ready():
	# Obtém a altura total da textura para calcular o scroll
	if $TextureRect.texture != null:
		background_height = $TextureRect.texture.get_size().y
	else:
		print("A textura não foi atribuída ao TextureRect!")

func _process(delta):
	# Move o background para baixo
	position.y += velocidade * delta

	# Reposiciona o background para o topo quando sair da tela
	if position.y >= background_height:
		position.y = 0
