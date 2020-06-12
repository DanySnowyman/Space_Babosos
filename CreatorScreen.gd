extends Node2D

onready var tween = $Tween

func _ready():
	#A Game By...
	yield(get_tree().create_timer(2), "timeout")
	tween.interpolate_property($AGameBy, "modulate:a", 0, 1, 1, Tween.TRANS_QUAD/
			Tween.EASE_OUT)
	tween.start()
	yield(get_tree().create_timer(1.5), "timeout")
	#@DanySnowyman
	tween.interpolate_property($DanySnowyman, "modulate:a", 0, 1, 1, Tween.TRANS_QUAD/
			Tween.EASE_OUT)
	tween.start()
	yield(get_tree().create_timer(2), "timeout")
	#Made With...
	tween.interpolate_property($MadeWith, "modulate:a", 0, 1, 1, Tween.TRANS_QUAD/
			Tween.EASE_OUT)
	tween.start()
	yield(get_tree().create_timer(1.5), "timeout")
	$GodotLogo.play()
	#GodotEngine
	tween.interpolate_property($GodotEngine, "modulate:a", 0, 1, 1, Tween.TRANS_QUAD/
			Tween.EASE_OUT)
	tween.start()
	yield(get_tree().create_timer(1.5), "timeout")
	tween.interpolate_property($GodotLogo, "modulate:a", 0, 1, 1, Tween.TRANS_QUAD/
			Tween.EASE_OUT)
	tween.start()
	yield(get_tree().create_timer(3), "timeout")
	tween.interpolate_property(self, "modulate:a", 1, 0, 1, Tween.TRANS_QUAD/
			Tween.EASE_OUT)
	tween.start()
	yield(tween, "tween_completed")
	queue_free()
