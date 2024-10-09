extends Control

@onready var GlobalReference = get_node("/root/GlobalValues")

func _ready():
	$VBoxContainer/Reiniciar.grab_focus()
	var Particulas = get_tree().root.get_node("Particulas")
	if Particulas != null:
		Particulas.queue_free()
	pass


func _on_menu_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://MainMenu.tscn")

func _on_reiniciar_pressed():
	get_tree().change_scene_to_file("res://Levels/Fase1/Level1.tscn")
	
	
