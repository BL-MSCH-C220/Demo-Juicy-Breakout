extends Control

var color_paddle = false
var color_ball = false
var color_blocks = false
var color_background = false

var particle_paddle = false
var particle_walls = false
var particle_blocks = false
var particle_ball = false

var blocks_appear = false
var blocks_fall = false
var blocks_fade = false
var blocks_rotate = false

var screen_shake_paddle = 0
var screen_shake_blocks = 0
var screen_shake_walls = 0
var ball_trail = false

var paddle_appear = false
var paddle_stretch = false
var paddle_face = false

var audio_music = false
var audio_effects = false

var effects_blur = false


signal changed

var WE = null

func _ready():
	reset_values()
	if effects_blur:
		WE = get_node_or_null("/root/Game/WorldEnvironment")
		if WE != null:
			WE.show()
	
func reset_values():
	color_paddle = true
	color_ball = true
	color_blocks = true
	color_background = true

	particle_paddle = true
	particle_walls = true
	particle_blocks = true
	particle_ball = true

	blocks_appear = true
	blocks_fall = true
	blocks_fade = true
	blocks_rotate = true

	screen_shake_paddle = 50
	screen_shake_blocks = 50
	screen_shake_walls = 50
	ball_trail = true

	paddle_appear = true
	paddle_stretch = true
	paddle_face = true

	audio_music = true
	audio_effects = true

	effects_blur = true
	emit_signal("changed")
	set_UI()

func set_UI():
	$Menu/Color/Color_Paddle.pressed = color_paddle
	$Menu/Color/Color_Ball.pressed = color_ball
	$Menu/Color/Color_Blocks.pressed = color_blocks
	$Menu/Color/Color_Background.pressed = color_background

	$Menu/Particles/Particle_Paddle.pressed = particle_paddle
	$Menu/Particles/Particle_Blocks.pressed = particle_blocks
	$Menu/Particles/Particle_Walls.pressed = particle_walls
	$Menu/Particles/Particle_Ball.pressed = particle_ball

	$Menu/Blocks/Blocks_Appear.pressed = blocks_appear
	$Menu/Blocks/Blocks_Fall.pressed = blocks_fall
	$Menu/Blocks/Blocks_Fade.pressed = blocks_fade
	$Menu/Blocks/Blocks_Rotate.pressed = blocks_rotate
	 
	$Menu/Ball/Ball_Trail.pressed = ball_trail

	$Menu/Paddle/Paddle_Appear.pressed = paddle_appear
	$Menu/Paddle/Paddle_Stretch.pressed = paddle_stretch

	$Menu/Screen_Shake/Screen_Shake_Paddle.value = screen_shake_paddle
	$Menu/Screen_Shake/Screen_Shake_Blocks.value = screen_shake_blocks
	$Menu/Screen_Shake/Screen_Shake_Walls.value = screen_shake_walls

	$Menu/Audio/Audio_music.pressed = audio_music
	$Menu/Audio/Audio_effects.pressed = audio_effects

	$Menu/Effects/Effects_blur.pressed = effects_blur

	$Menu/Face/Paddle_Face.pressed = paddle_face


func _on_Reset_pressed():
	reset_values()
	

func _on_Restart_pressed():
	get_node("/root/Game/Bricks").start_bricks()
	get_node("/root/Game/Ball_Container").start_ball()
	get_node("/root/Game/Paddle_Container/Paddle").start_paddle()
	get_tree().paused = false
	WE = get_node_or_null("/root/Game/WorldEnvironment")
	if WE != null:
		WE.show()
	hide()


func _on_Quit_pressed():
	get_tree().quit()




func _on_Blocks_Appear_toggled(button_pressed):
	blocks_appear = button_pressed
	emit_signal("changed")


func _on_Ball_Trail_toggled(button_pressed):
	ball_trail = button_pressed
	emit_signal("changed")



func _on_Paddle_Appear_toggled(button_pressed):
	paddle_appear = button_pressed
	emit_signal("changed")

func _on_Paddle_Stretch_toggled(button_pressed):
	paddle_stretch = button_pressed
	emit_signal("changed")

func _on_Paddle_Face_toggled(button_pressed):
	paddle_face = button_pressed
	emit_signal("changed")





func _on_Audio_music_toggled(button_pressed):
	audio_music = button_pressed
	emit_signal("changed")


func _on_Audio_effects_toggled(button_pressed):
	audio_effects = button_pressed
	emit_signal("changed")


func _on_Effects_blur_toggled(button_pressed):
	effects_blur = button_pressed
	emit_signal("changed")


func _on_Color_Paddle_toggled(button_pressed):
	color_paddle = button_pressed
	emit_signal("changed")


func _on_Color_Ball_toggled(button_pressed):
	color_ball = button_pressed
	emit_signal("changed")


func _on_Color_Blocks_toggled(button_pressed):
	color_blocks = button_pressed
	emit_signal("changed")


func _on_Color_Background_toggled(button_pressed):
	color_background = button_pressed
	emit_signal("changed")


func _on_Particle_Paddle_toggled(button_pressed):
	particle_paddle = button_pressed
	emit_signal("changed")


func _on_Particle_Blocks_toggled(button_pressed):
	particle_blocks = button_pressed
	emit_signal("changed")


func _on_Particle_Walls_toggled(button_pressed):
	particle_walls = button_pressed
	emit_signal("changed")


func _on_Particle_Ball_toggled(button_pressed):
	particle_ball = button_pressed
	emit_signal("changed")


func _on_Blocks_Fall_toggled(button_pressed):
	blocks_fall = button_pressed
	emit_signal("changed")


func _on_Blocks_Fade_toggled(button_pressed):
	blocks_fade = button_pressed
	emit_signal("changed")

func _on_Blocks_Rotate_toggled(button_pressed):
	blocks_rotate = button_pressed
	emit_signal("changed")


func _on_Screen_Shake_Paddle_value_changed(value):
	screen_shake_paddle = value
	emit_signal("changed")


func _on_Screen_Shake_Blocks_value_changed(value):
	screen_shake_blocks = value
	emit_signal("changed")


func _on_Screen_Shake_Walls_value_changed(value):
	screen_shake_walls = value
	emit_signal("changed")

