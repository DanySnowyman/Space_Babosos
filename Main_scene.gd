extends Node2D


export (PackedScene) var CreatorScreen
export (PackedScene) var TitleScreen
export (PackedScene) var Player
export (PackedScene) var ScoreScreen

var waiting_for_start = false
var showing_score_screen = false
var level = 1

func _ready():
	var creator_screen = CreatorScreen.instance()
	add_to_group("Main")
#	add_child(creator_screen)
#	yield($CreatorScreen._ready(), "completed")
	show_title_screen()
	
	
func show_title_screen():
	var title_screen = TitleScreen.instance()
	add_child(title_screen)
	yield($TitleScreen._ready(), "completed")
	$DelayToScoreScreen.start()
	waiting_for_start = true
	
	
func _on_DelayToScoreScreen_timeout():
	show_score_screen()
	
	
func show_score_screen():
	var score_screen = ScoreScreen.instance()
	waiting_for_start = false
	showing_score_screen = true
	$TitleScreen.visible = false
	$HUD/HiScore.visible = false
	add_child(score_screen)
	yield($ScoreScreen._ready(), "completed")
	$TitleScreen.visible = true
	$HUD/HiScore.visible = true
	waiting_for_start = true
	showing_score_screen = false
	$DelayToScoreScreen.start()
	
	
func call_hi_score():
	$HUD.show_hi_score()


func start_new_game():
	var player = Player.instance()
	$DelayToScoreScreen.stop()
	waiting_for_start = false
	$HUD/HiScore.visible = false
	$TitleScreen.remove()
	yield($TitleScreen.remove(), "completed")
	level = 9
	$HUD.announce_level(level)
	yield($HUD.announce_level(level), "completed")
	$BabososFormation.game_start(level)
	$HUD.game_start()
	add_child(player)
	
	
func prepare_next_level():
	level += 1
	if level > 10:
		game_beated()
	else:
		$HUD.announce_level(level)
		yield($HUD.announce_level(level), "completed")
		$BabososFormation.game_start(level)
	
	
func game_over():
	yield(get_tree().create_timer(1), "timeout")
	$GameOverScreen/GameOverText.visible = true
	yield(get_tree().create_timer(1), "timeout")
	$BabososFormation.on_game_over()
	$Player.call_deferred("queue_free")
	
	get_tree().call_group("total_babosos", "on_game_over")
	yield($BabososFormation.on_game_over(), "completed")
	get_tree().call_group("total_babosos", "queue_free")
	$GameOverScreen/GameOverText.visible = false
	$HUD.on_game_over()
	show_title_screen()
	

func game_beated():
	yield(get_tree().create_timer(1), "timeout")
	$GameOverScreen/GameBeatedText.visible = true
	yield(get_tree().create_timer(5), "timeout")
	$GameOverScreen/GameBeatedText.visible = false
	$Player.queue_free()
	$HUD.on_game_over()
	show_title_screen()


func _process(delta):
	if waiting_for_start == true and Input.is_action_pressed("ui_accept"):
		start_new_game()
	
	if showing_score_screen == true and Input.is_action_pressed("ui_accept"):
		$ScoreScreen.queue_free()
		$TitleScreen.visible = true
		$HUD/HiScore.visible = true
		showing_score_screen = false
		yield(get_tree().create_timer(0.5), "timeout")
		waiting_for_start = true
		$DelayToScoreScreen.start()


