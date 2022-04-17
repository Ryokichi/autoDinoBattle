extends Node2D

var db
var dinosInMarket  = []
var dinosInReserve = []
var dinosInBattle  = []


# Called when the node enters the scene tree for the first time.
func _ready():
	db = GlobalParams.db
	GlobalParams.addTurn()
	$Background/turn.text = str(GlobalParams.gameTurn)
	pass


func _on_btn_roll_pressed():
	for dino in dinosInMarket:
		print (dino.queue_free())
		pass
	dinosInMarket.clear()
	
	var tableName = "dinos"
	db.query("select * from " + tableName + ";")
#	for i in range(0, db.query_result.size()):
#		print (db.query_result[i])
#
#		pass
	addDinosToMarket(db.query_result)
	pass

func _on_btn_sell_pressed():
	
	pass


func _on_btn_battle_pressed():
	var sceneCode = get_tree().change_scene("res://screens/CombatScreen.tscn")
	print ("Codigo troca de cena: ", sceneCode)
	pass


func addDinosToMarket(list):
	var dinos = [] + list
	dinos.shuffle()
	
	print("res://dinos/"+dinos[0].name+".tscn")
	print("res://dinos/"+dinos[1].name+".tscn")
	print("res://dinos/"+dinos[2].name+".tscn")
	print("res://dinos/"+dinos[3].name+".tscn")
	
	
	dinosInMarket.append(load("res://dinos/"+dinos[0].name+".tscn").instance())
	dinosInMarket.append(load("res://dinos/"+dinos[1].name+".tscn").instance())
	dinosInMarket.append(load("res://dinos/"+dinos[2].name+".tscn").instance())
	dinosInMarket.append(load("res://dinos/"+dinos[3].name+".tscn").instance())
	
	for dino in dinosInMarket:
		add_child(dino)
		pass
	
	dinosInMarket[0].set_global_position($slot_market_00.get_global_position())
	dinosInMarket[1].set_global_position($slot_market_01.get_global_position())
	dinosInMarket[2].set_global_position($slot_market_02.get_global_position())
	dinosInMarket[3].set_global_position($slot_market_03.get_global_position())
	pass
