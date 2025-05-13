extends Marker3D

@export var DefaultMoveSpeed : float = 1.0
@export var HeightLimits : Vector2 = Vector2(1.0, 10.0)
@export var DefaultPitchAngle : float = 70.0

@onready var Camera : Camera3D = $SpringArm3D/Camera3D
@onready var SpringArm : SpringArm3D = $SpringArm3D

func _ready() -> void:	
	position = Vector3.ZERO
	position.y = 3.0 # todo fix collisions
	rotation_degrees.x = -DefaultPitchAngle
	
	SpringArm.spring_length = lerp(HeightLimits.x, HeightLimits.y, 0.5)

func _physics_process(delta: float) -> void:
	var MoveInput = Vector3.ZERO
	if Input.is_action_pressed("Camera_Move_Left"):
		MoveInput.x -= 1
	if Input.is_action_pressed("Camera_Move_Right"):
		MoveInput.x += 1
		
	if Input.is_action_pressed("Camera_Move_Forward"):
		MoveInput.z -= 1
	if Input.is_action_pressed("Camera_Move_Backward"):
		MoveInput.z += 1
		
	var ZoomInput = 0.0
	if Input.is_action_just_pressed("Camera_Move_Zoom_In"):
		ZoomInput -= 1
	if Input.is_action_just_pressed("Camera_Move_Zoom_Out"):
		ZoomInput += 1
	
	MoveCamera(delta, MoveInput.normalized(), ZoomInput)

func MoveCamera(delta : float, MoveInput : Vector3, ZoomInput : int):
	self.position += MoveInput * DefaultMoveSpeed * delta
	
	var SpringArmMove = ZoomInput * DefaultMoveSpeed * delta
	SpringArm.spring_length = clampf(SpringArm.spring_length + SpringArmMove, HeightLimits.x, HeightLimits.y)
