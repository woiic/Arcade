extends Control

signal endpoint_response(response)

enum SessionState {
WaitingCard = 0,
WaitingUserInfo,
InfoSended,
}

var player_data

var ActualSessionState : SessionState

# Called when the node enters the scene tree for the first time.
func _ready():
	ActualSessionState = SessionState.WaitingCard
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	match ActualSessionState:
		SessionState.WaitingCard:
			var input # Esta variable debe recibir el identificador del lector de tarjetas
			input = {cardId = 1}
			var CardId
			if input:
				CardId = input.cardId
				send_id_to_endpoint(CardId)
				ActualSessionState = SessionState.WaitingUserInfo
			return
		SessionState.WaitingUserInfo:
			var response
			# response = get_endpoint_response()
			if response:
				#id = inId
				#name = inName
				#image = inImage Acá se tendra que guardar la imagen en un archivo
				#faculty = inFaculty
				player_data = Global.PlayerData.new(response.id, response.name, response.fmage, response.faculty)
				emit_signal("endpoint_response", player_data)
			return
	return
	
	pass

func send_id_to_endpoint(CardId):
	# Aca se tiene que enviar la info del Id del usuario al endpoint
	return
