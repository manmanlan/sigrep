extends CanvasLayer

@onready var pause_menu: CanvasLayer = $"."
var settings_menu_scene = preload("res://Denny/Scenes/settings_menu_Instancia.tscn")

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
	var settingsmenu = settings_menu_scene.instantiate()  # Create settings menu instance
	add_child(settingsmenu)  # Add it to the current scene
	pause_menu.visible = false  # Hide menu when opening settings (optional)
	

func _on_back_pressed() -> void:
	get_tree().paused = false  # Ensure game is unpaused before switching scenes
	get_tree().change_scene_to_file("res://Denny/Scenes/main_menu.tscn")

func _process(delta: float) -> void:
	testesc()
	if Global.pauasos:
		resume()
