extends ParallaxBackground



func _ready():
	set_process(true)


func _process(delta):
	self.scroll_offset.y += 0.1
	$FrontLayer.motion_offset.y += 0.1
	$FrontLayer/AnimationPlayer.play("shinning stars")
	$BackLayer/AnimationPlayer.play("shinning stars")
