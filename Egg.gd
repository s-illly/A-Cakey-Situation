extends KinematicBody2D

var picked = false
	
func _input(event):
	if Input.is_action_pressed("pickup"): 
		var egg = $eggarea.get_overlapping_bodies()
		for e in egg:
			if e.name == "Girl" and picked == false:
				picked = true
			if picked == true:
				queue_free()

