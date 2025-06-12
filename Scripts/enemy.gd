extends Node2D

@export var speed = 80
var direction = 1
var is_attacking = false

func bigger_killzone(x: bool) -> void:
	if(x):
		$Killzone/CollisionShape2D.scale.x = 4.2
	else:
		$Killzone/CollisionShape2D.scale.x = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if(is_attacking):
		return
		
	if $RayCastR.is_colliding() or $RayCastL.is_colliding():
		direction *= -1;
		$AnimatedSprite2D.flip_h = not $AnimatedSprite2D.flip_h
		$AreaAlcance.scale.x *= -1
		
	$AnimatedSprite2D.play("run")
	position.x += speed * direction * delta



func _on_area_alcance_body_entered(body: Node2D) -> void:
	is_attacking = true
	bigger_killzone(true)
	$AnimatedSprite2D.play("attack")
	


func _on_animated_sprite_2d_animation_finished() -> void:
	is_attacking = false
	bigger_killzone(false)
