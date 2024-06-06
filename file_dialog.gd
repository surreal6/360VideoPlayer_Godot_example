extends Control

signal dir_selected

@onready var fileLabels = $VBoxContainer2/ScrollContainer/VBoxContainer

func _ready():
	var docs_path = ProjectSettings.globalize_path("res://videos/")
	$FileDialog.current_path = docs_path
	$FileDialog.set_filters(PackedStringArray(["*.ogv"]))
	await get_tree().create_timer(0.5).timeout
	dir_selected.emit(docs_path)

func on_dir_selected_signal(value):
	dir_selected.emit(value)

func hide_file_dialog():
	$FileDialog.hide()

func clear_file_list():
	for node in fileLabels.get_children():
		fileLabels.remove_child(node)
		node.queue_free()

func add_file_label(filename):
	var label = Label.new()
	label.text = filename
	label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	fileLabels.add_child(label)

func _on_button_pressed():
	$FileDialog.show()
