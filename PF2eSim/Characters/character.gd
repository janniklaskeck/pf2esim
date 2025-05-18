class_name Character
extends Node3D

enum GridSize {
	One = 1,
	Two,
	Three,
}

@export var characterGridSize: GridSize = GridSize.One

var components : Array[CharacterComponent]

func _ready() -> void:
	return

func initComponents():
	var childNodes = get_children()
	# Only parse direct children
	for N in childNodes:
		if N is CharacterComponent:
			components.append(N)

	for N in components:
		N.initComponent(self)
