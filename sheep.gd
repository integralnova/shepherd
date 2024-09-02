extends CharacterBody3D


var SPEED = 5.0
var safe = Vector3()
var is_safe = true

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("space"):
		if is_safe == false:
			velocity.x = randf_range(-10, 10)
			velocity.z = randf_range(-10, 10)
			SPEED = 0.1
			safety(true)
		else:
			velocity = safe * SPEED
			SPEED = 0.5
			safety(false)
		print(is_safe)
	
	
	
	
	if !(is_safe):
		velocity = safe * SPEED
		SPEED = 0.5
		
	move_and_slide()

func setRandomPosition():
	velocity.x = randf_range(-10, 10)
	velocity.z = randf_range(-10, 10)

func _on_player_posit(posit: Variant) -> void:
	safe.x = (posit.x- position.x)
	safe.z = (posit.z- position.z)

func safety(safe):
	if safe == true:
		is_safe = true
	else:
		is_safe = false
