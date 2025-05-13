extends Node

@export var adventureList: Array[AdventureSetup] = []

var currentAdventure : AdventureSetup = null

signal onAdventureSelected(selectedAdventure)

func _ready() -> void:
	return

func adventureSelected(selectedAdventure : AdventureSetup) -> void:
	currentAdventure = selectedAdventure
	
	onAdventureSelected.emit(selectedAdventure)
	return
