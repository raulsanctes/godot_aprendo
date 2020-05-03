# Las marcas de tabulación me indican si estoy trabajando dentro o fuera de un bloque de función
# Declaramos que todo lo que hagamos de código, puede afectar a este nodo y sus hijos
extends Node2D
# En esta zona podemos declarar variables y constantes globales
export var speed = 200
var screen_size
const upLeft = Vector2(-1,-1)
const upRight = Vector2(1,-1)
const downLeft = Vector2(-1,1)
const downRight = Vector2(1,1)

# Llamamos a la función _ready(), dentro de ella lo que hacemos es decir que todo
# lo que contenga se ejecutará una vez.
func _ready():
# Aquí en la variable screen_size cargamos la función get_viewport_rect() con la propiedad size para que nos devuelva
# el tamaño en X e Y de nuestra pantalla de juego.
	screen_size = get_viewport_rect().size
	position.x = screen_size.x/2
	position.y = screen_size.y/2
	$Img.playing = false
# Aquí con _process(), declaramos que todo lo que está dentro se ejecutará ciclicamente a la vez que con el booleano delta
# le decimos a la función que lo haga a la velocidad de renderizado del último frame, de esta manera mantenemos una
# velocidad constante de jugabilidad.

func load_menu_scene():
		var cancel
		cancel = get_tree().change_scene("res://Escenas/MainMenu.tscn")
		if cancel != 0:
			print(cancel)

func _process(delta):
	move(delta)

func move(delta):
	#	Vector2() con esta clase construimos dentro de la variable velocity un vector x.y
	var velocity = Vector2(0,0)
	
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
		$Img.animation = "Right"
		$Img.flip_h = false
		$lab_velo.text = "RIGHT"
		$lab_velo/lab_velocidad.text = str(velocity.x," ", velocity.y)
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		$Img.animation = "Right"
		$Img.flip_h = true
		$lab_velo.text = "LEFT"
		$lab_velo/lab_velocidad.text = str(velocity.x," ", velocity.y)
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
		$Img.animation = "Down"
		$lab_velo.text = "DOWN"
		$lab_velo/lab_velocidad.text = str(velocity.x," ", velocity.y)
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
		$Img.animation = "Up"
		$lab_velo.text = "UP"
		$lab_velo/lab_velocidad.text = str(velocity.x," ", velocity.y)
	if velocity == downRight:
		$lab_velo.text = "RIGHT DOWN"
		$lab_velo/lab_velocidad.text = str(velocity.x," ", velocity.y)
	if velocity == downLeft:
		$lab_velo.text = "LEFT DOWN"
		$lab_velo/lab_velocidad.text = str(velocity.x," ", velocity.y)
	if velocity == upLeft:
		$lab_velo.text = "LEFT UP"
		$lab_velo/lab_velocidad.text = str(velocity.x," ", velocity.y)
	if velocity == upRight:
		$lab_velo.text = "RIGHT UP"
		$lab_velo/lab_velocidad.text = str(velocity.x," ", velocity.y)

	if Input.is_action_pressed("ui_cancel"):
		load_menu_scene()
	if velocity.length() > 0:
		
		print(velocity)
		$Img.playing = true
#		Normalizamos velocity para que el valor sea entero y multiplicamos por speed para que sea la velocidad constante.
		velocity = velocity.normalized() * speed
#		Cargamos a position el resultado de velocity * delta, el cual nos sirve para que la velocidad sea constante en cualquier velocidad de fotogramas.
		position += velocity * delta
#		Con clamp hacemos que el player no pueda superar los límites en sus ejes x o y, sea por debajo de 0 o por encima de screen_zise en sus respectivos ejes x.y, si no supera esos límites entonces el valor de positión.x o .y será el actual del player
		position.x = clamp(position.x, 0, screen_size.x)
		position.y = clamp(position.y, 0, screen_size.y)
	else:
		$lab_velo.text = "IDLE"
		$Img.frame = 0
		$Img.playing = false

func estados():
	pass
