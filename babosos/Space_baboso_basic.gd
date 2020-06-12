extends Area2D


func _ready():
	$BabosoShooting.visible = false
	add_to_group("total_babosos")
	add_to_group("total_basic_babosos")
	$AnimationPlayer.play("Idle")


func _on_Baboso_get_hit_by_Player_laser(_area_id, area, _area_shape, _self_shape):
	if area.has_method("im_the_laser"):
		remove_from_group("total_basic_babosos")
		$Sprite.visible = true
		$BabosoShooting.visible = false
		get_tree().call_group("HUD", "add_score", "BASIC")
		$AnimationPlayer.play("death")
		$HurtSound.play()
		yield($AnimationPlayer, "animation_finished")
		$CollisionShape2D.disabled = true
		yield(get_tree().create_timer(0.5), "timeout")
		queue_free()


func baboso_shoot():
	$ShoothFrameLenght.start()
	$BabosoShooting.visible = true
	$Sprite.visible = false
	$ShootSound.play()


func _on_ShoothFrameLenght_timeout():
	$Sprite.visible = true
	$BabosoShooting.visible = false
	
	
func on_game_over():
	$AnimationPlayer.play("win")

	
func _on_Space_baboso_basic_area_entered(area):
	if area.has_method("no_lasers_allowed"):
		add_to_group("no_ready_members")
	

func _on_Space_baboso_basic_area_exited(area):
	if area.has_method("no_lasers_allowed"):
		remove_from_group("no_ready_members")


func im_a_baboso():
	pass


