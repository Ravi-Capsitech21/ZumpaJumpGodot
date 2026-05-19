extends Camera2D

var fixed_x

func _ready():
	fixed_x = global_position.x

func _process(delta):
	global_position.x = fixed_x
