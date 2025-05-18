class_name SkillManager
extends CharacterComponent

@export var skillSetup : Array[SkillBase]

var skills = {}

func _init() -> void:
	# create dict for easy access
	for skill in skillSetup:
		skills[skill.Id] = skill

func getSkill(skillId: SkillBase.SkillId) -> SkillBase:
	var value = skills.find_key(skillId)
	assert(value != null)

	return value
