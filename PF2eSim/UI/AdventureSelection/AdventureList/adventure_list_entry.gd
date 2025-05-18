extends Node

@export var adventureButton: Button

var adventure: AdventureSetup


func _ready() -> void:
	adventureButton.pressed.connect(onPressed)


func setAdventure(newAdventure: AdventureSetup):
	adventure = newAdventure
	adventureButton.text = adventure.adventureName


func setSelected():
	adventureButton.pressed.emit()


func onPressed():
	AdventureManager.adventureSelected(adventure)
