extends CharacterBody2D

var velocidade = 200
var inclinacao_maxima = 15
var combustivel = 2000
var limite_esquerdo = -300
var limite_direito = 300
var tempo_entre_disparos = 0.2
var tempo_ultimo_disparo = 0
var Projectile = preload("res://scenes/Projectile.tscn")

func _physics_process(delta):
	var direcao = Vector2()

	# Movimentação horizontal do jogador
	if Input.is_action_pressed("ui_left"):
		direcao.x = -1
	if Input.is_action_pressed("ui_right"):
		direcao.x = 1
		
	tempo_ultimo_disparo += delta
	if Input.is_action_just_pressed("ui_up") and tempo_ultimo_disparo >= tempo_entre_disparos:
		disparar()
		tempo_ultimo_disparo = 0

	# Aplica o movimento lateral
	velocity.x = direcao.x * velocidade
	move_and_slide()

	# Verifica colisões
	if get_last_slide_collision():
		var colisao = get_last_slide_collision()
		var collider = colisao.get_collider()

		# Se colidir com os obstáculos laterais, o player para
		if collider.name.begins_with("SideObstacle"):
			velocity.x = 0
			morrer()  

		# Se colidir com os obstáculos centrais ou inimigos, o player morre
		if collider.name == "CentralObstacle" or collider.name == "Enemy":
			morrer()
		
	# Verifica se o avião saiu dos limites do rio
	if position.x < limite_esquerdo or position.x > limite_direito:
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
		
func disparar(): 
	var bullet = Projectile.instantiate()
	bullet.position = $Marker2D.position
	get_parent().add_child(bullet)
	print("Projétil disparado!")

		
func reabastecer(quantidade):
	combustivel += quantidade
	combustivel = clamp(combustivel, 0, 2000)

func morrer():
	queue_free()
	get_node("/root/Scenes/MainScene").game_over()
