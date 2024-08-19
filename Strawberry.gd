extends KinematicBody2D

var picked = false

func _input(event):
	if Input.is_action_pressed("pickup"): 
		var strawberry = $strawberryarea.get_overlapping_bodies()
		for s in strawberry:
			if s.name == "Girl" and picked == false:
				picked = true
			if picked == true:
				queue_free()

