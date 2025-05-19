@tool
class_name NavigationUtils
extends Node

@export var navigationSetup: NavigationSetup

var navigationComponent: NavigationComponent = null

var ownerCharacter: Character = null


func _init() -> void:
	return


func _process(delta: float) -> void:
	navigationComponent = get_parent() as NavigationComponent
	ownerCharacter = navigationComponent.get_parent() as Character
	if navigationSetup.enableDebug:
		var gridLocation: Array = worldToGrid(ownerCharacter.position)
		var gridLocationString: String = str(gridLocation[1])
		DebugDraw3D.draw_text(ownerCharacter.position + Vector3(0, 2, 0), gridLocationString)
		DebugDraw3D.draw_text(ownerCharacter.position + Vector3(0, 3, 0), str(ownerCharacter.position))


# Transform world location into grid location, return true if the grid location is in the level, false otherwise
func worldToGrid(worldLocation: Vector3):
	var xLoc1: float = (worldLocation.x + navigationSetup.gridSize / 2) / navigationSetup.gridSize
	var xLoc: int = round(xLoc1)

	var zLoc1: float = (worldLocation.z + navigationSetup.gridSize / 2) / navigationSetup.gridSize
	var zLoc: int = round(zLoc1)

	var gridLocation: Vector3i = Vector3i(xLoc, 0, zLoc)

	var isInLevel = true # TODO implement

	return [isInLevel, gridLocation]
