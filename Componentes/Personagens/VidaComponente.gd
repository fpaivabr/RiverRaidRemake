extends Node2D
## Node que oferece métodos para controle de vida 
class_name VidaComp

var escudo : bool = false

signal Morto
## Define o valor Máximo/Inicial de vida
@export var VidaMaxima := 10
var VidaAtual : int
var Vivo := true

func _ready():
	VidaAtual = VidaMaxima
	pass
	
	
func Dano(dano: int):
	VidaAtual -= dano
	if(VidaAtual <= 0 and Vivo):		
		Morto.emit()		
		Vivo = false;
	pass
