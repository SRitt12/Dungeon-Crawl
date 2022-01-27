extends Node2D

var fireball = preload("res://Fireball.tscn")
var speed = 200
var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	get_input()
	look_at(get_global_mouse_position())

func get_input():
	velocity = Vector2()
	if Input.is_action_just_pressed('left_click'):
		shoot()

func shoot():
	var f = fireball.instance()
	f.start($Muzzle.global_position, rotation)
	get_tree().get_current_scene().add_child(f)
