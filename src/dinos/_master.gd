extends Node2D

var is_selected = false
var sprite_tex
var my_name = 't-rex'
var aux_sprite = null


func _ready():
	set_my_name()
	set_sprite_texture()
	pass

func _input(event):
	if(event is InputEventMouseButton):
		if (event.button_index == BUTTON_LEFT and  !event.pressed):
			set_Initial_Param()
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

func set_Initial_Param():
	is_selected = false
	$AtqLife.visible = true
	aux_sprite.position = $Sprite.position
	pass
func set_AtqLife_visibility(visibility):
	if (visibility):
		$Sprite.modulate = Color(1,1,1)
#		$AtqLife.visible = visibility
	else:
		$Sprite.modulate = Color(0,0,0)
		pass
	pass


func set_my_name():
	print ("sobrescrever funcao set_name")
	pass


func set_sprite_texture():
	var sprite_path = "res://sprites/Dinossauros/"+my_name+".png"
	$Sprite.texture = load(sprite_path)
	aux_sprite = $Sprite.duplicate(1)
	add_child(aux_sprite)
	pass


func update_position(delta):
	aux_sprite.global_position = lerp(aux_sprite.global_position, get_global_mouse_position(), 25*delta)
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
