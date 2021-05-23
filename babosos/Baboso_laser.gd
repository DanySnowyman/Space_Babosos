extends Area2D

var speed = 100

func _ready():
	$AnimatedSprite.visible = true

func _process(delta):
	$AnimatedSprite.play("default")
	$AnimatedSprite.position += (Vector2(0, 1) * speed) * delta
	$CollisionShape2D.position += (Vector2(0, 1) * speed) * delta
	$VisibilityNotifier2D.position += (Vector2(0, 1) * speed) * delta


func _on_VisibilityNotifier2D_screen_exited():
	yield(get_tree().create_timer(1), "timeout")
	queue_free()


func im_baboso_laser():
	pass
