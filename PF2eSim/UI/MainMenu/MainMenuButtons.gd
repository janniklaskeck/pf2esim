extends Node

@export var ColorInterval: float = 1.

var startButton: Button
var loadGameButton: Button
var settingsButton: Button
var quitButton: Button
var TitleLabel: Label

var current_base_color: Color
var TargetColor: Color
var TargetColorCounter: float

var rng: RandomNumberGenerator = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	startButton = get_node("MainVBox/ButtonVBox/StartButton")
	startButton.pressed.connect(self.startPressed)
	
	loadGameButton = get_node("MainVBox/ButtonVBox/LoadGameButton")
	loadGameButton.pressed.connect(self.loadGamePressed)
	
	settingsButton = get_node("MainVBox/ButtonVBox/SettingsButton")
	settingsButton.pressed.connect(self.settingsPressed)
	
	quitButton = get_node("MainVBox/ButtonVBox/QuitButton")
	quitButton.pressed.connect(self.quitPressed)
	
	TitleLabel = get_node("MainVBox/TitleLabel")
	TargetColor = Color(rng.randf(), rng.randf(), rng.randf())
	current_base_color = TitleLabel.get_theme_color("font_color")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var alpha = TargetColorCounter / ColorInterval
	var NewColor = lerp_colors(current_base_color, TargetColor, alpha)
	TitleLabel.add_theme_color_override("font_color", NewColor)
	
	TargetColorCounter += delta
	if (TargetColorCounter > ColorInterval):
		current_base_color = TargetColor
		TargetColor = Color(rng.randf(), rng.randf(), rng.randf())
		TargetColorCounter = 0.0

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
	
