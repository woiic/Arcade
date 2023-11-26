extends Node2D

@onready var button = $Button

var simultaneous_scene
var folder_dir : String 
var game_dir = "res://main.tscn"
var mod_folder := "res://imports/1stExport.zip"

var gameScene
var parent
# D:\UCH\testsGodot\test0

# Called when the node enters the scene tree for the first time.
func _ready():
	parent = get_parent()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func loadMods():
	var dir = DirAccess.open("res://")
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		#while file_name != "":
			#if dir.current_is_dir():
				#print("Found directory: " + file_name)
			#else:
				#print("Found file: " + file_name)
			#file_name = dir.get_next()
	ProjectSettings.load_resource_pack(game_dir, false)
	print("yos")

func setText(text: String):
	button.text = text
	return

func setGameDir(dir :String):
	folder_dir = dir
	return 

func _on_button_pressed():
	print("Loading mods")
	print("Mods folder: " + folder_dir)
	loadMods()
	print("mods loaded")
	ProjectSettings.load_resource_pack(folder_dir, false)
	#get_tree().change_scene_to_file(game_dir)
	gameScene = load(game_dir)
	var ActualGame = gameScene.instantiate()
	#get_node("/root/GameSelectorScene/SelectGameLabel").hide()
	parent.StartGame(ActualGame)
	return
