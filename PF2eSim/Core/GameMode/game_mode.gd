class_name GameMode
extends Node

enum PlayMode
{
	Encounter = 0,
	Exploration,
	Downtime,
}

var adventureLevel: AdventureLevel

signal onCharacterPartyChanged(wasAdded, character)
var characterParty: Array[Character]

var gameStarted: bool = false

func _ready() -> void:
	assert(adventureLevel)

	var timer: Timer = Timer.new()
	add_child(timer)
	timer.wait_time = 1.0
	timer.one_shot = true
	timer.timeout.connect(startGame)
	timer.start()

func _process(delta: float) -> void:
	pass

func startGame():
	gameStarted = true
	spawnParty()


func spawnParty():
	pass
