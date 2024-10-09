extends Node2D
## Define métodos e atributos padrões para construção de fases.
class_name Level

var PrimeiroFrame := true

@onready var GlobalReference = get_node("/root/GlobalValues")
@export var MundoDaFase : Mundo
@export var Jogador1 : Jogador

func _ready():
	if MundoDaFase:
		MundoDaFase.connect("FimDoMundo", self.FimDaFase)
	
	if Jogador1:
		GlobalReference.JogadorRef = Jogador1
		Jogador1.setPowerUp(GlobalReference.PowerUpAtual)

func _process(_delta):
	if PrimeiroFrame:
		OnPrimeiroFrame()

func OnPrimeiroFrame():
	CriarParticulas()
	GlobalReference.resetJogador()
	PrimeiroFrame = false

func _unhandled_input(event):
	if event.is_action_pressed("Pausar"):
		$Pause/PauseMenu.show()
		$Pause/PauseMenu/Vbox/Voltar.grab_focus()
		get_tree().paused = true

func CriarParticulas() -> void:
	var Projeteis = Node2D.new()
	Projeteis.set_name("Particulas")
	get_tree().root.add_child(Projeteis)

func FimDaFase() -> void:
	get_tree().root.get_node("Particulas").queue_free()
	get_tree().change_scene_to_file("res://UI/TelaVitoria.tscn")
