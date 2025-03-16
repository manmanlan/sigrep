extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Volume/Master.value = db_to_linear(AudioServer.get_bus_volume_db(0))
	$Volume/SFX.value = db_to_linear(AudioServer.get_bus_volume_db(1))
	$Volume/Music.value = db_to_linear(AudioServer.get_bus_volume_db(2))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	release_focus()

func _on_master_mouse_exited() -> void:
	release_focus() # Replace with function body.


func _on_sfx_mouse_exited() -> void:
	release_focus() # Replace with function body.


func _on_music_mouse_exited() -> void:
	release_focus() # Replace with function body.
