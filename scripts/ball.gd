extends CharacterBody2D

@onready var fade_particles = $FadeParticles
@onready var collide_sound = $CollideSound

const SPEED: int = 750
var direction: Vector2 = Vector2.ZERO


func _ready():
	fade_particles.lifetime = 300. / SPEED
	set_pos()


func _process(delta):
	var move = move_and_collide(direction.normalized() * SPEED * delta, false, 0.1, true)
	if move:
		direction = direction.bounce(move.get_normal())
		collide_sound.stop()
		collide_sound.play()


func set_pos():
	direction = Vector2(randi_range(0, 1) * 2 - 1, randf() / 2 - 0.25)
	position = Vector2(get_window().size.x / 2., get_window().size.y / 2.)
