class_name HumanoidCollision
extends CharacterComponent

@onready var staticBody: StaticBody3D = $MeshInstance3D/StaticBody3D
@onready var collisionShape: CollisionShape3D = $MeshInstance3D/StaticBody3D/CollisionShape3D
