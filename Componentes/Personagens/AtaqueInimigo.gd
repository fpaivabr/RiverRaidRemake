extends ProjetilComp
class_name AtaqueEnemy

@export var fire_rate: float = 1.0

@onready var fire_timer = $Timer
@onready var GlobalReference = get_node("/root/GlobalValues")
var Alvo 


var Direcao :Vector2 = Vector2(1,0)

var pode_atirar: bool = true

func _ready():
	Alvo = GlobalReference.JogadorRef
	fire_timer.wait_time = fire_rate
	fire_timer.start()
	fire_timer.connect("timeout", self._on_timer_timeout)



func playerPosi():
	if Alvo != null:
		Direcao = Vector2(1,0).rotated(global_position.direction_to(Alvo.position).angle()).normalized()
	pass
	
func _on_timer_timeout():
	pode_atirar = true

func _process(delta):	
	if pode_atirar:
		playerPosi()
		pode_atirar = false
		fire_timer.start()
	position += Direcao * delta * Velocidade
	pass
