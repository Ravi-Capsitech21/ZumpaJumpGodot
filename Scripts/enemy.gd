extends Area2D
@onready var body = $AnimatableBody2D
@onready var back = $AnimatableBody2D/back
@onready var front = $AnimatableBody2D/front

@export var rotation_speed := 70

func _ready():
	body.add_to_group("obstacle")
	
		
func _process(delta):
	back.rotation_degrees += rotation_speed * delta
