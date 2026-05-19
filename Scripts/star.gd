extends Area2D

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):

	# check player collision
	if body.is_in_group("player"):

		# add star to player
		body.collect_star()

		# remove star
		queue_free()
