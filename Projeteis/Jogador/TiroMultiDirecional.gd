extends ProjetilComp


# Called when the node enters the scene tree for the first time.
@onready var desaparecer = $Desaparecer
func _ready():
	$Desaparecer.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_desaparecer_timeout():
	queue_free()
	pass # Replace with function body.
