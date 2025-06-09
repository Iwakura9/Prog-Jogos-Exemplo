extends Node2D

@export var speed = 80
var direction = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $RayCastR.is_colliding() or $RayCastL.is_colliding():
		direction *= -1;
		$Sprite2D.flip_h = not $Sprite2D.flip_h
		
	position.x += speed * direction * delta
