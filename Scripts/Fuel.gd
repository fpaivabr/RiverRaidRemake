extends CharacterBody2D

func _ready():
	print("Fuel pronto")
	set_collision_layer(2)  # Define o layer do fuel
	set_collision_mask(1)   # Só colide com player e projéteis

	# Conecta o sinal de colisão
	connect("body_entered", Callable(self, "_on_body_entered"))

	velocity = Vector2(0, 150)  # Define a velocidade diretamente

func _physics_process(delta):
	move_and_slide()

	# Remove o Fuel quando sair da tela
	if position.y > 600:
		queue_free()

func _on_body_entered(body):
	if body.name == "Player":
		print("Colidiu com o Player e foi coletado")
		body.reabastecer(500)  # Reabastece 1/4 da vida do player
		queue_free()  # Remove o Fuel
	elif body.is_in_group("projectile"):
		print("Colidiu com Projétil:", body.name)
		body.queue_free()  # Remove o Projétil
		queue_free()  # Remove o Fuel
