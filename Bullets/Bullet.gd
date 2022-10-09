extends Area

# Setting up the bullet's speed
var speed = 7
var velocity = Vector3()

# the onready function below makes sure that everything is set up and ready before it
# runs the _ready function below.

#I am using the "timer" variable for storing the "Timer" node and its baggage.
onready var timer = get_node("Timer")

# Again, as mentioned above the "Onready" function refers to this "func_ready()" section.
# It makes sure that everything in this section is ready for executing anything.
# func _ready():
#	# This delays the time for one second until the bullet self-destructs.
#	# You can increase the value for the bullet's distance.
#	timer.set_wait_time(1)
#	#This "start()" function interacts with the "start()" function in the player3D.gd file
#	timer.start()
	
# These two functions control the bullet's movement.
func start(xform):
	transform = xform
	velocity = +transform.basis.z * speed
	
func _process(delta):
	transform.origin += velocity * delta

# If a bullet enters Anything, it will be destroyed
func _on_Bullet_body_entered(body):
	print(body.name)
	if body.name is StaticBody:
		queue_free()
# Whenever the timer runs out, the timer will self-destruct (i.e disappear)
func _on_Timer_timeout():
	queue_free()
