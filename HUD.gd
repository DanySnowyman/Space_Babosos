extends CanvasLayer

var lives = 3
var score = 0
var combo = 0
var multiplier = 1
var last_defeated


func _ready():
	add_to_group("HUD")
	$Lives.text = "LIVES " + str(lives)
	$Score.text = "SCORE " + str(score)
	$Combo.text = "COMBO " + "x " + str(combo)
	

func substract_lives():
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
		multiplier += 0.2
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
		baboso_value = 500
	
	score += baboso_value * multiplier
	$Score.text = "SCORE " + str(score)
	$Combo.text = "COMBO " + "x " + str(combo)
