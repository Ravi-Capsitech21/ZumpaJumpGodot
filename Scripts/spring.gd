extends Area2D

@export var spring_force := -900

func _ready():

	# connect collision
	body_entered.connect(_on_body_entered)

	# stop animation initially
	$AnimationPlayer.stop()


func _on_body_entered(body):

	# check player
	if body.is_in_group("player"):

		# bounce player upward
		body.velocity.y = spring_force

		# play spring animation
		$AnimationPlayer.play("new_animation")
