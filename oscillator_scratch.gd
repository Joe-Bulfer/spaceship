########
# START - PUSHED
#######
	# fully control how fast it oscillates, how wide, and angle using three variables
extends Sprite2D

var speed : float = 3.0
var amplitude : float = 200
var angle : float = -20.0 

#this is what I want to have, to call this function multiple times for multiple particles on the same screen
#make_oscillator(
	#speed = 5
	#amplitude = 50
	#angle = 40
	#center = (30,60)
#)

func _ready():
	var texture = load("res://white-particle.png")
	self.texture = texture
	
	# Convert angle to radians for trigonometric functions
	var angle_rad = deg_to_rad(angle)

func _process(delta: float):
	var angle_rad = deg_to_rad(angle) #i don't know why is is declared multiple times but hey it works
	# Calculate the direction vector based on the angle
	var direction_x = cos(angle_rad)
	var direction_y = sin(angle_rad)
	var oscillation = amplitude * sin(speed * Time.get_ticks_msec() / 2000.0)
	
	# Apply the oscillation in the direction of the angle
	position.x = get_viewport().get_size().x / 2 + oscillation * direction_x
	position.y = get_viewport().get_size().y / 2 + oscillation * direction_y

	if int(Time.get_ticks_msec() / 1000) % 1 == 0:
		print("Particle position: ", position)
		#print(get_viewport().get_size() / 2)
########
# END - PUSHED
#######

########
# START - COLLIDE TEST
#######
#extends Area2D
#
#var speed : float = 3.0
#var amplitude : float = 200
#var angle : float = -20.0 
#
#func _ready():
	#var texture = load("res://white-particle.png")
	#self.texture = texture
	#
	## Convert angle to radians for trigonometric functions
	#var angle_rad = deg_to_rad(angle)
#
#func _process(delta: float):
	#var angle_rad = deg_to_rad(angle)  # This is fine to declare here
	## Calculate the direction vector based on the angle
	#var direction_x = cos(angle_rad)
	#var direction_y = sin(angle_rad)
	#var oscillation = amplitude * sin(speed * Time.get_ticks_msec() / 2000.0)
	#
	## Apply the oscillation in the direction of the angle
	#position.x = get_viewport().get_size().x / 2 + oscillation * direction_x
	#position.y = get_viewport().get_size().y / 2 + oscillation * direction_y
#
#func _on_Oscillator_body_entered(body):
	#if body.is_in_group("players"):
		## Optionally handle collisions with the player if needed
		#pass

######
# END - COLLIDE TEST
######
