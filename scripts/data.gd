extends Node

var points: Array


func _ready():
	load_data()


func save_data():
	var file = FileAccess.open("user://data.tres", FileAccess.WRITE)
	file.store_var(points)
	file.close()


func load_data():
	if FileAccess.file_exists("user://data.tres"):
		var file = FileAccess.open("user://data.tres", FileAccess.READ)
		var content = file.get_var()
		
		if content:
			points = content
			return
	
	points = [0, 0]
	save_data()
