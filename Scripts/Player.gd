# scripts/Player.gd
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
	velocity = direcao.normalized() * velocidade  # Atualiza a velocidade
	move_and_slide()  # Usa a função para mover a nave

	# Controla a inclinação da nave com base no movimento lateral
	if direcao.x != 0:
		rotation_degrees = lerp(rotation_degrees, direcao.x * inclinacao_maxima, 0.1)
	else:
		rotation_degrees = lerp(rotation_degrees, 0, 0.1)

	# Consome combustível
	combustivel -= delta * 10
	if combustivel <= 0:
		morrer()

# Função para lidar com a destruição do jogador quando o combustível acaba
func morrer():
	queue_free()

# Função para reabastecer o combustível
func reabastecer(quantidade):
	combustivel += quantidade
	if combustivel > 100:
		combustivel = 100

# Disparar o projétil
func disparar_projetil():
	var proj_instance = Projectile.instantiate()
	proj_instance.position = position  # Define a posição inicial do projétil como a do jogador
	get_parent().add_child(proj_instance)  # Adiciona o projétil à cena
