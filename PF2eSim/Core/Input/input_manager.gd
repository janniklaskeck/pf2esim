class_name Input_Manager
extends Node

@export var encounterInputMode: PackedScene
@export var explorationInputMode: PackedScene
@export var downtimeInputMode: PackedScene

var currentPlayMode: GameMode.PlayMode = GameMode.PlayMode.Encounter

var currentInputMode: Node = null

func enableInputMode(mode: GameMode.PlayMode):
	currentPlayMode = mode

	updateInputMode()

func updateInputMode():
	if currentInputMode:
		currentInputMode.queue_free()

	var newInputModeScene
	if currentPlayMode == GameMode.PlayMode.Encounter:
		newInputModeScene = encounterInputMode
	elif currentPlayMode == GameMode.PlayMode.Exploration:
		newInputModeScene = explorationInputMode
	elif currentPlayMode == GameMode.PlayMode.Downtime:
		newInputModeScene = downtimeInputMode
	else:
		print("wat")

	currentInputMode = newInputModeScene.instantiate()
	get_tree().root.add_child(currentInputMode)
