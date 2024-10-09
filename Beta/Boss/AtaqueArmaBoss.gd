extends ProjetilComp

@onready var Global = get_node("/root/GlobalValues")
var WhereTo = Vector2(1,0)
var flag = true
var Alvo

func _ready():
	Alvo = Global.JogadorRef
	pass 

func playerPosi():
	WhereTo = WhereTo.rotated(global_position.direction_to(Alvo.position).angle()).normalized()
	pass

func _process(delta):	
	if flag:
		playerPosi()
		flag = false
	position += WhereTo * delta * Velocidade
	pass
