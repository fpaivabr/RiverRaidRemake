extends TileMap
## Node do tipo [TileMap], com funcionalidades de geração baseadas em chunks. [br]
##[b]Chunk:[/b] nesse caso 1 chunk = [i]screensize[/i].
class_name Mundo

##Referência ao [TileSet] deste [TileMap]
@onready var Tileset = tile_set

##Define o tamanho do [chunk] com base no tamanho da tela ([viewport size]).
@onready var TamanhoDoChunk := Vector2i(ceil(get_viewport_rect().size.x/(Tileset.tile_size.x*scale.x)),ceil(get_viewport_rect().size.y/(Tileset.tile_size.y*scale.y)))

##Experimental:: Define o tipo de geração da fase. [br]
##[b]Fixa:[/b] não faz nada, apenas utiliza o [TileMap] como está. [br]
##[b]Aleatória:[/b] gera cada chunk aleatóriamente com base no [TileMapPattern] do [TileMap]. [br]
##[b]Discreta:[/b] [i]Em Construção[/i]
@export_enum("Fixa", "Aleatória", "Discreta") var GeracaoDeChunk = 0

## Experimental:: Define o tamanho do [TileMap] em [i]Chunks[/i]. [b]Necessário[/b] para gerarão aleatória.
@export var TamanhoDoMundo := 0

## Se [param true] começa movimentando o mundo.
@export var AutoMove := true

##Sinal interno, disparado quando se chega no fim do cenário
signal FimDoMundo

func _ready():
	SetGeracaoMundo(GeracaoDeChunk)
	pass

func _process(delta):
	if AutoMove:
		MoverMundo(get_viewport_rect().size.y/4, delta)
	pass

##Define qual método usar para construir o [Mundo].
func SetGeracaoMundo(Opção: int) -> void:
	match Opção:
		0:
			pass
		1:
			CriarMundoRNG()
		2:
			pass

##Experimental::Faz a geração de mundo de maneira aleatória. Utiliza os [patterns] do [TileSet] para construir os [i]chunks[/i].
func CriarMundoRNG() -> void: 
	var rng = RandomNumberGenerator.new()
	for c in TamanhoDoMundo:
		var Camada = 0
		var Posicao = Vector2i(0,-(TamanhoDoChunk.y*c))
		var Padrao = Tileset.get_pattern(rng.randi_range(0,Tileset.get_patterns_count()-1))
		set_pattern(Camada, Posicao, Padrao)

## Move o [Mundo] para baixo do eixo y de acordo com a [Velocidade] em pixels, corigido pelo [delta] time.
func MoverMundo(Velocidade: float, delta: float) -> void: 
	if position.y >= ((TamanhoDoMundo-1)*(TamanhoDoChunk.y*Tileset.tile_size.y*scale.y))-1:
		FimDoMundo.emit()
	else:
		position.y += delta * Velocidade
