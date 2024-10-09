extends Node2D

var podeatirar := true
var Alvo := Node
@export_range(0.1,1) var velocidade : float = 0.1

func _ready():
	if global_position.x <= 320:
		$Ani.flip_h = true
	$Ani.play("flight")
	$VidaComp.connect("Morto", self.Morrer)

func _process(_delta):
	if $AtaqueComp.projetil and podeatirar and Alvo != null:
		$AtaqueComp.Ataque(global_position.x, global_position.y)
		podeatirar = false
	pass

func _on_timer_timeout():
	podeatirar = true

func Morrer():
	queue_free()
