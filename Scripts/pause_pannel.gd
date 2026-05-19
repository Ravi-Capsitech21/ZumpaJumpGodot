extends Control

@onready var pause_menu: Control = $PauseMenu
@onready var pause_btn: Button = $PauseBtn

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pause_menu.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func resume():
	get_tree().paused = false
	
func pause():
	get_tree().paused = true
	
func testEsc():
	if Input.is_action_just_pressed("Esc") and get_tree().paused == false:
		pause()
	elif  Input.is_action_just_pressed("Esc") and get_tree().paused == true:
		resume()
		
  

func _on_back_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_pause_btn_pressed() -> void:
	pause_menu.visible = true
	pause_btn.disabled = true
	
func _on_resume_button_pressed() -> void:
	resume()

func _on_restart_button_pressed() -> void:
	get_tree().reload_current_scene()

func _on_home_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")
	
