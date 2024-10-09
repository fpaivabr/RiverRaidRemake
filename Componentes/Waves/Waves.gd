extends Node
## Node responsável por Spawnar inimigos na tela. Requer que cada grupo de inimigos sejá colocado em um node filho do tipo Wave.
class_name Waves

##Sinal interno emitido no evento _on_clock_timeout
signal TimerTimeout

##Contador de segundos decorridos desde o ínicio da fase
var segundos := 0

## Tempo de espera entre os spawns dos inimigos
@export_range(0,1) var InimigoDelay := 0.4

'## Tempo de espera entre os spawns das waves
@export_range(1,60) var TimePerWave := 1
@onready var GlobalReference = get_node("/root/GlobalValues")
var MoverScene := preload("res://Componentes/Waves/auto_mover.tscn")
var TodasWaves : Array[Wave] = []
var WaveAtual := 0'

func _ready():
	pass

##Registra os segundos desde o inicio da fase e emite o sinal [TimerTimeout] a cada segundo.
func _on_clock_timeout():
	segundos += 1
	TimerTimeout.emit()

'func GetWaves() -> void:
	for i in get_children():
		if i is Wave:
			TodasWaves.append(i)

func SpawnWaveX(Spawn: Wave) -> void:
	if Spawn.Inimigos and Spawn.Quantidade and Spawn.LocalizacaoSpawn:
		for C in Spawn.Inimigos.size():
			for A in Spawn.Quantidade[C]:
				var inimigo = Spawn.Inimigos[C].instantiate()
				var caminho = MoverScene.instantiate()
				caminho.SETVelocidade(inimigo.velocidade)
				Spawn.LocalizacaoSpawn[C].add_child(caminho)
				inimigo.Alvo = GlobalReference.JogadorRef
				caminho.add_child(inimigo)
				await get_tree().create_timer(InimigoDelay).timeout
	else:
		push_error("Um dos arrays do node Wave não foi iniciado apropriadamente")

func _on_wave_spawn_timeout() -> void:
	if WaveAtual < TodasWaves.size():
		SpawnWaveX(TodasWaves[WaveAtual])
		WaveAtual += 1'
