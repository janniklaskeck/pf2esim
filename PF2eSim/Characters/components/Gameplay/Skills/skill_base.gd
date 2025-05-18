class_name SkillBase
extends Resource

enum SkillId {
	None = 0,
	Acrobatics,
	Arcana,
	Athletics,
	Crafting,
	Deception,
	Diplomacy,
	Intimidation,
	Lore,
	Medicine,
	Nature,
	Occultism,
	Perception,
	Performance,
	Religion,
	Society,
	Stealth,
	Survival,
	Thievery,
}

enum SkillLevel {
	Untrained,
	Trained,
	Expert,
	Master,
	Legendary,
}

@export var Id: SkillId = SkillId.None

@export var actions: Array[Action]
@export var actionsTrained: Array[Action]
