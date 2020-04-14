extends Area2D

var speed = 80


func _process(delta):
	$AnimatedSprite.play("default")
	$AnimatedSprite.position += (Vector2(0, 1) * speed) * delta
	$CollisionShape2D.position += (Vector2(0, 1) * speed) * delta
	$VisibilityNotifier2D.position += (Vector2(0, 1) * speed) * delta


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
