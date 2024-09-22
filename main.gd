extends Node2D

func _process(delta: float) -> void:
	pass

func _on_interface_click_start() -> void:
	$Ball.reset()

func _on_ball_touch_player_signal() -> void:
	$Interface.set_score($Interface.score + 1)
	if $Interface.score % 5 == 0 :
		$Ball.up_speed_x()

func _on_ball_exit_screen() -> void:
	game_over()

func game_over() -> void:
	$Ball.playing = false
	$Interface.game_over()
