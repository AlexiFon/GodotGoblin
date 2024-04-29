extends Node2D

var enemy_array =[]

func _physics_process(delta):
	turn()

func turn():
	var enemy_position = get_global_mouse_position()
	get_node("Goblin").look_at(enemy_position)


func _on_range_body_exited(body:Node2D):
	enemy_array.append(body)

func _on_range_body_entered(body:Node2D):
	pass # Replace with function body.
