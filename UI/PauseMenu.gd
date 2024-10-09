extends Control

func _on_opções_pressed():
	pass

func _on_voltar_pressed():
	hide()
	get_tree().paused = false

func _on_smenu_pressed():
	get_tree().root.get_node("Particulas").queue_free()
	get_tree().paused = false
	get_tree().change_scene_to_file("res://MainMenu.tscn")

func _on_s_jogo_pressed():
	get_tree().paused = false
	get_tree().quit()
