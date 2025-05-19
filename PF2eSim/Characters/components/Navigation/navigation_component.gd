class_name NavigationComponent
extends CharacterComponent

@export var navigationSetup: NavigationSetup

var currentGridLocation: Vector3i = Vector3i.ZERO


func canMoveTo(gridLocation: Vector3i) -> bool:
	return false


func moveTo(newGridLocation: Vector3i) -> bool:
	return false
