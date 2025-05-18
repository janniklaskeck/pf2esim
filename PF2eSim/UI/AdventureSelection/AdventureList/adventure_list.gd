extends Node

@export var adventureListEntry: PackedScene

@export var adventureSelectionList: VBoxContainer
@export var adventureDescriptionLabel: Label

@export var characterSelectionButton: Button
@export var backButton: Button


func _ready() -> void:
	backButton.pressed.connect(self.backPressed)

	characterSelectionButton.pressed.connect(self.characterSelectionPressed)
	characterSelectionButton.disabled = true

	AdventureManager.onAdventureSelected.connect(onAdventureSelected)

	var foundAdventure = false
	for adventure in AdventureManager.adventureList:
		var loadedAdventure: AdventureSetup
		loadedAdventure = load(adventure.resource_path)

		print(loadedAdventure.adventureName)

		var entry = load(adventureListEntry.resource_path)
		var newEntry = entry.instantiate()
		newEntry.setAdventure(loadedAdventure)
		adventureSelectionList.add_child(newEntry)
		if not foundAdventure:
			newEntry.setSelected()
			foundAdventure = true


func onAdventureSelected(selectedAdventure: AdventureSetup):
	if selectedAdventure:
		adventureDescriptionLabel.text = selectedAdventure.adventureDescription
		characterSelectionButton.disabled = false
	else:
		characterSelectionButton.disabled = true


func backPressed():
	SceneManager.loadMainMenuScene()


func characterSelectionPressed():
	SceneManager.loadCharacterSelection()
