extends ProjetilComp

@onready var audio_stream_player = $AudioStreamPlayer
@export var volume: float = -4.0
@export_range(-180,180) var rotacao: float

func _ready():
	audio_stream_player.volume_db = volume
	audio_stream_player.play()
	rotacao = deg_to_rad(rotacao)
	pass

func _process(delta):
	position -= Vector2(0, 1).rotated(rotacao) * delta * Velocidade
	pass
