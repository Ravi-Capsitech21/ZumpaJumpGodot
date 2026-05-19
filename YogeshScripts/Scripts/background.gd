extends Sprite2D

@onready var player = get_parent().get_node("Player")

var fixed_x

func _ready():
	fixed_x = global_position.x


func _process(delta):
	# follow only Y axis
	global_position.y = lerp(global_position.y, player.global_position.y, 0.1)

	# keep X fixed
	global_position.x = fixed_x 
