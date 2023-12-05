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
var this_game_score : float = 0
var max_game_score : float = 0
var this_user = "hola2"
var this_PlayerData # Actual player data

#var simultaneous_scene = preload("res://scenes/game_selector_scene.tscn").instantiate()

# Called when the node enters the scene tree for the first time.
func _ready():
	ActualState = State.Start
	game_list_scene.hide()
	pause_container.hide()
	game_overlay.hide()
	title.show()
	
	get_parent().get_child(0).MainScene = self
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match ActualState:
		State.Start:
			
			#print(tst)
			return
		#State.ChossingGame:
		#State.AwatingCard:
		State.InGame:
			if Input.is_action_just_pressed("escape"):
				var main_game = $Main
				if main_game:
					main_game.queue_free()
					game_list_scene.show()
					hideScore()
	return


func _on_button_pressed():
	game_list_scene.show()
	title.hide()
	# Getting top score
	return

func _on_pause_container_return_mm():
	var main_game = $Main
	if main_game:
		main_game.queue_free()
		game_list_scene.show()

func _on_game_list_scene_game_selected():
	ActualState = State.InGame
	
	#opening and writing sistem
	# TODO: buscar una forma de dejar esto más decente y variables según el juego
	
	var file = FileAccess.open("res://LeaderBoards/test.txt", FileAccess.READ)
	var content = file.get_as_text()
	file.close()
	var file2 = FileAccess.open("res://LeaderBoards/test.txt", FileAccess.WRITE)
	file2.store_string(content)
	max_game_score = search_user_score(content, this_user)
	
	game_list_scene.hide()

# :------------------------------ Methods to interact with Mediador -----------------------------: #

func give_PlayerData():
	return this_PlayerData

# :------------------------------ Points Related Methods -----------------------------: #

# TODO: cambiar nombre a algo que tenga que ver con el paso de datos desde juego a arcade y que con
#		argumentos extra se hagan distintas acciones

func showScore(in_points: float, in_delay: float=0):
	saveScore(in_points)
	game_overlay.showScore(in_points, max_game_score, in_delay)
	game_overlay.show()
	return

func hideScore():
	game_overlay.hideScore()
	return

func gameOver(in_points: float):
	print(in_points)
	return

func saveScore(in_points: float):
	this_game_score = in_points
	if in_points > max_game_score:
		max_game_score = in_points
		
	var file = FileAccess.open("res://LeaderBoards/test.txt", FileAccess.READ)
	var content = file.get_as_text()
	#print(content)
	file.close()
	var file2 = FileAccess.open("res://LeaderBoards/test.txt", FileAccess.WRITE)
	var new_scores = save_user_score(content, this_user, max_game_score)
	#file2.store_string(content)
	print(new_scores)
	file2.store_string(new_scores)
	file2.close()
	return
var a = """hola 123
hola1 4324
hola2 5"""

func search_user_score(search_string : String, user_name : String):
	var linelist = search_string.split("\n")
	for line in linelist:
		var words = line.split(" ")
		if words[0] == user_name:
			return int(words[1])
	return 0


func save_user_score(search_string : String, user_name : String, top_score : int):
	var linelist = search_string.split("\n")
	var wordslist = []
	var all_lines = ""
	for line in linelist:
		var words = line.split(" ")
		if words[0] == user_name:
			words[1] = str(top_score)
		wordslist.append_array(words)
	var count = 0
	for word in wordslist:
		if count % 2 == 0:
			all_lines += str(word) + " "
		else:
			all_lines += str(word) + "\n"
		count+=1
	return all_lines

func save(content):
	var file = FileAccess.open("res://LeaderBoards/test.txt", FileAccess.WRITE)
	file.store_string(content)

func load():
	var file = FileAccess.open("res://LeaderBoards/test.txt", FileAccess.READ)
	var content = file.get_as_text()
	return content

