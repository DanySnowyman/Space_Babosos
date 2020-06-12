extends Node2D

func _ready():
	yield(get_tree().create_timer(0.5), "timeout")
	$CharactersScreen/MeetTheCharsTitle.visible = true
	yield(get_tree().create_timer(1), "timeout")
	$CharactersScreen/BasicRow.visible = true
	yield(get_tree().create_timer(0.5), "timeout")
	$CharactersScreen/LaserRow.visible = true
	yield(get_tree().create_timer(0.5), "timeout")
	$CharactersScreen/FieryRow.visible = true
	yield(get_tree().create_timer(0.5), "timeout")
	$CharactersScreen/HeavyRow.visible = true
	yield(get_tree().create_timer(0.5), "timeout")
	$CharactersScreen/ChiefRow.visible = true
	yield(get_tree().create_timer(0.5), "timeout")
	$CharactersScreen/PlayerRow.visible = true
	yield(get_tree().create_timer(5), "timeout")
	$CharactersScreen.visible = false
	
	yield(get_tree().create_timer(0.5), "timeout")
	$HowToPlayScreen.visible = true
	$HowToPlayScreen/HowToPlayTitle.visible = true
	yield(get_tree().create_timer(2), "timeout")
	$HowToPlayScreen/HowToPlay1.visible = true
	yield(get_tree().create_timer(2), "timeout")
	$HowToPlayScreen/HowToPlay2.visible = true
	yield(get_tree().create_timer(2), "timeout")
	$HowToPlayScreen/HowToPlay3.visible = true
	yield(get_tree().create_timer(2), "timeout")
	$HowToPlayScreen/HowToPlay4.visible = true
	yield(get_tree().create_timer(10), "timeout")
	
	queue_free()
	
	
	
	
