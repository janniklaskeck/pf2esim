class_name Character
extends Node3D

enum CharacterSize {
	Small = 1,
	Medium,
	Large,
	Gigantic
}

@export var characterName: String = "Default Character Name"
@export var characterPortrait: Texture2D = null

@export var gridPos: Vector3i

@export var characterGridSize: CharacterSize = CharacterSize.Medium

var components: Array[CharacterComponent]

@export var collisionComponent: HumanoidCollision
@export var meshComponent: HumanoidMesh
@export var movementComponent: MovementComponent

func _ready() -> void:
	initComponents()


func initComponents():
	var childNodes = get_children()
	# Only parse direct children
	for N in childNodes:
		if N is CharacterComponent:
			components.append(N)

	for N in components:
		N.initComponent(self)

	for N in components:
		N.beginPlay()

func onTurnStart():
	pass

func onTurnEnd():
	pass
