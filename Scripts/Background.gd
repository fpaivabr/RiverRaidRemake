extends Control  
var background_height = 0
var velocidade = 100

func _ready():
	if $TextureRect.texture != null:
		background_height = $TextureRect.texture.get_size().y

func _process(delta):
	position.y += velocidade * delta
	if position.y >= background_height:
		position.y = 0
