extends Node

var backButton : Button
var characterSelectionButton : Button

func _ready() -> void:
	
	backButton = get_node("VFlowContainer/ButtonContainer/MarginContainer/BackButton")
	backButton.pressed.connect(self.backPressed)
	
	characterSelectionButton = get_node("VFlowContainer/ButtonContainer/MarginContainer2/CharacterSelectionButton")
	characterSelectionButton.pressed.connect(self.characterSelectionPressed)
	characterSelectionButton.disabled = true
	
	var listNode = get_node("VFlowContainer/HBoxContainer/ScrollContainer/AdventureList")
	
	AdventuresManager.onAdventureSelected.connect(onAdventureSelected)
	
	for adventure in AdventuresManager.adventure_list:
		var loaded_adventure : Adventure 
		loaded_adventure = load(adventure)
		
		print(loaded_adventure.adventure_name)
		
		var entry = load("res://PF2eSim/UI/AdventureSelection/AdventureListEntry.tscn")
		var newEntry = entry.instantiate()
		newEntry.setAdventure(loaded_adventure)
		listNode.add_child(newEntry)

func onAdventureSelected(selectedAdventure : Adventure):
	var descNode = get_node("VFlowContainer/HBoxContainer/AdventureDescription")
	if (selectedAdventure):
		descNode.text = selectedAdventure.adventure_description
		characterSelectionButton.disabled = false
	else:
		characterSelectionButton.disabled = true

func backPressed():
	SceneManager.loadMainMenuScene()
	
func characterSelectionPressed():
	SceneManager.loadCharacterSelection()
