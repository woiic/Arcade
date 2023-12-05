extends Control

signal game_selected

@onready var title_label = $SelectGameLabel
@onready var buttonsArray :Array

var games:Array
var mod_folder := "res://imports//"

var GButton = preload("res://scenes/games_button.tscn") 
var GameOverlay = preload("res://scenes/game_overlay.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	title_label.show()
	get_mods(mod_folder)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func get_mods(path):
	var dir = DirAccess.open(path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		var yReloc = 20
		while file_name != "":
			if dir.current_is_dir():
				pass
				#print("Found directory: " + file_name)
			else:
				#print("Found file: " + file_name)
				var game_button =  GButton.instantiate()
				$".".add_child(game_button)
				game_button.setText(file_name)
				game_button.set_position(Vector2(game_button.position.x, game_button.position.y + yReloc))
				game_button.setGameDir(path + file_name)
				buttonsArray.append(game_button)
			file_name = dir.get_next()
			yReloc += 20
	else:
		print("An error occurred when trying to access the path.")

func StartGame(inGame):
	game_selected.emit()
	get_parent().add_child(inGame)
	#hide()
	
