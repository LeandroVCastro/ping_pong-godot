extends Control

signal click_start

var score = 0

func _ready() -> void:
	$GameOver.hide()
	pass

func _process(delta: float) -> void:
	pass
	
func start() :
	$Button.hide()
	$GameOver.hide()
	set_score(0)
	
func _on_button_pressed() -> void:
	start()
	emit_signal('click_start')
	
func game_over() -> void:
	$Button.show()
	$GameOver.show()
	
func set_score(new_score: int) -> void:
	score = new_score
	$Score.text = "Pontos: " + str(score)
