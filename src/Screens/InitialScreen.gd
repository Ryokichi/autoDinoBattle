extends Node2D

const SQLite = preload("res://addons/godot-sqlite/bin/gdsqlite.gdns")
var db
var db_path = "res://dataStore/dinoBattleDB.db"


# Called when the node enters the scene tree for the first time.
func _ready():
	db = SQLite.new()
	db.path = db_path
#	commitDataToDB()
#	readFromDB()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_btn_novo_jogo_pressed():
	var sceneCode = get_tree().change_scene("res://screens/PreCombatScreen.tscn")
	print ("Codigo troca de cena: ", sceneCode)
	pass


func commitDataToDB():
	db.open_db()
	var tableName = "dinos"
	var dict : Dictionary = Dictionary()
	dict["name"] = "fadsfasdfasd"
	dict['rarity'] = 1
	db.insert_row(tableName, dict)
	pass
	
func readFromDB():
	db.open_db()
	var tableName = "dinos"
	db.query("select * from "+tableName+";")
	for i in range(0, db.query_result.size()):
		print (db.query_result[i])
		pass
	
	pass
