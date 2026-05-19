extends Control

@onready var start_buttons: VBoxContainer = $StartButtons
#@onready var options: Panel = $Options
@onready var options_panel: Panel = $OptionsPanel

# Called when the node enters the scene tree for the first time.
	
func _ready() -> void:
	start_buttons.visible = true
	options_panel.visible = false

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level.tscn")


func _on_setting_pressed() -> void:
	print("Setting pressed")
	start_buttons.visible = false
	options_panel.visible = true


func _on_back_pressed() -> void:
	_ready()
