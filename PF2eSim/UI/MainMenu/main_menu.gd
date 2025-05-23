extends Node

@export var colorInterval: float = 1.

@export var startButton: Button
@export var loadGameButton: Button
@export var settingsButton: Button
@export var quitButton: Button
@export var titleLabel: Label

var current_base_color: Color
var targetColor: Color
var targetColorCounter: float

var rng: RandomNumberGenerator = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	startButton.pressed.connect(self.startPressed)

	loadGameButton.pressed.connect(self.loadGamePressed)

	settingsButton.pressed.connect(self.settingsPressed)

	quitButton.pressed.connect(self.quitPressed)

	targetColor = Color(rng.randf(), rng.randf(), rng.randf())
	current_base_color = titleLabel.get_theme_color("font_color")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var alpha = targetColorCounter / colorInterval
	var newColor = lerp_colors(current_base_color, targetColor, alpha)
	titleLabel.add_theme_color_override("font_color", newColor)

	targetColorCounter += delta
	if (targetColorCounter > colorInterval):
		current_base_color = targetColor
		targetColor = Color(rng.randf(), rng.randf(), rng.randf())
		targetColorCounter = 0.0

func startPressed():
	SceneManager.loadAdventureSelectionScene()

func loadGamePressed():
	print("Not Implemented!")
	return

func settingsPressed():
	print("Not Implemented!")
	return

func quitPressed():
	get_tree().quit()

func lerp_colors(color1: Color, color2: Color, alpha: float):
	return lerp(color1, color2, alpha)
