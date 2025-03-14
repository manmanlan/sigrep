extends Control


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")


func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://Denny/Scenes/settings_menu.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()
