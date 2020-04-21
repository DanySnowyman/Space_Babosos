extends Area2D

signal Baboso_laser_defeated

var shooting_frame_lenght = 100


func _ready():
	$BabosoShooting.visible = false
	add_to_group("total_babosos")
	add_to_group("total_laser_babosos")
	$AnimationPlayer.play("Idle")


func _on_Baboso_get_hit_by_Player_laser(area_id, area, area_shape, self_shape):
	if area.has_method("im_the_laser"):
		if $ShootSound.is_playing() == true:
			$CollisionShape2D.disabled = true
			yield(baboso_shoot(), "completed")
			_on_ShootFrameLenght_timeout()
			$AnimationPlayer.play("death")
			$HurtSound.play()
			emit_signal("Baboso_laser_defeated")
			yield($AnimationPlayer, "animation_finished")
			queue_free()
		else:
			$CollisionShape2D.disabled = true
			_on_ShootFrameLenght_timeout()
			$AnimationPlayer.play("death")
			$HurtSound.play()
			emit_signal("Baboso_laser_defeated")
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


func _on_Space_baboso_laser_area_entered(area):
	if area.has_method("no_lasers_allowed"):
		add_to_group("no_ready_members")
	
	
func _on_Space_baboso_laser_area_exited(area):
	if area.has_method("no_lasers_allowed"):
		remove_from_group("no_ready_members")
		

