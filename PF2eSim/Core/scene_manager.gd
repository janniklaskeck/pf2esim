extends Node
class_name Scene_Manager

@export var mainMenuScene: PackedScene
@export var adventureSelectionScene: PackedScene
@export var characterSelectionScene: PackedScene
@export var adventureScene: PackedScene

var currentScene: PackedScene = null


func _ready() -> void:
	call_deferred("loadMainMenuScene")


func loadMainMenuScene() -> void:
	ChangeToScene(mainMenuScene)


func loadAdventureSelectionScene() -> void:
	ChangeToScene(adventureSelectionScene)


func loadCharacterSelection() -> void:
	ChangeToScene(characterSelectionScene)


func startAdventure():
	ChangeToScene(adventureScene)


func ChangeToScene(scene: PackedScene) -> bool:
	if scene == null:
		return false

	currentScene = scene
	get_tree().change_scene_to_file(scene.resource_path)
	return true
