extends CharacterBody2D


const SPEED : float = 5000.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	var direction = Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = direction * SPEED * delta
	move_and_slide() 
	
func add_scale():
	%Sprite.scale *= Vector2(1.5, 1.5)
	%CollisionShape2D.scale *= Vector2(1.5,1.5)
