extends Node2D

var card_being_dragged
var card_slots = []
var use=false


func _ready() -> void:
	# Gather card slots into an array for easy access
	for slot in get_tree().get_nodes_in_group("card_slots"):
		card_slots.append(slot)
		


func _physics_process(delta: float) -> void:
	if card_being_dragged:
		card_being_dragged.reparent($".", true)
		var mouse_pos = get_global_mouse_position()
		card_being_dragged.position = mouse_pos

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			var card = check_for_card()
			if card:
				card_being_dragged = card
		else:
			if card_being_dragged:
				move_card_to_nearest_slot()
			card_being_dragged = null

func check_for_card():
	var space_state = get_world_2d().direct_space_state
	var parameters = PhysicsPointQueryParameters2D.new()
	parameters.position = get_global_mouse_position()
	parameters.collide_with_areas = true
	parameters.collision_mask = 1
	var result = space_state.intersect_point(parameters)
	
	if result.size() > 0:
		var card = result[0].collider.get_parent()
		if card.is_in_group("card"):  # Correctly checks if it's part of the card group
			return card
	return null


func move_card_to_nearest_slot():
	
	if use:
		card_used()
		
	
	var nearest_slot = null
	var shortest_distance = INF

	for slot in card_slots:
		# Skip occupied slots
		if slot.get_child_count() > 1:
			continue
		
		var distance = card_being_dragged.global_position.distance_to(slot.global_position)
		if distance < shortest_distance:
			shortest_distance = distance
			nearest_slot = slot

	if nearest_slot:
		card_being_dragged.reparent(nearest_slot, true)  # True keeps its current transform
		card_being_dragged.global_position = nearest_slot.global_position


func _on_area_2d_area_entered(area: Area2D) -> void:
	print("aaaaaaa")
	use=true


func _on_area_2d_area_exited(area: Area2D) -> void:
	use=false
	print("waa")

func card_used():
	card_being_dragged.queue_free()
