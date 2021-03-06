extends Area2D

export (PackedScene) var Laser
export (PackedScene) var Exhaust
export (PackedScene) var Trace

var screen_size
var speed = 130
var can_control
var can_shoot
var can_dead

var game_beated = false
var in_center = false
var exhaust_added = false
var delayed = false

signal return_home
signal call_ending

func _ready():
	add_to_group("Player")
	self.position = Vector2(160, 160)
	screen_size = get_viewport_rect().size
	can_control = true
	can_shoot = false
	can_dead = true
	$ShipExplosion.visible = false
	

func player_reset():
	$ShipExplosion.visible = false
	$CollisionShape2D.disabled = true
	self.position = Vector2(160, 160)
	can_control = true
	can_dead = true
	for n in range (8):
		$Sprite.visible = true
		yield(get_tree().create_timer(0.1), "timeout")
		$Sprite.visible = false
		yield(get_tree().create_timer(0.1), "timeout")
	$Sprite.visible = true
	$CollisionShape2D.disabled = false


func on_game_over():
	queue_free()
	
	
func _on_Player_area_shape_entered(_area_id, area, _area_shape, _self_shape):
	if can_dead == true:
		can_dead = false
		can_control = false
		$Sprite.visible = false
		$ShipExplosion.visible = true
		$AnimationPlayer.play("explosion")
		$ExplosionSound.play()
		yield($AnimationPlayer, "animation_finished")
		$ShipExplosion.visible = false
		if area.has_method("im_a_baboso"):
			get_tree().call_group("Main", "game_over")
		else:
			get_tree().call_group("HUD", "substract_lives")
	

func _process(delta):
	var velocity = Vector2()
	if can_control == true and game_beated == false:
		player_control(delta, velocity)
		
	if game_beated == true:
		ending_sequence(delta, velocity)

	

func player_control(delta, velocity):
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

	position += (velocity * speed) * delta

	if velocity.x == 0:
		$Sprite.frame = 0

	position.x = clamp(position.x, 15, screen_size.x - 15)
	if position.x == 15 || position.x == (screen_size.x - 15):
		$Sprite.frame = 0
	
	if Input.is_action_pressed("ui_accept") and $ShootCadence.is_stopped():
		if can_shoot == true:
			var shoot = Laser.instance()
			shoot.position += self.position
			shoot.position.y -= 14
			shoot.position.x += 0.5
			get_parent().add_child(shoot)
			$LaserSpread.frame = 0
			$LaserSpread.play("spread")
			$LaserSound.play()
			$ShootCadence.start()
			if $LaserSpread.frame > 4: $LaserSpread.stop()
	

func ending_sequence(delta, velocity):
	var exhaust = Exhaust.instance()
	var trace = Trace.instance()
	
	if (self.position - Vector2(160, 160)).length() > 1 and in_center == false:
		speed = 50
		velocity = self.position.direction_to(Vector2(160, 160))
		if velocity.x > 0:
			$Sprite.frame = 1
		elif velocity.x < 0:
			$Sprite.frame = 4
	else: in_center = true

	if in_center == true:
		$Sprite.frame = 0
		if exhaust_added == false:
			exhaust.position == self.position
			exhaust.position.y += 13
			add_child(exhaust)
			exhaust_added = true
			$EngineFire.start_engine()
		if delayed == false:
			yield(get_tree().create_timer(2), "timeout")
			delayed = true
		velocity = Vector2(0, -1)
		$EngineFire.engine_ready()
		trace.position += self.position
		trace.position.y += 16
		get_parent().add_child(trace)
		emit_signal("return_home")
		if self.position.y < 0:
			emit_signal("call_ending")
		if self.position.y < -1000:
			queue_free()

	position += (velocity * speed) * delta
	

func _on_Player_return_home():
	get_tree().call_group("Parallax", "on_player_win")


func _on_Player_call_ending():
	get_tree().call_group("Main", "show_ending")


func im_the_player():
	pass

