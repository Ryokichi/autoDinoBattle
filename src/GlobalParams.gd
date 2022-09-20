extends Node

const SQLite  = preload("res://addons/godot-sqlite/bin/gdsqlite.gdns")
const db_path = "res://dataStore/dinoBattleDB.db"

var db = null
var gameTurn = 0
var dino_selected = null
var slot_selected = null


func _ready():
	load_data_base()
	connect_signals()
	gameTurn = 0
	pass


func connect_signals():
	GlobalSignals.connect('dino_selected', self, 'set_dino_select')
	GlobalSignals.connect('dino_released', self, 'set_dino_released')
	GlobalSignals.connect('is_over_slot', self, 'set_slot_selected')
	pass

func is_dino_selected():
	return (dino_selected != null)
	pass


func get_dino_selected():
	return dino_selected
	pass

func _input(event):
	if(event is InputEventMouseButton):
		if (event.button_index == BUTTON_LEFT and  !event.pressed):
			check_for_dino_selected()
			pass
		pass
	pass


func _physics_process(delta):
	if (dino_selected != null):
		dino_selected.update_position(delta)
		pass
	pass


func check_for_dino_selected():
	if (dino_selected != null):
		set_dino_released()
		pass
	pass


func load_data_base():
	db = SQLite.new()
	db.path = db_path
	db.open_db()
	pass


func addTurn():
	gameTurn += 1
	pass


func getCurrentTurn():
	return gameTurn


func set_dino_select(dino):
	dino_selected = dino
	pass


func set_dino_released():
	dino_selected = null
	print ('soltei')
	pass
