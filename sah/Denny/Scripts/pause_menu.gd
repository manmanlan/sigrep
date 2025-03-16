extends CanvasLayer

@onready var pause_menu: CanvasLayer = $"."

func resume():
	pause_menu.visible = false
	get_tree().paused = false

func pause():
	pause_menu.visible = true
	get_tree().paused = true

func testesc():
	if Input.is_action_just_pressed("esc"):
		if get_tree().paused:
			resume()
		else:
			pause()

func _on_resume_pressed() -> void:
	resume()

func _on_settings_pressed() -> void:
	pause_menu.visible = false  # Hide menu when opening settings (optional)

func _on_back_pressed() -> void:
	get_tree().paused = false  # Ensure game is unpaused before switching scenes
	get_tree().change_scene_to_file("res://Denny/Scenes/main_menu.tscn")

func _process(delta: float) -> void:
	testesc()
