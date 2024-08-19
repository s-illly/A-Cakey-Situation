extends Area2D

func _on_eggarea_body_entered(body):
	if Input.is_action_pressed("pickup"):
		 queue_free()
