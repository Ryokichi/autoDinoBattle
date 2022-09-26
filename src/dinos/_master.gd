extends Node2D

var is_selected = false
var sprite_tex
var my_name = 't-rex'
var aux_sprite = null
var slot

var currentExp = 0
var currentLevel = 1

var currentAttack = 5 # Valor atual, base + bonus
var baseAttack = 5 # base que vai resetar sempre que voltar pra preparation layer
var bonusAttack = 0 # o bonus que o atk tem no momento (o valor sempre será temporario)
var currentLife = 5
var baseLife = 5
var bonusLife = 0 

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
	
	#temporario, alterar pra ao criar passar esses atributos
	self.updateAttributes()
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

func setAttack(value):
	self.baseAttack = value
	pass

func setLife(value):
	self.baseLife = value
	pass

func addAttack(value, isTemporary):
	if(isTemporary):
		self.bonusAttack += value
	else:
		self.baseAttack += value		
	pass

func addLife(value, isTemporary):
	if(isTemporary):
		self.bonusLife += value
	else:
		self.baseLife += value		
	
	self.updateAttributes()
	pass

func updateAttributes():
	self.currentAttack = self.bonusAttack + self.baseAttack
	self.currentLife = self.bonusLife + self.baseLife
	
	if(self.currentAttack < 0):
		self.currentAttack = 0
	if(self.currentLife <= 0):
		self.destroy()
	print(self.currentAttack)
	var stats = $AtqLife
	stats.get_node("AtqValue")
	stats.get_node("AtqValue").set_text(self.currentAttack as String)
	stats.get_node("LifeValue").set_text(self.currentLife as String)
	pass

func destroy():
	self.currentLife = 0
	#chamado quando o bixo ficar com a vida menor ou igual a 0
	#Ele será removido da layer atual, caso for de combate na proxima preparação ele volta, se for durante a preparação ele eh removido do time
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

func consume(dino):
	var atk = floor(dino.currentAttack / 2)
	var life = floor(dino.currentLife / 2)
	self.addAttack(atk, false)
	self.addLife(life, false)
	pass

func getConsumed():
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
