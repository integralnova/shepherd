extends CharacterBody3D

signal posit(posit)

const SPEED = 20
const JUMP_VELOCITY = 4.5
var ray_origin = Vector3()
var ray_target = Vector3()
var campos
var target_pos

func _ready() -> void:
	campos = position
	target_pos = position

func _physics_process(delta: float) -> void:
	await get_tree().create_timer(3).timeout
	target_pos = (campos - position).normalized()
	velocity = target_pos * SPEED
	move_and_slide()
	moved()

func moved():
	posit.emit(position)

func _on_camera_3d_camerapos(pos: Variant) -> void:
	campos = pos
