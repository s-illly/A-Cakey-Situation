extends Node2D

enum states {
	IDLE,
	IN,
	DISPLAY_TITLE,
	DISPLAY_PLAY,
	LAUNCH,
	GIRL,
	USER_START,
	STORYMODE1,
	STORYMODE2,
	STORYMODE3,
	STORYMODE4,
	SCREEN,
	KITCHEN,
	BEDROOM,
	LIVINGROOM,	
	DININGROOM,
	GARDEN,
	GAME_OVER_PAUSE,
	BAKING,
	END1,
	END2,
}

var walking = Vector2(0 ,0)
var speed = 200
var launching = 2
var launchgame = 0
var Storytimer = 2
var Storytimer2 = 6
var Storytimer3 = 3
var state = states.IN
var collected = 0
var gameOverTime = 3
var gameOverTimer = 0

func _ready():
	pass

func _process(delta):
	match state:
		states.IDLE: pass
		states.IN: initial()
		states.DISPLAY_TITLE: displayTitle()
		states.DISPLAY_PLAY: displayPlay()
		states.LAUNCH: launch(delta)
		states.GIRL: girl()
		states.STORYMODE1: storymode1()
		states.STORYMODE2: storymode2()
		states.STORYMODE3: storymode3()
		states.STORYMODE4: storymode4()
		states.SCREEN: screen()
		states.KITCHEN: kitchen()
		states.BEDROOM: bedroom()
		states.LIVINGROOM: livingroom()
		states.DININGROOM: diningroom()
		states.GARDEN: garden()
		states.GAME_OVER_PAUSE: gameOverPause(delta)
		states.BAKING: baking()
		states.END1: end1()
		states.END2: end2()
		

func initial():
	$TitleScreen.visible = false
	$Play.visible = false
	$Play/UI/Baking.visible = false
	$Play/UI/Textbox/end1.visible = false
	$Play/UI/Textbox/end2.visible = false
	$Play/UI/Textbox/restart.visible = false
	$Play/UI/Textbox/quit.visible = false
	$Play/UI/Textbox/story4.visible = false
	$Play/UI/Textbox/story4.text = "Press E to pick up items"
	collected = 0
	
	
	$Play/UI/Livingroom.visible = false
	$Play/UI/Kitchen.visible = false
	$Play/UI/Screen.visible = false
	$Play/UI/Bedroom.visible = false
	$Play/UI/Diningroom.visible = false
	$Play/UI/Garden.visible = false
	
	$Play/UI/Strawberry/AnimatedSprite.visible = true
	$Play/UI/Egg/AnimatedSprite.visible = true
	$Play/UI/Milk/AnimatedSprite.visible = true
	$Play/UI/Wheat/AnimatedSprite.visible = true
	$Play/UI/Sugar/AnimatedSprite.visible = true
	
	$Play/UI/Sugar.visible = false
	$Play/UI/Milk.visible = false
	$Play/UI/Egg.visible = false
	$Play/UI/Wheat.visible = false
	$Play/UI/Strawberry.visible = false
	
	state = states.DISPLAY_TITLE

func displayTitle():
	$TitleScreen.visible = true
	$Play.visible = false 
	state = states.IDLE

func _on_starting_button_down():
	state = states.DISPLAY_PLAY
	
func displayPlay():
	$TitleScreen.visible = false
	$Play.visible = true
	$Play/UI/Screen.visible = true
	$Play/Girl.visible = true
	state = states.LAUNCH

func launch(delta):
	launchgame += delta
	if launchgame > launching:
		launchgame = 0
		state = states.GIRL
		
func girl():
	$Play/Girl.set_physics_process(true)
	state = states.STORYMODE1

func storymode1():
	#visibility
	$Play/UI/Textbox.visible = true
	$Play/UI/Textbox/story1.visible = true
	$Play/UI/Textbox/story2.visible = false
	$Play/UI/Screen.visible = true
	$Play/Girl.visible = true
	$Storytimer.start()
	state = states.STORYMODE2

func storymode2():
	if $Storytimer.is_stopped():
		$Play/UI/Textbox/story1.visible = false
		$Play/UI/Textbox/story2.visible = true
		$Storytimer2.start()
		state = states.STORYMODE3

func storymode3():
	if $Storytimer2.is_stopped():
		$Play/UI/Textbox/story2.visible = false
		$Play/UI/Textbox/story3.visible = true
		$Storytimer3.start()
		state = states.STORYMODE4

func storymode4():
	if $Storytimer3.is_stopped():
		$Play/UI/Textbox/story3.visible = false
		$Play/UI/Textbox/story4.visible = true
		state = states.SCREEN
		
func screen():
	$Play/UI/Screen.visible = true
	$Play/UI/Kitchen.visible = false
	$Play/UI/Livingroom.visible = false
	$Play/UI/Bedroom.visible = false
	$Play/UI/Diningroom.visible = false
	$Play/UI/Garden.visible = false
	
	$Play/UI/Sugar.visible = false
	$Play/UI/Milk.visible = false
	$Play/UI/Egg.visible = false
	$Play/UI/Wheat.visible = false
	$Play/UI/Strawberry.visible = false
	
func kitchen():
	
	$Play/UI/Screen.visible = false
	$Play/UI/Kitchen.visible = true
	$Play/UI/Livingroom.visible = false
	$Play/UI/Bedroom.visible = false
	$Play/UI/Diningroom.visible = false
	$Play/UI/Garden.visible = false
	$Play/UI/Milk.visible = true	
	$Play/UI/Egg.visible = false
	$Play/UI/Milk/AnimatedSprite.play("milk")

func livingroom():

	$Play/UI/Screen.visible = false
	$Play/UI/Kitchen.visible = false
	$Play/UI/Livingroom.visible = true
	$Play/UI/Bedroom.visible = false
	$Play/UI/Diningroom.visible = false
	$Play/UI/Garden.visible = false
	
	$Play/UI/Sugar.visible = true 
	$Play/UI/Strawberry.visible = false
	$Play/UI/Sugar/AnimatedSprite.play("sugar")
	
func bedroom():
	
	$Play/UI/Screen.visible = false
	$Play/UI/Kitchen.visible = false
	$Play/UI/Livingroom.visible = false
	$Play/UI/Bedroom.visible = true
	$Play/UI/Diningroom.visible = false
	$Play/UI/Garden.visible = false
	$Play/UI/Strawberry.visible = true 
	$Play/UI/Strawberry/AnimatedSprite.play("strawberry")

func garden():
	
	$Play/UI/Screen.visible = false
	$Play/UI/Kitchen.visible = false
	$Play/UI/Livingroom.visible = false
	$Play/UI/Bedroom.visible = false
	$Play/UI/Diningroom.visible = false
	$Play/UI/Garden.visible = true
	
	$Play/UI/Wheat.visible = true		
	$Play/UI/Wheat/AnimatedSprite.play("wheat")

func diningroom():
	
	$Play/UI/Screen.visible = false
	$Play/UI/Kitchen.visible = false
	$Play/UI/Livingroom.visible = false
	$Play/UI/Bedroom.visible = false
	$Play/UI/Diningroom.visible = true
	$Play/UI/Garden.visible = false
	
	$Play/UI/Egg.visible = true
	$Play/UI/Egg/AnimatedSprite.play("egg")
	
func _on_Rightwall_body_entered(body):
	if state == states.SCREEN:
		state = states.LIVINGROOM
		$Play/Girl.position = Vector2(200, 400)	
	elif state == states.LIVINGROOM:
		state = states.BEDROOM
		$Play/Girl.position = Vector2(200, 400)
	if state == states.KITCHEN:
		state = states.SCREEN
		$Play/Girl.position = Vector2(200, 400)
	if state == states.DININGROOM:
		state = states.KITCHEN
		$Play/Girl.position = Vector2(200, 400)
	
		
func _on_Leftwall_body_entered(body):
	if state == states.SCREEN:
		state = states.KITCHEN
		$Play/Girl.position = Vector2(650, 400)
	elif state == states.KITCHEN:
		state = states.DININGROOM
		$Play/Girl.position = Vector2(650, 400)
	if state == states.GARDEN:
		state = states.SCREEN
		$Play/Girl.position = Vector2(420, 400)
	if state == states.LIVINGROOM:
		state = states.SCREEN
		$Play/Girl.position = Vector2(650, 400)
	if state == states.BEDROOM:
		state = states.LIVINGROOM
		$Play/Girl.position = Vector2(650, 400)
		
func _on_Outside_body_entered(body):
	if state == states.SCREEN:
		state = states.GARDEN
		$Play/Girl.position = Vector2(420, 400)

func _on_wheatarea_body_entered(body):
	if body == $Play/Girl:
		if Input.is_action_pressed("pickup"):
			if state == states.GARDEN:
				print("wheat picked up")
				$Play/UI/Wheat/AnimatedSprite.visible = false
				$Play/UI/Textbox/story4.text = "Wheat picked up"
				collected = collected + 1
				if collected == 5:
					state = states.GAME_OVER_PAUSE

func _on_strawberryarea_body_entered(body):
	if body == $Play/Girl:
		if Input.is_action_pressed("pickup"):
			if state == states.BEDROOM:
				print("strawberry picked up")
				$Play/UI/Strawberry/AnimatedSprite.visible = false
				$Play/UI/Textbox/story4.text = "Strawberry picked up"
				collected = collected + 1
				if collected == 5:
					state = states.GAME_OVER_PAUSE

func _on_eggarea_body_entered(body):
	if body == $Play/Girl:
		if Input.is_action_pressed("pickup"):
			if state == states.DININGROOM:
				print("egg picked up")
				$Play/UI/Egg/AnimatedSprite.visible = false
				$Play/UI/Textbox/story4.text = "Egg picked up"
				collected = collected + 1
				if collected == 5:
					state = states.GAME_OVER_PAUSE

func _on_milkarea_body_entered(body):
	if body == $Play/Girl:
		if Input.is_action_pressed("pickup"):
			if state == states.KITCHEN:
				print("milk picked up")
				$Play/UI/Milk/AnimatedSprite.visible = false
				$Play/UI/Textbox/story4.text = "Milk picked up"
				collected = collected + 1
				if collected == 5:
					state = states.GAME_OVER_PAUSE

func _on_sugararea_body_entered(body):
	if body == $Play/Girl:
		if Input.is_action_pressed("pickup"):
			if state == states.LIVINGROOM:
				print("sugar picked up")
				$Play/UI/Sugar/AnimatedSprite.visible = false
				$Play/UI/Textbox/story4.text = "Sugar picked up"
				collected = collected + 1
				if collected == 5:
					state = states.GAME_OVER_PAUSE

func gameOverPause(delta):
	gameOverTimer += delta
	if gameOverTimer > gameOverTime:
		gameOverTimer = 0
		state = states.BAKING

func baking():
	$Play/UI/Baking.visible = true
	$Play/UI/Baking/AnimatedSprite.play("baking")
	$Play/UI/Screen.visible = false
	$Play/UI/Kitchen.visible = false
	$Play/UI/Livingroom.visible = false
	$Play/UI/Bedroom.visible = false
	$Play/UI/Diningroom.visible = false
	$Play/UI/Garden.visible = false
	$Play/Girl.visible = false
	
	state = states.END1
func end1():
	$Play/UI/Textbox/story4.visible = false
	$Play/UI/Textbox/end1.visible = true
	$Endtimer1.start()
	state = states.END2
	
func end2():
	if $Endtimer1.is_stopped():
		$Play/UI/Textbox/end1.visible = false
		$Play/UI/Textbox/end2.visible = true
		$Play/UI/Textbox/restart.visible = true
		$Play/UI/Textbox/quit.visible = true
		

func _on_restart_button_down():
	state = states.IN

func _on_quit_button_down():
	get_tree().quit()
