extends Level
var flag := true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if flag:
		GlobalReference.JogadorRef = Jogador1
		CriarParticulas()
		flag = false
	pass
