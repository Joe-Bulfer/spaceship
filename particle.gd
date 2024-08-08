extends Sprite2D

# Speed and amplitude for the oscillation
var speed : float = 2.0
var amplitude : float = 100.0

func _ready():
	pass

func _process(delta: float):
	# Calculate the new x position using a sine function for oscillation
	var oscillation = amplitude * sin(speed * Time.get_ticks_msec() / 1000.0)
	position.x = oscillation
