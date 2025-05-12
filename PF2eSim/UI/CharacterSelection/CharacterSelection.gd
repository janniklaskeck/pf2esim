extends Node

func _ready() -> void:
	var startButton = get_node("VBoxContainer2/HBoxContainer2/StartButton")
	startButton.pressed.connect(self.onStartPressed)
	
	var backButton = get_node("VBoxContainer2/HBoxContainer2/BackButton")
	backButton.pressed.connect(self.onBackPressed)


func onBackPressed():
	SceneManager.loadAdventureSelectionScene()
	
func onStartPressed():
	SceneManager.startAdventure()
