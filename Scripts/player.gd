extends CharacterBody2D

var stars_collected := 0

@export var speed := 200
@export var jump_force := -400
@export var gravity := 900

@export var next_level_path := "res://scenes/lvl_2.tscn"


var spawn_position: Vector2


var is_dead := false

var spring = -600


func _ready():

	add_to_group("player")

	# save starting position
	spawn_position = global_position


func _physics_process(delta):

	# stop movement if dead
	if is_dead:
		return

	# gravity
	velocity.y += gravity * delta

	
	var direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * speed

	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_force

	
	move_and_slide()

	# collision check
	for i in range(get_slide_collision_count()):

		var collision = get_slide_collision(i)
		var collider = collision.get_collider()

		if collider and collider.is_in_group("obstacle"):
			die()



func collect_star():

	stars_collected += 1

	print("Stars Collected: ", stars_collected)

	
	if stars_collected >= 3:
		win_level()



func win_level():

	print("LEVEL COMPLETE")

	await get_tree().create_timer(1.0).timeout

	#get_tree().change_scene_to_file(next_level_path)



func die():

	# stop multiple calls
	if is_dead:
		return

	is_dead = true

	print("GAME OVER")

	# stop movement
	velocity = Vector2.ZERO

	# hide player
	visible = false

	# wait before respawn
	await get_tree().create_timer(1.0).timeout

	respawn()


# respawn player
func respawn():

	print("RESPAWN")

	# move player to starting position
	global_position = spawn_position

	velocity = Vector2.ZERO

	visible = true

	is_dead = false

	#  respawn  stars
	for star in get_tree().get_nodes_in_group("stars"):

		star.respawn_star()

	# reset  stars
	stars_collected = 0


func _on_spring_body_entered(body: Node2D) -> void:
	velocity.y = spring
