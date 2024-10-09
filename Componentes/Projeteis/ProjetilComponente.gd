extends Area2D
## Node que define comportamento padrão para projeteis
class_name ProjetilComp

## Define a velocidade inicial do projétil
@export var Velocidade := 120

## Define o dano do projétil
@export var Dano := 1

func _ready():
	
	pass

func start(iniPosition):
	position = iniPosition

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _on_area_entered(area:Area2D):
	if area is HitboxComp:
		area.Hit(Dano)
		queue_free()
	pass

