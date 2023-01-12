extends Node2D

onready var HUD = get_node("/root/Game/HUD")
onready var center = get_viewport_rect().size.x/2
onready var height = get_viewport_rect().size.y


func _ready():
	HUD.connect("changed",self,"_on_HUD_changed")
	show_face()

func _physics_process(_delta):
	if get_node("/root/Game/Ball_Container").has_node("Ball"):
		var ball = get_node("/root/Game/Ball_Container/Ball")
		$Pupil_left/Sprite.position.x = 10
		$Pupil_right/Sprite.position.x = 10
		$Pupil_left.look_at(ball.position)
		$Pupil_right.look_at(ball.position)
		var d = ((($Mouth.global_position.y - ball.global_position.y)/height)-0.2)*2
		d = clamp(d, -1, 1)
		$Mouth.scale.y = d
	else:
		$Pupil_left/Sprite.position.x = 0
		$Pupil_right/Sprite.position.x = 0
		$Mouth.scale.y = 1

		

func show_face():
	if HUD.paddle_face:
		show()
	else:
		hide()


func _on_HUD_changed():
	show_face()
