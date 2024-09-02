extends Camera3D
signal camerapos(pos)

var ray_origin = Vector3()
var ray_target = Vector3()
var pos = Vector3()

func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("click"):
		const RAY_LENGTH = 1000

		var space_state = get_world_3d().direct_space_state
		var cam = self
		var mousepos = get_viewport().get_mouse_position()

		var origin = cam.project_ray_origin(mousepos)
		var end = origin + cam.project_ray_normal(mousepos) * RAY_LENGTH
		var query = PhysicsRayQueryParameters3D.create(origin, end)
		query.collide_with_areas = true
		var result = space_state.intersect_ray(query)
		if result.is_empty():
			print("off your head ")
			
		else:
			pos = result.position
	camerapos.emit(pos)
