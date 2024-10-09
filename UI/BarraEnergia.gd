extends ProgressBar

@onready var GlobalReference = get_node("/root/GlobalValues")

func init_energia():
	max_value = 40
	value = 40

func _process(_delta):
	var energia = GlobalReference.barraEnergia
	alterarEnergia(energia)
	
func alterarEnergia(valor) -> void:
	value = valor


