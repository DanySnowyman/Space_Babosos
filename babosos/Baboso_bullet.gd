extends Area2D

var speed = 50


func _process(delta):
	$AnimatedSprite.play("default")
	position += (Vector2(0, 1) * speed) * delta


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
