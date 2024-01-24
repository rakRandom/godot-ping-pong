extends Node2D

@onready var kinematic_objects = $KinematicObjects

@onready var ball = preload("res://scenes/ball.tscn").instantiate()
@onready var reset_timer = $ResetTimer
@onready var game_ui = $UI
@onready var celebration_sound = $CelebrationSound
@onready var left_side_particles = $Particles/LeftSideParticles
@onready var right_side_particles = $Particles/RightSideParticles


func _ready():
	game_ui.update_points_label()

# Add the ball before 3 seconds
func _on_load_timer_timeout():
	kinematic_objects.add_child(ball)


func add_points(add_for_left_side: bool):
	if add_for_left_side:
		Data.points[0] += 1
		left_side_particles.emitting = true
	else:
		Data.points[1] += 1
		right_side_particles.emitting = true
	
	celebration_sound.stop()
	celebration_sound.play()
	game_ui.update_points_label()
	Data.save_data()
	reset_timer.start()


# Detect when the ball enter in the left or the right field
func _on_field_1_body_entered(_body):
	add_points(false)
func _on_field_2_body_entered(_body):
	add_points(true)

# Resets the ball position, its called after 3 seconds
func _on_timer_timeout():
	ball.set_pos()
