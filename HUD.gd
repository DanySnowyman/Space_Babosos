extends CanvasLayer

var lives = 3
var score = 0
var hi_score = 5000
var combo = 0
var multiplier = 1
var last_defeated
var hi_score_beated = false

func show_hi_score():
	$HiScore.visible = true
	$HiScore.text = "HI-SCORE " + str(hi_score)
	
	
func game_start():
	add_to_group("HUD")
	lives = 3
	score = 0
	combo = 0
	multiplier = 1
	last_defeated = null
	hi_score_beated = false
	$Lives.visible = true
	$Score.visible = true
	$Combo.visible = true
	$Lives.text = "LIVES " + str(lives)
	$Score.text = "SCORE " + str(score)
	$Combo.text = "COMBO " + "x " + str(combo)
	

func announce_level(level):
	combo = 0
	multiplier = 1
	$Combo.text = "COMBO " + "x " + str(combo)
	$Combo.add_color_override("font_color", Color(1, 1, 1))
	$LevelSign.text = "LEVEL " + str(level)
	$LevelSign.visible = true
	yield(get_tree().create_timer(2), "timeout")
	$LevelSign.visible = false


func substract_lives():
	yield(get_tree().create_timer(0.2), "timeout")
	if lives > 0:
		lives -= 1
		combo = 0
		$Combo.text = "COMBO " + "x " + str(combo)
		$Combo.add_color_override("font_color", Color(1, 1, 1))
		last_defeated = null
		$Lives.text = "LIVES " + str(lives)
		get_tree().call_group("Player", "player_reset")
	else:
		get_tree().call_group("Main", "game_over")
	
	
	
func add_score(baboso_type):
	var baboso_value
	
	if baboso_type == "CHIEF":
		pass
	elif last_defeated == baboso_type:
		combo += 1
		multiplier += 0.5
	else:
		combo = 0
	
	if baboso_type == "BASIC":
		baboso_value = 50
		$Combo.add_color_override("font_color", Color(0.07, 0.89, 0))
		last_defeated = baboso_type
	elif baboso_type == "LASER":
		baboso_value = 100
		$Combo.add_color_override("font_color", Color(0, 0.53, 1))
		last_defeated = baboso_type
	elif baboso_type == "FIERY":
		baboso_value = 150
		$Combo.add_color_override("font_color", Color(1, 0, 0))
		last_defeated = baboso_type
	elif baboso_type == "HEAVY":
		baboso_value = 200
		$Combo.add_color_override("font_color", Color(1, 0.47, 0))
		last_defeated = baboso_type
	elif baboso_type == "CHIEF":
		baboso_value = 2000
	
	score += baboso_value * multiplier
	$Combo.text = "COMBO " + "x " + str(combo)
	if hi_score_beated == false:
		$Score.text = "SCORE " + str(score)
	else: $Score.text = "SCORE! " + str(score)


func flashing_score():
	for n in range(10):
		$Score.add_color_override("font_color", Color(1, 1, 0))
		yield(get_tree().create_timer(0.2), "timeout")
		$Score.add_color_override("font_color", Color(1, 0, 0))
		yield(get_tree().create_timer(0.2), "timeout")
	$Score.add_color_override("font_color", Color(1, 1, 1))
	$Score.text = "SCORE! " + str(score)


func on_game_over():
	$Score.visible = false
	$Lives.visible = false
	$Combo.visible = false
	if hi_score_beated == true:
		hi_score = score

func _physics_process(delta):
	if score > hi_score and hi_score_beated == false:
		flashing_score()
		hi_score_beated = true
		
