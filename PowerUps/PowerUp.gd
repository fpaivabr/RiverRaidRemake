#extends Node2D
#class_name PowerUp
#
#const SPEED = 25.0
#@export var tipo: int = 1
#
#func _physics_process(_delta):
	#position.y += SPEED * _delta
	#pass
#
#func _on_visible_on_screen_notifier_2d_screen_exited():
	#queue_free()
#
#
#func _on_area_2d_area_entered(area):
	#var parent = area.get_parent()
	##if area is HitboxComp and parent is Jogador:
	##	parent._power_up(tipo)
	##	queue_free()
