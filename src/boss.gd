extends KinematicBody2D

export var speed := 300.0

func get_texture_size() -> Vector2:
	
	return $Sprite.texture.get_size()
	
func _physics_process(delta):
	
	position.y += speed * delta
