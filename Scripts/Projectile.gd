extends CharacterBody2D  

var velocidade = 400  # Velocidade do projétil

func _physics_process(delta):
	position.y -= velocidade * delta  # Move o projétil para cima

	# Se o projétil sair da tela, ele é destruído
	if position.y < 0:
		queue_free()

# Se você quiser lidar com colisões:
func _on_Projectile_body_entered(body):
	if body.name == "Enemy" or body.name == "Obstacle":
		body.queue_free()  # Destroi o inimigo/obstáculo
		queue_free()  # Destroi o projétil após a colisão
