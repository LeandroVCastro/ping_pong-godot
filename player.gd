extends CharacterBody2D

const SPEED = 230

func _physics_process(delta: float) -> void:
	velocity.y = 0
	if Input.is_action_pressed("move_down"):
		velocity.y = SPEED
		
	if Input.is_action_pressed("move_up"):
		velocity.y = -SPEED
	
	move_and_slide()
