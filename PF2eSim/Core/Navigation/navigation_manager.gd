class_name Navigation_Manager
extends Node

@export var gridConfig: GridConfig

@export var debug: bool = false


func _process(delta: float) -> void:
	if debug:
		var origin = Vector3(0, gridConfig.groundHeight, 0)
		var xSize = Vector3(gridConfig.gridSize * 64, 0, 0)
		var ySize = Vector3(0, 0, gridConfig.gridSize * 64)
		DebugDraw3D.draw_grid(origin, xSize, ySize, Vector2i(64, 64), Color.LIGHT_CORAL)


func findPath(startPos: Vector3i, endPos: Vector3i) -> Array[Vector3i]:
	var path: Array[Vector3i] = []

	# TODO implement actual path finding
	path = [endPos]

	return path


# Transform world location into grid location, return true if the grid location is in the level, false otherwise
func worldToGrid(worldLocation: Vector3):
	var xLoc1: float = (worldLocation.x) / gridConfig.gridSize
	var xLoc: int = floorf(xLoc1)

	var zLoc1: float = (worldLocation.z) / gridConfig.gridSize
	var zLoc: int = floorf(zLoc1)

	var gridLocation: Vector3i = Vector3i(xLoc, 0, zLoc)

	return gridLocation


func gridToWorld(gridLocation: Vector3i):

	var gridX: float = gridLocation.x * gridConfig.gridSize
	var gridY: float = gridLocation.y * gridConfig.floorHeight
	var gridZ: float = gridLocation.z * gridConfig.gridSize

	var worldPos: Vector3 = Vector3(gridX, gridY, gridZ)
	worldPos += Vector3(gridConfig.gridSize * 0.5, gridConfig.groundHeight, gridConfig.gridSize * 0.5)

	return worldPos
