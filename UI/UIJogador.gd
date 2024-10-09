extends Control
@onready var GlobalReference = get_node("/root/GlobalValues")
@onready var pontos = $Pontuacao
@onready var vida = $Vidas
@onready var powerUp = GlobalReference.PowerUpAtual
@onready var icone = $PowerUp
var icon
# Called when the node enters the scene tree for the first time.
func _ready():
	match powerUp:
		"TiroMulti":
			icon = preload("res://Assets/TiroTriploIcon.png")
		"SuperMissil":
			icon = preload("res://Assets/LaserIcon.png")
		"Escudo":
			icon = preload("res://Assets/EscudoIcon.png")
	icone.texture = icon
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pontos.text = "Score: " +  str(GlobalReference.pontuacao)
	vida.text = "Vidas: " +    str(GlobalReference.vidas)
	pass
