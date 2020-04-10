extends Node2D

onready var tween = $Tween
export (PackedScene) var Baboso_Basic
export (PackedScene) var Baboso_shoot


const formation = Vector2 (6, 3)

var velocity = Vector2(1, 0)
var speed = 20


func _ready():
	position = Vector2 (24, 24)
	create_formation()
	$BabosoBasicCadence.start()


func create_formation():
	for y in range (formation.y):
		var babosoPos = Vector2(0, (y * 20))
		for x in range (formation.x):
			babosoPos.x = (x * 24)
			var baboso = Baboso_Basic.instance()
			baboso.position = babosoPos
			add_child(baboso)


func move_formation(delta):
	position += (velocity * speed) * delta


func if_border_reached():
	for baboso in get_tree().get_nodes_in_group("total_babosos"):
		if left_border_reached(baboso) or right_border_reached(baboso):
			get_down()
			velocity = -velocity
			break


func left_border_reached(baboso):
	if velocity.x < 0.0:
		if baboso.global_position.x < 20:
			return true
	return false
	
	
func right_border_reached(baboso):
	if velocity.x > 0.0:
		if baboso.global_position.x > 300:
			return true
	return false


func get_down():
	tween.interpolate_property(self, "position",
	position, position + Vector2(0, 16), 0.5,
	Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
	tween.start()


func baboso_basic_shoot():
	var basic_babosos = get_tree().get_nodes_in_group("total_babosos")
	if basic_babosos.size() >= 1:
		var next_shooting_baboso = basic_babosos[randi() % basic_babosos.size()]
		var shoot = Baboso_shoot.instance()
		if $BabosoBasicCadence.is_stopped():
			next_shooting_baboso.baboso_shoot()
			shoot.position = next_shooting_baboso.global_position
			get_parent().add_child(shoot)
			$BabosoBasicCadence.start()
		


func _process(delta):
	move_formation(delta)
	if_border_reached()
	baboso_basic_shoot()
