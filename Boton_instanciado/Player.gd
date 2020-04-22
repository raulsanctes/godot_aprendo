extends Node2D

export var speed = 400
var screen_size

func _ready():
	set_process(true)
	screen_size = get_viewport_rect().size

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

		position.x = clamp(position.x, 0, screen_size.x)
		position.y = clamp(position.y, 0, screen_size.y)
		#prueba
