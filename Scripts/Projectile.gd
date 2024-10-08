extends CharacterBody2D  

var velocidade = 200 
var direcao = Vector2(-1, 0)

func _physics_process(delta):
	position += direcao * velocidade * delta

	if position.y < 0:
		queue_free()

func _on_Projectile_body_entered(body):
	if body.name == "Enemy" or body.name == "Obstacle":
		body.queue_free()
		queue_free() 
