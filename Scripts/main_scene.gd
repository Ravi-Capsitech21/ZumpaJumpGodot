extends Area2D

@export var speed := 200

func _process(delta):
	# Move obstacle left
	pass

	# Delete when off screen
	

# 🔥 Collision with player
func _on_body_entered(body):
	if body.is_in_group("player"):
		body.queue_free()   # destroy player
		get_tree().reload_current_scene()   # restart game
