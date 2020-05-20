extends Area2D

export (PackedScene) var Laser


func _ready():
	$BabosoShooting.visible = false
	add_to_group("total_babosos")
	add_to_group("total_laser_babosos")
	$AnimationPlayer.play("Idle")


func _on_Baboso_get_hit_by_Player_laser(_area_id, area, _area_shape, _self_shape):
	if area.has_method("im_the_laser"):
		remove_from_group("total_laser_babosos")
		$BabosoShooting.visible = false
		$Sprite.visible = true
		$AnimationPlayer.play("death")
		$HurtSound.play()
		get_tree().call_group("HUD", "add_score", "LASER")
		yield($AnimationPlayer, "animation_finished")
		queue_free()


func baboso_shoot():
	var laser = Laser.instance()
	$BabosoShooting.visible = true
	$Sprite.visible = false
	$ShootSound.play()
	laser.position = to_global($Sprite.position - Vector2(0, 13))
	get_parent().get_parent().add_child(laser)
	yield(get_tree().create_timer(0.4), "timeout")
	$BabosoShooting.visible = false
	$Sprite.visible = true
	
	
func on_game_over():
	$AnimationPlayer.play("win")
	

func _on_Space_baboso_laser_area_entered(area):
	if area.has_method("no_lasers_allowed"):
		add_to_group("no_ready_members")
	
	
func _on_Space_baboso_laser_area_exited(area):
	if area.has_method("no_lasers_allowed"):
		remove_from_group("no_ready_members")
	
	
func im_a_baboso():
	pass


