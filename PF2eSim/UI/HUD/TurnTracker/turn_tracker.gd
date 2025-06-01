class_name TurnTracker
extends Control

var entryScene: PackedScene = preload("res://PF2eSim/UI/HUD/TurnTracker/turn_tracker_entry.tscn")

var gameMode: GameMode_Encounter

@onready var entryList: HBoxContainer = $HBoxContainer/MarginContainer/ScrollContainer/EntryList

@onready var endTurnButton: BaseButton = $HBoxContainer/EndTurnButton


func _ready() -> void:
	gameMode = get_tree().get_first_node_in_group("GameMode")
	gameMode.onActiveCharacterAdded.connect(addCharacter)
	gameMode.onActiveCharactersChanged.connect(onActiveCharactersChanged)

	endTurnButton.pressed.connect(onEndTurnButtonPressed)


func addCharacter(newCharacter: Character):
	var newEntry: TurnTrackerEntry = entryScene.instantiate()
	newEntry.name = newCharacter.characterName + "_TurnTrackerEntry"
	newEntry.setCharacter(newCharacter)
	entryList.add_child(newEntry)


func onActiveCharactersChanged():
	for c in entryList.get_children():
		c.queue_free()

	for c in gameMode.activeCharacters:
		addCharacter(c)


func onEndTurnButtonPressed():
	gameMode.endCurrentTurn()
