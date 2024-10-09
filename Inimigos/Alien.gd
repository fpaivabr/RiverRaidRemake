extends Node2D
var podeatirar = true
#@onready var jogador = get_tree().root.get_node("Level1/Jogador/VidaComponente")
var Alvo := Node
@export_range(0.1,1) var velocidade : float = 0.1

func _ready():
	pass 


func _process(_delta):
	if $AtaqueComponente.projetil and podeatirar and Alvo != null:
		$AtaqueComponente.Ataque(global_position.x, global_position.y)
		podeatirar = false
	pass

func _on_timer_timeout():
	podeatirar = true
	pass
