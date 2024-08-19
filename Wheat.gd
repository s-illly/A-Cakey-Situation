extends KinematicBody2D

var picked = false
	
func _input(event):
	if Input.is_action_pressed("pickup"): 
		var wheat = $wheatarea.get_overlapping_bodies()
		for w in wheat:
			if w.name == "Girl" and picked == false:
				picked = true
			if picked == true:
				queue_free()


