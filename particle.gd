extends Sprite2D

# Speed and amplitude for the oscillation
var speed : float = 2.0
var amplitude : float = 100.0

func _ready():
	var texture = load("res://white-particle.png")

func _process(delta: float):
	# Calculate the new x position using a sine function for oscillation
	var oscillation = amplitude * sin(speed * Time.get_ticks_msec() / 1000.0)
	position.x = oscillation
	# Print the particle's position every second
	#white particle doesn't visibly appear, so this is the best I can do.
	if int(Time.get_ticks_msec() / 1000) % 1 == 0:
		print("Particle position: ", position)
