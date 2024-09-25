# scripts/MainScene.gd
extends Node2D

@onready var Player = preload("res://scenes/Player.tscn")
@onready var Enemy = preload("res://scenes/Enemy.tscn")
@onready var Fuel = preload("res://scenes/Fuel.tscn")
@onready var Obstacle = preload("res://scenes/Obstacle.tscn")

# Função que é executada ao iniciar a cena
func _ready():
	# Instancia o jogador na posição inicial desejada
	var player_instance = Player.instantiate()
	player_instance.position = Vector2(200, 500) #CONFERIR
	add_child(player_instance)
	
	# Inicia os Timers para gerar inimigos, obstáculos e fuel
	$InimigoTimer.start()
	$FuelTimer.start()
	$ObstacleTimer.start()

# Função para spawnar inimigos periodicamente
func _on_EnemyTimer_timeout():
	var enemy_instance = Enemy.instantiate()
	enemy_instance.position = Vector2(randf_range(50, 400), -50)  # Posiciona os inimigos acima da tela
	add_child(enemy_instance)

# Função para spawnar combustível periodicamente
func _on_FuelTimer_timeout():
	var fuel_instance = Fuel.instantiate()
	fuel_instance.position = Vector2(randf_range(50, 400), -50)  # Posiciona o combustível acima da tela
	add_child(fuel_instance)

# Função para spawnar obstáculos periodicamente
func _on_ObstacleTimer_timeout():
	var obstacle_instance = Obstacle.instantiate()
	obstacle_instance.position = Vector2(randf_range(50, 400), -50)  # Posiciona os obstáculos acima da tela
	add_child(obstacle_instance)
