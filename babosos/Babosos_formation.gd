extends Node2D

onready var tween = $Tween
export (PackedScene) var Baboso_Basic
export (PackedScene) var Baboso_Laser
export (PackedScene) var Bullet
export (PackedScene) var Laser


var velocity = Vector2(1, 0)
var speed = 10


func _ready():
	position = Vector2(24, 24)
	create_formation()
	$BabosoBasicCadence.start()
	$BabosoLaserCadence.start()


func create_formation():
	var column_spacing = 24
	var row_spacing = 20
	#Column 1
	set_pos("basic", Vector2(0, 0))
	set_pos("laser", Vector2(0, row_spacing))
	set_pos("basic", Vector2(0, row_spacing * 2))
	set_pos("laser", Vector2(0, row_spacing * 3))
	set_pos("basic", Vector2(0, row_spacing * 4))
	#Column 2
	set_pos("basic", Vector2(column_spacing, 0))
	set_pos("laser", Vector2(column_spacing, row_spacing))
	set_pos("basic", Vector2(column_spacing, row_spacing * 2))
	set_pos("laser", Vector2(column_spacing, row_spacing * 3))
	set_pos("basic", Vector2(column_spacing, row_spacing * 4))
	#Column 3
	set_pos("basic", Vector2(column_spacing * 2, 0))
	set_pos("laser", Vector2(column_spacing * 2, row_spacing))
	set_pos("basic", Vector2(column_spacing * 2, row_spacing * 2))
	set_pos("laser", Vector2(column_spacing * 2, row_spacing * 3))
	set_pos("basic", Vector2(column_spacing * 2, row_spacing * 4))
	#Column 4
	set_pos("basic", Vector2(column_spacing * 3, 0))
	set_pos("laser", Vector2(column_spacing * 3, row_spacing))
	set_pos("basic", Vector2(column_spacing * 3, row_spacing * 2))
	set_pos("laser", Vector2(column_spacing * 3, row_spacing * 3))
	set_pos("basic", Vector2(column_spacing * 3, row_spacing * 4))
	#Column 5
	set_pos("basic", Vector2(column_spacing * 4, 0))
	set_pos("laser", Vector2(column_spacing * 4, row_spacing))
	set_pos("basic", Vector2(column_spacing * 4, row_spacing * 2))
	set_pos("laser", Vector2(column_spacing * 4, row_spacing * 3))
	set_pos("basic", Vector2(column_spacing * 4, row_spacing * 4))
	#Column 6
	set_pos("basic", Vector2(column_spacing * 5, 0))
	set_pos("laser", Vector2(column_spacing * 5, row_spacing))
	set_pos("basic", Vector2(column_spacing * 5, row_spacing * 2))
	set_pos("laser", Vector2(column_spacing * 5, row_spacing * 3))
	set_pos("basic", Vector2(column_spacing * 5, row_spacing * 4))
	#Column 7
	set_pos("basic", Vector2(column_spacing * 6, 0))
	set_pos("laser", Vector2(column_spacing * 6, row_spacing))
	set_pos("basic", Vector2(column_spacing * 6, row_spacing * 2))
	set_pos("laser", Vector2(column_spacing * 6, row_spacing * 3))
	set_pos("basic", Vector2(column_spacing * 6, row_spacing * 4))
	
	
func set_pos(baboso_type, position):
	if baboso_type == "basic":
		baboso_type = Baboso_Basic.instance()
	elif baboso_type == "laser":
			baboso_type = Baboso_Laser.instance()
	baboso_type.position = position
	add_child(baboso_type)


func move_formation(delta):
	position += (velocity * speed) * delta


func if_border_reached():
	for baboso in get_tree().get_nodes_in_group("total_babosos"):
		if left_border_reached(baboso) or right_border_reached(baboso):
			get_down()
			velocity = -velocity
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
	tween.interpolate_property(self, "position",
	position, position + Vector2(0, 16), 0.5,
	Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
	tween.start()


func baboso_basic_shoot():
	var basic_babosos = get_tree().get_nodes_in_group("total_basic_babosos")
	if basic_babosos.size() >= 1:
		var next_shooting_baboso = basic_babosos[randi() % basic_babosos.size()]
		var bullet = Bullet.instance()
		if $BabosoBasicCadence.is_stopped():
			next_shooting_baboso.baboso_shoot()
			bullet.position = next_shooting_baboso.global_position
			get_parent().add_child(bullet)
			$BabosoBasicCadence.start()
			

func baboso_laser_shoot():
	var laser_babosos = get_tree().get_nodes_in_group("total_laser_babosos")
	if laser_babosos.size() >= 1:
		var next_shooting_baboso = laser_babosos[randi() % laser_babosos.size()]
		var laser = Laser.instance()
		if $BabosoLaserCadence.is_stopped():
			next_shooting_baboso.baboso_shoot()
			laser.position = next_shooting_baboso.global_position
			get_parent().add_child(laser)
			$BabosoLaserCadence.start()


func _process(delta):
	move_formation(delta)
	if_border_reached()
	baboso_basic_shoot()
	baboso_laser_shoot()
