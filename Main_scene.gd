extends Node2D

func _ready():
	add_to_group("Main")


func show_creator():
	pass
	
func show_title():
	pass
	
func show_hi_scores():
	pass

func start_new_game():
	pass
	
func game_over():
	$Titles/Label.show()
	yield(get_tree().create_timer(1), "timeout")
	$BabososFormation.on_game_over()
	
	
	
	

func _process(delta):
	pass
