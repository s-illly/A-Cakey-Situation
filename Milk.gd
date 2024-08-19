extends KinematicBody2D

var picked = false

func _input(event):
	if Input.is_action_pressed("pickup"): 
		var milk = $milkarea.get_overlapping_bodies()
		for m in milk:
			if m.name == "Girl" and picked == false:
				picked = true
			if picked == true:
				queue_free()

