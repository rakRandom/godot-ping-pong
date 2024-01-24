extends CharacterBody2D

const SPEED: int = 350

func _process(_delta):
	velocity.y = 0
	position.x = 1230
	if Input.is_action_pressed("player2_up"):
		velocity.y = -SPEED
	if Input.is_action_pressed("player2_down"):
		velocity.y = SPEED
	
	move_and_slide()
