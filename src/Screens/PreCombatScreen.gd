extends Node2D

var dinosInMarket  = []
var dinosInReserve = []
var dinosInBattle  = []

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass


func _on_btn_roll_pressed():
	for dino in dinosInMarket:
		print (dino)
		pass
	
	pass


func _on_btn_sell_pressed():
	
	pass


func _on_btn_battle_pressed():
	var sceneCode = get_tree().change_scene("res://screens/CombatScreen.tscn")
	print ("Codigo troca de cena: ", sceneCode)
	pass
