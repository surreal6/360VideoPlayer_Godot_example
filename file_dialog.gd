extends Control

signal dir_selected

func _ready():
	print(OS.SYSTEM_DIR_DOCUMENTS)
	var docs_path = OS.get_system_dir(OS.SYSTEM_DIR_DOCUMENTS)
	
	$FileDialog.current_path = docs_path

func on_dir_selected_signal(value):
	print(value)
	#dir_selected.emit(value)
	#var sim_event = InputEventAction.new()
	#sim_event.action = "ui_cancel"
	#sim_event.pressed = true
	#Input.parse_input_event(sim_event)
	pass

func on_file_selected_signal(path):
	print(path)
	$FileDialog.current_path = path


func on_dir_selected_trigger(path):
	print(path)
	$FileDialog.current_path = path


func _on_file_dialog_gui_focus_changed(node):
	#print(node)
	pass


func _on_file_dialog_window_input(event):
	#print(event)
	pass
