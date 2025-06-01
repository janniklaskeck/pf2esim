class_name TurnTrackerEntry extends MarginContainer

@onready var characterPortrait: TextureRect = $AspectRatioContainer/CharacterPortrait
@onready var characterName: Label = $AspectRatioContainer/CharacterName

var character: Character

func _ready() -> void:
	characterName.text = character.characterName
	if character.characterPortrait:
		characterPortrait.texture = load(character.characterPortrait.resource_path)

func setCharacter(character: Character):
	self.character = character
