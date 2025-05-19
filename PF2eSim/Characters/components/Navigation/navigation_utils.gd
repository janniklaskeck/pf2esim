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
	if navigationSetup.enableDebug and ownerCharacter:
		var gridLocation: Vector3i = worldToGrid(ownerCharacter.position)
		var gridLocationString: String = str(gridLocation)
		var gridLoc = gridToWorld(gridLocation)

		DebugDraw3D.draw_text(gridLoc + Vector3(0, 2, 0), gridLocationString)
		DebugDraw3D.draw_text(gridLoc + Vector3(0, 3, 0), str(ownerCharacter.position))

		ownerCharacter.position = gridLoc


# Transform world location into grid location, return true if the grid location is in the level, false otherwise
func worldToGrid(worldLocation: Vector3):
	var xLoc1: float = (worldLocation.x + navigationSetup.gridSize / 2) / navigationSetup.gridSize
	var xLoc: int = round(xLoc1)

	var zLoc1: float = (worldLocation.z + navigationSetup.gridSize / 2) / navigationSetup.gridSize
	var zLoc: int = round(zLoc1)

	var gridLocation: Vector3i = Vector3i(xLoc, 0, zLoc)

	return gridLocation


func gridToWorld(gridLocation: Vector3i):

	var gridX: float = gridLocation.x * navigationSetup.gridSize
	var gridY: float = 0.0
	var gridZ: float = gridLocation.z * navigationSetup.gridSize

	return Vector3(gridX, gridY, gridZ)
