extends Control

signal endpoint_response(response)
signal on_player_session(player_data)
signal guest_session(guest_data)

enum SessionState {
WaitingCard = 0,
WaitingUserInfo,
InfoSended,
}

var player_data

var ActualSessionState : SessionState
var parent

@onready var main_label: Label = $MainLabel
@onready var guest_button: Button = $GuestButton
@onready var simular_tarjeta: Button = $SimularTarjeta

@onready var name_input: LineEdit = $LineEdit
@onready var enter_guest_button: Button = $EnterGuestButton

# Called when the node enters the scene tree for the first time.
func _ready():
	ActualSessionState = SessionState.WaitingCard
	name_input.hide()
	enter_guest_button.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# TODO: dejar así o cambiar sistema
	#ActualSessionState = SessionState.WaitingCard
	#match ActualSessionState:
		#SessionState.WaitingCard:
			#var input # Esta variable debe recibir el identificador del lector de tarjetas
			#input = {cardId = 1}
			#var CardId
			#if input:
				#CardId = input.cardId
				#send_id_to_endpoint(CardId)
				#ActualSessionState = SessionState.WaitingUserInfo
			#return
		#SessionState.WaitingUserInfo:
			#var response
			## response = get_endpoint_response()
			#if response:
				##id = inId
				##name = inName
				##image = inImage Acá se tendra que guardar la imagen en un archivo
				##faculty = inFaculty
				#player_data = Global.PlayerData.new(response.id, response.name, response.fmage, response.faculty)
				#emit_signal("endpoint_response", player_data)
			#return
	#return
	
	pass

func send_id_to_endpoint(CardId):
	# Aca se tiene que enviar la info del Id del usuario al endpoint
	return

func _on_guest_entering() -> void:
	main_label.hide()
	guest_button.hide()
	name_input.show()
	enter_guest_button.show()
	pass # Replace with function body.


func _on_enter_guest() -> void:
	#var id : int
	#var name : String
	#var image : String
	#var faculty : String
	#var guest : bool
	var name = name_input.text
	if name == "":
		return
	var guest_player_data = Global.PlayerData.new(0, name, "default image", "", true)
	guest_session.emit(guest_player_data)
	return

func _on_simular_tarjeta() -> void:
	var id : int = 1
	var name : String = "Dummy Data"
	var image : String = "Default image"
	var faculty : String = "FCFM"
	var guest : bool = false
	#var name = name_input.text
	if name == "":
		return
	var player_data = Global.PlayerData.new(0, name, "default image", "", true)
	on_player_session.emit(player_data)
	return
