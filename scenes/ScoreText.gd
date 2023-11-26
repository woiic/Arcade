extends Label

@onready var score_text = $"."
@onready var score_number = $"../ScoreNumber"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func setScore(inScore : float):
	score_number.text = str(inScore)
	return
