extends Label

func _ready():
	# Centraliza o texto dentro do Label
	horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	
	# Centraliza o Label na tela
	anchor_left = 0.5
	anchor_right = 0.5
	anchor_top = 0.5
	anchor_bottom = 0.5
	
	# Compensa o tamanho do Label para centralizar perfeitamente
	position -= size / 2
