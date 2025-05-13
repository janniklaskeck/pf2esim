extends Node

@export var AdventureListEntry : PackedScene

@export var AdventureSelectionList : VBoxContainer
@export var AdventureDescriptionLabel : Label

@export var CharacterSelectionButton : Button
@export var BackButton : Button

func _ready() -> void:
	BackButton.pressed.connect(self.backPressed)
	
	CharacterSelectionButton.pressed.connect(self.characterSelectionPressed)
	CharacterSelectionButton.disabled = true
	
	Statics.AdventuresManager.onAdventureSelected.connect(onAdventureSelected)
	
	var foundAdventure = false
	for adventure in Statics.AdventuresManager.adventureList:
		var loaded_adventure : AdventureSetup 
		loaded_adventure = load(adventure.resource_path)
		
		print(loaded_adventure.adventure_name)
		
		var entry = load(AdventureListEntry.resource_path)
		var newEntry = entry.instantiate()
		newEntry.setAdventure(loaded_adventure)
		AdventureSelectionList.add_child(newEntry)
		if not foundAdventure:
			newEntry.setSelected()
			foundAdventure = true
		
func onAdventureSelected(selectedAdventure : AdventureSetup):
	if (selectedAdventure):
		AdventureDescriptionLabel.text = selectedAdventure.adventure_description
		CharacterSelectionButton.disabled = false
	else:
		CharacterSelectionButton.disabled = true

func backPressed():
	Statics.SceneManager.loadMainMenuScene()
	
func characterSelectionPressed():
	Statics.SceneManager.loadCharacterSelection()
