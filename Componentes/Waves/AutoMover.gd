extends PathFollow2D
##Contém métodos e atributos para controlar um movimento dentro de um [Path2D]
class_name AutoMover

##Define o movimento em pixels por segundo.
var Velocidade : float = 0.8

##Armazena as informações dos objetos [CurvaAcel]
var Curvas : Array[CurveAcel] = []

##Aceleração do elemento atual no Array.
var AceleracaoAtual : float = 1

##Progress_ratio máximo do elemento atual no Array.
var ProgressAtual : float = 0

##Elemento atual do Array.
var CurvaAtual := 0

func _process(delta):
	if progress_ratio > ProgressAtual:
		AtualizarCurva()
	
	if progress_ratio >= 1:
		queue_free()

	progress_ratio += delta*Velocidade*AceleracaoAtual



##Atualiza a velocidade do [AutoMover]
func SetVelocidade(NovaVelocidade: float) -> void:
	Velocidade = NovaVelocidade

##Atualiza o Array de [CurveAcel] do [AutoMover]
func SetCurvas(NovaCurvas: Array[CurveAcel]) -> void:
	Curvas = NovaCurvas

##Verifica qual é a proxima curva no Array e atualiza as variáveis [i]Atuais[/i]. Se não houver mais curvas no Array retorna a velocidade para padrão.
func AtualizarCurva() -> void:
	if CurvaAtual < Curvas.size()-1:
		CurvaAtual += 1
		SetDadosAtuais(CurvaAtual)
	else:
		AceleracaoAtual = 1
	
##Atualiza o valor das variáveis [i]Atuais[/i] de acordo com o [Index].
func SetDadosAtuais(Index: int) -> void:
	ProgressAtual = Curvas[Index].CurvaProgress
	AceleracaoAtual = Curvas[Index].CoefienteAceleracao
