extends ParallaxBackground

onready var tween = $Tween


func _ready():
	set_process(true)
	add_to_group("Parallax")


func _process(delta):
	self.scroll_offset.y += 0.1
	$FrontLayer.motion_offset.y += 0.1
	$FrontLayer/AnimationPlayer.play("shinning stars")
	$BackLayer/AnimationPlayer.play("shinning stars")


func on_player_win():
	self.scroll_offset.y += 1
	$FrontLayer.motion_offset.y += 1


func fade_out():
	tween.interpolate_property($FrontLayer/FrontStars, "modulate:a", 1, 0, 5/
			Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	tween.interpolate_property($BackLayer/BackStars, "modulate:a", 1, 0, 5/
			Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	tween.start()


func fade_in():
	tween.interpolate_property($FrontLayer/FrontStars, "modulate:a", 0, 1, 10/
			Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	tween.interpolate_property($BackLayer/BackStars, "modulate:a", 0, 1, 10/
			Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	tween.start()
