extends Node2D

var waiting_for_start = false
var level = 1

func _ready():
	add_to_group("Main")
	$CreatorScreen.show_creator_screen()
	yield($CreatorScreen.show_creator_screen(), "completed")
	$TitleScreen.show_title_screen()
	

func call_hi_score():
	$HUD.show_hi_score()


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
	yield(get_tree().create_timer(1), "timeout")
	$GameOverScreen.show_game_over()
	yield(get_tree().create_timer(1), "timeout")
	$BabososFormation.on_game_over()
	$Player/CollisionShape2D.disabled = true
	get_tree().call_group("total_babosos", "on_game_over")
	yield($BabososFormation.on_game_over(), "completed")
	get_tree().call_group("total_babosos", "queue_free")
	$GameOverScreen/GameOverText.visible = false
	$HUD.on_game_over()
	$TitleScreen.show_title_screen()
	$TitleScreen.visible = true
	
	

func _process(delta):
	if $TitleScreen.show_press_fire == true and Input.is_action_pressed("ui_accept"):
		start_new_game()
		$TitleScreen/StartPressedSound.play()
		$TitleScreen.show_press_fire = false
	
