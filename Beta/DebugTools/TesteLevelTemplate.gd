extends Level

@export var IngameDebug := true
@export var JogadorHitBox := true
@export var JogadorVida := 10
@export var JogadorSpeed := 200.0
@export_enum("TiroMulti","SuperMissil","Escudo") var PowerUpAtual := 0
@export var SpawnLocation : PathFollow2D = null

var Inimigo1 = preload("res://Inimigos/Aviao.tscn")
var Inimigo2 = preload("res://Inimigos/Helicoptero.tscn")

func _ready():
	#GlobalReference.PowerUpAtual = GlobalReference.PowerUps[1]
	super()
	SetJogador()
		

func _unhandled_input(event):
	if event.is_action_pressed("Pausar") and !IngameDebug:
		$Pause/PauseMenu.show()
		$Pause/PauseMenu/Vbox/Voltar.grab_focus()
		get_tree().paused = true
	elif event.is_action_pressed("Pausar") and IngameDebug:
		$Pause/DebugMenu.show()
		$Pause/DebugMenu/Vbox/Voltar.grab_focus()
		get_tree().paused = true

func SpawnInimigo(opCode: int):
	match opCode:
		1:			
			var novoInimigo = Inimigo1.instantiate()
			SpawnLocation.SetVelocidade(novoInimigo.velocidade)
			SpawnLocation.add_child(novoInimigo)
			SpawnLocation.flipAtivo()
		2:	
			var novoInimigo = Inimigo2.instantiate()
			SpawnLocation.SetVelocidade(novoInimigo.velocidade)
			SpawnLocation.add_child(novoInimigo)
			SpawnLocation.flipAtivo()

func SetJogador():
	Jogador1.Speed = JogadorSpeed
	Jogador1.get_node("VidaComponente").VidaAtual = JogadorVida
	Jogador1.get_node("VidaComponente").VidaMaxima = JogadorVida
	Jogador1.get_node("HurtboxComponente").set_process(JogadorHitBox)
	var novoPowerUp := "TiroMulti"
	match PowerUpAtual:
		0: novoPowerUp = "TiroMulti"
		1: novoPowerUp = "SuperMissil"
		2: novoPowerUp = "Escudo"
	Jogador1.setPowerUp(novoPowerUp)
