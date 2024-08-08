extends Node2D

# Rotation speed in radians per second
var rotation_speed = 2.0

# Reference to the Sprite2D node
var sprite: Sprite2D

func _ready():
	# Load the texture
	var texture = load("res://perfect-square.webp")
	
	# Create and configure the Sprite2D node
	sprite = Sprite2D.new()
	sprite.texture = texture
	add_child(sprite)
	# Scale the sprite to be about a third of the original size
	sprite.scale = Vector2(0.33, 0.33)
	# Set the pivot to the center of the sprite
	sprite.offset = texture.get_size() * 0.5 * sprite.scale# this doesn't help
	
	# Center the sprite in the middle of the screen
	sprite.position = get_viewport().size / 2# this causes it to be off centered
	
func _process(delta):
	if Input.is_action_pressed("ui_right"):
		rotation += rotation_speed * delta
	if Input.is_action_pressed("ui_left"):
		rotation -= rotation_speed * delta
	
	# Apply rotation to the sprite
	sprite.rotation = rotation
