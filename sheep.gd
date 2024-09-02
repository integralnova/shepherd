extends CharacterBody3D


const SPEED = 5.0
var safe = Vector3()
var is_safe = true

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("space"):
		is_safe = false
	if Input.is_action_just_pressed("spacei"):
		is_safe = true
	
	if is_safe:
		velocity.x = randf_range(-10, 10)
		velocity.z = randf_range(-10, 10)
	if !(is_safe):
		velocity = safe * SPEED
		
	move_and_slide()


func _on_player_posit(posit: Variant) -> void:
	safe.x = (posit.x- position.x)
	safe.z = (posit.z- position.z)
