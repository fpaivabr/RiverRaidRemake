extends Polygon2D

@onready var Global = get_node("/root/GlobalValues")
@export var Corpo : Polygon2D

func _ready():
	Corpo.connect("PartDestroyed", self.Improve)
	$VidaArma.connect("Morto", self.Explode)
	$Timer.connect("timeout", self.timeout)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	look_at(Global.JogadorRef.position)
	pass

func Improve():
	$Timer.wait_time *= 0.8

func timeout():
	$AtaqueComp.Ataque($Tip.global_position.x, $Tip.global_position.y)
	pass 

func Explode():
	$HitboxComp/CollisionPolygon2D.disabled = true;
	Corpo.explode()
	queue_free()
