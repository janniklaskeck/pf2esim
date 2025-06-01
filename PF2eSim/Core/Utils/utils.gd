class_name Utils_Statics
extends Node

var gameCamera: GameCamera

func traceLineMouse():
	if not gameCamera:
		gameCamera = get_tree().get_first_node_in_group("Camera")

	if not gameCamera:
		print("Utils_traceLine: Could not find game camera!")
		return {}

	var camera3D: Camera3D = gameCamera.camera

	var mousePos = get_viewport().get_mouse_position()
	var rayLength = 100
	var from = camera3D.project_ray_origin(mousePos)
	var to = from + camera3D.project_ray_normal(mousePos) * rayLength
	var space = camera3D.get_world_3d().get_direct_space_state()
	var rayQuery = PhysicsRayQueryParameters3D.create(from, to)
	var result = space.intersect_ray(rayQuery)
	return result
