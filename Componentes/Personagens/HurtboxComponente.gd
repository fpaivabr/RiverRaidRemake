extends Area2D
## Oferece métodos para detecção de dano. É necessário atribuir um node CollisionShape2D.
class_name HitboxComp

## Cria uma conexão com um node VidaComp para controle de Vida.
@export var Vida : VidaComp

signal Stunned

func Stun():
	Stunned.emit()

func Hit(dano: int):
	if Vida:
		Vida.Dano(dano)
	pass

