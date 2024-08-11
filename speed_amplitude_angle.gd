# fully control how fast it oscillates, how wide, and angle
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
#chatgpt crap below
###################################################################
#extends Sprite2D
#
## Speed, amplitude, angle, and center for the oscillation
#var speed : float = 5.0
#var amplitude : float = 50.0
#var angle : float = 40.0
#var center : Vector2 = Vector2(30, 60)
#
#func _ready():
	#var texture = load("res://white-particle.png")
	#self.texture = texture
#
	## Initialize the particle with the make_oscillator function
	#make_oscillator(speed, amplitude, angle, center)
#
#func _process(delta: float):
	## Convert angle to radians
	#var angle_rad = deg_to_rad(angle)
#
	## Calculate the oscillation offset
	#var oscillation = amplitude * sin(speed * Time.get_ticks_msec() / 1000.0)
#
	## Calculate the direction vector based on the angle
	#var direction_x = cos(angle_rad)
	#var direction_y = sin(angle_rad)
#
	## Apply the oscillation in the direction of the angle
	#position.x = center.x + oscillation * direction_x
	#position.y = center.y + oscillation * direction_y
#
	## Print the particle's position every second
	#if int(Time.get_ticks_msec() / 1000) % 1 == 0:
		#print("Particle position: ", position)
#
#func make_oscillator(speed: float = 5.0, amplitude: float = 50.0, angle: float = 40.0, center: Vector2 = Vector2(30, 60)):
	#self.speed = speed
	#self.amplitude = amplitude
	#self.angle = angle
	#self.center = center

