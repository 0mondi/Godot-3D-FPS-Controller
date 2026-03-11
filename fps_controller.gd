extends CharacterBody3D

@export var mouse_sensitivity: float = 0.002
@onready var camera = $Camera3D

func _ready():
	# Lock the mouse cursor to the game window
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	# Handle Mouse Look
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * mouse_sensitivity)
		camera.rotate_x(-event.relative.y * mouse_sensitivity)
		
		# Clamp camera to prevent flipping upside down
		camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-90), deg_to_rad(90))

func _physics_process(delta):
	# Basic 3D gravity
	if not is_on_floor():
		velocity.y -= 9.8 * delta
	move_and_slide()
