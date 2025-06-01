@tool
class_name PF2eSimContextMenus
extends EditorContextMenuPlugin


func _popup_menu(paths: PackedStringArray) -> void:
	add_context_menu_item("Create Scene script", _onCreateSceneScript)


func _onCreateSceneScript(data: Array):
	if data.size() != 1:
		print("Too many assets selected!")
		return

	var path = data[0]
	if not path is String:
		print("No file path detected!")
		return

	var pathString: String = path as String
	pathString.simplify_path()
	if not pathString.begins_with("res://"):
		print("No file path detected2!")
		return

	var extension: String = pathString.get_extension()
	if not extension == "tscn":
		print("No scene file selected!")
		return

	var scriptFilePath = pathString.trim_suffix("." + extension)
	scriptFilePath += ".gd"

	if not FileAccess.file_exists(scriptFilePath):
		var scriptFile = FileAccess.open(scriptFilePath, FileAccess.WRITE)
		print(scriptFile)
		var className = pathString.get_file().trim_suffix("." + extension).to_pascal_case()
		var typeName = "Node"
		var scriptContent = "class_name %s\nextends %s\n\nfunc _ready() -> void:\n\tpass\n" % [className, typeName]
		scriptFile.store_string(scriptContent)
		scriptFile.close()

	print("Script file already exists!")

	var scene: PackedScene = load(path)
	var instance: Node = scene.instantiate()
	instance.set_script(scriptFilePath)
	scene.pack(instance)
	ResourceSaver.save(scene, path)
