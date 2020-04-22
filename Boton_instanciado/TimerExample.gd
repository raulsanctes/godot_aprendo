extends Node2D

var nueve = "Se ejecuta nueve"

signal my_signal(value, other_value)

func _ready():
	$Timer.connect("timeout", self, "_on_Timer_out")
	emit_signal("my_signal", true, 42)
	
func _nueve99():
	print(nueve)
	
func _on_Timer_out():
	$Sprite.visible = !$Sprite.visible
	_nueve99()
	
