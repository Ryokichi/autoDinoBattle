extends Area2D

var child_dino = null
var is_over_me = false


func _ready():
	$SelectionSprite.visible = false
	pass

func set_child_dino(dino):
	child_dino = dino
	pass


func get_child_dino():
	return child_dino
	pass


func _on_Slot_mouse_entered():
	if (GlobalParams.is_dino_selected()):
		$SelectionSprite.visible = true
		self.is_over_me = true
		print(self.global_position)
		pass
	pass


func _on_Slot_mouse_exited():
	$SelectionSprite.visible = false
	self.is_over_me = false
	pass

