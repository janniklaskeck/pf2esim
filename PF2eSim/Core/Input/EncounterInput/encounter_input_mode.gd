class_name EncounterInputMode
extends InputModeBase

var gameMode: GameMode_Encounter


func _ready() -> void:
	gameMode = get_tree().get_first_node_in_group("GameMode") as GameMode_Encounter


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("LMB"):
		var worldTrace = Utils.traceLineMouse()

		if worldTrace.is_empty():
			return

		var hitCollider: Node3D = worldTrace.collider
		var tracePosition: Vector3 = worldTrace.position

		DebugDraw3D.draw_sphere(tracePosition, 0.5, Color.ALICE_BLUE, 5.0)

		if hitCollider.get_parent() is CharacterComponent:
			gameMode.selectCharacter(hitCollider.get_parent().ownerCharacter)
		else:
			if gameMode.currentlySelectedCharacter:
				var movementComponent: MovementComponent = gameMode.currentlySelectedCharacter.movementComponent
				movementComponent.moveTo(NavigationManager.worldToGrid(worldTrace.position))

		#print(hitCollider.get_parent_node_3d())
