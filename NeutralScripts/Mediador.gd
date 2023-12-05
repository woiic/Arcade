extends Node2D

var MainScene

# Called when the node enters the scene tree for the first time.
func _ready():
	#get_parent().get_child(1)# count
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# :------------------------------ Player Data Class -----------------------------: #


class PlayerData :
	var id : int
	var name : String
	var image : String
	var faculty : String
	
	func _init(inId: int, inName: String, inImage: String, inFaculty: String):
		id = inId
		name = inName
		image = inImage
		faculty = inFaculty
		return



# :------------------------------ Methods to interact with MainScene -----------------------------: #

func get_PlayerData():
	#var PD : static.PlayerData
	var player_data : PlayerData
	#MainScene = get_parent().get_child(2) # 2 siempre es el MainScene
	player_data = MainScene.give_PlayerData()
	return player_data

func  get_LeaderBoard():
	var LeaderBoard : String = ""
	return LeaderBoard

func game_over(in_points :float):
	var max_points = {points=0, is_best=false} # int, bool
	
	return max_points

