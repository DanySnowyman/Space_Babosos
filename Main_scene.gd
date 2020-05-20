extends Node2D

var waiting_for_start = false
var level = 1

func _ready():
	add_to_group("Main")
	$TitleScreen.show_title_screen()
	yield(get_tree().create_timer(5), "timeout")
	waiting_for_start = true
	

func show_creator():
	pass
	
func show_title():
	pass
	
func show_hi_scores():
	pass

func start_new_game():
	waiting_for_start = false
	$TitleScreen.visible = false
	level = 1
	$HUD.announce_level(level)
	yield($HUD.announce_level(level), "completed")
	$BabososFormation.game_start(level)
	$HUD.game_start()
	$Player.game_start()
	
	
func prepare_next_level():
	level += 1
	$HUD.announce_level(level)
	yield($HUD.announce_level(level), "completed")
	$BabososFormation.game_start(level)
	
	
func game_over():
	$GameOverScreen.show_game_over()
	yield(get_tree().create_timer(1), "timeout")
	$BabososFormation.on_game_over()
	$Player/CollisionShape2D.disabled = true
	get_tree().call_group("total_babosos", "on_game_over")
	

func _process(delta):
	if waiting_for_start == true and Input.is_action_pressed("ui_accept"):
		start_new_game()
	
