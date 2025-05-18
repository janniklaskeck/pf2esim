@tool
extends CollisionShape3D

@export var UpdateTransform: bool:
	set(value):
		UpdateTransform = false
		updateCapsulePosition()


func updateCapsulePosition():
	if not Engine.is_editor_hint():
		return

	var staticBodyParent = get_parent() as StaticBody3D
	position = Vector3.ZERO

	if shape is CapsuleShape3D:
		staticBodyParent.position.y = shape.height / 2
