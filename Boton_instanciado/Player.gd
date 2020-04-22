# Las marcas de tabulación me indican si estoy trabajando dentro o fuera de un bloque de función
# Declaramos que todo lo que hagamos de código, puede afectar a este nodo y sus hijos
extends Node2D

# En esta zona podemos declarar variables y constantes globales

export var speed = 400
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
	var velocity = Vector2()	

	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_pressed("Speed_up"):
		speed +=100
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		position += velocity * delta
#		Para que no se salga de los límites de la pantalla declarados en la variable
#		screen_size, clampeamos a position. Acá lo que hacemos es lo siguiente, si 
#		mi pantalla tiene una resolución de 1280x720, y mi position arriba llegó a 
#		por ejemplo 1281x721, position.x tiene 721 de valor pero ahora le decimos que con CLAMP que compruebe si se
#		salió del valor marcado entre 0 y 720 (screen_size.x), nos 
#		devuelve al valor límite, es decir 720. Si hubiese tenido un valor dentro del rango en position.x
#		dejaría el valor tal como está. Clamp entonces, funciona de la siguiente manera.
#		clamp(dejar_este_valor_si_esta_dentro_del_siguiente_rango, minimo_este_valor, maximo_este_otro_valor) de salirse
#		por arriba maximo_este_otro_valor entonces colocar maximo_este_otro_valor lo mismo sucederá de salirse por debajo de
#		minimo_este_valor

		position.x = clamp(position.x, 0, screen_size.x)
		position.y = clamp(position.y, 0, screen_size.y)
