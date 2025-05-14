@tool
extends Node

@export var MeshInstance: MeshInstance3D
@export var StaticBody: StaticBody3D
@export var CollisionShape: CollisionShape3D

@export var UpdateTransform : bool:
	set(value):
		UpdateTransform = false
		updateCapsulePosition()

func updateCapsulePosition():
	if Engine.is_editor_hint():
		var ShapeInstance = CollisionShape.shape as CapsuleShape3D
		StaticBody.position.y = ShapeInstance.height / 2
