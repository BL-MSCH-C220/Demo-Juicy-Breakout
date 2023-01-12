extends WorldEnvironment

onready var HUD = get_node("/root/Game/HUD")

func _ready():
	show()

func show():
	if HUD.effects_blur:
		environment.background_mode = Environment.BG_CANVAS
	else:
		environment.background_mode = Environment.BG_CLEAR_COLOR	

func hide():
	environment.background_mode = Environment.BG_CLEAR_COLOR

