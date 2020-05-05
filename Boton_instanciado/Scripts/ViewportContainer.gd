extends ViewportContainer

var sizeCanvas = Vector2(ProjectSettings.get_setting("display/window/size/width"), ProjectSettings.get_setting(("display/window/size/height")))
var promesas = load("res://Escenas/Instancias/Promesas/Promesa.tscn")
var nombrePromesa

func _ready():
	promesasNuevasNivel(sizeCanvas.x, sizeCanvas.y)
	var counter = get_child_count()
	print("INSTANCIAS HIJOS: ", counter)
	print("Resolución de ventana es: ", sizeCanvas)
	print(nombrePromesa)

func _process(delta):
	pass

func promesasNuevasNivel(promx, promy):
	var promesaNueva = promesas.instance()
	add_child(promesaNueva)
	randomize()
	promx = randi()%int(promx)
	promy = randi()%int(promy)
	promesaNueva.set_global_position(Vector2(promx,promy))
	print("Valor X: ", promx," ", "Valor Y: ", promy)
	print("Cargado PROMESANUEVA")
