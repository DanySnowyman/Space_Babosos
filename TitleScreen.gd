extends Node2D

onready var tween = $Tween

var show_press_fire = false
var has_sounded = false


func _ready():
	$SpaceLogo.position = Vector2(160, -65)
	$BabososLogo.scale.y = 0
	$BabososLogo.position = Vector2(160, 105)
	$SpaceLogo.visible = true
	$BabososLogo.visible = true
	$BabosoTitle.visible = false
	tween.interpolate_property($SpaceLogo, "position",
			$SpaceLogo.position, Vector2(160, 65), 2,
			Tween.TRANS_BOUNCE, Tween.EASE_OUT)
	tween.start()
	yield(tween, "tween_completed")
	$BabososTextAppearSound.play()
	tween.interpolate_property($BabososLogo, "scale", Vector2(1, 0),
			Vector2(1, 1), 2, Tween.TRANS_QUAD, Tween.EASE_IN_OUT)
	tween.start()
	yield(tween, "tween_all_completed")
	baboso_enter_sound()
	$AnimationPlayer.play("BabosoMovement")
	yield($AnimationPlayer, "animation_finished")
	$AnimationPlayer.play("BabosoAnimation")
	yield(get_tree().create_timer(1.5), "timeout")
	show_press_fire = true
	get_tree().call_group("Main", "call_hi_score")
	$PressEscText.show()
	$PressStartText.show()


func _on_PressStartBlink_timeout():
	$PressStartText.visible = !$PressStartText.visible


func baboso_enter_sound():
	for n in range (3):
		$BabosoEnterSound.play()
		

func remove():
	$StartPressedSound.play()
	$PressStartBlink.start(0.1)
	$PressEscText.hide()
	yield($StartPressedSound, "finished")
	self.call_deferred("queue_free")
	
	
func return_to_desktop():
	$PressStartText.text = "SEE YOU LATER!"
	$StartPressedSound.play()
	$PressStartBlink.start(0.1)
	$PressEscText.hide()
	yield($StartPressedSound, "finished")
	
	

func _process(delta):
	if show_press_fire == true and $PressStartBlink.is_stopped():
		$PressStartBlink.start(0.5)
		
		
	if $SpaceLogo.position.y >= 63 and has_sounded == false:
		$SpaceTextFallSound.play()
		has_sounded = true
	
	if $SpaceLogo.position.y < 60:
		has_sounded = false


