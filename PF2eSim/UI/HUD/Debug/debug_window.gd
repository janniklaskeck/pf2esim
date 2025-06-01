class_name DebugWindow
extends Control

var enableNavigationDebug: bool = false

@onready var navigationDebugCheckBox: CheckButton = $NavigationDebugCheckButton

func _ready() -> void:
	navigationDebugCheckBox.toggled.connect(onNavigationDebugChanged)

func onNavigationDebugChanged(toggledOn: bool):
	NavigationManager.gridMap.debugNavigation = toggledOn
