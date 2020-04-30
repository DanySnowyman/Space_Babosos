extends Area2D



func _ready():
	$BabosoShooting.visible = false
	add_to_group("total_babosos")
	add_to_group("total_basic_babosos")
	$AnimationPlayer.play("Idle")


func _on_Baboso_get_hit_by_Player_laser(_area_id, area, _area_shape, _self_shape):
	if area.has_method("im_the_laser"):
		if $ShootSound.is_playing() ==  true:
			yield(baboso_shoot(), "completed")
			_on_ShootFrameLenght_timeout()
			$AnimationPlayer.play("death")
			$HurtSound.play()
			get_tree().call_group("HUD", "add_score", "BASIC")
			yield($AnimationPlayer, "animation_finished")
			queue_free()
		else:
			$BabosoShooting.visible = false
			get_tree().call_group("HUD", "add_score", "BASIC")
			$HurtSound.play()
			$AnimationPlayer.play("death")
			yield($AnimationPlayer, "animation_finished")
			queue_free()

func baboso_shoot():
	$ShootFrameLenght.start()
	$BabosoShooting.visible = true
	$Sprite.visible = false
	$ShootSound.play()
	yield(get_tree().create_timer(0.2), "timeout")
	

func _on_ShootFrameLenght_timeout():
	$BabosoShooting.visible = false
	$Sprite.visible = true


func _on_Space_baboso_basic_area_entered(area):
	if area.has_method("no_lasers_allowed"):
		add_to_group("no_ready_members")
	

func _on_Space_baboso_basic_area_exited(area):
	if area.has_method("no_lasers_allowed"):
		remove_from_group("no_ready_members")


