extends Area2D

var speed = 120


func _process(delta):
	$AnimatedSprite.play("default")
	global_position += (Vector2(0, -1) * speed) * delta
	
	
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Laser_hits_Baboso(area_id, area, area_shape, self_shape):
	queue_free()


func im_the_laser():
	pass




