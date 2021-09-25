extends "res://src/alien.gd"
signal game_over
export var speed := 300.0

func get_texture_size() -> Vector2:
	
	return $Sprite.texture.get_size()
	
func _physics_process(delta):
	
	position.y += speed * delta


func _on_VisibilityNotifier2D_screen_exited():
	if not was_hit:
		emit_signal("game_over")
	
