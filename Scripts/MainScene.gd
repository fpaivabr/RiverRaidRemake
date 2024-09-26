extends CharacterBody2D

# Preload da cena do projétil
@onready var Projectile = preload("res://Scenes/Projectile.tscn")

# Variáveis de controle do jogador
var velocidade = 200
var inclinacao_maxima = 15
var combustivel = 100  # Combustível inicial

# Movimentação do jogador
func _physics_process(delta):
	var direcao = Vector2()

	# Controles do jogador
	if Input.is_action_pressed("ui_left"):
		direcao.x = -1
	elif Input.is_action_pressed("ui_right"):
		direcao.x = 1

	# Movimentação para cima (padrão do RiverRaid)
	direcao.y = -1
	
	# Aplica o movimento
	velocity = direcao.normalized() * velocidade
	move_and_slide()

	# Controla a inclinação da nave com base no movimento lateral
	if direcao.x != 0:
		rotation_degrees = lerp(rotation_degrees, direcao.x * inclinacao_maxima, 0.1)
	else:
		rotation_degrees = lerp(rotation_degrees, 0.0, 0.1)

	# Consome combustível
	combustivel -= delta * 5
	if combustivel <= 0:
		morrer()

	# Verifica se o jogador pressionou o "espaço" para atirar
	if Input.is_action_just_pressed("shoot"):
		disparar_projetil()

# Função para disparar o projétil
func disparar_projetil():
	var proj_instance = Projectile.instantiate()
	proj_instance.position = position  # O projétil será criado na posição do player
	get_parent().add_child(proj_instance)  # Adiciona o projétil à cena

# Função para lidar com a destruição do jogador quando o combustível acaba
func morrer():
	queue_free()

# Função para reabastecer o combustível
func reabastecer(quantidade):
	combustivel += quantidade
	if combustivel > 100:
		combustivel = 100
