class_name CharacterComponent
extends Node

var ownerCharacter: Character = null

func _init() -> void:
	set_process(false)
	set_physics_process(false)

func initComponent(inOwner: Character):
	ownerCharacter = inOwner

func beginPlay():
	set_process(true)
	set_physics_process(true)
