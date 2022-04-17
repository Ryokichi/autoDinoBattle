extends Node2D

var is_selected = false
var sprite_tex
var my_name = 't-rex'


func _ready():
	set_my_name()
	set_sprite_texture()
	pass

func _input(event):
	if(event is InputEventMouseButton):
		if (event.button_index == BUTTON_LEFT and  !event.pressed):
			is_selected = false
			$AtqLife.visible = true
			pass
		
	pass


func _on_Area2D_input_event(viewport, event, shape_idx):
	if(Input.is_action_just_pressed("ui_left_click")):
		GlobalSignals.emit_signal("dino_selected", self)
		set_AtqLife_visibility(false)
		pass
	pass


func _physics_process(delta):
	pass


func set_AtqLife_visibility(visibility):
	$AtqLife.visible = visibility
	pass


func set_my_name():
	print ("sobrescrever funcao set_name")
	pass


func set_sprite_texture():
	var sprite_path = "res://sprites/Dinossauros/"+my_name+".png"
	$Sprite.texture = load(sprite_path)
	pass


func update_position(delta):
	global_position = lerp(global_position, get_global_mouse_position(), 25*delta)
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
