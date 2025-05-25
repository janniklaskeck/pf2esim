class_name EncounterMode
extends GameMode

var currentlySelectedCharacter: Character = null


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("LMB"):
		var worldTrace = traceWorld()

		if worldTrace.is_empty():
			return

		var hitCollider: Node3D = worldTrace.collider
		var tracePosition: Vector3 = worldTrace.position

		DebugDraw3D.draw_sphere(tracePosition, 1.0, Color.ALICE_BLUE, 5.0)

		if hitCollider.get_parent() is CharacterComponent:
			currentlySelectedCharacter = hitCollider.get_parent().ownerCharacter
		else:
			if currentlySelectedCharacter:
				var movementComponent: MovementComponent = currentlySelectedCharacter.find_child("MovementComponent")
				movementComponent.moveTo(NavigationManager.worldToGrid(worldTrace.position))

		print(hitCollider.get_parent_node_3d())
