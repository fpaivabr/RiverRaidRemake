extends Level


func FimDaFase() -> void:
	get_tree().root.get_node("Particulas").queue_free()
	GlobalReference.setNextLevel(2)
	get_tree().change_scene_to_file("res://UI/TelaVitoria.tscn")
