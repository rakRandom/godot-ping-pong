extends CanvasLayer

@onready var left_points_label = $LeftPointsLabel
@onready var right_points_label = $RightPointsLabel


# Update points label
func update_points_label():
	left_points_label.text = str(Data.points[0])
	right_points_label.text = str(Data.points[1])


# Go to Menu
func _on_back_button_button_up():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
