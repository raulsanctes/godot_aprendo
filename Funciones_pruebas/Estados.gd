extends Node
# Haré una máquina de estados para que me detecte con los 4 botones direccionales

enum STATES_LIST {IDLE, RUN_UP, RUN_X, RUN_FLIPX, RUN_DOWN, DEAD}
var estado
var estadoActual
var velocity = Vector2(0, 0)

func _ready():
	print("Nodo ESTADOS cargado")

func _process(_delta):
	deteccionEstados()

func deteccionEstados():
	if Input.is_action_just_pressed("ui_up"):
		velocity = Vector2(0, -1)
		estadoActual = STATES_LIST.RUN_UP
		transitionTo(estadoActual)
	
	if Input.is_action_just_pressed("ui_right"):
		velocity = Vector2(1, 0)
		estadoActual = STATES_LIST.RUN_X
		transitionTo(estadoActual)
	
	if Input.is_action_just_pressed("ui_down"):
		velocity = Vector2(0, 1)
		estadoActual = STATES_LIST.RUN_DOWN
		transitionTo(estadoActual)
	
	if Input.is_action_just_pressed("ui_left"):
		velocity = Vector2(-1, 0)
		estadoActual = STATES_LIST.RUN_FLIPX
		transitionTo(estadoActual)

func transitionTo(nuevoEstado):
		estado = nuevoEstado
		match estado:
			STATES_LIST.IDLE:
				nuevoEstado = "idle"
				imprimoEstados()
			STATES_LIST.RUN_UP:
				nuevoEstado = "run_up"
				imprimoEstados()
			STATES_LIST.RUN_X:
				nuevoEstado = "run_right"
				imprimoEstados()
			STATES_LIST.RUN_FLIPX:
				nuevoEstado = "run_left"
				imprimoEstados()
			STATES_LIST.RUN_DOWN:
				nuevoEstado = "run_down"
				imprimoEstados()
			STATES_LIST.DEAD:
				nuevoEstado = "dead"
				imprimoEstados()

func imprimoEstados():
	print("El estado actual es: ", (STATES_LIST.keys()[estadoActual]), " Y la dirección es: ", velocity)
