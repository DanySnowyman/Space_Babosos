extends Node2D

func _ready():
	pass


func start_engine():
	$AnimationPlayer.play("Engine Start")
#
#
func engine_ready():
	$AnimationPlayer.play("Engine Ready")
