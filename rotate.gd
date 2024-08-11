# rotate with left and right keys smoothly
extends Sprite2D

# Variables for smooth acceleration and deceleration
var target_rotation_speed : float = 0.0
var current_rotation_speed : float = 0.0
var acceleration : float = 3.0  # Adjusted for reasonable values
var deceleration : float = 3.0  # Adjusted for reasonable values
var max_rotation_speed : float = 10.0  # Maximum speed of rotation

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

############################
# SIMPLIFIED WITHOUT ACCELLERATION
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

