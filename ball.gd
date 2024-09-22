extends Area2D

signal touch_player_signal
signal exit_screen

var speed_x = 5
var speed_y = 0
var playing = false


func _ready() -> void:
	$AnimatedSprite2D.play("idle")

func _process(delta: float) -> void:
	if playing == true :
		move()

func move() -> void:
	position.x = position.x + speed_x
	position.y = position.y + speed_y

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group('player') :
		touch_player()
	else :
		touch_wall()
	
func touch_player() -> void:
	speed_x = speed_x * -1
	speed_y = randf_range(-3, 3)
	flip()
	emit_signal('touch_player_signal')
		
func touch_wall() -> void:
	speed_y = speed_y * -1
	flip()

func flip() -> void:
	if speed_x < 0 :
		rotation_degrees = 0 - (speed_y * 5)
	else :
		rotation_degrees = 180 + (speed_y * 5)

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	emit_signal('exit_screen')

func up_speed_x() -> void:
	if speed_x > 0 :
		speed_x += 1
	else :
		speed_x -= 1
		
func reset() -> void:
	playing = true
	speed_x = 5
	speed_y = 0
	position.x = 222
	position.y = 177
	rotation_degrees = 180
