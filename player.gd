extends CharacterBody2D

const inputs = {
	"up": Vector2.UP,
	"left": Vector2.LEFT,
	"right": Vector2.RIGHT,
	"down": Vector2.DOWN
}

var grid_size: int = 64

@onready var ray: RayCast2D = $RayCast2D

# from peanuts-code, maybe revisit this later but its fine
func _unhandled_input(event: InputEvent) -> void:
	for action in inputs.keys():
		if event.is_action_pressed(action):
			move(action)
	
func move(action):
	var destination = inputs[action] * grid_size
	ray.target_position = destination
	ray.force_raycast_update()
	if not ray.is_colliding():
		position += destination
