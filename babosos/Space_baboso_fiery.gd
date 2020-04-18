extends Area2D

onready var tween = $FieryInAction/Tween

signal Baboso_fiery_defeated


func _ready():
	$Sprite.visible = true
	$FieryInAction.visible = false
	add_to_group("total_babosos")
	add_to_group("total_fiery_babosos")
	$AnimationPlayer.play("Idle")


func _on_Baboso_get_hit_by_Player_laser(area_id, area, area_shape, self_shape):
	if area.has_method("im_the_laser"):
		$AnimationPlayer.play("death")
		$HurtSound.play()
		emit_signal("Baboso_fiery_defeated")
		yield($AnimationPlayer, "animation_finished")
		queue_free()


func fiery_attack(player_pos):
	var target = Vector2()
	target = to_local(player_pos)
	
	$Sprite.visible = false
	$CollisionShape2D.disabled = true
	$FieryInAction.visible = true
	$FieryInAction/AttackCollisionShape.disabled = false
	$FieryInAction/AttackAnimation.play("attack")
	tween.interpolate_property($FieryInAction, "position",
			$Sprite.position, target, 2,
			Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
	tween.start()
	yield(tween, "tween_completed")
	tween.interpolate_property($FieryInAction, "position",
			$FieryInAction.position, $Sprite.position, 3,
			Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
	tween.start()
	yield(tween, "tween_completed")
	$Sprite.visible = true
	$CollisionShape2D.disabled = false
	$FieryInAction.visible = false
	$FieryInAction/AttackCollisionShape.disabled = true
	
	
func _on_Space_baboso_fiery_area_entered(area):
	if area.has_method("no_lasers_allowed"):
		add_to_group("no_ready_members")

func _on_Space_baboso_fiery_area_exited(area):
	if area.has_method("no_lasers_allowed"):
		remove_from_group("no_ready_members")


