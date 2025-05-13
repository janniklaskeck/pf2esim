extends Node

@export var startButton : Button
@export var backButton : Button

func _ready() -> void:
	startButton.pressed.connect(self.onStartPressed)
	
	backButton.pressed.connect(self.onBackPressed)

func onBackPressed():
	Statics.SceneManager.loadAdventureSelectionScene()
	
func onStartPressed():
	Statics.SceneManager.startAdventure()
