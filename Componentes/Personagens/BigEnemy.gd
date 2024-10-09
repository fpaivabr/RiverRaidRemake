extends Node2D
class_name Boss

@export var vida: int = 100
@export var fire_rate: float = 2.0
@export var fase_2_vida: int = 50
@export var dano_colisao: int = 20

@onready var fire_timer = $Timer
@onready var GlobalReference = get_node("/root/GlobalValues")
@onready var animacoes = $AnimatedSprite2D

signal boss_morto

var Alvo
var pode_atirar: bool = true
var fase_atual: int = 1

func _ready():
	Alvo = GlobalReference.JogadorRef
	fire_timer.wait_time = fire_rate
	fire_timer.start()
	fire_timer.connect("timeout", self._on_timer_timeout)
	$VidaComp.connect("Morto", self.morrer)
	$Hurtbox.connect("area_entered", self._on_area_entered)

func _process(_delta):
	if pode_atirar:
		if fase_atual == 1:
			atirar()
		elif fase_atual == 2:
			atirar_rapido()
		pode_atirar = false
		fire_timer.start()

func atirar():
	var projétil = preload("res://Componentes/Personagens/AtaqueBigEnemy.tscn").instance()
	var direcao_atual = Vector2(cos(rotation), sin(rotation))
	projétil.start(global_position, direcao_atual)
	get_parent().add_child(projétil)

func atirar_rapido():
	for i in range(3):
		var projétil = preload("res://Componentes/Personagens/AtaqueBigEnemy.tscn").instance()
		var direcao_atual = Vector2(cos(rotation + i * 0.1), sin(rotation + i * 0.1))
		projétil.start(global_position, direcao_atual)
		get_parent().add_child(projétil)

func morrer():
	if animacoes:
		animacoes.play("morte")
		animacoes.connect("animation_finished", self._on_morte_animacao_finalizada)
	else:
		queue_free()

func _on_morte_animacao_finalizada():
	emit_signal("boss_morto", self)
	var explosao = preload("res://Componentes/Personagens/AtaqueBigEnemy.tscn").instance()
	explosao.position = global_position
	get_parent().add_child(explosao)
	queue_free()

func _on_area_entered(area):
	if area.has_method("receber_dano"):
		area.receber_dano(dano_colisao)
	$VidaComp.Dano($VidaComp.VidaAtual)

func _on_timer_timeout():
	pode_atirar = true
	if $VidaComp.VidaAtual <= fase_2_vida and fase_atual == 1:
		fase_atual = 2
		animacoes.play("fase_2")
