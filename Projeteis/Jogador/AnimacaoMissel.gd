extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func playMissel():
	play("Missel")
	
func playExplosao():
	play("Explosao")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
