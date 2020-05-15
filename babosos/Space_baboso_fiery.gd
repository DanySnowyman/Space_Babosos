extends Area2D

onready var tween = $FieryInAction/Tween

var is_retreating = false
var velocity = Vector2()
var retreating_speed = 40
var actual_fiery_position = Vector2()


func _ready():
	$Sprite.visible = true
	$FieryInAction.visible = false
	$FieryInAction/AttackCollisionShape.disabled = true
	add_to_group("total_babosos")
	add_to_group("total_fiery_babosos")
	$AnimationPlayer.play("Idle")


func _on_Baboso_get_hit_by_laser(_area_id, area, _area_shape, _self_shape):
	if area.has_method("im_the_laser"):
		$AnimationPlayer.play("death")
		$HurtSound.play()
		get_tree().call_group("HUD", "add_score", "FIERY")
		yield($AnimationPlayer, "animation_finished")
		queue_free()
		

func _on_FieryInAction_get_hit_by_laser(_area_id, area, _area_shape, _self_shape):
	if area.has_method("im_the_laser"):
		tween.stop_all()
		is_retreating = false
		$FieryInAction/AttackAnimation.play("death_on_attack")
		$HurtSound.play()
		get_tree().call_group("HUD", "add_score", "FIERY")
		yield($FieryInAction/AttackAnimation, "animation_finished")
		queue_free()
	
	
func fiery_attack(player_pos):
	var target = Vector2()
	target = player_pos
	$AttackSound.play()
	$Sprite.visible = false
	$CollisionShape2D.disabled = true
	$FieryInAction.visible = true
	$FieryInAction/AttackCollisionShape.disabled = false
	$FieryInAction/AttackAnimation.play("attack")
	$FieryInAction.position = to_global($Sprite.position)
	$FieryInAction.set_as_toplevel(true)
	tween.interpolate_property($FieryInAction, "position",
			$FieryInAction.position, target, 2,
			Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
	tween.start()
	yield(tween, "tween_completed")
	is_retreating = true
	$AttackSound.stop()
	$FailSound.play()
	
	
func fiery_retreated():
	yield(get_tree().create_timer(0.1), "timeout")
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


func _process(delta):
	if is_retreating == true:
		$FieryInAction/AttackAnimation.play("retreat")
		$FieryInAction.position += (velocity * retreating_speed) * delta
		velocity = $FieryInAction.position.direction_to(to_global($Sprite.position))
		if (to_local($FieryInAction.position) - $Sprite.position).length() < 1:
			is_retreating = false
			fiery_retreated()


func im_a_baboso():
	pass
