extends KinematicBody2D

export var speed = 200

var screen_size
var estado
var estadoActual
var estadoSiguiente

enum state_list {IDLE, UP, DOWN, RIGHT, LEFT, RIGHTUP, LEFTUP, RIGHTDOWN, LEFTDOWN}

func _ready():
	screen_size = get_viewport_rect().size
	position.x = screen_size.x/2
	position.y = screen_size.y/2
	$Img.playing = false

func _process(delta):
	move(delta)

func move(delta):
	
	var velocity = Vector2(0,0)
	
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
		estado = state_list.RIGHT
		transitionTo(estado, velocity)
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		estado = state_list.LEFT
		transitionTo(estado, velocity)
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
		estado = state_list.DOWN
		transitionTo(estado, velocity)
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
		estado = state_list.UP
		transitionTo(estado, velocity)
	if velocity == Vector2(1, -1):
		estado = state_list.RIGHTUP
		transitionTo(estado, velocity)
	if velocity == Vector2(-1, -1):
		estado = state_list.LEFTUP
		transitionTo(estado, velocity)
	if velocity == Vector2(-1, 1):
		estado = state_list.LEFTDOWN
		transitionTo(estado, velocity)
	if velocity == Vector2(1, 1):
		estado = state_list.RIGHTDOWN
		transitionTo(estado, velocity)

	if Input.is_action_pressed("ui_cancel"):
		load_menu_scene()

	if velocity.length() > 0:
		$Img.playing = true
		velocity = velocity.normalized() * speed
		position += velocity * delta
		position.x = clamp(position.x, 0, screen_size.x)
		position.y = clamp(position.y, 0, screen_size.y)
	else:
		$lab_velo.text = "IDLE"
		$Img.frame = 0
		$Img.playing = false

func load_menu_scene():
		var cancel
		cancel = get_tree().change_scene("res://Escenas/MainMenu.tscn")
		if cancel != 0:
			print(cancel)

func transitionTo(nuevoEstado, velocity):
	estado = nuevoEstado
	match estado:
		state_list.IDLE:
			nuevoEstado = "idle"
		state_list.UP:
			nuevoEstado = "up"
			$Img.animation = "Up"
			$lab_velo.text = "UP"
			$lab_velo/lab_velocidad.text = str(velocity.x," ", velocity.y)
		state_list.DOWN:
			nuevoEstado = "down"
			$Img.animation = "Down"
			$lab_velo.text = "DOWN"
			$lab_velo/lab_velocidad.text = str(velocity.x," ", velocity.y)
		state_list.RIGHT:
			nuevoEstado = "right"
			$Img.animation = "Right"
			$Img.flip_h = false
			$lab_velo.text = "RIGHT"
			$lab_velo/lab_velocidad.text = str(velocity.x," ", velocity.y)
		state_list.LEFT:
			nuevoEstado = "left"
			$Img.animation = "Right"
			$Img.flip_h = true
			$lab_velo.text = "LEFT"
			$lab_velo/lab_velocidad.text = str(velocity.x," ", velocity.y)
		state_list.RIGHTUP:
			nuevoEstado = "rightup"
			$lab_velo.text = "RIGHTUP"
			$lab_velo/lab_velocidad.text = str(velocity.x," ", velocity.y)
		state_list.LEFTUP:
			nuevoEstado = "leftup"
			$lab_velo.text = "LEFTUP"
			$lab_velo/lab_velocidad.text = str(velocity.x," ", velocity.y)
		state_list.RIGHTDOWN:
			nuevoEstado = "rightdown"
			$lab_velo.text = "RIGHTDOWN"
			$lab_velo/lab_velocidad.text = str(velocity.x," ", velocity.y)
		state_list.LEFTDOWN:
			nuevoEstado = "leftdown"
			$lab_velo.text = "LEFTDOWN"
			$lab_velo/lab_velocidad.text = str(velocity.x," ", velocity.y)
