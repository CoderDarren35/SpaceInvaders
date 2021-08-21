extends Area2D


export var speed: = 100.0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y -= speed * delta
	

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_laser_body_entered(body):
	body.queue_free()
