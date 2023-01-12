extends StaticBody2D

onready var HUD = get_node("/root/Game/HUD")


func emit_particle(pos):
	if HUD.particle_walls:
		$Particles2D.emitting = true
		$Particles2D.global_position = pos
		$Particles2D.look_at(get_viewport_rect().size/2)
