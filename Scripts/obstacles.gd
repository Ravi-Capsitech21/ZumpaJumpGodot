extends Area2D

@export var speed := 200

func _ready():
	body_entered.connect(_on_body_entered)   

func _process(delta):
	pass

#  Collision
func _on_body_entered(body):
	if body.is_in_group("player"):
		body.die()
