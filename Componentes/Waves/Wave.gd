extends Node
##Node responsável por segurar os dados de cada inimigo a ser spwanado pelo node Waves.
class_name Wave

##Referência ao node pai
@onready var WaveControle = get_parent()

##Referência ao script global
@onready var GlobalReference = get_node("/root/GlobalValues")

##Preload da scene responsável pelo movimento dos inimigos
var MoverScene := preload("res://Componentes/Waves/auto_mover.tscn")

##Contém os inimigos que seram spawnados. Cada Inimigos é spawnado conforme o Quantidade[] na posição correspondente.
@export var Inimigos : Array[PackedScene] = []

##Contém o a quantidade que cada inimigo em Inimigo[] deve ser spawnado.
@export var Quantidade : Array[int] = []

##Contém os nodes Path2D no qual os inimigos devem spawnar.
@export var LocalizacaoSpawn : Array[Path2D] = []

##Em qual segundo a wave deve ser spawnada.
@export var SpawnTime := 0

##Armazena objetos do tipo [CurvaAcel]. Pemite alterar a velocidade do inimigo em pedaçõs diferentes da curva.		
@export var Curvas : Array[CurveAcel] = []
func _ready():
	WaveControle.connect("TimerTimeout", self.ChecarSpawn)

##Instância e adiciona de acordo com o array [quantidade], todos os inimigos no array [Inimigos] nos [path2D] do array [LocalizacaoSpawn].
func SpawnWave() -> void:
	for C in Inimigos.size():
		for A in Quantidade[C]:
			var inimigo = Inimigos[C].instantiate()
			inimigo.Alvo = GlobalReference.JogadorRef
			var caminho = MoverScene.instantiate()
			if Curvas:
				caminho.SetCurvas(Curvas)
				caminho.SetDadosAtuais(0)
			caminho.SetVelocidade(inimigo.velocidade)
			LocalizacaoSpawn[C].add_child(caminho)
			caminho.add_child(inimigo)
			await get_tree().create_timer(WaveControle.InimigoDelay).timeout

##Verifica se a Wave deve ser [i]Spawnada[/i] no segundo atual.
func ChecarSpawn() -> void:
	if WaveControle.segundos == SpawnTime:
		SpawnWave()
	pass
