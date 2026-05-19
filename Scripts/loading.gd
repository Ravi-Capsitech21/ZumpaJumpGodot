extends Node2D

@onready var progress_bar = $ProgressBar
@export var next_scene_path: String = "res://scenes/main.tscn"

var progress: Array[float] = []

var displayed_progress := 0.0   
var real_progress := 0.0        # actual loading progress
var speed := 40.0               # speed of fake fill
var loaded := false

func _ready():
	ResourceLoader.load_threaded_request(next_scene_path)

func _process(delta):
	var status = ResourceLoader.load_threaded_get_status(next_scene_path, progress)

	match status:
		ResourceLoader.THREAD_LOAD_IN_PROGRESS:
			if progress.size() > 0:
				real_progress = progress[0] * 100

		ResourceLoader.THREAD_LOAD_LOADED:
			loaded = true
			real_progress = 100   # force to 100 when done

	
	displayed_progress = move_toward(displayed_progress, real_progress, speed * delta)
	progress_bar.value = displayed_progress

	
	if loaded and displayed_progress >= 100:
		await get_tree().create_timer(0.5).timeout   # small finish delay
		var scene = ResourceLoader.load_threaded_get(next_scene_path)
		get_tree().change_scene_to_packed(scene)
