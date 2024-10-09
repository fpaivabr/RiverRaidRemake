extends Control

var PauseMenu = preload("res://UI/OpçõesMenu.tscn")
#@onready var GlobalReference = get_node("/root/GlobalValues")

func _ready():
	$VBoxContainer/PButton.grab_focus()
	pass

func _on_p_button_pressed():
	get_tree().change_scene_to_file("res://UI/PowerUpsMenu.tscn")
	#get_tree().change_scene_to_file(GlobalReference.FaseInicial.get_path())
	pass


func _on_s_button_pressed():
	get_tree().quit()
	pass


func _on_op_button_pressed():
	get_tree().change_scene_to_file("res://UI/OpçõesMenu.tscn")
	pass
