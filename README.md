Right now all I have is an oscillator with adjustable speed, amplitude, and angle, but not center (x,y) yet. It would be cool to call a function like this multiple times and have multiple oscillators on the screen at once.

```gdscript
make_oscillator(
	speed = 5
	amplitude = 50
	angle = 45
	center = (30,60)
```

![](oscillator_and_spaceship.gif)

The player/spaceship has rotation and movement/thrust. Using lerp (linear interpolation) there smooth acceleration.

Random notes:
Planets orbit in ovals, which are represented with a triangle whose two sides move while one side is stationiary (down the middle of the oval). Gravity is any particle, node or spaceship's vector (x, y pos.) being modified by other node's vector/position depending on their distance between them and... surface area? Arbritrary density variable? 
