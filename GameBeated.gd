extends Node2D

onready var tween = $Tween

func _ready():
	tween.interpolate_property($EarthSavedImage, "modulate:a", 0, 1, 5/
			Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	tween.start()
	yield(get_tree().create_timer(2), "timeout")
	$CongratulationsText.visible = true
	$EarthIsSavedText.visible = true
	$BlinkText.start()
	yield(get_tree().create_timer(12), "timeout")
	tween.interpolate_property(self, "modulate:a", 1, 0, 5/
			Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	tween.start()
	yield(tween, "tween_completed")
	get_tree().call_group("Main", "show_title_screen")
	get_tree().call_group("Parallax", "fade_in")
	queue_free()


func _on_BlinkText_timeout():
	$EarthIsSavedText.visible = !$EarthIsSavedText.visible
