extends Marker3D

@export var defaultMoveSpeed: float = 1.0
@export var heightLimits: Vector2 = Vector2(1.0, 10.0)
@export var defaultPitchAngle: float = 70.0

@onready var camera: Camera3D = $SpringArm3D/Camera3D
@onready var springArm: SpringArm3D = $SpringArm3D


func _ready() -> void:
	initCameraTransform()


func _physics_process(delta: float) -> void:
	var moveInput = Vector3.ZERO
	if Input.is_action_pressed("Camera_Move_Left"):
		moveInput.x -= 1
	if Input.is_action_pressed("Camera_Move_Right"):
		moveInput.x += 1

	if Input.is_action_pressed("Camera_Move_Forward"):
		moveInput.z -= 1
	if Input.is_action_pressed("Camera_Move_Backward"):
		moveInput.z += 1

	var zoomInput = 0.0
	if Input.is_action_just_pressed("Camera_Move_Zoom_In"):
		zoomInput -= 1
	if Input.is_action_just_pressed("Camera_Move_Zoom_Out"):
		zoomInput += 1

	MoveCamera(delta, moveInput.normalized(), zoomInput)


func initCameraTransform():
	var currentLevel = AdventureManager.currentAdventureSceneNode as AdventureLevel
	position = currentLevel.startingLocation.position

	position.y = 3.0 # todo fix collisions
	rotation_degrees.x = -defaultPitchAngle

	springArm.spring_length = lerp(heightLimits.x, heightLimits.y, 0.5)


func MoveCamera(delta: float, moveInput: Vector3, zoomInput: int):
	self.position += moveInput * defaultMoveSpeed * delta

	var springArmMove = zoomInput * defaultMoveSpeed * delta
	springArm.spring_length = clampf(springArm.spring_length + springArmMove, heightLimits.x, heightLimits.y)
