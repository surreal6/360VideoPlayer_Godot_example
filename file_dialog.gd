extends Control

signal dir_selected

func _ready():
	print("fileDialog ready at %s" % OS.get_system_dir(OS.SYSTEM_DIR_DOCUMENTS))
	var docs_path = OS.get_system_dir(OS.SYSTEM_DIR_DOCUMENTS)
	
	$FileDialog.current_path = docs_path

func on_dir_selected_signal(value):
	dir_selected.emit(value)
