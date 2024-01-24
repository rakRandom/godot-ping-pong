extends CharacterBody2D

const SPEED: int = 350

func _process(_delta):
	velocity.y = 0
	position.x = 50
	if Input.is_action_pressed("player1_up"):
		velocity.y = -SPEED
	if Input.is_action_pressed("player1_down"):
		velocity.y = SPEED
	
	move_and_slide()
