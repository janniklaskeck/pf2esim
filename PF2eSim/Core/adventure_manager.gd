extends Node
class_name Adventure_Manager

signal onAdventureSelected(selectedAdventure)

@export var adventureList: Array[AdventureSetup] = []

var currentAdventureSetup: AdventureSetup = null
var currentAdventureSceneNode: Node = null


func _ready() -> void:
	return


func loadCurrentAdventureScene():
	if currentAdventureSetup == null:
		print("Loaded adventure scene with invalid selected adventure asset")
		return

	var adventureScene = currentAdventureSetup.mapAsset
	currentAdventureSceneNode = adventureScene.instantiate()
	get_tree().root.add_child(currentAdventureSceneNode)


func adventureSelected(selectedAdventure: AdventureSetup) -> void:
	currentAdventureSetup = selectedAdventure

	onAdventureSelected.emit(selectedAdventure)
	return
