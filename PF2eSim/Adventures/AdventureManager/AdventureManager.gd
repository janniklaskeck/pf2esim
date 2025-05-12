extends Node

@export_file() var adventure_list: Array[String] = []

var adventure_manager_scene = null

var currentAdventure : Adventure = null

signal onAdventureSelected(selectedAdventure)

func _ready() -> void:
	return

func adventureSelected(selectedAdventure : Adventure) -> void:
	currentAdventure = selectedAdventure
	
	onAdventureSelected.emit(selectedAdventure)
	return
