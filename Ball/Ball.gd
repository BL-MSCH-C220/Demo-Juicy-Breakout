extends RigidBody2D

export var max_speed = 400.0
export var min_speed = 100.0
onready var HUD = get_node("/root/Game/HUD")
onready var camera = get_node("/root/Game/Camera")

onready var effect_paddle = get_node("/root/Game/Effect_Paddle")
onready var effect_wall = get_node("/root/Game/Effect_Wall")
onready var effect_brick = get_node("/root/Game/Effect_Brick")

var wall_trauma = 0.01
var paddle_trauma = 0.01
var brick_trauma = 0.01

func _ready():
	HUD.connect("changed",self,"_on_HUD_changed")
	contact_monitor = true
	set_max_contacts_reported(4)
	update_color()


func update_color():
	if HUD.color_ball:
		$Color.color = Color8(34,184,207)
	else:
		$Color.color = Color(1,1,1,1)
	if HUD.particle_ball:
		$Particles2D.emitting = true
	else:
		$Particles2D.emitting = false




func play_sound(sound):
	if HUD.audio_effects:
		sound.play()

func _on_HUD_changed():
	update_color()	

func _physics_process(_delta):
	if HUD.ball_trail:
		var c = $Color.duplicate()
		c.rect_global_position = global_position
		c.color = c.color.darkened(0.4)
		get_node("/root/Game/Trail_Container").add_child(c)


	var bodies = get_colliding_bodies()
	for body in bodies:
		if body.name == "Walls":
			if HUD.screen_shake_walls > 0:
				camera.add_trauma(wall_trauma*HUD.screen_shake_walls)
			play_sound(effect_wall)
		if body.name == "Paddle":
			if HUD.screen_shake_paddle > 0:
				camera.add_trauma(paddle_trauma*HUD.screen_shake_paddle)
			play_sound(effect_paddle)
		if body.is_in_group("Brick"):
			if HUD.screen_shake_blocks > 0:
				camera.add_trauma(brick_trauma*HUD.screen_shake_blocks)
			play_sound(effect_brick)
			
		if body.has_method("emit_particle"):
			body.emit_particle(global_position)
		if body.is_in_group("Brick"):
			body.die()

func _integrate_forces(state):
	if abs(state.linear_velocity.x) < min_speed:
		state.linear_velocity.x = sign(state.linear_velocity.x) * min_speed
	if abs(state.linear_velocity.y) < min_speed:
		state.linear_velocity.y = sign(state.linear_velocity.y) * min_speed
	if state.linear_velocity.length() > max_speed:
		state.linear_velocity = state.linear_velocity.normalized() * max_speed
