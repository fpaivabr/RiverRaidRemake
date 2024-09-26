extends CharacterBody2D

var velocidade = 200
var inclinacao_maxima = 15
var combustivel = 2000

func _physics_process(delta):
	var direcao = Vector2()

	# Movimentação horizontal do jogador
	if Input.is_action_pressed("ui_left"):
		direcao.x = -1
	elif Input.is_action_pressed("ui_right"):
		direcao.x = 1

	# Aplica o movimento lateral
	velocity.x = direcao.x * velocidade
	move_and_slide()

	# Verifica colisões
	if get_last_slide_collision():
		var colisao = get_last_slide_collision()
		var collider = colisao.get_collider()

		# Se colidir com os obstáculos laterais, o player para
		if collider.name == "SideObstacle":
			velocity.x = 0

		# Se colidir com os obstáculos centrais ou inimigos, o player morre
		if collider.name == "CentralObstacle" or collider.name == "Enemy":
			morrer()

	# Inclinação da nave
	if direcao.x != 0:
		rotation_degrees = lerp(rotation_degrees, direcao.x * inclinacao_maxima, 0.1)
	else:
		rotation_degrees = lerp(rotation_degrees, 0.0, 0.1)

	# Consome combustível
	combustivel -= delta * 5
	if combustivel <= 0:
		morrer()

func morrer():
	print("Player morreu")
	queue_free()
