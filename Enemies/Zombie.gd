extends KinematicBody2D


onready var player = get_parent().get_node("Player")

var player_in_range
var player_in_los


# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	# pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	sightCheck()

func _on_Sight_body_entered(body):
	if body == player:
		player_in_range = true
		print("Player in range")
		
	


func _on_Sight_body_exited(body):
	if body == player:
		player_in_range = false
		print("Player left range")

# If player is within range, casts ray from enemy to player to check if player is in line of sight		
func sightCheck():
	if player_in_range == true:
		var space_state = get_world_2d().direct_space_state
		var sight_check = space_state.intersect_ray(position, player.position, [self], collision_mask)
		if sight_check:
			print(str(player.position) + ", " + str(position))
			if sight_check.collider.name == "Player":
				print("Player in sight")
				player_in_los = true
				
			else:
				player_in_los = false
				print("Player not in sight" + sight_check.collider.name)
		

