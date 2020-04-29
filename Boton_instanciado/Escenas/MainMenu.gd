extends TextureRect

func PlayButton():
	var error_code = get_tree().change_scene("res://Escenas/Player.tscn")
	if error_code !=0:
		print("ERROR: ", error_code)

func CreditsButton():
	print("Created by")

func QuitButton():
	get_tree().quit()
