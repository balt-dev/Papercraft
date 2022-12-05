extends Node

func ensure_directory(path: String) -> bool:
	if DirAccess.dir_exists_absolute(path):
		return true
	else:
		DirAccess.make_dir_absolute(path)
		return false
		
func glob_dir(dir_path: String, recursive: bool = false) -> Array[String]:
	var out: Array[String] = []
	var dir = DirAccess.open(dir_path)
	if dir:
		dir.list_dir_begin()
		var path = dir.get_next()
		while path != "":
			if not dir.current_is_dir(): 
				out.append(path)
			elif recursive:
				out.append_array(glob_dir(dir_path + "/" + path))
			path = dir.get_next()
	return out

func _ready():
	# Initialize user directory
	ensure_directory("user://mods")
	var dir = DirAccess.open("user://")
	if not dir.file_exists("skin.png"):
		dir.copy("res://assets/textures/entites/player.png", "user://skin.png")
	# Add mods
	for mod in glob_dir("user://mods"):
		if dir.file_exists("user://mods/"+mod):
			ProjectSettings.load_resource_pack("user://mods/"+mod)
	# Initialize tileset
	Global.ts = TileSet.new()
	Global.ts.add_physics_layer()
	Global.ts.tile_size = Vector2i(Global.TILE_SIZE, Global.TILE_SIZE)
	# Initialize globals
	Global.registry = Registry.new()
	Global.rng = RandomNumberGenerator.new()
	#Initialize blocks
	for path in glob_dir("res://assets/blocks"):
		Global.registry.add_block(load("res://assets/blocks/" + path))
	for path in glob_dir("res://assets/items"):
		Global.registry.add_item(load("res://assets/items/" + path))
	get_tree().change_scene_to_file("res://scenes/game.tscn")
