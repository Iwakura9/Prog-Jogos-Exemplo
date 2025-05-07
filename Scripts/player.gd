extends CharacterBody2D

@export var speed := 200
@export var roll_speed := 160
@onready var _animation_player = $AnimationPlayer
var is_moving = false
var direction = false # 1:DIR | -1:ESQ
var is_rolling = false


func _physics_process(delta: float) -> void:
	
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	
	if is_rolling:
		if direction:
			velocity.x = -roll_speed
		else:
			velocity.x = roll_speed
		move_and_slide()
		return 
	
	is_moving = input_vector.x != 0
	velocity.x = input_vector.x * speed

	move_and_slide()
	
	 # Ignora mudanças até que a rolagem termine
	
	# Gravidade
	if not is_on_floor():
		velocity.y += 7
		
	# Direção
	if velocity.x > 0:
		direction = false
	elif velocity.x < 0:
		direction = true
	
	# Pulo
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -200
	



	if not is_on_floor():
		$AnimatedSprite2D.play("jump")
		$AnimatedSprite2D.flip_h = direction
	else:
		if Input.is_action_just_pressed("roll"):
			$AnimatedSprite2D.play("roll")
			$AnimatedSprite2D.flip_h = direction
			is_rolling = true
			
		elif is_moving:
			$AnimatedSprite2D.play("run")
			$AnimatedSprite2D.flip_h = direction
			
		else:
			$AnimatedSprite2D.play("idle")
			$AnimatedSprite2D.flip_h = direction

func _on_animated_sprite_2d_animation_finished() -> void:
	is_rolling = false
