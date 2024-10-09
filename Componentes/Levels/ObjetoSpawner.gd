extends Node2D
class_name ObjSpawComp

@export var Objeto : PackedScene = null

func _ready():
	if Objeto != null:
		SpawnObjeto(Objeto)

func SpawnObjeto(Obj: PackedScene):
	var newObjeto = Obj.instantiate()
	add_child(newObjeto)
	
