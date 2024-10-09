extends ProjetilComp

var Alvo 
var Direcao :Vector2 = Vector2(1,0)
var flag :bool= true
@onready var GlobalReference = get_node("/root/GlobalValues")

func playerPosi():
	if Alvo != null:
		Direcao = Vector2(1,0).rotated(global_position.direction_to(Alvo.position).angle()).normalized()
	pass

func _ready():
	Alvo = GlobalReference.JogadorRef
	pass

func _process(delta):
	if flag:
		playerPosi()
		flag = false
	position += Direcao * delta * Velocidade
	pass
