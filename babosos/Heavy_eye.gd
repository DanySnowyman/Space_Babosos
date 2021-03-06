extends Area2D


var speed = 20
var velocity = Vector2()


func _process(delta):
	self.rotation = velocity.angle()
	position += (velocity * speed) * delta
	velocity.y += delta * 10


func _on_VisibilityNotifier2D_screen_exited():
	yield(get_tree().create_timer(2),"timeout")
	queue_free()
