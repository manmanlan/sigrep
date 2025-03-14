extends CharacterBody2D


var SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@export var jump_buffer_timer= .1
@export var coyote_time = .1

var jump_buffer=false

var jump_available: bool = true

func _physics_process(delta):
	
	# Add the gravity.
	if not is_on_floor():
		if jump_available:
			get_tree().create_timer(coyote_time).timeout.connect(coyote_timeout)
		else:
			velocity.y += gravity * delta
			
	else:
		jump_available=true
		if jump_buffer:
			jump()
			jump_buffer=false

	# Handle jump.
	if Input.is_action_pressed("ui_accept"):
			
		if jump_available:
			jump()
			jump_available=false
		else:
			jump_buffer=true
			get_tree().create_timer(jump_buffer_timer).timeout.connect(on_jump_buffer_timeout)


		

		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("a", "d")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0,SPEED)
	

	move_and_slide()

func coyote_timeout():
	jump_available=false

func jump()->void:
	velocity.y = JUMP_VELOCITY

func on_jump_buffer_timeout()->void:
	jump_buffer=false
	
