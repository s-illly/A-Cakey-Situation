extends RigidBody2D

var picked = false

func _physics_process(delta):
	if picked == true:
		queue_free()

func _input(event):
	if Input.is_action_pressed("pickup"): 
		var bodies = $detector.get_overlapping_bodies()
		for b in bodies:
			if b.name == "Girl" and picked == false:
				picked = true



