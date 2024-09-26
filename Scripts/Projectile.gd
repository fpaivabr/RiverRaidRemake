extends CharacterBody2D

var velocidade = 400

# Movimentação do projétil
func _physics_process(delta):
	velocity = Vector2(0, -velocidade)  # O projétil vai se mover para cima
	move_and_slide()

	# Se o projétil sair da tela, ele é destruído
	if position.y < 0:
		queue_free()

# Função que lida com a colisão
func _on_Projectile_body_entered(body):
	pass
	#if body.name == "Enemy" or body.name == "Obstacle":
		#body.queue_free()  # Destroi o inimigo/obstáculo
		#queue_free()  # Destroi o projétil após a colisão
