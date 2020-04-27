# Las marcas de tabulación me indican si estoy trabajando dentro o fuera de un bloque de función
# Declaramos que todo lo que hagamos de código, puede afectar a este nodo y sus hijos
extends Node2D
# En esta zona podemos declarar variables y constantes globales
export var speed = 200
var screen_size
# Llamamos a la función _ready(), dentro de ella lo que hacemos es decir que todo
# lo que contenga se ejecutará una vez.
func _ready():
# Aquí en la variable screen_size cargamos la función get_viewport_rect() con la propiedad size para que nos devuelva
# el tamaño en X e Y de nuestra pantalla de juego.
	screen_size = get_viewport_rect().size
# Aquí con _process(), declaramos que todo lo que está dentro se ejecutará ciclicamente a la vez que con el booleano delta
# le decimos a la función que lo haga a la velocidad de renderizado del último frame, de esta manera mantenemos una
# velocidad constante de jugabilidad.

func _process(delta):
	move(delta)

func move(delta):
	#	Vector2() con esta clase construimos dentro de la variable velocity un vector x.y
	var velocity = Vector2()

	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
		$Img.animation = "Right"
		$Img.flip_h = false
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		$Img.animation = "Right"
		$Img.flip_h = true
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
		$Img.animation = "Down"
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
		$Img.animation = "Up"
	if Input.is_action_pressed("Speed_up"):
		speed +=100
	if velocity.length() > 0:
#		Normalizamos velocity para que el valor sea entero y multiplicamos por speed para que sea la velocidad constante.
		velocity = velocity.normalized() * speed
#		Cargamos a position el resultado de velocity * delta, el cual nos sirve para que la velocidad sea constante en cualquier
#		velocidad de fotogramas.
		position += velocity * delta 
#		Con clamp hacemos que el player no pueda superar los límites en sus ejes x o y, sea por debajo de 0 o por encima de
#		screen_zise en sus respectivos ejes x.y, si no supera esos límites entonces el valor de positión.x o .y será el actual
#		del player
		position.x = clamp(position.x, 0, screen_size.x)
		position.y = clamp(position.y, 0, screen_size.y)
