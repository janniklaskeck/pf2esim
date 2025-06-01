@tool
class_name GridMap_Encounter
extends GridMapBase

@export var metaData: GridMeshLibraryMetaData

@export var gridHalfExtent: int = 32

var navGrid: AStarGrid2D


func _ready() -> void:
	if Engine.is_editor_hint():
		return
	navGrid = AStarGrid2D.new()
	#navGrid.diagonal_mode = AStarGrid2D.DIAGONAL_MODE_ONLY_IF_NO_OBSTACLES

	var gridCellSize: float = NavigationManager.gridConfig.gridSize
	navGrid.cell_size = Vector2(gridCellSize, gridCellSize)
	navGrid.region = Rect2i(-gridHalfExtent, -gridHalfExtent, gridHalfExtent * 2, gridHalfExtent * 2)
	navGrid.update()

	parseGridMap()

	NavigationManager.setGridMap(self)


func _process(delta: float) -> void:
	drawDebug(delta)


func drawDebug(delta: float):
	if not debugNavigation:
		return

	var gridCellSize: float = NavigationManager.gridConfig.gridSize
	var origin = Vector3(0, NavigationManager.gridConfig.groundHeight, 0)
	var xSize = Vector3(gridCellSize * gridHalfExtent * 2, 0, 0)
	var ySize = Vector3(0, 0, gridCellSize * gridHalfExtent * 2)
	DebugDraw3D.draw_grid(origin, xSize, ySize, Vector2i(gridHalfExtent * 2, gridHalfExtent * 2), Color.YELLOW)

	var blockedPoints: PackedVector3Array
	var validPoints: PackedVector3Array

	for x in range(-gridHalfExtent, gridHalfExtent):
		for y in range(-gridHalfExtent, gridHalfExtent):
			var cellPos = Vector2i(x, y)
			if not navGrid.is_in_bounds(cellPos.x, cellPos.y):
				return
			var cellWorldPos = navGrid.get_point_position(cellPos)
			var worldPos = Vector3(cellWorldPos.x + gridCellSize * 0.5, NavigationManager.gridConfig.groundHeight, cellWorldPos.y + gridCellSize * 0.5)
			if navGrid.is_point_solid(cellPos):
				blockedPoints.append(worldPos)
			else:
				validPoints.append(worldPos)

	DebugDraw3D.draw_points(blockedPoints, DebugDraw3D.POINT_TYPE_SQUARE, 0.2, Color.RED)
	DebugDraw3D.draw_points(validPoints, DebugDraw3D.POINT_TYPE_SQUARE, 0.2, Color.GREEN)


func parseGridMap():
	for xPos in range(-gridHalfExtent, gridHalfExtent):
		for zPos in range(-gridHalfExtent, gridHalfExtent):
			var gridId: Vector2i = Vector2i(xPos, zPos)
			var cellPos: Vector3i = Vector3i(xPos, 0, zPos)
			var meshLibId: int = get_cell_item(cellPos)
			if meshLibId >= 0:
				var meshName: String = mesh_library.get_item_name(meshLibId)
				var meshMetaData: MeshLibraryEntryData = metaData.metaData.get(meshName)
				if meshMetaData:
					if meshMetaData.navWeight == NavConstants.NavWeight.Blocked:
						navGrid.set_point_solid(gridId)
			else:
				navGrid.set_point_solid(gridId)
