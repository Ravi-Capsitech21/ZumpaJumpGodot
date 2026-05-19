extends Area2D

@export var slow_motion_scale := 0.3
@export var slow_motion_time := 5.0

func _ready():

	body_entered.connect(_on_body_entered)


func _on_body_entered(body):

	if body.is_in_group("player"):

		# slow motion
		Engine.time_scale = slow_motion_scale

		# wait
		await get_tree().create_timer(slow_motion_time * slow_motion_scale).timeout

		# normal speed
		Engine.time_scale = 1.0
