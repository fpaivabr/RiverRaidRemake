extends ProjetilComp
class_name Target

func _ready():
	Dano = 0
	pass	

func _process(delta):
		position.y += 80*delta;
		
func _on_area_entered(area:Area2D):
	if area is HitboxComp:
		area.Stun()
		queue_free()
	pass
