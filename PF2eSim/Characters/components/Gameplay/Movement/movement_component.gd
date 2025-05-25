class_name MovementComponent
extends CharacterComponent

@export var moveSpeed: float = 1.0

var isMoving: bool = false
var currentPath: Array[Vector3i]
var currentTargetPos: Vector3i
var currentMoveProgress: float = 0.0


func _process(delta: float) -> void:
	processPath(delta, currentPath)


func initComponent(inOwner: Character):
	super.initComponent(inOwner)
	inOwner.position = NavigationManager.gridToWorld(inOwner.gridPos)


func canMoveTo(targetPos: Vector3i) -> bool:
	var currentPos = ownerCharacter.gridPos
	var path = NavigationManager.findPath(currentPos, targetPos)
	return path.size() > 0


func moveTo(targetPos: Vector3i) -> bool:
	var currentPos = ownerCharacter.gridPos
	var path = NavigationManager.findPath(currentPos, targetPos)

	if path.size() == 0:
		return false

	currentPath = path

	return true


func processPath(delta: float, path: Array[Vector3i]):
	if path.size() == 0:
		isMoving = false
		return

	if not isMoving:
		currentTargetPos = path[0]
		isMoving = true

	currentMoveProgress = minf(currentMoveProgress + delta * moveSpeed, 1.0)

	var currentPosWorld: Vector3 = NavigationManager.gridToWorld(ownerCharacter.gridPos)
	var targetPosWorld: Vector3 = NavigationManager.gridToWorld(currentTargetPos)
	var newPosWorld: Vector3 = lerp(currentPosWorld, targetPosWorld, currentMoveProgress)

	ownerCharacter.position = newPosWorld

	if currentMoveProgress >= 1.0:
		isMoving = false
		currentMoveProgress = 0.0
		ownerCharacter.gridPos = currentTargetPos
		print(currentTargetPos)
		path.remove_at(0)
