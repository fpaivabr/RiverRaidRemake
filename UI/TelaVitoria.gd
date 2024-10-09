extends Control

@onready var GlobalReference = get_node("/root/GlobalValues")

func _ready():
	$Continuar.grab_focus()
	pass

func _on_button_pressed():
	get_tree().change_scene_to_file("res://MainMenu.tscn")

func _on_continuar_pressed():
	get_tree().change_scene_to_file("res://UI/PowerUpsMenu.tscn")
	pass
