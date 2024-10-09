extends PathFollow2D

var direction = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	progress_ratio += 0.1 * direction * delta
	if 0 >= progress_ratio or progress_ratio >= 1:
		direction *= -1
	pass
