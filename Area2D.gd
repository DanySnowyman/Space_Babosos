extends Area2D

var screen_size
var speed = 130

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	var velocity = Vector2()
	
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		$AnimationPlayer.play("left")
		if $Sprite.frame == 3:
			$AnimationPlayer.stop()

	if Input.is_action_just_released("ui_left"):
		$AnimationPlayer.play_backwards("left")
	
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
		$AnimationPlayer.play("right")
		if $Sprite.frame == 2:
			$AnimationPlayer.stop()
	
	if Input.is_action_just_released("ui_right"):
		$AnimationPlayer.play_backwards("right")
	
	velocity = velocity * speed
	position += velocity * delta
	
	if velocity.x == 0:
		$Sprite.frame = 0
	
	position.x = clamp(position.x, 15, screen_size.x - 15)
	if position.x == 15 || position.x == (screen_size.x - 15):
		$Sprite.frame = 0
