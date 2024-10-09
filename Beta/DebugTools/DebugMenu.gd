extends Control

@export var Fase : Level = null
var InimigoAtual


func _on_sair_pressed():
	get_tree().paused = false
	get_tree().quit()

func _on_voltar_pressed():
	hide()
	get_tree().paused = false

func _on_sa_pressed():
	Fase.SpawnInimigo(1)
	hide()
	get_tree().paused = false

func _on_sh_pressed():
	Fase.SpawnInimigo(2)
	hide()
	get_tree().paused = false
