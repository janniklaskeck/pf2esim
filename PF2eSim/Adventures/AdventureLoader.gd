extends Node


func _ready() -> void:

	var currentAdventure: AdventureSetup = Statics.AdventuresManager.currentAdventure
	if currentAdventure == null:
		print("Loaded adventure scene with invalid selected adventure asset")
		return

	var adventureScene = currentAdventure.mapAsset
	Statics.SceneManager.addChildScene(adventureScene)
