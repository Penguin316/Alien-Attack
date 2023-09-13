extends CharacterBody2D


func _physics_process(delta):
	var speed = 300 # sets the speed of the player
	velocity = Vector2(0, 0) # prevents continuous motion when button isn't pressed
	
	if Input.is_action_pressed("up"):
		velocity.y = -speed
	if Input.is_action_pressed("down"):
		velocity.y = speed
	if Input.is_action_pressed("right"):
		velocity.x = speed
	if Input.is_action_pressed("left"):
		velocity.x = -speed
	
	move_and_slide() # move_and_slide() must be called for the velocity variable to work
	
	# creates boundry for the player
	var screen_size = get_viewport_rect().size
#	if global_position.x < 0:
#		global_position.x = 0
#	if global_position.x > screen_size.x:
#		global_position.x = screen_size.x
#	if global_position.y < 0:
#		global_position.y = 0
#	if global_position.y > screen_size.y:
#		global_position.y = screen_size.y
		
#	global_position.x = clampf(global_position.x, 0, screen_size.x)
#	global_position.y = clampf(global_position.y, 0, screen_size.y)

	global_position = global_position.clamp(Vector2(0, 0), screen_size)
