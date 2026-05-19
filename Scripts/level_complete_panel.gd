extends Control

@onready var star1 = $Panel/Star1
@onready var star2 = $Panel/Star2
@onready var star3 = $Panel/Star3

@export var empty_star : Texture
@export var fill_star : Texture

@export var next_level_path := "res://scenes/lvl_2.tscn"


func _ready():

	visible = false

	# all stars empty at start
	star1.texture = empty_star
	star2.texture = empty_star
	star3.texture = empty_star


func show_panel(collected_stars):

	visible = true

	# reset all stars
	star1.texture = empty_star
	star2.texture = empty_star
	star3.texture = empty_star

	# fill stars according to collected amount
	if collected_stars >= 1:
		star1.texture = fill_star

	if collected_stars >= 2:
		star2.texture = fill_star

	if collected_stars >= 3:
		star3.texture = fill_star

	# pause game
	get_tree().paused = true


func _on_next_button_pressed():

	get_tree().paused = false

	get_tree().change_scene_to_file(next_level_path)


func _on_back_button_pressed():

	get_tree().paused = false

	get_tree().reload_current_scene()
