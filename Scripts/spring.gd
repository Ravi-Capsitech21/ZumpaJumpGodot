extends Area2D

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.is_in_group("player"):
			$AnimationPlayer.play("RESET")
			$AnimationPlayer.animation_finished
			$AnimationPlayer.play("new_animation")
		else:
			$AnimationPlayer.play("new_animation")
