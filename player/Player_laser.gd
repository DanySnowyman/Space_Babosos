extends Area2D

var speed = 120


func _ready():
	$AnimatedSprite.play("default")


func _process(delta):
	global_position += (Vector2(0, -1) * speed) * delta
	
	
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Laser_hits_Baboso(_area_id, area, _area_shape, _self_shape):
	if area.has_method("im_a_baboso") or area.has_method("im_a_attacking_fiery")\
			or area.has_method("im_baboso_laser"):
		speed = 0
		$CollisionShape2D.queue_free()
		$AnimatedSprite.play("destroy")
		yield($AnimatedSprite, "animation_finished")
		queue_free()
	else: pass


func im_the_laser():
	pass




