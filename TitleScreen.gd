extends Node2D

onready var tween = $Tween

func show_title_screen():
	$SpaceLogo.position = Vector2(160,-65)
	$BabososLogo.position = Vector2(160, 105)
	$BabososLogo.scale.y = 0

	tween.interpolate_property($SpaceLogo, "position",
			$SpaceLogo.position, Vector2(160, 65), 2,
			Tween.TRANS_BOUNCE, Tween.EASE_OUT)
	tween.start()
	yield(tween, "tween_completed")
	tween.interpolate_property($BabososLogo, "scale", Vector2(1, 0),
			Vector2(1, 1), 2, Tween.TRANS_QUAD, Tween.EASE_IN_OUT)
	tween.start()

	
	
