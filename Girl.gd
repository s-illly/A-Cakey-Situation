extends KinematicBody2D

var speed = 250
var state_machine
var dir = Vector2.ZERO

func _ready():
	set_physics_process(false)
	state_machine = $AnimationTree.get("parameters/playback")

func get_input():
	var current = state_machine.get_current_node()
	
	var x = 0
	var y = 0
	
	if Input.is_action_pressed("up"):
		y = -1.0
		
	if Input.is_action_pressed("down"):
		y = 1.0
	
	if Input.is_action_pressed("right"):
		x = 1.0
		
	if Input.is_action_pressed("left"):
		x = -1.0
	
	dir = Vector2(x, y)
	
	if dir.length() > 0:
		state_machine.travel("walk")
		$AnimationTree.set("parameters/walk/blend_position", dir)
	if dir.length() == 0:
		state_machine.travel("idle")
	
	dir.normalized() 
	move_and_slide(dir * speed)
		
func _physics_process(delta):
	get_input()
	dir = move_and_slide(dir)
	
func reset():
	set_physics_process(false)
	position = Vector2(420, 400)
