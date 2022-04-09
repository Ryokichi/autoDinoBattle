extends "res://dinos/_master.gd"


func _ready():
	$Sprite.position = Vector2(0, -84)
	$Area2D/CollisionShape2D.position = Vector2(0, -84)
	$Area2D/CollisionShape2D.shape.extents = Vector2(74, 92)
	pass


func set_my_name():
	my_name = 'dino_1'
	print (my_name)


