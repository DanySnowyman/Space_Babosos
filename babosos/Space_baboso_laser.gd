extends Area2D

signal Baboso_laser_defeated

var timer = 0
var timer_enabled = false
var shooting_frame_lenght = 0.5 


func _ready():
	$BabosoShooting.visible = false
	add_to_group("total_babosos")
	add_to_group("total_laser_babosos")
	$AnimationPlayer.play("Idle")


func _on_Baboso_get_hit_by_Player_laser(area_id, area, area_shape, self_shape):
	emit_signal("Baboso_laser_defeated")
	$AnimationPlayer.play("death")
	$HurtSound.play()
		

func baboso_shoot():
	print("Baboso laser works")
	$BabosoShooting.visible = true
	$Sprite.visible = false
	$ShootSound.play()
	timer_enabled = true
	

func _process(delta):
	if timer_enabled == true:
		timer += delta
		
		if timer >= shooting_frame_lenght:
			$BabosoShooting.visible = false
			$Sprite.visible = true
			timer_enabled = false
			timer = 0
