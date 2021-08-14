extends Area2D
export var speed: = 100
export var cooldown_time: = 0.5
var cooldown_remaining: = 0.0
var Laser = load("res://src/laser.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	var size = $Sprite.texture.get_size()
	var view_rect = get_viewport_rect()
	position.x = view_rect.size.x * 0.5
	position.y = view_rect.size.y - size.y * 0.5

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var size = $Sprite.texture.get_size()
	var view_rect = get_viewport_rect()
	var parent = get_parent()
	if Input.is_action_pressed("move_left"):
		position.x -= speed * delta
	if Input.is_action_pressed("move_right"):
		position.x += speed * delta
	position.x = clamp(position.x, size.x * 0.5, view_rect.size.x - size.x * 0.5)
	if Input.is_action_just_pressed("fire") and not cooldown_remaining:
		var laser = Laser.instance()
		laser.position.x = position.x
		laser.position.y = position.y
		parent.add_child(laser)
		cooldown_remaining = cooldown_time
	if cooldown_remaining > 0.0:
		cooldown_remaining -= delta
	else:
		cooldown_remaining = 0.0 
