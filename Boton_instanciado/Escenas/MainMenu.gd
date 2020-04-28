extends TextureRect

func _ready():
	pass # Replace with function body.

func PlayButton():
	get_tree().change_scene("res://Escenas/Player.tscn")

func CreditsButton():
	print("Created by Gauchito Games")

func QuitButton():
	get_tree().quit()
