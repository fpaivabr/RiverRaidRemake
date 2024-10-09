extends PathFollow2D

var isEnable = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	progress_ratio += 0.4 * delta
	if progress_ratio == 1:
		progress_ratio = 0.2

func Start():
	progress_ratio = 0;