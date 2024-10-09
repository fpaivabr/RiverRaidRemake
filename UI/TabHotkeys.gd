extends Control

@onready var TeclaBotao = preload("res://UI/HotkeyButton.tscn")
@onready var ListaTeclas = $Painel/Margin/Scroll/VBox

var InputValido = {
	"esq": "Mover para Esquerda",
	"dir": "Mover para Direita",
	"cima": "Mover para Cima",
	"baixo": "Mover para Baixo",
	"tiro": "Disparar"
}

func _ready():
	Inicializar_Lista()
	pass

func Inicializar_Lista() -> void:
	InputMap.load_from_project_settings()
	for Acao in InputValido:
		var NovoBotao = TeclaBotao.instantiate()
		NovoBotao.find_child("NomeAção").text = InputValido[Acao]
		var TeclaCode = InputMap.action_get_events(Acao)
		NovoBotao.find_child("BotãoAção").text = TeclaCode[0].as_text().trim_suffix(" (Physical)")
		NovoBotao.pressed.connect(SetTecla.bind(NovoBotao, Acao))
		
		ListaTeclas.add_child(NovoBotao)
	pass

func SetTecla(_Botao, _Acao):
	#InputMap.action_add_event("tiro",KEY_B)
	#Precisa ser implementado
	pass


