extends Polygon2D

var Inimigo1 = preload("res://Inimigos/Helicoptero.tscn")
var Inimigo2 = preload("res://Inimigos/Aviao.tscn")
#var Mover = preload("res://Componentes/Waves/auto_mover.tscn")
var Mover : Array[PathFollow2D] = []
@export var Corpo : Polygon2D

func _ready():
	Corpo.connect("PartDestroyed", self.Improve)
	$VidaComp.connect("Morto", self.Explode)
	$Timer.connect("timeout", self.Deploy)
	pass

func Explode():
	$HitboxComp/CollisionPolygon2D.disabled = true;
	Corpo.explode()
	queue_free()

func Improve():
	$Timer.wait_time *= 0.8

func Deploy():
	var Path = randi_range(1,2)
	var novoInimigo = Inimigo1.instantiate()
	if Path == 1:
		$Path1/Mover.add_child(novoInimigo)
		$Path1/Mover.Start()
	elif Path == 2:
		$Path2/Mover2.add_child(novoInimigo)
		$Path2/Mover2.Start()
