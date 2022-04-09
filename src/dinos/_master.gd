extends Node2D

var is_selected = false
var sprite_tex
var my_name = 't-rex'


func _ready():
	set_my_name()
	set_sprite_texture()
	pass


func set_my_name():
	print ("sobrescrever funcao set_name")
	pass

func set_sprite_texture():
	var sprite_path = "res://sprites/Dinossauros/"+my_name+".png"
	$Sprite.texture = load(sprite_path)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _physics_process(delta):
	if(is_selected):
		global_position = lerp(global_position, get_global_mouse_position(), 25*delta)
		pass
	pass

func _on_Area2D_input_event(viewport, event, shape_idx):
	if(Input.is_action_just_pressed("ui_left_click")):
		is_selected = true
		$AtqLife.visible = false
		pass
	pass

func _input(event):
	if(event is InputEventMouseButton):
		if (event.button_index == BUTTON_LEFT and  !event.pressed):
			is_selected = false
			$AtqLife.visible = true
			pass
		
	pass
func beforeAttack():
	pass
func onBirth():
	pass
func onDeath():
	pass
func onAttack():
	pass
func onEnemyDeath():
	pass
func onHit():
	pass
func onKill():
	pass
func onPowerUp():
	pass
func onSell():
	pass
func onTurnEnd():
	pass
func onTurnStart():
	pass



