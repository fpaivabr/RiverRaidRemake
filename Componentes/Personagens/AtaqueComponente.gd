extends Node2D
## Node que oferece métedos para realizar ataques de projéteis
class_name AtaqueComponente

## Define o projétil a ser atirado
@export var projetil : PackedScene

func Ataque(PositionX: float, PositionY: float):
	var bullet = projetil.instantiate()
	var PositionGlobal := Vector2(0,0)
	PositionGlobal.x = PositionX
	PositionGlobal.y = PositionY
	get_tree().root.get_node("Particulas").add_child(bullet)
	bullet.start(PositionGlobal)
