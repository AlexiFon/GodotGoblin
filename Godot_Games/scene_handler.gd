extends Node

func _ready():
	var new_game_button = $"MainMenu/M/VB/NewGame"
	var quit_button = $"MainMenu/M/VB/Quit"
	new_game_button.pressed.connect(self._on_NewGame_pressed)
	quit_button.pressed.connect(self._on_Quit_pressed)


func _on_NewGame_pressed():
	get_node("MainMenu").queue_free()
	var game = load("res://Scenes/MainScenes/game_scene.tscn").instantiate()
	add_child(game)

func _on_Quit_pressed():
	get_tree().quit()

