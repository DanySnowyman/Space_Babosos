extends Area2D


export (PackedScene) var Heavy_eye

var hits_left = 3
var intact_texture = preload("res://gfx/Space_baboso_heavy_1.png")
var damaged_texture = preload("res://gfx/Space_baboso_heavy_2.png")
var beaten_texture = preload("res://gfx/Space_baboso_heavy_3.png")

func _ready():
	add_to_group("total_babosos")
	add_to_group("total_heavy_babosos")
	$Sprite.set_texture(intact_texture)
	$AnimationPlayer.play("Idle")


func _on_Baboso_get_hit_by_Player_laser(_area_id, area, _area_shape, _self_shape):
	if area.has_method("im_the_laser"):
		if hits_left == 3:
			hits_left -= 1
			$ResistSound.play()
			$Sprite.set_texture(damaged_texture)
		elif hits_left == 2:
			hits_left -= 1
			$ResistSound.play()
			$Sprite.set_texture(beaten_texture)
		else:
			$AnimationPlayer.play("death")
			$HurtSound.play()
			get_tree().call_group("HUD", "add_score", "HEAVY")
			left_eye_eyection()
			right_eye_eyection()
			yield($AnimationPlayer, "animation_finished")
			queue_free()
			

func left_eye_eyection():
	var Eye = Heavy_eye.instance()
	yield(get_tree().create_timer(0.15), "timeout")
	Eye.position = to_global($Sprite.position + Vector2(-4, -4))
	Eye.velocity = Vector2(-1.5, -3)
	get_parent().get_parent().add_child(Eye)


func right_eye_eyection():
	var Eye = Heavy_eye.instance()
	yield(get_tree().create_timer(0.15), "timeout") 
	Eye.position = to_global($Sprite.position + Vector2(4, -4))
	Eye.velocity = Vector2(1.5, -3)
	get_parent().get_parent().add_child(Eye)
	

func on_game_over():
	$AnimationPlayer.play("win")


func _on_Space_baboso_heavy_area_entered(area):
	if area.has_method("no_lasers_allowed"):
		add_to_group("no_ready_members")
	

func _on_Space_baboso_heavy_area_exited(area):
	if area.has_method("no_lasers_allowed"):
		remove_from_group("no_ready_members")


func im_a_baboso():
	pass
