extends Node2D

func show_creator_screen():
	yield(get_tree().create_timer(2), "timeout")
	$AGameBy.visible = true
	yield(get_tree().create_timer(2), "timeout")
	$DanySnowyman.visible = true
	yield(get_tree().create_timer(2), "timeout")
	$MadeWith.visible = true
	yield(get_tree().create_timer(2), "timeout")
	$GodotEngine.visible = true
	$GodotLogo.visible = true
	$GodotLogo.play()
	yield(get_tree().create_timer(3), "timeout")
	queue_free()
	
