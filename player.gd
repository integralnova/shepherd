extends CharacterBody3D


const SPEED = 20
const JUMP_VELOCITY = 4.5

var ray_origin = Vector3()
var ray_target = Vector3()
var pos
var target_pos

func _ready() -> void:
	pos = Vector3()
	target_pos = Vector3()
	

func _physics_process(delta: float) -> void:
	
	velocity = Vector3()
	
	velocity = velocity.normalized() * SPEED
	
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
		
	target_pos = (pos - position).normalized()
	
	velocity.x -= pos.x
	velocity.z += pos.z
		
	move_and_slide()
