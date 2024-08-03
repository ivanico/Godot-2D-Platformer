extends CharacterBody2D

var move_speed : float = 100.0
var jump_force : float = 200.0
var gravity : float = 500.0

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta #delta is converted per frame action to per sec action
		
	velocity.x = 0
	
	if Input.is_key_pressed(KEY_A) || Input.is_key_pressed(KEY_LEFT):
		velocity.x -= move_speed
	if Input.is_key_pressed(KEY_D) || Input.is_key_pressed(KEY_RIGHT):
		velocity.x += move_speed
	if Input.is_key_pressed(KEY_W) and is_on_floor() || Input.is_key_pressed(KEY_UP) and is_on_floor() || Input.is_key_pressed(KEY_SPACE) and is_on_floor():
		velocity.y = -jump_force
	
	move_and_slide()
	
	if global_position.y > 250:
		game_over()

func game_over ():
	get_tree().reload_current_scene()
