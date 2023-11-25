extends KinematicBody2D
class_name Character, "res://Art/v1.1 dungeon crawler 16X16 pixel pack/heroes/knight/knight_idle_anim_f0.png"

const FRICTION: float = .15

export(int) var acceleration: int
export(int) var max_speed: int = 100

var mov_direction: Vector2 = Vector2.ZERO
var velocity: Vector = Vector2.ZERO

func _physics_process(_delta: float) -> void:
	velocity = move_and_slide(velocity)
	velocity = lerp(velocity, Vector2.ZERO, FRICTION)
	
	func Move() -> void:
		mov_direction = move_direction.normalized()
		velocity += mov_direction * acceleration
		velocity = velocity.clamped(max_speed)
