extends Area2D
class_name Explosao

@export var explosao_radius: float = 50.0
@export var dano_explosao: int = 10
@export var delay_dano: float = 1.0

@onready var animacao = $AnimatedSprite

func _ready():
	# Configurar a área de colisão
	var collision_shape = CollisionShape2D.new()
	var shape = CircleShape2D.new()
	shape.radius = explosao_radius
	collision_shape.shape = shape
	add_child(collision_shape)

	# Configurar o temporizador para o atraso do dano
	var timer = Timer.new()
	timer.one_shot = true
	timer.wait_time = delay_dano
	add_child(timer)
	timer.connect("timeout", self._on_timer_timeout)
	timer.start()

	# Conectar o sinal de animação concluída
	animacao.connect("animation_finished", self._on_animated_sprite_2d_animation_finished)
	animacao.play("explosao")  # Nome da animação

	connect("body_entered", self._on_body_entered)

func _on_timer_timeout():
	queue_free()

func _on_body_entered(body):
	if body.has_method("receber_dano"):
		body.receber_dano(dano_explosao)

func _on_animated_sprite_2d_animation_finished():
	queue_free()
