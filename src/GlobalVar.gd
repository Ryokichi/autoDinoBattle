extends Node

const SQLite  = preload("res://addons/godot-sqlite/bin/gdsqlite.gdns")
const db_path = "res://dataStore/dinoBattleDB.db"
var db
var gameTurn


func _ready():
	db = SQLite.new()
	db.path = db_path
	db.open_db()
	
	gameTurn = 0
	pass

func addTurn():
	gameTurn += 1
	pass

func getCurrentTurn():
	return gameTurn
	pass
