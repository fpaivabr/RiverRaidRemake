extends VidaComp

@export var efeito: AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func comEscudo() -> void:
	escudo = true
	pass 

func semEscudo() -> void:
	escudo = false
	pass
	   
func resetVida() -> void:
	VidaAtual = VidaMaxima
	pass
	
func Dano(dano: int):
	if not escudo:
		VidaAtual -= dano
		efeito.play()
	if(VidaAtual <= 0):		
		Morto.emit()		
	pass
	
	
