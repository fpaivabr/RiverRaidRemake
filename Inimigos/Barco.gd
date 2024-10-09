extends Node2D
class_name Barco

@export var fire_rate: float = 3.0
@export var alvo_scene = preload("res://Projeteis/Inimigos/AtaqueBarco.tscn")

@onready var fire_timer = $Timer
@onready var GlobalReference = get_node("/root/GlobalValues")
var Alvo

func _ready():
	Alvo = GlobalReference.JogadorRef
	fire_timer.wait_time = fire_rate
	fire_timer.start()
	fire_timer.connect("timeout", self._on_fire_timeout)

func _on_fire_timeout():
	if Alvo != null:
		var alvo = alvo_scene.instantiate()
		alvo.position = Alvo.global_position
		get_parent().add_child(alvo)
		alvo.start_tracking(Alvo)  # Inicia o rastreamento do jogador
