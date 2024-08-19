extends KinematicBody2D

var picked = false
	
func _input(event):
	if Input.is_action_pressed("pickup"): 
		var sugar = $sugararea.get_overlapping_bodies()
		for su in sugar:
			if su.name == "Girl" and picked == false:
				picked = true
			if picked == true:
				queue_free()
