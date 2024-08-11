###################
# START - WORKING SMOOTH ROTATE AND STATIC MOVE
###################
# rotate with left and right keys smoothly
#extends Sprite2D
#
## Variables for smooth acceleration and deceleration
#var target_rotation_speed : float = 0.0
#var current_rotation_speed : float = 0.0
#var acceleration : float = 3.0  # Adjusted for reasonable values
#var deceleration : float = 3.0  # Adjusted for reasonable values
#var max_rotation_speed : float = 10.0  # Maximum speed of rotation
#
#var move_speed : float = 200.0  # Speed of movement when spacebar is pressed
######
#var current_move_speed : float = 0.0  # Current speed of movement
#var move_acceleration : float = 100.0  # Acceleration rate for movement
#var move_deceleration : float = 150.0  # Deceleration rate for movement
######
#
#func _ready():
	## Initialize the sprite's properties or load the texture
	#var texture = load("res://white-particle.png")
	#self.texture = texture
	#
	#position.x = get_viewport().get_size().x / 2
	#position.y = get_viewport().get_size().y / 2
#
#func _process(delta: float):
	## Update target rotation speed based on input
	#if Input.is_action_pressed("ui_left"):
		#target_rotation_speed = -max_rotation_speed
	#elif Input.is_action_pressed("ui_right"):
		#target_rotation_speed = max_rotation_speed
	#else:
		#target_rotation_speed = 0.0
#
	## Smoothly adjust current rotation speed
	#if target_rotation_speed != 0:
		## Accelerate or decelerate to target speed
		#current_rotation_speed = lerp(current_rotation_speed, target_rotation_speed, acceleration * delta)
	#else:
		## Decelerate to stop
		#current_rotation_speed = lerp(current_rotation_speed, 0.0, deceleration * delta)
	#rotation += current_rotation_speed * delta
	#
	## Move forward in the direction the sprite is pointing when spacebar is pressed
	#if Input.is_action_pressed("ui_accept"):
		## Calculate movement vector based on the sprite's rotation
		#var movement_vector = Vector2(cos(rotation), sin(rotation)) * move_speed * delta
		#position += movement_vector
	#
	#print(deg_to_rad(rotation))
	#print(rotation)

###################
# END - WORKING SMOOTH ROTATE AND STATIC MOVE
###################

############################
# START - SIMPLIFIED WITHOUT ACCELLERATION
############################
#extends Sprite2D
#
## Rotation speed in radians per second
#
#func _ready():
	## Initialize the sprite's properties or load the texture
	#var texture = load("res://white-particle.png")
	#self.texture = texture
	#
	#position.x = get_viewport().get_size().x / 2
	#position.y = get_viewport().get_size().y / 2
#
#func _process(delta: float):
		#if Input.is_action_pressed("ui_left"):
			#rotation += -5
		#elif Input.is_action_pressed("ui_right"):
				#rotation += 5

	# Update rotation based on rotation speed

############################
# END - SIMPLIFIED WITHOUT ACCELLERATION
############################

#############
#START - WORKING SMOOTH ROTATE AND THRUST
############
extends Sprite2D

# Variables for smooth acceleration and deceleration
var target_rotation_speed : float = 0.0
var current_rotation_speed : float = 0.0
var acceleration : float = 1.0  # Adjusted for reasonable values
var deceleration : float = 1.0  # Adjusted for reasonable values
var max_rotation_speed : float = 8.0  # Maximum speed of rotation

var move_speed : float = 100.0  # Maximum speed of movement
var current_move_speed : float = 0.0  # Current speed of movement
var move_acceleration : float = 10.0  # Acceleration rate for movement
var move_deceleration : float = 10.0  # Deceleration rate for movement

func _ready():
	# Initialize the sprite's properties or load the texture
	var texture = load("res://white-particle.png")
	self.texture = texture
	
	position.x = get_viewport().get_size().x / 2
	position.y = get_viewport().get_size().y / 2

func _process(delta: float):
	# Update target rotation speed based on input
	if Input.is_action_pressed("ui_left"):
		target_rotation_speed = -max_rotation_speed
	elif Input.is_action_pressed("ui_right"):
		target_rotation_speed = max_rotation_speed
	else:
		target_rotation_speed = 0.0

	# Smoothly adjust current rotation speed
	if target_rotation_speed != 0:
		# Accelerate or decelerate to target speed
		current_rotation_speed = lerp(current_rotation_speed, target_rotation_speed, acceleration * delta)
	else:
		# Decelerate to stop
		current_rotation_speed = lerp(current_rotation_speed, 0.0, deceleration * delta)

	# Apply rotation
	rotation += current_rotation_speed * delta

	# Smoothly adjust current movement speed
	if Input.is_action_pressed("ui_accept"):
		# Accelerate movement
		current_move_speed = lerp(current_move_speed, move_speed, move_acceleration * delta)
	else:
		# Decelerate movement
		current_move_speed = lerp(current_move_speed, 0.0, move_deceleration * delta)

	# Move forward in the direction the sprite is pointing
	var movement_vector = Vector2(cos(rotation), sin(rotation)) * current_move_speed * delta
	position += movement_vector

#########
#END - WORKING SMOOTH ROTATE AND THRUST
###########

#########
#START - COLLIDE TEST
#########
#extends Area2D
#
## Variables for smooth acceleration and deceleration
#var target_rotation_speed : float = 0.0
#var current_rotation_speed : float = 0.0
#var acceleration : float = 1.0  # Adjusted for reasonable values
#var deceleration : float = 1.0  # Adjusted for reasonable values
#var max_rotation_speed : float = 8.0  # Maximum speed of rotation
#
#var move_speed : float = 100.0  # Maximum speed of movement
#var current_move_speed : float = 0.0  # Current speed of movement
#var move_acceleration : float = 10.0  # Acceleration rate for movement
#var move_deceleration : float = 10.0  # Deceleration rate for movement
#
#func _ready():
	## Initialize the sprite's properties or load the texture
	#var texture = load("res://white-particle.png")
	#self.texture = texture
	#
	#position.x = get_viewport().get_size().x / 2
	#position.y = get_viewport().get_size().y / 2
#
#func _process(delta: float):
	## Update target rotation speed based on input
	#if Input.is_action_pressed("ui_left"):
		#target_rotation_speed = -max_rotation_speed
	#elif Input.is_action_pressed("ui_right"):
		#target_rotation_speed = max_rotation_speed
	#else:
		#target_rotation_speed = 0.0
#
	## Smoothly adjust current rotation speed
	#if target_rotation_speed != 0:
		#current_rotation_speed = lerp(current_rotation_speed, target_rotation_speed, acceleration * delta)
	#else:
		#current_rotation_speed = lerp(current_rotation_speed, 0.0, deceleration * delta)
#
	## Apply rotation
	#rotation += current_rotation_speed * delta
#
	## Smoothly adjust current movement speed
	#if Input.is_action_pressed("ui_accept"):
		#current_move_speed = lerp(current_move_speed, move_speed, move_acceleration * delta)
	#else:
		#current_move_speed = lerp(current_move_speed, 0.0, move_deceleration * delta)
#
	## Move forward in the direction the sprite is pointing
	#var movement_vector = Vector2(cos(rotation), sin(rotation)) * current_move_speed * delta
	#position += movement_vector
#
#func _on_Oscillator_body_entered(body):
	#if body.is_in_group("oscillators"):
		## Calculate push force in the direction of the spaceship's rotation
		#var push_force = 500.0  # Adjust this value as needed
		#var push_vector = Vector2(cos(rotation), sin(rotation)) * push_force
		#body.position += push_vector

#########
#END - COLLIDE TEST
#########
