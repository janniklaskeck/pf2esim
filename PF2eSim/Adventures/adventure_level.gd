class_name AdventureLevel
extends Node

@export var gameModeScene: PackedScene
@export var gameCameraScene: PackedScene
@export var gameHUDScene: PackedScene

var partySpawnLocations: Array[StartingLocation]

var gameMode: GameMode = null
var gameCamera: GameCamera = null
var gameHUD: MainHUD = null

func _ready() -> void:
	findPartySpawnLocations()

	gameMode = gameModeScene.instantiate()
	gameMode.adventureLevel = self
	gameMode.add_to_group("GameMode")
	get_tree().root.add_child(gameMode)

	gameCamera = gameCameraScene.instantiate()
	gameCamera.adventureLevel = self
	gameCamera.add_to_group("Camera")
	get_tree().root.add_child(gameCamera)

	gameHUD = gameHUDScene.instantiate()

	get_tree().root.add_child(gameHUD)

func findPartySpawnLocations():
	var nodes = get_tree().get_nodes_in_group("PartySpawnLocations")
	for N in nodes:
		partySpawnLocations.append(N as StartingLocation)
