extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
var safe = Vector3()

func _physics_process(delta: float) -> void:
	velocity = safe * SPEED
	move_and_slide()



func _on_player_posit(posit: Variant) -> void:
	safe.x = (posit.x- position.x)
	safe.z = (posit.z- position.z)
