extends PathFollow2D

var Ativo := false

var Velocidade : float = 0.8

func _process(delta):
	if progress_ratio >= 1:
		get_child(0).queue_free()
		flipAtivo()
		progress_ratio = 0

	if Ativo:
		progress_ratio += delta*Velocidade

func SetVelocidade(NovaVelocidade: float) -> void:
	Velocidade = NovaVelocidade

func flipAtivo():
	Ativo = !Ativo
