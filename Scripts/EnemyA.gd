extends CharacterBody2D

func _ready():
	print("Inimigo A pronto")
	set_collision_layer(2)  # Define o layer dos inimigos
	set_collision_mask(1)   # Só colide com player e projéteis

	# Conecta o sinal de colisão
	connect("body_entered", Callable(self, "_on_body_entered"))

	velocity = Vector2(0, 200)  # Define a velocidade diretamente

func _physics_process(delta):
	move_and_slide()

	# Remove o inimigo quando sair da tela
	if position.y > 600:
		queue_free()

func _on_body_entered(body):
	if body.name == "Player":
		print("Colidiu com o Player")
		body.queue_free()  # Remove o Player
		queue_free()  # Remove o inimigo
	elif body.is_in_group("projectile"):
		print("Colidiu com Projétil:", body.name)
		body.queue_free()  # Remove o Projétil
		queue_free()  # Remove o inimigo


func _on_area_2d_body_entered(body: Node2D) -> void:
	print(">>>>>>>> ",body.name)
	pass # Replace with function body.
