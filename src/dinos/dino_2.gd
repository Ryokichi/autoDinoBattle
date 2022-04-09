extends "res://dinos/_master.gd"


func _ready():
	$Sprite.position = Vector2(0, -57)
	$Area2D/CollisionShape2D.position = Vector2(0, -57)
	$Area2D/CollisionShape2D.shape.extents = Vector2(72, 10600)
	pass


func set_my_name():
	my_name = 'dino_2'
	print (my_name)
	pass
