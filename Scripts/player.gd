extends CharacterBody2D

@export var speed := 200
@onready var _animation_player = $AnimationPlayer
var is_moving = false
var direcao = false # false -> direita; true -> esquerda

func _physics_process(delta: float) -> void:
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	
	is_moving = input_vector.x != 0
	velocity.x = input_vector.x * speed
	move_and_slide()

	if Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		$IdleSprite.visible = false
		$RunSprite.visible = true
		$RunSprite.flip_h = false
		_animation_player.play("run")
		direcao = false

	elif Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		$IdleSprite.visible = false
		$RunSprite.flip_h = true
		$RunSprite.visible = true
		_animation_player.play("run")
		direcao = true
	
	else:
		$IdleSprite.flip_h = direcao
		$IdleSprite.visible = true
		_animation_player.play("idle")
		$RunSprite.visible = false
		
