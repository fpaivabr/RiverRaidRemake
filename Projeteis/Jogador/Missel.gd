extends ProjetilComp
@onready var Animacao = $AnimacaoPlayer
@onready var audio_player = $AudioStreamPlayer
@export var volume: float = -10

func _ready():
	audio_player.volume_db = volume
	Animacao.play("Missel")
	$ExplosaoTimer.start()
	$Desaparecer.start()
	pass # Replace with function body.

func _process(delta):
	position -= Vector2(0, 1).rotated(0) * delta * Velocidade
	pass

func _on_area_entered(area:Area2D):
	if area is HitboxComp:
		area.Hit(Dano)
	pass


func _on_desaparecer_timeout():
	queue_free()
	pass # Replace with function body.


func _on_explosao_timer_timeout():
	Velocidade = 70
	audio_player.play()
	pass # Replace with function body.
