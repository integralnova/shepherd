extends Camera3D
signal camerapos(pos)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
var ray_origin = Vector3()
var ray_target = Vector3()
var pos 
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("click"):
		const RAY_LENGTH = 1000

		var space_state = get_world_3d().direct_space_state
		var cam = %Camera3D
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
