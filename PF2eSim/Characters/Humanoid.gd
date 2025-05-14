extends Node

@onready var MeshInstance: MeshInstance3D = $MeshInstance3D
@onready var StaticBody: StaticBody3D = $MeshInstance3D/StaticBody3D
@onready var CollisionShape: CollisionShape3D = $MeshInstance3D/StaticBody3D/CollisionShape3D

func _init() -> void:
	return

func _ready() -> void:
	return

func _process(delta):
	return
