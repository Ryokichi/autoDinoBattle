extends Area2D

var child_dino = null


func _ready():
	$SelectionSprite.visible = true
	pass

func set_child_dino(dino):
	child_dino = dino
	pass
