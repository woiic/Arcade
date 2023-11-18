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

var simultaneous_scene = preload("res://scenes/game_selector_scene.tscn").instantiate()

# Called when the node enters the scene tree for the first time.
func _ready():
	ActualState = State.Start
	title.show()
	titleButton.show()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass


func _on_button_pressed():
	#get_tree().root.add_child(simultaneous_scene)
	#get_tree().change_scene("res://scenes/game_selector_scene.tscn")
	get_tree().change_scene_to_file("res://scenes/game_selector_scene.tscn")
	return
