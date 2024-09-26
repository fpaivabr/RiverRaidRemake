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
# COMEÇAR CORREÇÃO AQUI!!
func _on_Projectile_body_entered(body):
	if body is Enemy or body is Obstacle:  # Verifica se o corpo é um inimigo ou obstáculo
		body.queue_free()  # Destrói o inimigo/obstáculo
		queue_free()  # Destrói o projétil após a colisão
