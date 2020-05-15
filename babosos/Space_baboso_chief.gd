extends Area2D


var speed = 70
var velocity


func _ready():
	$ChiefSound.play()
	$AnimationPlayer.play("Idle")
	if position.x < 0:
		velocity = 1
	else: velocity = -1


func _on_Baboso_get_hit_by_Player_laser(_area_id, area, _area_shape, _self_shape):
	if area.has_method("im_the_laser"):
			$AnimationPlayer.play("death")
			$HitSound.play()
			get_tree().call_group("HUD", "add_score", "CHIEF")
			yield($AnimationPlayer, "animation_finished")
			queue_free()
			

func _process(delta):
	position.x += (speed * velocity) * delta


func _on_VisibilityNotifier2D_viewport_exited(viewport):
	queue_free()
