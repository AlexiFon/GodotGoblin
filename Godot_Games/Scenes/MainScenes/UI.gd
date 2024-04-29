extends CanvasLayer

func set_tower_preview(tower_type, mouse_position):
	var drag_tower = load("res://Scenes/Goblin/"+tower_type+".tscn").instantiate()
	drag_tower.set_name("DragTower")
	drag_tower.modulate = Color("00ff00dd")

	var range_texture= Sprite2D.new()
	range_texture.set_name("RangeIndicator")
	range_texture.position =Vector2(0,0)
	var scaling = GameData.tower_data[tower_type]["range"] / 600.0
	range_texture.scale =Vector2(scaling, scaling)
	var texture = load("res://Assets/UI/range_overlay.png")
	range_texture.texture=texture
	range_texture.modulate =Color("00ff00dd")
	

	var control = Control.new()
	control.add_child(drag_tower, true)
	control.add_child(range_texture, true)
	control.position=mouse_position
	control.set_name("TowerPreview")
	add_child(control,true)
	move_child(get_node("TowerPreview"), 0)


func update_tower_preview(new_position, color):
	get_node("TowerPreview").position=new_position
	if get_node("TowerPreview/DragTower").modulate != Color(color):
		get_node("TowerPreview/DragTower").modulate = Color(color)
		get_node("TowerPreview/RangeIndicator").modulate = Color(color)
