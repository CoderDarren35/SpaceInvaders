extends Node2D
signal lose
signal win(swarm)
export var speed: = 100.0
export var downtime: = 1.0
var down_remaining: = 0.0 
var vector: = Vector2()
var direction: = 1.0

# Called when the node enters the scene tree for the first time.
func _ready():
	vector.x = speed

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += vector * delta
	if down_remaining > 0.0:
		down_remaining -= delta
	else:
		vector.x = speed * direction
		vector.y = 0.0
	if not $LeftNotifier.is_on_screen() and not $RightNotifier.is_on_screen():
		emit_signal("lose")
	if get_child_count() <= 2:
		emit_signal("win", self)
		queue_free()

func reverse():
	vector.y = speed
	vector.x = 0.0
	down_remaining = downtime
	direction *= -1.0
	

func _on_RightNotifier_screen_exited():
	reverse()


func _on_LeftNotifier_screen_exited():
	reverse()
