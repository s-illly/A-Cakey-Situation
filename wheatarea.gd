extends Area2D

func _on_wheatarea_body_entered(body):
	if Input.is_action_pressed("pickup"):
		 queue_free()
