 Godot 4 - 3D First-Person Camera Controller

##  Overview
A robust 3D first-person character controller. This project highlights proficiency in 3D spatial environments, Euler angle mathematics, and raw hardware mouse event capturing in the Godot Engine.

##  Core Mechanics & Implementation
*   **Mouse Capturing:** Utilizes `Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)` inside the `_ready()` function to lock the system cursor to the window center and hide it, a requirement for traditional FPS mechanics.
*   **InputEvent Polling:** Instead of polling input states in the process loop, this script taps directly into `_input(event)` to listen specifically for `InputEventMouseMotion`. This ensures camera updates are 1-to-1 with physical mouse movement.
*   **Rotational Clamping:** To prevent the camera from continuously flipping over backward, the X-axis rotation is clamped strictly between `-90` and `90` degrees using `deg_to_rad()`.

##  Technical Highlights
The script relies on an `@onready var` to cache the `Camera3D` node reference when the engine first instantiates the player. This prevents the performance overhead of querying the scene tree every time the user moves the mouse.

```gdscript
# Mouse look logic with mathematical clamping
func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * mouse_sensitivity)
		camera.rotate_x(-event.relative.y * mouse_sensitivity)
		camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-90), deg_to_rad(-90))
