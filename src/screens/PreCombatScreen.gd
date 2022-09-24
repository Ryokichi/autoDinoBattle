extends Node2D

var db
var dinosInMarket  = []
var dinosInReserve = []
var dinosInBattle  = []

var numOfDinosInMarket = 4;
var currentLevel = 0;
var dinoTableName = "dinos";

var moneyPerTurn = 10;
var currentMoney = 0;


# Called when the node enters the scene tree for the first time.
func _ready():
	db = GlobalParams.db
	GlobalParams.addTurn()
	$Background/turn.text = "Turno:" + str(GlobalParams.gameTurn)
	pass

func onTurnStart():
	self.currentMoney = self.moneyPerTurn
	
	self.interactWithTeam('onTurnStart')
	
	pass

func _on_btn_roll_pressed():
	for dino in dinosInMarket:
		print ("_on_btn_roll_pressed: ", dino.queue_free())
		pass
	
	dinosInMarket.clear()
	
	for n in range(0, numOfDinosInMarket):
		randomize()
		var rand = stepify(rand_range(0, 100), 1) #Aqui ele só faz um random de 0 a 99(incluso) e força o valor a base inteira(remove qqr coisa pos 1.xxx)
		var randomizedRarity = self.getRandomizedRarityForDino(rand);
		
		var possibilities = db.query("select * from " + self.dinoTableName + " WHERE rarity = " + randomizedRarity + ";").query_result
		
		randomize()
		rand = stepify(rand_range(0, possibilities.length), 1) #Novamente só gera um random, mas agora de 0 até os valores possiveis de dino no lvl selecionado
		var dino = self.addDinoToMarket(possibilities[rand])
		var slot = str2var('$slot_market_0' + n as String)
		dino.slot = slot;
		dino.set_global_position(slot.get_global_position())
		pass
	
	#Caso você adicione alguma interação de ao jogador dar reroll
	#self.interactWithTeam('onReroll')
	
#	for i in range(0, db.query_result.size()):
#		print (db.query_result[i])
#
#		pass
	pass

func getRandomizedRarityForDino(randValue):
	var chancesOptions = db.query("select " + "LevelDoJogador" + " from chancesPerLevel;").query_result;#modifica o tablename pra alguma que você crie. 
	# Formato da tabela sugerido
	# id | lvl1 | lvl2 | lvl3 | lvl4 | lvl5
	# 0  | 100  |  0   |   0  |  0   |  0
	# 1  | 70   |  30  |   0  |  0   |  0
	# 2  | 30   |  40  |   30 |  0   |  0
	# 3  | 20   |  20  |   30 |  30  |  0
	# 4  | 10   |  15  |   25 |  20  |  30
	# É uma sugestão. É possivel ter mais do que isso caso queira que não seja atrelado ao lvl atual do jogador as chances.
	
	var cumulativeValue = 0
	for n in range(0, chancesOptions.length, 1):
		cumulativeValue += chancesOptions[n]
		if (cumulativeValue < randValue):
			return n

func _on_btn_sell_pressed(): #Sugiro não ser um botão e sim uma area de colisão apenas. Ao dropar um dino aqui ele deletar aquele dino e dar dinheiro a você
	
	pass

func onDinoSell(dino):
	var slot = dino.slot;
	slot.isEmpty = true;
	
	self.interactWithTeam('onDinoSold', dino);
	
	var money = dino.moneyValue;
	self.currentMoney += money;
	
	#não sei tirar ainda dino do parent e remover do grupo que ta mostrando na tela.
	pass

func _on_btn_battle_pressed():
	self.interactWithTeam('beforeBattleStart');
	var sceneCode = get_tree().change_scene("res://screens/CombatScreen.tscn")
	print ("Codigo troca de cena: ", sceneCode)
	pass


func addDinoToMarket(dinoInfo):
	
	print(" addDinosToMarket: res://dinos/"+dinoInfo.name+".tscn")
	var dino = load("res://dinos/"+dinoInfo.name+".tscn").instance()
	#
	#dino.hp = dinoInfo.hp #adicionar aqui tudo que seria pra instanciar os stats dos dinos
	#
	dinosInMarket.append(dino)
	
	add_child(dino)
	return dino
	pass

func interactWithTeam(funcToCall, caller = null):
	for dino in dinosInBattle:
		dino.call(funcToCall, dinosInBattle, caller)
	pass
