class_name Navigation_Manager
extends Node

@export var gridConfig: GridConfig

var gridMap: GridMapBase


func setGridMap(inGridMap: GridMapBase):
	gridMap = inGridMap


func findPath(startPos: Vector3i, endPos: Vector3i) -> Array[Vector3i]:
	var path: Array[Vector3i] = []

	var navGrid: AStarGrid2D = gridMap.navGrid
	if not navGrid.is_in_bounds(startPos.x, startPos.z) or not navGrid.is_in_bounds(endPos.x, endPos.z):
		print("error")
		return []

	var pathIds = navGrid.get_id_path(Vector2i(startPos.x, startPos.z), Vector2i(endPos.x, endPos.z), true)
	for p in pathIds:
		path.append(Vector3i(p.x, 0, p.y))
	# TODO implement actual path finding
	#path = [endPos]

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
