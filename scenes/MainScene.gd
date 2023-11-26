extends CanvasLayer

enum State {
Start = 0,
ChossingGame,
AwatingCard,
InGame,
}

var ActualState;
@onready var title = $Title
@onready var titleButton = $Title/Button
#@onready var game_selector_scene = $GameSelectorScene
@onready var game_list_scene = $GameListScene
@onready var pause_container = $pause_container
@onready var game_overlay = $GameOverlay

var bon_pause = false

#var simultaneous_scene = preload("res://scenes/game_selector_scene.tscn").instantiate()

# Called when the node enters the scene tree for the first time.
func _ready():
	ActualState = State.Start
	game_list_scene.hide()
	pause_container.hide()
	game_overlay.hide()
	title.show()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match ActualState:
		State.Start:
			pass
		#State.ChossingGame:
		#State.AwatingCard:
		State.InGame:
			if Input.is_action_just_pressed("escape"):
				var main_game = $Main
				if main_game:
					main_game.queue_free()
					game_list_scene.show()
	return


func _on_button_pressed():
	#get_tree().change_scene_to_file("res://scenes/game_selector_scene.tscn")
	game_list_scene.show()
	title.hide()
	return



func _on_pause_container_return_mm():
	var main_game = $Main
	if main_game:
		main_game.queue_free()
		game_list_scene.show()


func _on_game_list_scene_game_selected():
	ActualState = State.InGame

func showScore(in_points: float):
	game_overlay.showScore(in_points)
	game_overlay.show()
	return

func hideScore():
	game_overlay.hideScore()
	return

func gameOver(in_points: float):
	print(in_points)
	return
