@tool
extends EditorPlugin

var contextMenuPluginScript = preload("res://addons/pf2esim_editor/ContextMenu/pf2esim_context_menus.gd")
var plugin: PF2eSimContextMenus

func _enter_tree() -> void:
	plugin = contextMenuPluginScript.new()
	add_context_menu_plugin(EditorContextMenuPlugin.CONTEXT_SLOT_FILESYSTEM, plugin)


func _exit_tree() -> void:
	remove_context_menu_plugin(plugin)
