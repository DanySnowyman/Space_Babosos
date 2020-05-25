extends Node2D

onready var tween = $Tween
export (PackedScene) var Baboso_Basic
export (PackedScene) var Baboso_Laser
export (PackedScene) var Baboso_Fiery
export (PackedScene) var Baboso_Heavy
export (PackedScene) var Baboso_Chief
export (PackedScene) var Bullet

var is_game_over = false
var game_has_start = false
var formation_can_move = false
var formation_getting_down = true
var velocity = Vector2(0, 0)
var speed = 0
var chief_appearances = 0


func reset_variables():
	is_game_over = false
	game_has_start = false
	formation_can_move = false
	formation_getting_down = true
	velocity = Vector2(0, 0)
	speed = 0
	chief_appearances = 0


func game_start(level):
	add_to_group("BabososFormation")
	randomize()
	self.position = Vector2(24, -164)
	create_formation(level)
	tween.interpolate_property(self, "position", Vector2(24, -164),
			Vector2(24, 16), 1.5, Tween.TRANS_QUINT, Tween.EASE_OUT)
	tween.start()
	yield(tween, "tween_completed")
	velocity = Vector2(1, 0)
	speed = 10
	chief_appearances = 2
	formation_can_move = true
	formation_getting_down = false
	is_game_over = false
	game_has_start = true
	baboso_basic_cadence()
	baboso_laser_cadence()
	baboso_fiery_cadence()
	chief_appearance()
	
	
func baboso_basic_cadence():
	$BabosoBasicCadence.start(rand_range(0.5, 2))
	

func baboso_laser_cadence():
	$BabosoLaserCadence.start(rand_range(2, 5))
	

func baboso_fiery_cadence():
	$BabosoFieryCadence.start(rand_range(4, 7))
	
	
func chief_appearance():
	$ChiefAppearance.start(rand_range(20, 35))


func create_formation(level):
	if level == 1:
		formation_level_1()
	elif level == 2:
		formation_level_2()
	elif level == 3:
		formation_level_3()
	elif level == 4:
		formation_level_4()
	elif level == 5:
		formation_level_5()
	elif level == 6:
		formation_level_6()
	elif level == 7:
		formation_level_7()
	elif level == 8:
		formation_level_8()
	elif level == 9:
		formation_level_9()
	elif level == 10:
		formation_level_10()
	
	
func formation_level_1():
	var column_spacing = 24
	var row_spacing = 20
	
	#Column 1
	set_pos("basic", Vector2(0, 0))
	set_pos("basic", Vector2(0, row_spacing))
	set_pos("basic", Vector2(0, row_spacing * 2))
	set_pos("basic", Vector2(0, row_spacing * 3))
	set_pos("laser", Vector2(0, row_spacing * 4))
	#Column 2
	set_pos("basic", Vector2(column_spacing, 0))
	set_pos("basic", Vector2(column_spacing, row_spacing))
	set_pos("basic", Vector2(column_spacing, row_spacing * 2))
	set_pos("basic", Vector2(column_spacing, row_spacing * 3))
	set_pos("laser", Vector2(column_spacing, row_spacing * 4))
	#Column 3
	set_pos("basic", Vector2(column_spacing * 2, 0))
	set_pos("basic", Vector2(column_spacing * 2, row_spacing))
	set_pos("basic", Vector2(column_spacing * 2, row_spacing * 2))
	set_pos("basic", Vector2(column_spacing * 2, row_spacing * 3))
	set_pos("laser", Vector2(column_spacing * 2, row_spacing * 4))
	#Column 4
	set_pos("basic", Vector2(column_spacing * 3, 0))
	set_pos("basic", Vector2(column_spacing * 3, row_spacing))
	set_pos("basic", Vector2(column_spacing * 3, row_spacing * 2))
	set_pos("basic", Vector2(column_spacing * 3, row_spacing * 3))
	set_pos("laser", Vector2(column_spacing * 3, row_spacing * 4))
	#Column 5
	set_pos("basic", Vector2(column_spacing * 4, 0))
	set_pos("basic", Vector2(column_spacing * 4, row_spacing))
	set_pos("basic", Vector2(column_spacing * 4, row_spacing * 2))
	set_pos("basic", Vector2(column_spacing * 4, row_spacing * 3))
	set_pos("laser", Vector2(column_spacing * 4, row_spacing * 4))
	#Column 6
	set_pos("basic", Vector2(column_spacing * 5, 0))
	set_pos("basic", Vector2(column_spacing * 5, row_spacing))
	set_pos("basic", Vector2(column_spacing * 5, row_spacing * 2))
	set_pos("basic", Vector2(column_spacing * 5, row_spacing * 3))
	set_pos("laser", Vector2(column_spacing * 5, row_spacing * 4))
	#Column 7
	set_pos("basic", Vector2(column_spacing * 6, 0))
	set_pos("basic", Vector2(column_spacing * 6, row_spacing))
	set_pos("basic", Vector2(column_spacing * 6, row_spacing * 2))
	set_pos("basic", Vector2(column_spacing * 6, row_spacing * 3))
	set_pos("laser", Vector2(column_spacing * 6, row_spacing * 4))


func formation_level_2():
	var column_spacing = 24
	var row_spacing = 20
	
	#Column 1
	set_pos("basic", Vector2(0, 0))
	set_pos("basic", Vector2(0, row_spacing))
	set_pos("basic", Vector2(0, row_spacing * 2))
	set_pos("laser", Vector2(0, row_spacing * 3))
	set_pos("fiery", Vector2(0, row_spacing * 4))
	#Column 2
	set_pos("basic", Vector2(column_spacing, 0))
	set_pos("basic", Vector2(column_spacing, row_spacing))
	set_pos("basic", Vector2(column_spacing, row_spacing * 2))
	set_pos("laser", Vector2(column_spacing, row_spacing * 3))
	set_pos("fiery", Vector2(column_spacing, row_spacing * 4))
	#Column 3
	set_pos("basic", Vector2(column_spacing * 2, 0))
	set_pos("basic", Vector2(column_spacing * 2, row_spacing))
	set_pos("basic", Vector2(column_spacing * 2, row_spacing * 2))
	set_pos("laser", Vector2(column_spacing * 2, row_spacing * 3))
	set_pos("fiery", Vector2(column_spacing * 2, row_spacing * 4))
	#Column 4
	set_pos("basic", Vector2(column_spacing * 3, 0))
	set_pos("basic", Vector2(column_spacing * 3, row_spacing))
	set_pos("basic", Vector2(column_spacing * 3, row_spacing * 2))
	set_pos("laser", Vector2(column_spacing * 3, row_spacing * 3))
	set_pos("fiery", Vector2(column_spacing * 3, row_spacing * 4))
	#Column 5
	set_pos("basic", Vector2(column_spacing * 4, 0))
	set_pos("basic", Vector2(column_spacing * 4, row_spacing))
	set_pos("basic", Vector2(column_spacing * 4, row_spacing * 2))
	set_pos("laser", Vector2(column_spacing * 4, row_spacing * 3))
	set_pos("fiery", Vector2(column_spacing * 4, row_spacing * 4))
	#Column 6
	set_pos("basic", Vector2(column_spacing * 5, 0))
	set_pos("basic", Vector2(column_spacing * 5, row_spacing))
	set_pos("basic", Vector2(column_spacing * 5, row_spacing * 2))
	set_pos("laser", Vector2(column_spacing * 5, row_spacing * 3))
	set_pos("fiery", Vector2(column_spacing * 5, row_spacing * 4))
	#Column 7
	set_pos("basic", Vector2(column_spacing * 6, 0))
	set_pos("basic", Vector2(column_spacing * 6, row_spacing))
	set_pos("basic", Vector2(column_spacing * 6, row_spacing * 2))
	set_pos("laser", Vector2(column_spacing * 6, row_spacing * 3))
	set_pos("fiery", Vector2(column_spacing * 6, row_spacing * 4))
	

func formation_level_3():
	var column_spacing = 24
	var row_spacing = 20
	
	#Column 1
	set_pos("basic", Vector2(0, 0))
	set_pos("laser", Vector2(0, row_spacing))
	set_pos("fiery", Vector2(0, row_spacing * 2))
	set_pos("fiery", Vector2(0, row_spacing * 3))
	set_pos("fiery", Vector2(0, row_spacing * 4))
	#Column 2
	set_pos("basic", Vector2(column_spacing, 0))
	set_pos("basic", Vector2(column_spacing, row_spacing))
	set_pos("laser", Vector2(column_spacing, row_spacing * 2))
	set_pos("fiery", Vector2(column_spacing, row_spacing * 3))
	set_pos("fiery", Vector2(column_spacing, row_spacing * 4))
	#Column 3
	set_pos("basic", Vector2(column_spacing * 2, 0))
	set_pos("basic", Vector2(column_spacing * 2, row_spacing))
	set_pos("basic", Vector2(column_spacing * 2, row_spacing * 2))
	set_pos("laser", Vector2(column_spacing * 2, row_spacing * 3))
	set_pos("fiery", Vector2(column_spacing * 2, row_spacing * 4))
	#Column 4
	set_pos("basic", Vector2(column_spacing * 3, 0))
	set_pos("basic", Vector2(column_spacing * 3, row_spacing))
	set_pos("basic", Vector2(column_spacing * 3, row_spacing * 2))
	set_pos("laser", Vector2(column_spacing * 3, row_spacing * 3))
	set_pos("fiery", Vector2(column_spacing * 3, row_spacing * 4))
	#Column 5
	set_pos("basic", Vector2(column_spacing * 4, 0))
	set_pos("basic", Vector2(column_spacing * 4, row_spacing))
	set_pos("basic", Vector2(column_spacing * 4, row_spacing * 2))
	set_pos("laser", Vector2(column_spacing * 4, row_spacing * 3))
	set_pos("fiery", Vector2(column_spacing * 4, row_spacing * 4))
	#Column 6
	set_pos("basic", Vector2(column_spacing * 5, 0))
	set_pos("basic", Vector2(column_spacing * 5, row_spacing))
	set_pos("laser", Vector2(column_spacing * 5, row_spacing * 2))
	set_pos("fiery", Vector2(column_spacing * 5, row_spacing * 3))
	set_pos("fiery", Vector2(column_spacing * 5, row_spacing * 4))
	#Column 7
	set_pos("basic", Vector2(column_spacing * 6, 0))
	set_pos("laser", Vector2(column_spacing * 6, row_spacing))
	set_pos("fiery", Vector2(column_spacing * 6, row_spacing * 2))
	set_pos("fiery", Vector2(column_spacing * 6, row_spacing * 3))
	set_pos("fiery", Vector2(column_spacing * 6, row_spacing * 4))
	
	
func formation_level_4():
	var column_spacing = 24
	var row_spacing = 20
	
	#Column 1
	set_pos("basic", Vector2(0, 0))
	set_pos("basic", Vector2(0, row_spacing))
	set_pos("fiery", Vector2(0, row_spacing * 2))
	set_pos("heavy", Vector2(0, row_spacing * 3))
	set_pos("basic", Vector2(0, row_spacing * 4))
	#Column 2
	set_pos("basic", Vector2(column_spacing, 0))
	set_pos("laser", Vector2(column_spacing, row_spacing))
	set_pos("fiery", Vector2(column_spacing, row_spacing * 2))
	set_pos("heavy", Vector2(column_spacing, row_spacing * 3))
	set_pos("basic", Vector2(column_spacing, row_spacing * 4))
	#Column 3
	set_pos("basic", Vector2(column_spacing * 2, 0))
	set_pos("laser", Vector2(column_spacing * 2, row_spacing))
	set_pos("heavy", Vector2(column_spacing * 2, row_spacing * 2))
	set_pos("basic", Vector2(column_spacing * 2, row_spacing * 3))
	set_pos("basic", Vector2(column_spacing * 2, row_spacing * 4))
	#Column 4
	set_pos("basic", Vector2(column_spacing * 3, 0))
	set_pos("laser", Vector2(column_spacing * 3, row_spacing))
	set_pos("heavy", Vector2(column_spacing * 3, row_spacing * 2))
	set_pos("basic", Vector2(column_spacing * 3, row_spacing * 3))
	set_pos("basic", Vector2(column_spacing * 3, row_spacing * 4))
	#Column 5
	set_pos("basic", Vector2(column_spacing * 4, 0))
	set_pos("laser", Vector2(column_spacing * 4, row_spacing))
	set_pos("heavy", Vector2(column_spacing * 4, row_spacing * 2))
	set_pos("basic", Vector2(column_spacing * 4, row_spacing * 3))
	set_pos("basic", Vector2(column_spacing * 4, row_spacing * 4))
	#Column 6
	set_pos("basic", Vector2(column_spacing * 5, 0))
	set_pos("laser", Vector2(column_spacing * 5, row_spacing))
	set_pos("fiery", Vector2(column_spacing * 5, row_spacing * 2))
	set_pos("heavy", Vector2(column_spacing * 5, row_spacing * 3))
	set_pos("basic", Vector2(column_spacing * 5, row_spacing * 4))
	#Column 7
	set_pos("basic", Vector2(column_spacing * 6, 0))
	set_pos("basic", Vector2(column_spacing * 6, row_spacing))
	set_pos("fiery", Vector2(column_spacing * 6, row_spacing * 2))
	set_pos("heavy", Vector2(column_spacing * 6, row_spacing * 3))
	set_pos("basic", Vector2(column_spacing * 6, row_spacing * 4))
	
	
func formation_level_5():
	var column_spacing = 24
	var row_spacing = 20
	
	#Column 1
	set_pos("basic", Vector2(0, 0))
	set_pos("basic", Vector2(0, row_spacing))
	set_pos("basic", Vector2(0, row_spacing * 2))
	set_pos("heavy", Vector2(0, row_spacing * 3))
	set_pos("heavy", Vector2(0, row_spacing * 4))
	#Column 2
	set_pos("basic", Vector2(column_spacing, 0))
	set_pos("basic", Vector2(column_spacing, row_spacing))
	set_pos("basic", Vector2(column_spacing, row_spacing * 2))
	set_pos("fiery", Vector2(column_spacing, row_spacing * 3))
	set_pos("heavy", Vector2(column_spacing, row_spacing * 4))
	#Column 3
	set_pos("basic", Vector2(column_spacing * 2, 0))
	set_pos("laser", Vector2(column_spacing * 2, row_spacing))
	set_pos("laser", Vector2(column_spacing * 2, row_spacing * 2))
	set_pos("fiery", Vector2(column_spacing * 2, row_spacing * 3))
	set_pos("heavy", Vector2(column_spacing * 2, row_spacing * 4))
	#Column 4
	set_pos("basic", Vector2(column_spacing * 3, 0))
	set_pos("laser", Vector2(column_spacing * 3, row_spacing))
	set_pos("laser", Vector2(column_spacing * 3, row_spacing * 2))
	set_pos("fiery", Vector2(column_spacing * 3, row_spacing * 3))
	set_pos("fiery", Vector2(column_spacing * 3, row_spacing * 4))
	#Column 5
	set_pos("basic", Vector2(column_spacing * 4, 0))
	set_pos("laser", Vector2(column_spacing * 4, row_spacing))
	set_pos("laser", Vector2(column_spacing * 4, row_spacing * 2))
	set_pos("fiery", Vector2(column_spacing * 4, row_spacing * 3))
	set_pos("heavy", Vector2(column_spacing * 4, row_spacing * 4))
	#Column 6
	set_pos("basic", Vector2(column_spacing * 5, 0))
	set_pos("basic", Vector2(column_spacing * 5, row_spacing))
	set_pos("basic", Vector2(column_spacing * 5, row_spacing * 2))
	set_pos("fiery", Vector2(column_spacing * 5, row_spacing * 3))
	set_pos("heavy", Vector2(column_spacing * 5, row_spacing * 4))
	#Column 7
	set_pos("basic", Vector2(column_spacing * 6, 0))
	set_pos("basic", Vector2(column_spacing * 6, row_spacing))
	set_pos("basic", Vector2(column_spacing * 6, row_spacing * 2))
	set_pos("heavy", Vector2(column_spacing * 6, row_spacing * 3))
	set_pos("heavy", Vector2(column_spacing * 6, row_spacing * 4))
	
	
func formation_level_6():
	var column_spacing = 24
	var row_spacing = 20
	
	#Column 1
	set_pos("basic", Vector2(0, 0))
	set_pos("basic", Vector2(0, row_spacing))
	set_pos("fiery", Vector2(0, row_spacing * 2))
	set_pos("basic", Vector2(0, row_spacing * 3))
	set_pos("basic", Vector2(0, row_spacing * 4))
	#Column 2
	set_pos("basic", Vector2(column_spacing, 0))
	set_pos("laser", Vector2(column_spacing, row_spacing))
	set_pos("fiery", Vector2(column_spacing, row_spacing * 2))
	set_pos("heavy", Vector2(column_spacing, row_spacing * 3))
	set_pos("basic", Vector2(column_spacing, row_spacing * 4))
	#Column 3
	set_pos("laser", Vector2(column_spacing * 2, 0))
	set_pos("laser", Vector2(column_spacing * 2, row_spacing))
	set_pos("fiery", Vector2(column_spacing * 2, row_spacing * 2))
	set_pos("heavy", Vector2(column_spacing * 2, row_spacing * 3))
	set_pos("heavy", Vector2(column_spacing * 2, row_spacing * 4))
	#Column 4
	set_pos("laser", Vector2(column_spacing * 3, 0))
	set_pos("laser", Vector2(column_spacing * 3, row_spacing))
	set_pos("fiery", Vector2(column_spacing * 3, row_spacing * 2))
	set_pos("heavy", Vector2(column_spacing * 3, row_spacing * 3))
	set_pos("heavy", Vector2(column_spacing * 3, row_spacing * 4))
	#Column 5
	set_pos("laser", Vector2(column_spacing * 4, 0))
	set_pos("laser", Vector2(column_spacing * 4, row_spacing))
	set_pos("fiery", Vector2(column_spacing * 4, row_spacing * 2))
	set_pos("heavy", Vector2(column_spacing * 4, row_spacing * 3))
	set_pos("heavy", Vector2(column_spacing * 4, row_spacing * 4))
	#Column 6
	set_pos("basic", Vector2(column_spacing * 5, 0))
	set_pos("laser", Vector2(column_spacing * 5, row_spacing))
	set_pos("fiery", Vector2(column_spacing * 5, row_spacing * 2))
	set_pos("heavy", Vector2(column_spacing * 5, row_spacing * 3))
	set_pos("basic", Vector2(column_spacing * 5, row_spacing * 4))
	#Column 7
	set_pos("basic", Vector2(column_spacing * 6, 0))
	set_pos("basic", Vector2(column_spacing * 6, row_spacing))
	set_pos("fiery", Vector2(column_spacing * 6, row_spacing * 2))
	set_pos("basic", Vector2(column_spacing * 6, row_spacing * 3))
	set_pos("basic", Vector2(column_spacing * 6, row_spacing * 4))
	
	
func formation_level_7():
	var column_spacing = 24
	var row_spacing = 20
	
	#Column 1
	set_pos("fiery", Vector2(0, 0))
	set_pos("basic", Vector2(0, row_spacing))
	set_pos("basic", Vector2(0, row_spacing * 2))
	set_pos("heavy", Vector2(0, row_spacing * 3))
	set_pos("fiery", Vector2(0, row_spacing * 4))
	#Column 2
	set_pos("fiery", Vector2(column_spacing, 0))
	set_pos("basic", Vector2(column_spacing, row_spacing))
	set_pos("laser", Vector2(column_spacing, row_spacing * 2))
	set_pos("heavy", Vector2(column_spacing, row_spacing * 3))
	set_pos("fiery", Vector2(column_spacing, row_spacing * 4))
	#Column 3
	set_pos("fiery", Vector2(column_spacing * 2, 0))
	set_pos("basic", Vector2(column_spacing * 2, row_spacing))
	set_pos("laser", Vector2(column_spacing * 2, row_spacing * 2))
	set_pos("heavy", Vector2(column_spacing * 2, row_spacing * 3))
	set_pos("fiery", Vector2(column_spacing * 2, row_spacing * 4))
	#Column 4
	set_pos("fiery", Vector2(column_spacing * 3, 0))
	set_pos("basic", Vector2(column_spacing * 3, row_spacing))
	set_pos("laser", Vector2(column_spacing * 3, row_spacing * 2))
	set_pos("heavy", Vector2(column_spacing * 3, row_spacing * 3))
	set_pos("fiery", Vector2(column_spacing * 3, row_spacing * 4))
	#Column 5
	set_pos("fiery", Vector2(column_spacing * 4, 0))
	set_pos("basic", Vector2(column_spacing * 4, row_spacing))
	set_pos("laser", Vector2(column_spacing * 4, row_spacing * 2))
	set_pos("heavy", Vector2(column_spacing * 4, row_spacing * 3))
	set_pos("fiery", Vector2(column_spacing * 4, row_spacing * 4))
	#Column 6
	set_pos("fiery", Vector2(column_spacing * 5, 0))
	set_pos("basic", Vector2(column_spacing * 5, row_spacing))
	set_pos("laser", Vector2(column_spacing * 5, row_spacing * 2))
	set_pos("heavy", Vector2(column_spacing * 5, row_spacing * 3))
	set_pos("fiery", Vector2(column_spacing * 5, row_spacing * 4))
	#Column 7
	set_pos("fiery", Vector2(column_spacing * 6, 0))
	set_pos("basic", Vector2(column_spacing * 6, row_spacing))
	set_pos("basic", Vector2(column_spacing * 6, row_spacing * 2))
	set_pos("heavy", Vector2(column_spacing * 6, row_spacing * 3))
	set_pos("fiery", Vector2(column_spacing * 6, row_spacing * 4))
	
	
func formation_level_8():
	var column_spacing = 24
	var row_spacing = 20
	
	#Column 1
	set_pos("basic", Vector2(0, 0))
	set_pos("fiery", Vector2(0, row_spacing))
	set_pos("laser", Vector2(0, row_spacing * 2))
	set_pos("heavy", Vector2(0, row_spacing * 3))
	set_pos("heavy", Vector2(0, row_spacing * 4))
	#Column 2
	set_pos("laser", Vector2(column_spacing, 0))
	set_pos("basic", Vector2(column_spacing, row_spacing))
	set_pos("fiery", Vector2(column_spacing, row_spacing * 2))
	set_pos("laser", Vector2(column_spacing, row_spacing * 3))
	set_pos("heavy", Vector2(column_spacing, row_spacing * 4))
	#Column 3
	set_pos("fiery", Vector2(column_spacing * 2, 0))
	set_pos("laser", Vector2(column_spacing * 2, row_spacing))
	set_pos("basic", Vector2(column_spacing * 2, row_spacing * 2))
	set_pos("fiery", Vector2(column_spacing * 2, row_spacing * 3))
	set_pos("laser", Vector2(column_spacing * 2, row_spacing * 4))
	#Column 4
	set_pos("fiery", Vector2(column_spacing * 3, 0))
	set_pos("fiery", Vector2(column_spacing * 3, row_spacing))
	set_pos("laser", Vector2(column_spacing * 3, row_spacing * 2))
	set_pos("basic", Vector2(column_spacing * 3, row_spacing * 3))
	set_pos("fiery", Vector2(column_spacing * 3, row_spacing * 4))
	#Column 5
	set_pos("fiery", Vector2(column_spacing * 4, 0))
	set_pos("laser", Vector2(column_spacing * 4, row_spacing))
	set_pos("basic", Vector2(column_spacing * 4, row_spacing * 2))
	set_pos("fiery", Vector2(column_spacing * 4, row_spacing * 3))
	set_pos("heavy", Vector2(column_spacing * 4, row_spacing * 4))
	#Column 6
	set_pos("laser", Vector2(column_spacing * 5, 0))
	set_pos("basic", Vector2(column_spacing * 5, row_spacing))
	set_pos("fiery", Vector2(column_spacing * 5, row_spacing * 2))
	set_pos("laser", Vector2(column_spacing * 5, row_spacing * 3))
	set_pos("heavy", Vector2(column_spacing * 5, row_spacing * 4))
	#Column 7
	set_pos("basic", Vector2(column_spacing * 6, 0))
	set_pos("fiery", Vector2(column_spacing * 6, row_spacing))
	set_pos("laser", Vector2(column_spacing * 6, row_spacing * 2))
	set_pos("heavy", Vector2(column_spacing * 6, row_spacing * 3))
	set_pos("heavy", Vector2(column_spacing * 6, row_spacing * 4))


func formation_level_9():
	var column_spacing = 24
	var row_spacing = 20
	
	#Column 1
	set_pos("laser", Vector2(0, 0))
	set_pos("fiery", Vector2(0, row_spacing))
	set_pos("heavy", Vector2(0, row_spacing * 2))
	set_pos("basic", Vector2(0, row_spacing * 3))
	set_pos("basic", Vector2(0, row_spacing * 4))
	#Column 2
	set_pos("laser", Vector2(column_spacing, 0))
	set_pos("fiery", Vector2(column_spacing, row_spacing))
	set_pos("heavy", Vector2(column_spacing, row_spacing * 2))
	set_pos("basic", Vector2(column_spacing, row_spacing * 3))
	set_pos("basic", Vector2(column_spacing, row_spacing * 4))
	#Column 3
	set_pos("laser", Vector2(column_spacing * 2, 0))
	set_pos("fiery", Vector2(column_spacing * 2, row_spacing))
	set_pos("fiery", Vector2(column_spacing * 2, row_spacing * 2))
	set_pos("heavy", Vector2(column_spacing * 2, row_spacing * 3))
	set_pos("heavy", Vector2(column_spacing * 2, row_spacing * 4))
	#Column 4
	set_pos("laser", Vector2(column_spacing * 3, 0))
	set_pos("fiery", Vector2(column_spacing * 3, row_spacing))
	set_pos("fiery", Vector2(column_spacing * 3, row_spacing * 2))
	set_pos("basic", Vector2(column_spacing * 3, row_spacing * 3))
	set_pos("basic", Vector2(column_spacing * 3, row_spacing * 4))
	#Column 5
	set_pos("laser", Vector2(column_spacing * 4, 0))
	set_pos("fiery", Vector2(column_spacing * 4, row_spacing))
	set_pos("fiery", Vector2(column_spacing * 4, row_spacing * 2))
	set_pos("heavy", Vector2(column_spacing * 4, row_spacing * 3))
	set_pos("heavy", Vector2(column_spacing * 4, row_spacing * 4))
	#Column 6
	set_pos("laser", Vector2(column_spacing * 5, 0))
	set_pos("fiery", Vector2(column_spacing * 5, row_spacing))
	set_pos("heavy", Vector2(column_spacing * 5, row_spacing * 2))
	set_pos("basic", Vector2(column_spacing * 5, row_spacing * 3))
	set_pos("basic", Vector2(column_spacing * 5, row_spacing * 4))
	#Column 7
	set_pos("laser", Vector2(column_spacing * 6, 0))
	set_pos("fiery", Vector2(column_spacing * 6, row_spacing))
	set_pos("heavy", Vector2(column_spacing * 6, row_spacing * 2))
	set_pos("basic", Vector2(column_spacing * 6, row_spacing * 3))
	set_pos("basic", Vector2(column_spacing * 6, row_spacing * 4))
	
	
func formation_level_10():
	var column_spacing = 24
	var row_spacing = 20
	
	#Column 1
	set_pos("laser", Vector2(0, 0))
	set_pos("fiery", Vector2(0, row_spacing))
	set_pos("basic", Vector2(0, row_spacing * 2))
	set_pos("heavy", Vector2(0, row_spacing * 3))
	set_pos("heavy", Vector2(0, row_spacing * 4))
	#Column 2
	set_pos("laser", Vector2(column_spacing, 0))
	set_pos("laser", Vector2(column_spacing, row_spacing))
	set_pos("fiery", Vector2(column_spacing, row_spacing * 2))
	set_pos("basic", Vector2(column_spacing, row_spacing * 3))
	set_pos("heavy", Vector2(column_spacing, row_spacing * 4))
	#Column 3
	set_pos("laser", Vector2(column_spacing * 2, 0))
	set_pos("laser", Vector2(column_spacing * 2, row_spacing))
	set_pos("fiery", Vector2(column_spacing * 2, row_spacing * 2))
	set_pos("basic", Vector2(column_spacing * 2, row_spacing * 3))
	set_pos("heavy", Vector2(column_spacing * 2, row_spacing * 4))
	#Column 4
	set_pos("laser", Vector2(column_spacing * 3, 0))
	set_pos("laser", Vector2(column_spacing * 3, row_spacing))
	set_pos("fiery", Vector2(column_spacing * 3, row_spacing * 2))
	set_pos("basic", Vector2(column_spacing * 3, row_spacing * 3))
	set_pos("heavy", Vector2(column_spacing * 3, row_spacing * 4))
	#Column 5
	set_pos("laser", Vector2(column_spacing * 4, 0))
	set_pos("laser", Vector2(column_spacing * 4, row_spacing))
	set_pos("fiery", Vector2(column_spacing * 4, row_spacing * 2))
	set_pos("basic", Vector2(column_spacing * 4, row_spacing * 3))
	set_pos("heavy", Vector2(column_spacing * 4, row_spacing * 4))
	#Column 6
	set_pos("laser", Vector2(column_spacing * 5, 0))
	set_pos("laser", Vector2(column_spacing * 5, row_spacing))
	set_pos("fiery", Vector2(column_spacing * 5, row_spacing * 2))
	set_pos("basic", Vector2(column_spacing * 5, row_spacing * 3))
	set_pos("heavy", Vector2(column_spacing * 5, row_spacing * 4))
	#Column 7
	set_pos("laser", Vector2(column_spacing * 6, 0))
	set_pos("fiery", Vector2(column_spacing * 6, row_spacing))
	set_pos("basic", Vector2(column_spacing * 6, row_spacing * 2))
	set_pos("heavy", Vector2(column_spacing * 6, row_spacing * 3))
	set_pos("heavy", Vector2(column_spacing * 6, row_spacing * 4))


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
			speed += 7
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
			baboso_basic_cadence()
	
	if $BulletPause.is_stopped() && $LaserPause.is_stopped():
		formation_can_move = true
		
		
func baboso_laser_shoot():
	var laser_babosos = get_tree().get_nodes_in_group("total_laser_babosos")
	var laser_babosos_unready = get_tree().get_nodes_in_group("no_ready_members")
	if laser_babosos.size() >= 1 and laser_babosos_unready.size() == 0:
		var next_shooting_baboso = laser_babosos[randi() % laser_babosos.size()]
		if $BabosoLaserCadence.is_stopped() && formation_getting_down == false:
			$LaserPause.start()
			formation_can_move = false
			next_shooting_baboso.baboso_shoot()
			baboso_laser_cadence()
			
	if $LaserPause.is_stopped() && $BulletPause.is_stopped():
		formation_can_move = true
			

func baboso_fiery_attack():
	var fiery_target = get_parent().get_node("Player").get_global_position()
	var fiery_babosos = get_tree().get_nodes_in_group("total_fiery_babosos")
	if fiery_babosos.size() >= 1:
		var next_attacking_fiery = fiery_babosos[randi() % fiery_babosos.size()]
		if $BabosoFieryCadence.is_stopped() && formation_getting_down == false:
			next_attacking_fiery.fiery_attack(fiery_target)
			baboso_fiery_cadence()


func baboso_chief_appear():
	var chief = Baboso_Chief.instance()
	var pos1 = Vector2 (-32, 12)
	var pos2 = Vector2 (352, 12)
	var pos_array = []
	pos_array.append(pos1)
	pos_array.append(pos2)
	if chief_appearances > 0:
		if $ChiefAppearance.is_stopped() and self.position.y >= 32:
			chief.position = pos_array[randi() % pos_array.size()]
			get_parent().add_child(chief)
			chief_appearance()
			chief_appearances -= 1
	else: pass
	

func on_game_over():
	is_game_over = true
	get_tree().call_group("total_babosos", "on_game_over")
	tween.interpolate_property(self, "position", self.position,
			self.position + Vector2(0, 200), 10,
			Tween.TRANS_LINEAR, Tween.EASE_IN)
	tween.start()
	yield(tween, "tween_completed")


func level_completed():
	if get_tree().get_nodes_in_group("total_babosos").size() == 0 \
			and get_tree().get_nodes_in_group("chief_baboso").size() == 0:
		get_tree().call_group("Main", "prepare_next_level")
		game_has_start = false
		

func _process(delta):
	if is_game_over == false and game_has_start == true:
		move_formation(delta)
		if_border_reached()
		baboso_basic_shoot()
		baboso_laser_shoot()
		baboso_fiery_attack()
		baboso_chief_appear()
		level_completed()
