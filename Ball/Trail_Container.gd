extends Node2D

export var shrink_amount = 0.04
export var hue_amount = 0.03
export var fade_amount = 0.03
export var desaturate_amount = 0
export var darken_amount = 0.001

func _ready():
	randomize()

func _physics_process(_delta):
	for ch in get_children():
		ch.rect_position.x += (randf()-0.5)
		ch.rect_position.y += (randf()-0.5)
		
		ch.rect_size *= (1-shrink_amount)
		ch.color = ch.color.from_hsv(ch.color.h+hue_amount, ch.color.s-desaturate_amount, ch.color.v-darken_amount, ch.color.a-fade_amount)
		if ch.color.a <= 0:
			ch.queue_free()
