extends Node2D

onready var tween = $Tween
export (PackedScene) var Baboso_Basic
export (PackedScene) var Baboso_Laser
export (PackedScene) var Baboso_Fiery
export (PackedScene) var Baboso_Heavy
export (PackedScene) var Baboso_Chief
export (PackedScene) var Bullet
export (PackedScene) var Laser

var is_game_over = false
var formation_can_move = true
var formation_getting_down = false
var velocity = Vector2(1, 0)
var speed = 10


func _ready():
	randomize()
	position = Vector2(24, 16)
	create_formation()
	$BabosoBasicCadence.start()
	$BabosoLaserCadence.start()
	$BabosoFieryCadence.start()
	$ChiefAppearance.start(rand_range(16, 30))


func create_formation():
	var column_spacing = 24
	var row_spacing = 20
	#Column 1
	set_pos("basic", Vector2(0, 0))
	set_pos("laser", Vector2(0, row_spacing))
	set_pos("basic", Vector2(0, row_spacing * 2))
	set_pos("heavy", Vector2(0, row_spacing * 3))
	set_pos("fiery", Vector2(0, row_spacing * 4))
	#Column 2
	set_pos("basic", Vector2(column_spacing, 0))
	set_pos("laser", Vector2(column_spacing, row_spacing))
	set_pos("basic", Vector2(column_spacing, row_spacing * 2))
	set_pos("heavy", Vector2(column_spacing, row_spacing * 3))
	set_pos("fiery", Vector2(column_spacing, row_spacing * 4))
	#Column 3
	set_pos("basic", Vector2(column_spacing * 2, 0))
	set_pos("laser", Vector2(column_spacing * 2, row_spacing))
	set_pos("basic", Vector2(column_spacing * 2, row_spacing * 2))
	set_pos("heavy", Vector2(column_spacing * 2, row_spacing * 3))
	set_pos("fiery", Vector2(column_spacing * 2, row_spacing * 4))
	#Column 4
	set_pos("basic", Vector2(column_spacing * 3, 0))
	set_pos("laser", Vector2(column_spacing * 3, row_spacing))
	set_pos("basic", Vector2(column_spacing * 3, row_spacing * 2))
	set_pos("heavy", Vector2(column_spacing * 3, row_spacing * 3))
	set_pos("fiery", Vector2(column_spacing * 3, row_spacing * 4))
	#Column 5
	set_pos("basic", Vector2(column_spacing * 4, 0))
	set_pos("laser", Vector2(column_spacing * 4, row_spacing))
	set_pos("basic", Vector2(column_spacing * 4, row_spacing * 2))
	set_pos("heavy", Vector2(column_spacing * 4, row_spacing * 3))
	set_pos("fiery", Vector2(column_spacing * 4, row_spacing * 4))
	#Column 6
	set_pos("basic", Vector2(column_spacing * 5, 0))
	set_pos("laser", Vector2(column_spacing * 5, row_spacing))
	set_pos("basic", Vector2(column_spacing * 5, row_spacing * 2))
	set_pos("heavy", Vector2(column_spacing * 5, row_spacing * 3))
	set_pos("fiery", Vector2(column_spacing * 5, row_spacing * 4))
	#Column 7
	set_pos("basic", Vector2(column_spacing * 6, 0))
	set_pos("laser", Vector2(column_spacing * 6, row_spacing))
	set_pos("basic", Vector2(column_spacing * 6, row_spacing * 2))
	set_pos("heavy", Vector2(column_spacing * 6, row_spacing * 3))
	set_pos("fiery", Vector2(column_spacing * 6, row_spacing * 4))
	
	
func set_pos(baboso_type, position):
	if baboso_type == "basic":
		baboso_type = Baboso_Basic.instance()
	elif baboso_type == "laser":
		baboso_type = Baboso_Laser.instance()
	elif baboso_type == "fiery":
		baboso_type = Baboso_Fiery.instance()
	elif baboso_type == "heavy":
		baboso_type = Baboso_Heavy.instance()
	baboso_type.position = position
	add_child(baboso_type)


func move_formation(delta):
	if formation_can_move == true:
		position += (velocity * speed) * delta
	else: pass


func if_border_reached():
	for baboso in get_tree().get_nodes_in_group("total_babosos"):
		if left_border_reached(baboso) or right_border_reached(baboso):
			get_down()
			velocity = -velocity
			speed += 5
			break


func left_border_reached(baboso):
	if velocity.x < 0.0:
		if baboso.global_position.x < 20:
			return true
	return false
	
	
func right_border_reached(baboso):
	if velocity.x > 0.0:
		if baboso.global_position.x > 300:
			return true
	return false


func get_down():
	formation_getting_down = true
	tween.interpolate_property(self, "position",
			position, position + Vector2(0, 16), 0.5,
			Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
	tween.start()
	formation_getting_down = false


func baboso_basic_shoot():
	var basic_babosos = get_tree().get_nodes_in_group("total_basic_babosos")
	if basic_babosos.size() >= 1:
		var next_shooting_baboso = basic_babosos[randi() % basic_babosos.size()]
		var bullet = Bullet.instance()
		if $BabosoBasicCadence.is_stopped() && formation_getting_down == false:
			$BulletPause.start()
			formation_can_move = false
			next_shooting_baboso.baboso_shoot()
			bullet.position = next_shooting_baboso.global_position
			get_parent().add_child(bullet)
			$BabosoBasicCadence.start()
	
	if $BulletPause.is_stopped() && $LaserPause.is_stopped():
		formation_can_move = true
		
		
func baboso_laser_shoot():
	var laser_babosos = get_tree().get_nodes_in_group("total_laser_babosos")
	var laser_babosos_unready = get_tree().get_nodes_in_group("no_ready_members")
	if laser_babosos.size() >= 1 and laser_babosos_unready.size() == 0:
		var next_shooting_baboso = laser_babosos[randi() % laser_babosos.size()]
		var laser = Laser.instance()
		if $BabosoLaserCadence.is_stopped() && formation_getting_down == false:
			$LaserPause.start()
			formation_can_move = false
			next_shooting_baboso.baboso_shoot()
			laser.position = next_shooting_baboso.global_position
			laser.position.y -= 13
			get_parent().add_child(laser)
			$BabosoLaserCadence.start()
			
	if $LaserPause.is_stopped() && $BulletPause.is_stopped():
		formation_can_move = true
			

func baboso_fiery_attack():
	var fiery_target = get_parent().get_node("Player").get_global_position()
	var fiery_babosos = get_tree().get_nodes_in_group("total_fiery_babosos")
	if fiery_babosos.size() >= 1:
		var next_attacking_fiery = fiery_babosos[randi() % fiery_babosos.size()]
		if $BabosoFieryCadence.is_stopped() && formation_getting_down == false:
			next_attacking_fiery.fiery_attack(fiery_target)
			$BabosoFieryCadence.start()


func baboso_chief_appear():
	var chief = Baboso_Chief.instance()
	var pos1 = Vector2 (-32, 12)
	var pos2 = Vector2 (352, 12)
	var pos_array = []
	pos_array.append(pos1)
	pos_array.append(pos2)
	if $ChiefAppearance.is_stopped():
		chief.position = pos_array[randi() % pos_array.size()]
		get_parent().add_child(chief)
		$ChiefAppearance.start(rand_range(16, 30))
		

func on_game_over():
	is_game_over = true
	tween.interpolate_property(self, "position", 1.0, 0.0, 3, Tween.TRANS_LINEAR, Tween.EASE_IN)

func _process(delta):
	if is_game_over == false:
		move_formation(delta)
		if_border_reached()
		baboso_basic_shoot()
		baboso_laser_shoot()
		baboso_fiery_attack()
		baboso_chief_appear()
