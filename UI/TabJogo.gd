extends Control

@onready var GlobalReference = get_node("/root/GlobalValues")

func _ready():
	$ValoresIniciais/VidasIniciais/VidaSlider.value = GlobalReference.VidasIniciais
	pass 

func _on_level_1_pressed():
	GlobalReference.FaseInicial = preload("res://Levels/Fase1/Level1.tscn")
	pass 

func _on_level_2_pressed():
	GlobalReference.FaseInicial = preload("res://Levels/Fase2/Level2.tscn")
	pass 

func _on_level_3_pressed():
	#GlobalReference.FaseInicial = preload("res://Levels/Fase3/Level3.tscn")
	pass 

func _on_h_slider_value_changed(value:int):
	GlobalReference.vidas = value
	GlobalReference.VidasIniciais = value;
	pass
