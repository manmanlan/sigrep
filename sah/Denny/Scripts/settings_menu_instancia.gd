extends Control

func _on_return_to_main_menu_pressed():
	AudioServer.set_bus_volume_db(0,linear_to_db($"CanvasLayer/Audio Opt/Volume/Master".value))
	AudioServer.set_bus_volume_db(1,linear_to_db($"CanvasLayer/Audio Opt/Volume/SFX".value))
	AudioServer.set_bus_volume_db(2,linear_to_db($"CanvasLayer/Audio Opt/Volume/Music".value))
	get_tree().paused = false
	if not Global.pauasos:
		Global.pauasos = true
		queue_free()
	if Global.pauasos:
		Global.pauasos = false
