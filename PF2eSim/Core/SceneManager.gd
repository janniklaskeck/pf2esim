extends Node

enum SceneNames {MainMenu, LoadGame, Settings, AdventureSelection, CharacterSelection, Adventure}

var mainMenuScene = preload("res://PF2eSim/UI/MainMenu/MainMenu.tscn")
var advScene = preload("res://PF2eSim/UI/AdventureSelection/AdventureSelection.tscn")

var currentScene = null

func _ready() -> void:
	call_deferred("loadMainMenuScene")
	ResourceLoader.load_threaded_request("res://PF2eSim/UI/AdventureSelection/AdventureSelection.tscn")
	
func loadMainMenuScene() -> void:
	currentScene = SceneNames.MainMenu
	get_tree().change_scene_to_file("res://PF2eSim/UI/MainMenu/MainMenu.tscn")

func loadAdventureSelectionScene() -> void:
	currentScene = SceneNames.AdventureSelection
	get_tree().change_scene_to_file("res://PF2eSim/UI/AdventureSelection/AdventureSelection.tscn")

func loadCharacterSelection() -> void:
	currentScene = SceneNames.CharacterSelection
	get_tree().change_scene_to_file("res://PF2eSim/UI/CharacterSelection/CharacterSelection.tscn")

func startAdventure():
	currentScene = SceneNames.Adventure
	get_tree().change_scene_to_file("res://PF2eSim/Game/Scenes/Adventure/Adventure.tscn")
	return
