class_name GameMode_Encounter
extends GameMode

@export var debugCharacterScene: PackedScene

signal onCharacterSelectionChanged(previousCharacter, newCharacter)

var currentlySelectedCharacter: Character = null

signal onActiveCharacterAdded(character)
signal onActiveCharactersChanged()
var activeCharacters: Array[Character]


func _process(delta: float) -> void:
	super._process(delta)

	if gameStarted:
		onTurnProcess(activeCharacters[0])


func startGame():
	super.startGame()

	InputManager.enableInputMode(PlayMode.Encounter)

	startNextTurn()


func spawnParty():
	var debugCharacterInstance: Character = debugCharacterScene.instantiate()
	debugCharacterInstance.name = "DebugCharacterInstance"
	debugCharacterInstance.position = adventureLevel.partySpawnLocations[0].position
	debugCharacterInstance.gridPos = NavigationManager.worldToGrid(debugCharacterInstance.position)
	debugCharacterInstance.add_to_group("Characters")
	debugCharacterInstance.add_to_group("PlayerCharacters")
	characterParty.append(debugCharacterInstance)
	get_parent().add_child(debugCharacterInstance)

	addActiveCharacter(debugCharacterInstance)


func selectCharacter(newSelectedCharacter: Character):
	var previousSelectedCharacter: Character = currentlySelectedCharacter
	currentlySelectedCharacter = newSelectedCharacter
	onCharacterSelectionChanged.emit(previousSelectedCharacter, currentlySelectedCharacter)

func addActiveCharacter(character: Character):
	activeCharacters.append(character)
	onActiveCharacterAdded.emit(character)

func startNextTurn():
	onTurnStart(activeCharacters[0])


func endCurrentTurn():
	onTurnEnd(activeCharacters[0])
	activeCharacters.push_back(activeCharacters.pop_front())
	onActiveCharactersChanged.emit()
	startNextTurn()


func onTurnStart(character: Character):
	character.onTurnStart()


func onTurnProcess(character: Character):
	pass


func onTurnEnd(character: Character):
	character.onTurnEnd()
