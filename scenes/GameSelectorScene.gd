extends Control


@onready var select_game_label = $SelectGameLabel
@onready var buttonsArray :Array

var games:Array
var mod_folder := "res://imports//"

var GButton = preload("res://scenes/games_button.tscn") # Puedo hacer que cada package tenga su propio boton que siga 
								# ciertos  parametros por que necesita prelodear las cosas y no puede ser dinamico
								# take: despues de investigar esto puede ser dinamico con load("---")
var GameOverlay = preload("res://scenes/game_overlay.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	select_game_label.show()
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
		var yRelocation = 20
		while file_name != "":
			if dir.current_is_dir():
				pass
				#print("Found directory: " + file_name)
			else:
				#print("Found file: " + file_name)
				var game_button =  GButton.instantiate()
				$".".add_child(game_button)
				game_button.setText(file_name)
				game_button.set_position(Vector2(game_button.position.x, game_button.position.y + yRelocation))
				game_button.setGameDir(path + file_name)
				buttonsArray.append(game_button)
			file_name = dir.get_next()
			yRelocation += 20
	else:
		print("An error occurred when trying to access the path.")

func StartGame(inGame):
	select_game_label.hide()
	#TODO: en lugar de usar hide() sería mejor hacer una nueva escena que reciba los juegos cada vez.
	for i in buttonsArray:
		i.hide()
	#$".".add_child(inGame)
	# cramos una nueva escena gameOverlay y le añadimos el 
	get_tree().change_scene_to_file("res://scenes/game_container.tscn")
	print(get_tree().root.get_child(0))
	get_tree().root.add_child(inGame)
#	get_tree().root.get_child(0).add_child(inGame)
	
