extends Node

@export var adventureButton : Button

var adventure : AdventureSetup

func _ready() -> void:
	adventureButton.pressed.connect(onPressed)

func setAdventure(newAdventure : AdventureSetup):
	adventure = newAdventure
	adventureButton.text = adventure.adventure_name

func setSelected():
	adventureButton.pressed.emit()

func onPressed():
	Statics.AdventuresManager.adventureSelected(adventure)
