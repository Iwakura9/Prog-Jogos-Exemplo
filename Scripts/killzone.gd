extends Area2D

func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
	

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		$Timer.start()
		var sprite = body.get_node_or_null("AnimatedSprite2D")
		if sprite:
			sprite.play("death")
			body.is_dead = true
		else:
			print("AnimatedSprite2D não encontrado dentro de", body.name)
