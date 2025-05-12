extends Node

var adventure : Adventure

func _ready() -> void:
	get_node("MarginContainer/AdventureButton").pressed.connect(onPressed)

func setAdventure(newAdventure : Adventure):
	adventure = newAdventure
	get_node("MarginContainer/AdventureButton").text = adventure.adventure_name

func onPressed():
	AdventuresManager.adventureSelected(adventure)
	return
