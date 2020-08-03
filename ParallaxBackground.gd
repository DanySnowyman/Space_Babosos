extends ParallaxBackground

onready var tween = $Tween

var normal_speed = 0.1
var ending_speed = 1

func _ready():
	normal_speed = 0.1
	set_process(true)
	add_to_group("Parallax")


func _process(delta):
	self.scroll_offset.y += normal_speed
	$FrontLayer.motion_offset.y += normal_speed
#	self.scroll_offset.y += 0.1
#	$FrontLayer.motion_offset.y += 0.1
	$FrontLayer/AnimationPlayer.play("shinning stars")
	$BackLayer/AnimationPlayer.play("shinning stars")


func on_player_win():
	normal_speed = 2
#	self.scroll_offset.y += 1
#	$FrontLayer.motion_offset.y += 1


func fade_out():
	$FrontLayer/AnimationPlayer.stop()
	$BackLayer/AnimationPlayer.stop()
	tween.interpolate_property($FrontLayer/FrontStars, "modulate:a", 1, 0, 5/
			Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	tween.interpolate_property($BackLayer/BackStars, "modulate:a", 1, 0, 5/
			Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	tween.start()


func fade_in():
	tween.interpolate_property($FrontLayer/FrontStars, "modulate:a", 0, 1, 2/
			Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	tween.interpolate_property($BackLayer/BackStars, "modulate:a", 0, 1, 2/
			Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	tween.start()
	normal_speed = 0.1
	yield(get_tree().create_timer(5), "timeout")
	$FrontLayer/AnimationPlayer.play("shinning stars")
	$BackLayer/AnimationPlayer.play("shinning stars")
