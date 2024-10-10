extends CharacterBody2D

# Variáveis de controle do jogador
var velocidade = 200
var inclinacao_maxima = 15
var combustivel = 2000  # O jogador começa com combustível cheio
var tempo_entre_disparos = 0.2
var tempo_ultimo_disparo = 0

@onready var Projectile = preload("res://Scenes/Projectile.tscn")

func _ready():
	print("Player pronto com combustível cheio")
	#set_collision_layer(1)  # Define o layer do player
	#set_collision_mask(2)   # Só colide com inimigos e fuel, não com projéteis

	# Conecta o sinal de colisão
	connect("body_entered", Callable(self, "_on_body_entered"))

func _physics_process(delta):
	var direcao = Vector2()

	# Movimentação lateral do jogador
	if Input.is_action_pressed("ui_left"):
		direcao.x = -1
	elif Input.is_action_pressed("ui_right"):
		direcao.x = 1

	# Disparar o projétil
	tempo_ultimo_disparo += delta
	if Input.is_action_just_pressed("ui_up") and tempo_ultimo_disparo >= tempo_entre_disparos:
		disparar_projetil()
		tempo_ultimo_disparo = 0

	# Aplica o movimento lateral
	velocity.x = direcao.x * velocidade
	move_and_slide()

	# Inclinação da nave
	if direcao.x != 0:
		rotation_degrees = lerp(rotation_degrees, direcao.x * inclinacao_maxima, 0.1)
	else:
		rotation_degrees = lerp(rotation_degrees, 0.0, 0.1)

	# Consome combustível continuamente
	combustivel -= delta * 5
	if combustivel <= 0:
		print("Combustível acabou")
		morrer()

func disparar_projetil():
	var proj_instance = Projectile.instantiate()
	proj_instance.position = global_position + Vector2(0, -50)  # Projétil um pouco acima do player
	get_parent().add_child(proj_instance)
	print("Projétil instanciado na posição: ", proj_instance.position)

func _on_body_entered(body):
	print("Colidiu com:", body.name)  # Verifica o que está colidindo
	if body.is_in_group("enemy"):
		print("Colidiu com inimigo")
		morrer()
		body.queue_free()  # Remove o inimigo
	elif body.is_in_group("fuel"):
		print("Colidiu com Fuel")
		reabastecer(500)
		body.queue_free()  # Remove o fuel
	elif body.is_in_group("projectile"):
		print("Colidiu com Projétil")
		body.queue_free()
		queue_free()  # Remove o projétil


func morrer():
	print("Jogador morreu")
	queue_free()  # Remove o Player

func reabastecer(quantidade):
	combustivel += quantidade
	combustivel = clamp(combustivel, 0, 2000)
	print("Combustível reabastecido. Combustível atual: ", combustivel)
