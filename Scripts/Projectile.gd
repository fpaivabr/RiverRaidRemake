# scripts/Projectile.gd
extends CharacterBody2D

var velocidade = 400

# Movimentação do projétil
func _physics_process(delta):
	# Atualiza a velocidade para mover o projétil para cima
	velocity = Vector2(0, -velocidade)
	move_and_slide()

	# Destrói o projétil ao sair da tela
	if position.y < 0:
		queue_free()

# Função que lida com a colisão com o inimigo
func _on_CollisionShape2D_body_entered(body):
	if body.name == "Enemy":  # Verifica o nome do corpo colidido
		body.queue_free()  # Destroi o inimigo
		queue_free()  # Destroi o projétil após a colisão
