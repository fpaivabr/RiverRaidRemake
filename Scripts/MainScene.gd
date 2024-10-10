extends Node2D

@onready var Player = preload("res://scenes/Player.tscn")
@onready var EnemyA = preload("res://scenes/EnemyA.tscn")
@onready var EnemyB = preload("res://scenes/EnemyB.tscn")
@onready var Boss = preload("res://scenes/EnemyC.tscn")  # Inimigo C (Boss)
@onready var Fuel = preload("res://scenes/Fuel.tscn")

var game_time = 0  # Controlador de tempo total do jogo
var cenario_movel = true  # Controla se o cenário está se movendo

func _ready():
	# Verifica se o jogador já existe na cena, se não, adiciona
	if not has_node("Player"):
		var player_instance = Player.instantiate()
		player_instance.position = Vector2(300, 500)  # Ajuste para uma posição central visível
		add_child(player_instance)
		print("Player instanciado na posição: ", player_instance.position)

	# Conecta os Timers aos seus respectivos métodos usando Callable
	get_node("EnemyATimer").timeout.connect(Callable(self, "_on_EnemyATimer_timeout"))
	get_node("EnemyBTimer").timeout.connect(Callable(self, "_on_EnemyBTimer_timeout"))
	get_node("EnemyCTimer").timeout.connect(Callable(self, "_on_EnemyCTimer_timeout"))
	get_node("FuelTimer").timeout.connect(Callable(self, "_on_FuelTimer_timeout"))

	# Ajusta o tempo de espera para o combustível aparecer
	get_node("FuelTimer").wait_time = 5  # Combustível aparece a cada 5 segundos (ajuste conforme necessário)
	get_node("FuelTimer").start()

	# Inicia o Timer do Enemy A
	get_node("EnemyATimer").wait_time = 4  # Inimigo A aparece a cada 4 segundos
	get_node("EnemyATimer").start()

	# Ajusta o Timer do Enemy B para começar após 30 segundos
	get_node("EnemyBTimer").wait_time = 5  # Inimigo B aparece a cada 5 segundos
	get_node("EnemyBTimer").stop()  # Timer do Enemy B começa parado

	game_time = 0  # Reinicia o tempo de jogo

# Inimigo A aparece até 30 segundos
func _on_EnemyATimer_timeout():
	if game_time < 30:  # Aparecer por até 30 segundos
		var enemyA_instance = EnemyA.instantiate()
		enemyA_instance.position = Vector2(randf_range(250, 800), -50)  # Ajuste de X para a área central
		add_child(enemyA_instance)
		print("Inimigo A instanciado na posição: ", enemyA_instance.position)

# Inimigo B aparece depois de 30 segundos e continua até 60 segundos
func _on_EnemyBTimer_timeout():
	if game_time >= 30 and game_time < 60:  # Aparece apenas depois de 30 segundos
		var enemyB_instance = EnemyB.instantiate()
		enemyB_instance.position = Vector2(randf_range(250, 800), -50)
		add_child(enemyB_instance)
		print("Inimigo B instanciado na posição: ", enemyB_instance.position)

# O Boss aparece após 60 segundos e o cenário para de se mover
func _on_EnemyCTimer_timeout():
	if game_time >= 60:  # Aparece após 60 segundos
		var boss_instance = Boss.instantiate()
		boss_instance.position = Vector2(300, -50)  # Posição central para o Boss
		add_child(boss_instance)
		print("Boss instanciado na posição: ", boss_instance.position)

		# Para o Boss ser único na tela, paramos os outros timers e o cenário
		get_node("EnemyATimer").stop()
		get_node("EnemyBTimer").stop()
		get_node("EnemyCTimer").stop()
		cenario_movel = false  # Para o cenário após 60 segundos

# Função para spawn de combustível
func _on_FuelTimer_timeout():
	var fuel_instance = Fuel.instantiate()
	fuel_instance.position = Vector2(randf_range(250, 800), -50)  # Combustível aparece na área central
	add_child(fuel_instance)
	print("Combustível instanciado na posição: ", fuel_instance.position)

# Atualização do tempo de jogo e controle de timers
func _process(delta):
	game_time += delta  # Incrementa o tempo total de jogo

	# Iniciar o Enemy B depois de 30 segundos
	if game_time >= 30 and game_time < 60:
		if not get_node("EnemyBTimer").is_stopped():
			get_node("EnemyBTimer").start()
		get_node("EnemyATimer").stop()  # Para de spawnar Enemy A após 30 segundos

	# Após 60 segundos, spawna o Boss e para tudo
	elif game_time >= 60:
		get_node("EnemyBTimer").stop()
		get_node("EnemyCTimer").start()

	# Para o cenário se o cenario_movel for false
	if cenario_movel:
		# Código para mover o cenário
		pass
