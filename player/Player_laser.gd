extends Area2D

var speed = 120


func _ready():
	$AnimatedSprite.play("default")


func _process(delta):
	global_position += (Vector2(0, -1) * speed) * delta
	
	
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Laser_hits_Baboso(_area_id, area, _area_shape, _self_shape):
	if area.has_method("im_a_baboso") or area.has_method("im_a_attacking_fiery"):
		speed = 0
		$CollisionShape2D.disabled = true
		$AnimatedSprite.play("destroy")
		yield($AnimatedSprite, "animation_finished")
		queue_free()


func im_the_laser():
	pass




