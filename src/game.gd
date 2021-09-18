extends Node2D

onready var Swarm = preload("res://src/swarm.tscn")
onready var Boss = preload("res://src/boss.tscn")
export var min_boss_delay := 15.0
export var max_boss_delay := 30.0 

func get_boss_delay():
	
	return min_boss_delay + (max_boss_delay - min_boss_delay) * randf()
	


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	$BossTimer.start(get_boss_delay())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_swarm_lose():
	get_tree().change_scene("res://src/GameOver.tscn")


func _on_swarm_win(last_swarm):
	var swarm = Swarm.instance()
	swarm.connect("win", self, "_on_swarm_win")
	swarm.speed = last_swarm.speed * 1.5
	add_child(swarm)
	#get_tree().change_scene("res://src/gamewin.tscn")


func _on_BossTimer_timeout():
	var boss = Boss.instance()
	var viewport_rect := get_viewport_rect()
	var boss_size :Vector2= boss.get_texture_size() * boss.scale
	boss.position = Vector2(viewport_rect.size.x * 0.5, -boss_size.y)
	add_child(boss)
