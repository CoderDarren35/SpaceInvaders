extends Node2D

onready var Swarm = preload("res://src/swarm.tscn")
export var min_boss_delay := 15.0
export var max_boss_delay := 30.0
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()

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
