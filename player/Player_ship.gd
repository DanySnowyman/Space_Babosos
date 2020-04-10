extends Area2D

export (PackedScene) var Laser
var screen_size
var speed = 130
var can_control = false

func _ready():
	screen_size = get_viewport_rect().size
	can_control = true
	$ShipExplosion.visible = false

func _process(delta):
	var velocity = Vector2()
	
	if can_control == true:
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
		
		if Input.is_action_pressed("ui_accept") and $ShootCadence.is_stopped():
			var shoot = Laser.instance()
			shoot.position += self.position
			shoot.position.y -= 14
			shoot.position.x += 0.5
			get_parent().add_child(shoot)
			$LaserSound.play()
			$ShootCadence.start()


func _on_Player_area_shape_entered(area_id, area, area_shape, self_shape):
	can_control = false
	$Sprite.visible = false
	$ShipExplosion.visible = true
	$AnimationPlayer.play("explosion")
	$ExplosionSound.play()
	$Audio
	yield($AnimationPlayer, "animation_finished")
	queue_free()

