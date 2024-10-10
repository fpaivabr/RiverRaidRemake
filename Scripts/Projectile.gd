extends CharacterBody2D

@export var bullet_speed: float = 600.0  # Velocidade do projétil

func _ready():
	print("Projétil pronto")
	#set_collision_layer(2)  # Define o layer do projétil
	#set_collision_mask(1)   # Só colide com inimigos e fuel

	# Conecta o sinal de colisão
	connect("body_entered", Callable(self, "_on_body_entered"))

	velocity = Vector2(0, -bullet_speed)  # Velocidade para cima

func _physics_process(delta: float):
	move_and_slide()

	# Verifica se o projétil saiu da tela
	if position.y < 0:
		print("Projétil destruído por sair da tela")
		queue_free()
	velocity.y = -bullet_speed -bullet_speed*delta

func _on_body_entered(body):
	if body.is_in_group("enemy") or body.is_in_group("fuel"):
		print("Projétil colidiu com:", body.name)
		body.queue_free()  # Remove o inimigo ou combustível
		queue_free()  # Remove o projétil
