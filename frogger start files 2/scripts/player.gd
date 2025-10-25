extends CharacterBody2D

var direction: Vector2 = Vector2(1, 1)
var speed: int = 200

func  _physics_process(_delta: float) -> void:
	direction = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = direction * speed
	
	char_animation()
	move_and_slide()
	
	
	if Input.is_action_just_pressed("Confirm"):
		print('something')

func char_animation():
	if direction:
		$AnimatedSprite2D.flip_h = direction.x > 0
		if direction.x != 0:
			$AnimatedSprite2D.animation = 'left'
		else:
			$AnimatedSprite2D.animation = 'up' if direction.y < 0 else 'down'
	else: 
		$AnimatedSprite2D.frame = 0
