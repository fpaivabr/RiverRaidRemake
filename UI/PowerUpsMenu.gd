extends Control

@onready var GlobalReference = get_node("/root/GlobalValues")

func _ready():
	$"VBoxContainer/Super Missil".grab_focus()
	pass

func _on_p_button_pressed():
	#get_tree().change_scene_to_file("res://UI/PowerUpsMenu.tscn")
	
	pass



func _on_tiro_triplo_pressed():
	GlobalReference.PowerUpAtual = GlobalReference.PowerUps[1]
	get_tree().change_scene_to_file(GlobalReference.FaseInicial.get_path())
	pass # Replace with function body.


func _on_super_missil_pressed():
	GlobalReference.PowerUpAtual = GlobalReference.PowerUps[2]
	get_tree().change_scene_to_file(GlobalReference.FaseInicial.get_path())
	pass # Replace with function body.


func _on_escudo_pressed():
	GlobalReference.PowerUpAtual = GlobalReference.PowerUps[3]
	get_tree().change_scene_to_file(GlobalReference.FaseInicial.get_path())
	pass # Replace with function body.
