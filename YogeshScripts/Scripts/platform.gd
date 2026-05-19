#extends AnimatableBody2D
#
#@export var bounce_force = -600
#
#func _on_area_2d_body_entered(body):
	#if body is CharacterBody2D:
		#if body.velocity.y > 0:
			#body.jump()
