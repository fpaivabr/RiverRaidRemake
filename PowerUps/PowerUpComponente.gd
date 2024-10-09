extends Node2D
## Node que oferece métedos para realizar ataques de projéteis
class_name PowerUpComp

## Define o projétil a ser atirado
@export var projetil : PackedScene
## Guarda o powerup escolhido nesta fase, armazenado em texto para facilitar entendimento do código
var powerUp : String
## Guarda o gasto de energia do powerup
var gasto : int
## Referência à valores utilizados em várias porções do código
@onready var GlobalReference = get_node("/root/GlobalValues")

## Função que recebe o powerup do jogador como string, e inicializa os valores associados a ele corretamente
func setPowerUp(powerUpId: String) -> void:
	powerUp = powerUpId
	match powerUp:
		"SuperMissil":
			projetil = preload("res://Projeteis/Jogador/Missel.tscn")
			gasto = 3
		"TiroMulti":
			projetil = preload("res://Projeteis/Jogador/TiroMultiDirecional.tscn")
			gasto = 4
		"Escudo":
			gasto = 2
		
##
func Action(PositionX: float, PositionY: float, _delta) -> void:
	if GlobalReference.barraEnergia <= 0:
		return
	if powerUp == "Escudo":
		GlobalReference.barraEnergia -= gasto * _delta
		pass
	else:
		GlobalReference.barraEnergia -= gasto
		Ataque(PositionX,PositionY)

func Ataque(PositionX: float, PositionY: float) -> void:
	var bullet = projetil.instantiate()
	var PositionGlobal : Vector2 = Vector2(0,0)
	PositionGlobal.x = PositionX
	PositionGlobal.y = PositionY
	get_tree().root.get_node("Particulas").add_child(bullet)
	bullet.start(PositionGlobal)
